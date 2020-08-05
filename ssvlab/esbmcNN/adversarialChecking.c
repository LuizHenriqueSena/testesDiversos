#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>

int main(){
  float x0 = nondet_float();
  __ESBMC_assume(x0 >= 0.000000 && x0 <= 1.000000);
  float x1 = nondet_float();
  __ESBMC_assume(x1 >= 0.000000 && x1 <= 1.000000);
//RESTRICTIONS 
//Low  __ESBMC_assume(-3.000000*x0 + 2.000000*x1 > 0);
//Low  __ESBMC_assume(4.000000*x0 + 1.000000*x1 > 0);
//High  __ESBMC_assume(-3.000000*x0 + 2.000000*x1 > 0);
//High  __ESBMC_assume(4.000000*x0 + 1.000000*x1 > 0);
//PROPERTIES 
  __ESBMC_assert(4.000000*x0 + 1.000000*x1 <= 5.500000, "Safety property violated");
  __ESBMC_assert(4.000000*x0 + 1.000000*x1 + 2.000000 <= 5.500000, "Safety property violated");
}
