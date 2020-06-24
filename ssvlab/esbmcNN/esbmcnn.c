#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#define arraySize(x)  (int)(sizeof(x) / sizeof((x)[0]))

typedef struct{
  int neurons;
  int teste1;
  float* weights;
  int teste2;
  float* bias;
  int teste3;
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
  layer layers[0];
  int layersInstanciatedIndex;
  int layersNumber;
} esbmc_nnet;

void printfVector(float* pointer, int size){
  for(int i=0; i<size; i++) {
    printf("%.6f \n", pointer[i]);
  }
}

void printfLayers(esbmc_nnet* net) {
  for(int i = 0; i < net->layersNumber; i++) {
    printf("VALUES %d and %d \n", i, net->layers[i].neurons);
  }
}

void printNeuralNetworkDescriptors(esbmc_nnet* net) {
  for(int n = 1; n < net->layersNumber; n++) {
    printf("W[%d] = {", n);
    int rows = net->layers[n].neurons;
    int columns = net->layers[n-1].neurons;
    for(int j = 0; j<rows; j++) {
      for(int i = 0; i< columns; i++) {
        printf("  %.6f,", net->layers[n].weights[i + j*columns]);
      }
      printf("\n");
    }
    printf("Bias[%d] = {", n);
    for(int j = 0; j<rows; j++) {
      printf("  %.6f,", net->layers[n].bias[j]);
    }
    printf("}\n");
  }
}

esbmc_layer createLayer(int neurons, int inputs, float* weights, float* bias){
  float* layerWeights;
  float* layerBias;
  layerWeights = (float*)malloc(sizeof(float)*inputs*neurons);
  layerBias = (float*)malloc(sizeof(float)*inputs*neurons);
  esbmc_layer layer = (esbmc_layer)malloc(sizeof(layer));
  layer->neurons = neurons;
  layer->weights = layerWeights;
  layer->bias = layerBias;
  return layer;
}

esbmc_nnet* initializeNN(int *layersDescription, int layersNumber){
  esbmc_nnet* nnet = (esbmc_nnet*)malloc(sizeof(esbmc_nnet)+ (layersNumber+2)*sizeof(layer));
  nnet->layersNumber = layersNumber+2;
  for(int i = 1; i <= layersNumber; i++) {
    nnet->layers[i].neurons = layersDescription[i-1];
    printf("cheguei \n");
  }
  return nnet;
}

void configNet(esbmc_nnet* net, int inputs, int outputs) {
  net->layers[0].neurons = inputs;
  net->layers[net->layersNumber-1].neurons = outputs;
  for(int i = 1; i < net->layersNumber; i++) {
    int neurons = net->layers[i].neurons;
    int previous = net->layers[i-1].neurons;
    net->layers[i].weights = (float*) malloc(sizeof(float)*neurons*previous);
    net->layers[i].bias = (float*) malloc(sizeof(float)*neurons);
  }
}

void addLayerDescription(esbmc_nnet* net, int index, float* weights, float* bias){
  if(index == 0){
    printf("Index must be a positive integer. \n");
    exit(0);
  }
  else if (index >= net->layersNumber) {
    printf("Index can't be outside the neural net. Max index: %d. \n", net->layersNumber-1);
    exit(0);
  }
  else {
    int inputs = net->layers[index-1].neurons;
    int neurons = net->layers[index].neurons;
    memcpy(net->layers[index].weights, weights, sizeof(float) * inputs*neurons);
    memcpy(net->layers[index].bias, bias, sizeof(float)*neurons);
  }
}

void addLayer(esbmc_nnet* net, esbmc_layer layer){
  if(net->layersNumber == 0){
//    net->layers->layer = layer;
    net->layersNumber++;
  }
  else {
//    net->layers->layer->neurons = layer -> neurons;
    net->layersNumber++;
  }
}

int main(){
  int hiddenLayers[3] = {10,2,4};
  float w1[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  float bias1[10] = {1, 2, 3, 4, 5, 7, 7, 8, 9, 10};
  float w2[20] = {1, 2, 3, 4, 5, 7, 7, 8, 9, 10, 1, 2, 3, 4, 5, 7, 7, 8, 9, 10};
  float bias2[2] = {2, 20};
  float w3[8] = {31, 32, 33, 34, 35, 37, 37, 38};
  float bias3[4] = {2, 20, 4, 5};
  float w4[40] = {1, 2, 3, 4,
    5, 7, 7, 8,
    9, 10, 1, 2,
    3, 4, 5, 7,
    7, 8, 9, 10,
    1, 2, 3, 4,
    5, 7, 7, 8,
    9, 10, 1, 2,
    3, 4, 5, 7,
    7, 8, 9, 10};
  float bias4[10] = {1, 2, 3, 4, 5, 7, 7, 8, 9, 10};

  esbmc_nnet* nnet = initializeNN(hiddenLayers, arraySize(hiddenLayers));
  configNet(nnet,1,10);
  addLayerDescription(nnet, 1, w1, bias1);
  addLayerDescription(nnet, 2, w2, bias2);
  addLayerDescription(nnet, 3, w3, bias3);
  addLayerDescription(nnet, 4, w4, bias4);
  printfLayers(nnet);
  printNeuralNetworkDescriptors(nnet);
}
