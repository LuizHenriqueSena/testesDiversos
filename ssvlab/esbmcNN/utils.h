#ifndef UTILS_H
#define UTILS_H
#include <stdio.h>
#include "structs.h"

void printfVector(float* pointer, int size){
  for(int i=0; i<size; i++) {
    printf("%.6f \n", pointer[i]);
  }
}

void printIVector(int* pointer, int size){
  for(int i=0; i<size; i++) {
    printf("%d \n", pointer[i]);
  }
}

void printfLayers(esbmc_nnet* net) {
  for(int i = 0; i < net->layersNumber; i++) {
    printf("Layer: %d Neurons: %d \n", i, net->layers[i].neurons);
  }
}

void printfMatrix(float * mat, int rows, int column) {
int i =0, j = 0;
for(i = 0; i< rows; i++) {
  for(j = 0; j<column; j++) {
    printf("  %.6f", mat[i*column + j]);
  }
  printf("\n");
}
}

void printfLayerResults(float * mat, int neurons, int layer) {
int i =0;
printf("Layer %d\n", layer);
for(i = 0; i< neurons; i++) {
    printf("Neuron%d  %.6f\n",i, mat[i]);
  }
}

void normalizef(float *image, int size) {
  int i;
  for (i = 0; i < size; i++) {
    image[i] = (image[i])/255;
  }
}

float* normalizefVec(float *image, int size) {
  float *out = (float*)malloc(size*sizeof(float));
  int i;
  for (i = 0; i < size; i++) {
    out[i] = (image[i])/255;
  }
  return out;
}

int biggest(float* vec, int size) {
  int i = 0;
  float biggest = vec[0];
  int biggestIndex = 0;
  for(i=1; i<size;i++) {
    if(vec[i] > biggest) {
      biggestIndex = i;
      biggest = vec[i];
    }
  }
  return biggestIndex;
}

void setVectorValue(float * ptr, float value, int size){
  for(int i =0; i < size; i++){
    ptr[i] = value;
  }
}

void RELU(float *activationPotencial, int size) {
  int i;
  for (i = 0; i < size; i++) {
    if(activationPotencial[i] < 0)
      activationPotencial[i] = 0;
  }
}
#endif
