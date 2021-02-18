#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>
#include "utils.h"

int main(){
float norm = (float)1/(float)255;
int x0 = nondet_int();
__ESBMC_assume((x0 >= 483)&&(x0 <=496));
int x1 = nondet_int();
__ESBMC_assume((x1 >= 296)&&(x1 <=303));
int x2 = nondet_int();
__ESBMC_assume((x2 >= 138)&&(x2 <=141));
int x3 = nondet_int();
__ESBMC_assume((x3 >= 19)&&(x3 <=20));
float i[4];
i[0] = x0*norm;
i[1] = x1*norm;
i[2] = x2*norm;
i[3] = x3*norm;


float layer1[7];
layer1[0]= (-0.259293f)*i[0] + (0.727559f)*i[1] + (-0.037613f)*i[2] + (-0.367779f)*i[3] + (-0.019240f);
layer1[0] = sigmoidLUT(layer1[0]);
layer1[1]= (0.337188f)*i[0] + (0.221390f)*i[1] + (0.068103f)*i[2] + (-0.542259f)*i[3] + (-0.016677f);
layer1[1] = sigmoidLUT(layer1[1]);
layer1[2]= (-0.553619f)*i[0] + (-0.476375f)*i[1] + (-0.079880f)*i[2] + (0.474309f)*i[3] + (-0.017581f);
layer1[2] = sigmoidLUT(layer1[2]);
layer1[3]= (-0.396830f)*i[0] + (-0.147145f)*i[1] + (-1.363340f)*i[2] + (0.981716f)*i[3] + (-0.118043f);
layer1[3] = sigmoidLUT(layer1[3]);
layer1[4]= (-0.224814f)*i[0] + (0.651486f)*i[1] + (-0.391765f)*i[2] + (0.405520f)*i[3] + (-0.018501f);
layer1[4] = sigmoidLUT(layer1[4]);
layer1[5]= (1.332844f)*i[0] + (-0.324553f)*i[1] + (0.248677f)*i[2] + (0.461122f)*i[3] + (0.077769f);
layer1[5] = sigmoidLUT(layer1[5]);
layer1[6]= (-0.148397f)*i[0] + (0.195045f)*i[1] + (-0.070675f)*i[2] + (-1.402215f)*i[3] + (0.674765f);
layer1[6] = sigmoidLUT(layer1[6]);
float layer2[3];
layer2[0]= (-0.228491f)*layer1[0] + (-0.782173f)*layer1[1] + (-0.182530f)*layer1[2] + (-0.172476f)*layer1[3] + (-0.306530f)*layer1[4] + (0.064892f)*layer1[5] + (-0.608707f)*layer1[6] + (0.342278f);
layer2[0] = sigmoidLUT(layer2[0]);
int r = 0;
layer2[1]= (-0.409494f)*layer1[0] + (0.407630f)*layer1[1] + (-1.003181f)*layer1[2] + (0.967240f)*layer1[3] + (-0.205405f)*layer1[4] + (0.519332f)*layer1[5] + (-0.508822f)*layer1[6] + (0.046970f);
layer2[1] = sigmoidLUT(layer2[1]);
if (layer2[1] > layer2[r]) r = 1;
layer2[2]= (-0.140221f)*layer1[0] + (0.686671f)*layer1[1] + (0.187891f)*layer1[2] + (0.204790f)*layer1[3] + (-0.028897f)*layer1[4] + (0.998079f)*layer1[5] + (-0.901339f)*layer1[6] + (0.131860f);
layer2[2] = sigmoidLUT(layer2[2]);
if (layer2[2] > layer2[r]) r = 2;
__ESBMC_assert(r == 2, "Classification is not a 2 anymore.");
}
