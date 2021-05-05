#include <stdint.h>
#include <stdio.h>
#include <arm_neon.h>

#define T_SIZE (100000)
#define A_LIM (49999)
#define B_LIM (74999)
#define C_LIM (99999)

uint8_t A[T_SIZE];
uint8_t *A_a = &A[0];
uint8_t *A_b = &A[50000];
uint8_t *A_c = &A[75000];


void init(){
    int i;
    for(i = 0; i < 50000; i++){
       A_a[i] = 0;
    }
    for(i = 0; i < 25000 ; i++ ){
        A_b[i] = 1;
    }
    for(i = 0; i < 25000; i++){
        A_c[i] = 2;
    }
}

int main(void){
  uint8x8_t v1, v2, v3;
  uint8_t s1;
  init();
  printf("Init success\n");
  v1 = vld1_u8(A_b);
  v2 = vld1_u8(A_c);
  v3 = vmul_u8(v1, v2);
  s1 = vget_lane_u8(v3, 7);
  printf("Scalar value: %d\n", s1);
  return 0;
}
