#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "coveringMethods.h"
//
// int ssCover[fc1 + fc2];
// int dsCover[fc1 + fc2];
// int svCover[fc1 + fc2];
// int dvCover[fc1 + fc2];
unsigned network(float input[2], float inputNdet[2])
{

  //  layer 0: dense_2
  float layer0[2];
  float layer0Ac[2];
  layer0[0]=0.0 + (2.0)*input[0] + (-3.0)*input[1];
  layer0Ac[0] = layer0[0];

  layer0[1]=0.0 + (1.0)*input[0] + (4.0)*input[1];
  layer0Ac[1] = layer0[1];

  float layer0Cm[2];
  float layer0CmAc[2];
  layer0Cm[0]=0.0 + (2.0)*inputNdet[0] + (-3.0)*inputNdet[1];
  layer0CmAc[0] = layer0Cm[0];
  layer0Cm[1]=0.0 + (1.0)*inputNdet[0] + (4.0)*inputNdet[1];
  layer0CmAc[1] = layer0Cm[1];

  if(layer0[0]<0) layer0[0]=0;
  printf("valor: %.6f \n", layer0Ac[0]);
  if(layer0[1]<0) layer0[1]=0;
  printf("valor: %.6f \n", layer0Ac[1]);

  if(layer0Cm[0]<0) layer0Cm[0]=0;
  printf("valor: %.6f \n", layer0CmAc[0]);
  if(layer0Cm[1]<0) layer0Cm[1]=0;
  printf("valor: %.6f \n", layer0CmAc[1]);

  //  layer 1: dense_3
  float layer1[1];
  //float* layeri1, float* layeri2, float* layerj1, float* layerj2, int l1, int l2, int layerIndex
  layer1[0]=0.0 + (1.0)*layer0[0] + (1.0)*layer0[1];
  printf("valor: %.6f \n", layer1[0]);

  float layer1Cm[1];

  layer1Cm[0]=0.0 + (1.0)*layer0Cm[0] + (1.0)*layer0Cm[1];
  printf("valor: %.6f \n", layer1Cm[0]);


  unsigned ret=0;
  float res=-100000;
  if(layer1[0]>res)  {
    res=layer1[0];
    ret=0;
  }
  unsigned ret2=0;
  float res2=-100000;
  if(layer1Cm[0]>res)  {
    res=layer1Cm[0];
    ret=0;
  }
  fullSSCover(layer0Ac, layer0CmAc,  layer1, layer1Cm, 2, 1, 1);
  printf("COVERAGE: %.6f\n", neuronCoverageSS());
  __ESBMC_assert(neuronCoverageSS() < 0.5, "not SS-Covered enough");

  return ret;
}
int main(int argc, char* argv[]) {
  float finput[2];
  finput[0]=2;
  finput[1]=2;
  float finput2[2];
  finput2[0] = nondet_float();
  __ESBMC_assume(finput2[0] <= 5 && finput2[0] >= -5);
  finput2[1] = nondet_float();
  __ESBMC_assume(finput2[1] <= 5 && finput2[1] >= -5);

  printf("%d",network(finput, finput2));
}
