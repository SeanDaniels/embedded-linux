/*----------------------------------------------------------------------------
 *----------------------------------------------------------------------------*/
#include <math.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <arm_neon.h>
#include <arm_acle.h>

#define N_TESTS (100000UL) // (1000000UL) // With >1 test, compiler super-optimizes unsafely?
#define N_ELEMENTS (10000UL) // (1024UL)

#define CYCLES_PER_NS (1.5)

extern void enable_runfast(void);

/*----------------------------------------------------------------------------
  MAIN function
 *----------------------------------------------------------------------------*/
int x[N_ELEMENTS], y[N_ELEMENTS], z[N_ELEMENTS];

void init_data(void) {
  int i;

  for (i=0; i<N_ELEMENTS; i++) {
    x[i] = N_ELEMENTS/2 - i;
    y[i] = i;
    z[i] = 0;
  }
}

int mult_ints(int * ax, int * ay, int * az, int n)
{
  int prod_sum = 0;
  for (int i=0; i < n; i++) {
    az[i] += ax[i]*ay[i];
    prod_sum += az[i];
  }
  return prod_sum;
}

int sum_ints(int * aa, int n) {
  int i, sum_val = 0;

  for (i=0; i < n; i++) {
    sum_val += aa[i];
  }
  return sum_val;
}

int main (int argc, char * * argv) {
  struct timespec start, end, pre;
  long long diff;
  int sum = 0;
  float  el_time;
  int n;

  init_data();
  clock_gettime(CLOCK_THREAD_CPUTIME_ID, &pre);
  clock_gettime(CLOCK_THREAD_CPUTIME_ID, &start);

  for (n=0; n<N_TESTS; n++) {
    // sum += sum_ints(x, N_ELEMENTS);
    sum += mult_ints(x, y, z, N_ELEMENTS);
  }

  clock_gettime(CLOCK_THREAD_CPUTIME_ID, &end);
  diff = ((long long) 1000000000) * (end.tv_sec - start.tv_sec) +
    (end.tv_nsec - start.tv_nsec);
  // Remove overhead of clock_gettime call
  diff -= ((long long) 1000000000) * (start.tv_sec - pre.tv_sec) +
    (start.tv_nsec - pre.tv_nsec);

  printf("Sum = %d\n", sum);
  el_time =  ((float) diff)/(N_ELEMENTS*N_TESTS);
  printf("Average %.3f ns (%.3f cycles) per element (%ld)\n", el_time,
	 el_time*CYCLES_PER_NS, N_ELEMENTS);
  exit(0);
}
