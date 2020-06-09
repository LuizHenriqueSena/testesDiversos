#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>
//esbmc-gpu verifynn.c --force-malloc-success --no-bounds-check --no-div-by-zero-check --no-pointer-check --incremental-bmc --interval-analysis
int main(){
  clock_t t;
  t = clock();
  float y = nondet_float();
  float x = nondet_float();
  safeLimit = 5.5;
  // Restrictions
  //   -3.000000  2.000000  0.000000
  //   4.000000  1.000000  0.000000
  // Simbolic Propagation:
  //   1.000000  3.000000  0.000000
  __ESBMC_assert(-3*x + 2*y > 0);
  __ESBMC_assert(4*x + 1*y > 0);

  __ESBMC_assume(x + 3*y - safeLimit > 0, "Unsafe");
}
