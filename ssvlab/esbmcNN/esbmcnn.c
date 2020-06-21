#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct{
  int neurons;
  int inputs;
  float* weights;
  float* bias;
}layer;

typedef layer* esbmc_layer;

typedef struct{
  esbmc_layer layer;
  esbmc_layer prev;
  esbmc_layer next;
} layers;

typedef layers* esbmc_layers;

typedef struct nnet{
  float* inputs;
  float* outputs;
  esbmc_layers layers;
  int layerNumbers;
} esbmc_nnet;

void printfVector(float* pointer, int size){
  for(int i=0; i<size; i++) {
    printf("%.6f \n", pointer[i]);
  }
}

esbmc_layer createLayer(int neurons, int inputs, float* weights, float* bias){
  float* layerWeights;
  float* layerBias;
  layerWeights = (float*)malloc(sizeof(float)*inputs*neurons);
  layerBias = (float*)malloc(sizeof(float)*inputs*neurons);
  esbmc_layer layer = (esbmc_layer)malloc(sizeof(layer));
  layer->neurons = neurons;
  layer->inputs = inputs;
  layer->weights = layerWeights;
  layer->bias = layerBias;
  return layer;
}

esbmc_nnet* initializeNN(){
  esbmc_nnet* nnet = (esbmc_nnet*)malloc(sizeof(esbmc_nnet));
  nnet->layerNumbers = 0;
  return nnet;
}

void addLayerDescription(esbmc_nnet* net, int neurons, int inputs, float* weights, float* bias){
  if(net->layerNumbers == 0){
    net->layers->layer->neurons = neurons;
    net->layers->layer->inputs = inputs;
    memcpy(net->layers->layer->weights, weights, sizeof(float) * inputs*neurons);
    memcpy(net->layers->layer->bias, bias, sizeof(float) *neurons);
    net->layerNumbers++;
  }
  else {
    net->layers->layer->neurons = neurons;
    net->layers->layer->inputs = inputs;
    memcpy(net->layers->layer->weights, weights, sizeof(float) * inputs*neurons);
    memcpy(net->layers->layer->bias, bias, sizeof(float) *neurons);
    net->layerNumbers++;
  }
}

void addLayer(esbmc_nnet* net, esbmc_layer layer){
  if(net->layerNumbers == 0){
    net->layers->layer = layer;
    net->layerNumbers++;
  }
  else {
    net->layers->layer->neurons = layer -> neurons;
    net->layerNumbers++;
  }
}

int main(){
  float w1[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  esbmc_nnet* nnet = initializeNN();
  esbmc_layer layer1;
  layer1 = (esbmc_layer)malloc(sizeof(layer));
  // neural->weights = (float*)malloc(10*sizeof(float));
  // neural->weights[0] = 1;
  // neural->weights[1] = 2;
  // neural->weights[2] = 3;
  // neural->weights[3] = 4;
  // neural->weights[4] = 5;
  // neural->weights[5] = 6;
  // neural->weights[6] = 7;
  // printfVector(neural->weights, 7);
}
