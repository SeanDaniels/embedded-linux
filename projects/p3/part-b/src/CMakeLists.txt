set(TARGET istool2)
set(CMAKE_VERBOSE_MAKEFILE ON)

include_directories(/opt/vc/include)
include_directories(/opt/vc/include/interface/vcos/pthreads)
include_directories(/opt/vc/include/interface/vmcs_host)
include_directories(/opt/vc/include/interface/vmcs_host/linux)
include_directories(/home/pi/src/raspberrypi/userland)
include_directories(/opt/vc/src/hello_pi/libs/vgfont)
include_directories(../inc)

link_directories(/opt/vc/lib)
link_directories(/opt/vc/src/hello_pi/libs/vgfont)

add_compile_options(-Wall
  -O3
  -Ofast
  -mcpu=cortex-a72
  -funroll-loops
  -mfloat-abi=hard
  -mfpu=crypto-neon-fp-armv8
  -mvectorize-with-neon-quad
  -ftree-vectorize
  -ffinite-math-only
  -fno-math-errno
  -ggdb)

# add_executable(mmaldemo main.c)
# add_executable(mmal_buffer_demo buffer_demo.c)
# add_executable(mmal_buffer_demo2 buffer_demo2.c)
add_executable(${TARGET} keyboard.c is_options.c buffer_demo_base.c yuv.c video_callback.c sccb_bus.c PCA9685_servo_driver.c bcm283x_board_driver.c)

# target_compile_options(mmal_buffer_demo PRIVATE "-O3")
# target_compile_options(mmal_buffer_demo2 PRIVATE "-O3")
# target_compile_options(istool1 PRIVATE "-O3" "-g")

# target_link_libraries(mmal_buffer_demo mmal_core mmal_util mmal_vc_client vcos bcm_host rt)
# target_link_libraries(mmal_buffer_demo2 mmal_core mmal_util mmal_vc_client vcos bcm_host rt)
target_link_libraries(istool2 m mmal_core mmal_util mmal_vc_client vcos bcm_host rt)
