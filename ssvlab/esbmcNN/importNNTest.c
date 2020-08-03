#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>
  float UpLinearRelaxation(float input, float up, float low) {
    float relaxation = (up/(up-low))*(input-low);
    return relaxation;
  }

  float LowLinearRelaxation(float input, float up, float low) {
    float relaxation = up/(up-low)*(input);
    return relaxation;
  }

int main(){
  float x0 = nondet_float();
  __ESBMC_assume(x0 >= 0.000000 && x0 <= 1.000000);
  float x1 = nondet_float();
  __ESBMC_assume(x1 >= 0.000000 && x1 <= 1.000000);
//RESTRICTIONS
  //__ESBMC_assume(-3.000000*x0 + 2.000000*x1 > 0);
  float nodeNegative1 = nondet_float();
  __ESBMC_assume(nodeNegative1 >= 0 && nodeNegative1 <= 2);
  __ESBMC_assume(4.000000*x0 + 1.000000*x1 > 0);
//PROPERTIES
  __ESBMC_assert(4.000000*x0 + 1.000000*x1 + nodeNegative1 <= 5.500000, "Safety property violated");
}
