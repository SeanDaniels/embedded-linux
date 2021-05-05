#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
// #include <math.h>
#include <stdint.h>
#include <sys/param.h>
#include <arm_acle.h>
#include <arm_neon.h>

#include "bcm_host.h"
#include "interface/vcos/vcos.h"

#include "interface/mmal/mmal.h"
#include "interface/mmal/util/mmal_connection.h"
#include "interface/mmal/util/mmal_default_components.h"

#include "is_options.h"
#include "video_callback.h"
#include "yuv.h"

#include "PCA9685_servo_driver.h"
#define FIND_CHROMA_LOOP_OPT
#define V_2 1
#define V_1 0

unsigned char img2_bitplanes[1280 * 720 * 3 / 2];

void draw_overlay_info(YUV_IMAGE_T *i) {
  Draw_Circle(i, i->half_w, i->half_h, 10, &black, 0);
  Draw_Circle(i, i->half_w, i->half_h, 12, &orange, 0);
  Draw_Circle(i, i->half_w, i->half_h, 13, &orange, 0);
  Draw_Circle(i, i->half_w, i->half_h, 22, &black, 0);
  Draw_Circle(i, i->half_w, i->half_h, 24, &white, 0);
  Draw_Circle(i, i->half_w, i->half_h, 25, &white, 0);
}

void clear_term_screen(void) { printf("\033[2J"); }

int find_chroma_matches(YUV_IMAGE_T *restrict i, YUV_T *restrict tc, CENTROID_DATA_T *restrict thisCentroid,
                        int sep) {
  int x, y, innerLoopRange, matches = 0;
  YUV_T color;
  int cx = 0, cy = 0;
  PIXEL_HOLDER_T pixelSetOne, pixelSetTwo;
  #ifdef FIND_CHROMA_LOOP_OPT
  int diff, h, w, hw, du, dv;
  uint8_t compareU, compareV;
  uint16_t *positionList = &xPos;
  h = i->h;
  w = i->w;
  hw = i->half_w;
  innerLoopRange = (i->w)/8;
  compareU = tc->u;
  compareV = tc->v;
  // 8x8 vectors that contain pixel u data, pixel v data, image chroma u data, and image chroma v data
  //
  uint32x2_t upper, lower;
  uint32x2_t sumVector = vdup_n_u32(0);
  uint8x8_t eightPixelsU, eightPixelsV, imageChromaU, imageChromaV, positionVector;
  uint16x8_t squareU, squareV, diffValueVector;
  // copy the scalar value of tc->u to all elements of the image chroma u 8x8 vector
  imageChromaU = vdup_n_u8(tc->u);
  // copy the scalar value of tc->v to all elements fot eh image chroma v 8x8 vector
  imageChromaV = vdup_n_u8(tc->v);
  diffValueVector = vdupq_n_u8(color_threshold);
  // the goal is to get the 8 bits of of the next 8 pixels, compare them to the images chroma u values and chroma v values
  // resulting in a 8x8 vector that contains the u differences of the 8 pixels, a 8x8 vector that contains the v differences of the 8 pixels
  for (y = sep >> 1; y <= h - (sep >> 1); y += sep) {
    for (x = sep >> 1; x <= w - (sep >> 1); x += 8) {
      positionVector = vld1_u16(positionList + x);
      /*get 8 pixel's u values*/
      eightPixelsU = vld1_u8((i->bU)+((x>>1)+(y>>1*hw)));
      /*get 8 pixel's v values*/
      eightPixelsV = vld1_u8((i->bV)+((x>>1)+(y>>1*hw)));
      /*subtract image chroma u value from the u values, store in same loc*/
      eightPixelsU = vsub_u8(eightPixelsU, imageChromaU);
      /*subtract image chroma v value from the v values, store in same loc*/
      eightPixelsV = vsub_u8(eightPixelsV, imageChromaV);
      /*square the u values*/
      squareU = vmull_u8(eightPixelsU, eightPixelsU);
      /*square the v values*/
      squareV = vmull_u8(eightPixelsV, eightPixelsV);
      /*sum the squared values*/
      squareU = vaddq_u16(squareU, squareV);
      /*'eightPixelsU' now contains the 'diff' values for 8 pixels*/
      /*the next step is to determine if the diff value is < the color threshold for the eight pixels*/
      /* compare the values in 'eightPixelsU' with color threshold, 'eightPixelsU' will now either contain 1 or 0 */
      squareV = vcltq_u16(squareU, diffValueVector);
      /* load x position  values  */
      squareU = vmovl_u8(positionVector);
      /* apply the mask contained in square v to the positions */
      squareV = vmulq_u16(squareU, squareV);
      upper = vget_high_u32(squareV);
      lower = vget_low_u32(squareV);
      upper = vpadd_u32(upper, lower);
      upper = vpadd_u32(upper, sumVector);
      uint16_t xVal = vget_lane_u16(upper,0);
      cx += xVal;
      /* Non simd control */
      du =i->bU[(x>>1)+((y>>1)*hw)] - compareU;
      dv = i->bV[(x>>1)+((y>>1)*hw)] - compareV;
      diff = du*du + dv*dv;

      if (diff < color_threshold) {
        pixelSetOne.pxA = x - (sep >> 1);
        pixelSetOne.pyA = y;
        pixelSetOne.pxB = x + (sep >> 1);
        pixelSetOne.pyB = y;
        pixelSetTwo.pxA = x;
        pixelSetTwo.pyA = y - (sep >> 1);
        pixelSetTwo.pxB = x;
        pixelSetTwo.pyB = y + (sep >> 1);
        cx += x;
        cy += y;
        matches++;
        Draw_Line_SWD(i, &pixelSetOne, &pink);
        Draw_Line_SWD(i, &pixelSetOne, &pink);
      }
    }
  }
#else
  unsigned int min_x = 0xffffffff, max_x = 0, min_y = 0xffffffff, max_y = 0;
  for (y = sep / 2; y <= i->h - sep / 2; y += sep) {
    for (x = sep / 2; x <= i->w - sep / 2; x += sep) {
      Get_Pixel_yuv(i, x, y, &color);
      // Identify pixels with right color
      int diff = Sq_UV_Difference_yuv(&color, tc);
      if (diff < color_threshold) {
        cx += x;
        cy += y;
        min_x = MIN(min_x, x);
        max_x = MAX(max_x, x);
        min_y = MIN(min_y, y);
        max_y = MAX(max_y, y);

        matches++;
        if (sep > 10)
          Draw_Rectangle(i, x, y, sep - 2, sep - 2, &pink, 0);
        else {
          Draw_Line(i, x - sep / 2, y, x + sep / 2, y, &pink);
          Draw_Line(i, x, y - sep / 2, x, y + sep / 2, &pink);
        }
      }
    }
  }
  #endif
  if (matches > 0) {
    cx /= matches;
    cy /= matches;
  }
  thisCentroid->cX = cx;
  thisCentroid->cY = cy;
  return matches;
}

void video_buffer_callback(MMAL_PORT_T *port, MMAL_BUFFER_HEADER_T *buffer) {
  struct timespec t1, t2;
  static struct timespec tpf;
  struct timespec tcf;
  static double t_sum_ms = 0;
  static int loop = 0;
  static YUV_IMAGE_T img, img2;
  int translate_image = 0;
  int w = 1280, h = 720;
  // Default target color
  static YUV_T target = {128, 135, 64}; // Green paper
  clock_gettime(CLOCK_MONOTONIC, &tcf);
  clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &t1);

  MMAL_BUFFER_HEADER_T *new_buffer;
  MMAL_BUFFER_HEADER_T *preview_new_buffer;
  MMAL_POOL_T *pool = (MMAL_POOL_T *)port->userdata;

  loop++;

  preview_new_buffer = mmal_queue_get(preview_input_port_pool->queue);
  if (preview_new_buffer) {

    int Y_array_size = w * h;
    int UV_array_size = Y_array_size / 4;
    int x, y; // coordinates

    int i;
    unsigned char *Y = preview_new_buffer->data;
    unsigned char *U = &(preview_new_buffer->data[Y_array_size]);
    unsigned char *V =
        &(preview_new_buffer->data[Y_array_size + UV_array_size]);

    // copy image components to preview_new_buffer
    memcpy(preview_new_buffer->data, buffer->data,
           Y_array_size + 2 * UV_array_size);
    preview_new_buffer->length = buffer->length;
    // initialize YUV_IMAGE_T data structures describing images
    YUV_Image_Init(&img, (unsigned char *)(preview_new_buffer->data), w,
                   h); // original image
    YUV_Image_Init(&img2, img2_bitplanes, w,
                   h); // extra space for modified image
    if (invert) { // Y: luminance.
      // Invert Luminance, one word at a time
      unsigned int *Y32 = (unsigned int *)Y;
      do {
        *Y32 ^= 0xffffffff;
        Y32++;
      } while (Y32 < (unsigned int *)U); // Note: U must be a multiple of 4
    } else if (invert_rect) {
      // Invert brightness of central rectangle, one byte at a time
      for (y = h / 2 - H_INVERT_RECT / 2; y < h / 2 + H_INVERT_RECT / 2; y++) {
        for (x = w / 2 - W_INVERT_RECT / 2; x < w / 2 + W_INVERT_RECT / 2;
             x++) {
          Y[y * w + x] ^= 0xff;
        }
      }
    }

    YUV_T center_color;
    Get_Pixel_yuv(&img, img.half_w, img.half_h, &center_color);
    if (show_data > 0)
      printf("\nCenter pixel: (%d, %d, %d)\n", center_color.y, center_color.u,
             center_color.v);
    if (update_target_color) {
      target = center_color;
      update_target_color = 0;
      printf("\nUpdated target color: (%d, %d, %d)\n", target.y, target.u,
             target.v);
    }

    // draw center circles
    draw_overlay_info(&img);

    // Find area matching target color
    int centroid_x, centroid_y, num_matches, offsetX, offsetY;
    CENTROID_DATA_T centroid;
    // find_chroma_matchs passed yuv_image_t pointer, yuv_t pointer, two int pointers, and an int
    num_matches = find_chroma_matches(&img, &target, &centroid,
                                      chroma_subsample_sep);
    if (num_matches > 0) {
      // Show centroid
      Draw_Circle(&img, centroid.cX, centroid.cY, 10, &white, 1);
      offsetX = img.half_w - centroid.cX;
      offsetY = img.half_h - centroid.cY;
      if (show_data > 0) {
        printf("Match centroid at (%d, %d) for %d samples\n", centroid.cX,
               centroid.cY, num_matches);
        printf("Offset = %d, %d\n", offsetX, offsetY);
      }
      // Correct image position
      if (imstab_digital) {
        // Copy bitplanes of image so far into another buffer
        YUV_Image_Copy(&img2, &img);
        //	target.y = 128; // overwrite
        YUV_Image_Fill(&img, &target);
        YUV_Translate_Image(&img, &img2, offsetX, offsetY, 0);
      }
      if (imstab_servo) {
        Update_Servo(offsetX, offsetY);
      }
    }

    // Send modified image in new buffer to preview component
    if (mmal_port_send_buffer(preview_input_port, preview_new_buffer) !=
        MMAL_SUCCESS) {
      printf("ERROR: Unable to send buffer \n");
    }
  } else {
    printf("ERROR: mmal_queue_get (%d)\n", preview_new_buffer);
  }

  mmal_buffer_header_release(buffer);

  // and send one back to the port (if still open)
  if (port->is_enabled) {
    MMAL_STATUS_T status;

    new_buffer = mmal_queue_get(pool->queue);
    if (new_buffer)
      status = mmal_port_send_buffer(port, new_buffer);
    if (!new_buffer || status != MMAL_SUCCESS)
      printf("Unable to return a buffer to the video port\n");
  }

  clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &t2);
  double t = t2.tv_nsec - t1.tv_nsec;
  if (t < 0)
    t += 1000000000;
  if (loop > 1) {
    long period = (tcf.tv_nsec - tpf.tv_nsec);
    if (period < 0){
      period += 1000000000;
    }
    fprintf(fp, "Frame processing time: %.3f of %.3f ms\n", t / 1000000.0,
            period / 1000000.0);
  }
  t_sum_ms += t / 1000000;
  // updating
  if ((loop & 0x0f) == 0) {
    fprintf(fp, "Average frame processing time %.3f ms\n",
            ((float)t_sum_ms) / loop);
  }
  tpf = tcf;
}
