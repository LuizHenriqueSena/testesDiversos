#ifndef STRUCTS_H
#define STRUCTS_H

float* neuronsSimbolicRestrictions;
int restrictionNeuronsWidth;
FILE *outputFile;
FILE *nnetFile;
char outPutPath[200];
char nnetFilePath[200];
char fileName[22] = "/adversarialChecking.c";
char nnetExt[20] = ".nnet";


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
