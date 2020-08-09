#ifndef STRUCTS_H
#define STRUCTS_H
typedef struct{
  int neurons;
  float* weights;
  float* bias;
  float* restrictionsHIGHER;
  float* restrictionsLOWER;
  float* concretization;
  float* outputLayer;
  unsigned short* allowsSimbolic;
}layer;

typedef layer* esbmc_layer;

typedef struct nnet{
  float* inputs;
  float* outputs;
  unsigned short isPatternNet;
  layer layers[0];
  int layersInstanciatedIndex;
  int layersNumber;
} esbmc_nnet;

#endif
