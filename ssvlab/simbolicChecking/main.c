#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>
//esbmc-gpu main.c --force-malloc-success --no-bounds-check --no-div-by-zero-check --no-pointer-check --incremental-bmc --interval-analysis
float UpLinearRelaxation(float input, float up, float low) {
  float relaxation = (up/(up-low))*(input-low);
  return relaxation;
}

float LowLinearRelaxation(float input, float up, float low) {
  float relaxation = up/(up-low)*(input);
  return relaxation;
}

int main(){
  clock_t t;
  t = clock();
  float y = nondet_float();
  __ESBMC_assume(y >= 0 && y <= 1);
  float x = nondet_float();
  __ESBMC_assume(x >= 0 && x <= 1);
  float safeLimit = 3.8;
  // Restrictions
  //   -3.000000  2.000000  0.000000
  //   4.000000  1.000000  0.000000
  // Simbolic Propagation:
  //   1.000000  3.000000  0.000000
  //__ESBMC_assume(-3*x + 2*y > 0);
  //__ESBMC_assume(4*x + 1*y > 0);
  __ESBMC_assume((-3*x + 2*y) > LowLinearRelaxation(-3*x + 2*y, 1, 0) && (-3*x + 2*y) < UpLinearRelaxation(-3*x + 2*y, 1, 0));
  __ESBMC_assume((4*x + 1*y) > LowLinearRelaxation(4*x + 1*y, 1, 0) && (4*x + 1*y) <LowLinearRelaxation(4*x + 1*y, 1, 0));

  __ESBMC_assert(x + 3*y - safeLimit < 0, "Unsafe");
}
