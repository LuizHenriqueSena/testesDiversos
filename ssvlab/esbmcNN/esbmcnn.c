#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <limits.h>
#include "cuda_operational_model.h"
#include "structs.h"
#include "utils.h"

//gcc -o main esbmcnn.c
#define arraySize(x)  (int)(sizeof(x) / sizeof((x)[0]))

void setImg(esbmc_nnet** nnet, float* img) {
  int inputs = (*nnet)->layers[0].neurons;
  for(int i=0; i< inputs; i++){
    (*nnet)->inputs[i] = img[i];
    (*nnet)->nonNormInputs[i] = (int) img[i];
  }
}

void printNeuralNetworkDescriptors(esbmc_nnet* net) {
  //printf("#include <stdio.h> \n#include <math.h>\n#include <stdlib.h>\n#include <time.h>\nfloat UpLinearRelaxation(float input, float up, float low) {\n  float relaxation = (up/(up-low))*(input-low);\n  return relaxation;\n}\nfloat LowLinearRelaxation(float input, float up, float low) {\n  float relaxation = up/(up-low)*(input);\n  return relaxation;\n}\nint main(){\n    clock_t t;\n    t = clock();\n    float y = nondet_float();\n    __ESBMC_assume(y >= 0 && y <= 1);\n    float x = nondet_float();\n    __ESBMC_assume(x >= 0 && x <= 1);\n    float safeLimit = 3.8;\n");
  int neurons = net->layers[1].neurons;
  printf("LAYER:.\n");
  printf("LAYER: %d.\n",net->layersNumber);
  for(int n = 1; n < net->layersNumber; n++) {
    printf("LAYER: %d. Neurons: %d \n", n, net->layers[n].neurons);
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

      //__ESBMC_assume(-3*x + 2*y > 0);\n    __ESBMC_assume(4*x + 1*y > 0);\n    __ESBMC_assert(x + 3*y - safeLimit < 0, \"Unsafe\");\n}");
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
  }
  return nnet;
}

esbmc_nnet* initializeNNFromNNet(int *layersDescription, int layersNumber){
  esbmc_nnet* nnet = (esbmc_nnet*)malloc(sizeof(esbmc_nnet)+ (layersNumber)*sizeof(layer));
  nnet->layersNumber = layersNumber;
  for(int i = 0; i < layersNumber; i++) {
    nnet->layers[i].neurons = layersDescription[i];
  }
  int inputs = nnet->layers[0].neurons;
  int outputs = nnet->layers[layersNumber-1].neurons;
  nnet->inputs = (float*) malloc(sizeof(float)*inputs);
  nnet->nonNormInputs = (int*) malloc(sizeof(int)*inputs);
  nnet->outputs = (float*) malloc(sizeof(float)*outputs);
  restrictionNeuronsWidth = inputs + 1;
  for(int i = 1; i < nnet->layersNumber; i++) {
    int neurons = nnet->layers[i].neurons;
    int previous = nnet->layers[i-1].neurons;
    nnet->layers[i].weights = (float*) malloc(sizeof(float)*neurons*previous);
    nnet->layers[i].bias = (float*) malloc(sizeof(float)*neurons);
    nnet->layers[i].restrictionsHIGHER = (float*) malloc(sizeof(float)*neurons*(inputs+1));
    nnet->layers[i].restrictionsLOWER = (float*) malloc(sizeof(float)*neurons*(inputs+1));
    nnet->layers[i].concretization = (float*) malloc(sizeof(float)*neurons*2);
    nnet->layers[i].outputLayer = (float*) malloc(sizeof(float)*neurons);
    nnet->layers[i].allowsSimbolic = (unsigned short*) malloc(sizeof(unsigned short)*neurons*2);
  }
  return nnet;
}

void configNet(esbmc_nnet* net, int inputs, int outputs) {
  net->layers[0].neurons = inputs;
  if(net->layersNumber > 2){
    net->layers[net->layersNumber-1].neurons = outputs;
  } else {
    net->layersNumber = 2;
    net->layers[1].neurons = outputs;
  }
  net->isPatternNet = 0;
  net->inputs = (float*) malloc(sizeof(float)*inputs);
  net->nonNormInputs = (int*) malloc(sizeof(int)*inputs);
  net->outputs = (float*) malloc(sizeof(float)*outputs);
  restrictionNeuronsWidth = inputs + 1;
  for(int i = 1; i < net->layersNumber; i++) {
    int neurons = net->layers[i].neurons;
    int previous = net->layers[i-1].neurons;
    net->layers[i].weights = (float*) malloc(sizeof(float)*neurons*previous);
    net->layers[i].bias = (float*) malloc(sizeof(float)*neurons);
    net->layers[i].restrictionsHIGHER = (float*) malloc(sizeof(float)*neurons*(inputs+1));
    net->layers[i].restrictionsLOWER = (float*) malloc(sizeof(float)*neurons*(inputs+1));
    net->layers[i].concretization = (float*) malloc(sizeof(float)*neurons*2);
    net->layers[i].outputLayer = (float*) malloc(sizeof(float)*neurons);
    net->layers[i].allowsSimbolic = (unsigned short*) malloc(sizeof(unsigned short)*neurons*2);
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

void computeLayerSimbolicPropagation(float* restrictions, int restrictionsSize, float bias, int neuronsPrevious, float* simbolicOutput){
  for(int i = 0; i < restrictionsSize; i++) {
    for(int j = 0; j < neuronsPrevious; j++){
      if(j==0){
        simbolicOutput[i] = restrictions[i+(j*(restrictionsSize))];
        //printf("SAIDA %d : %.6f \n",i+(j*(restrictionsSize)), restrictions[i+(j*(restrictionsSize))]);
      } else{
        simbolicOutput[i] += restrictions[i+(j*(restrictionsSize))];
        //printf("SAIDA %d : %.6f \n",i+(j*(restrictionsSize)), restrictions[i+(j*(restrictionsSize))]);
        if(j == neuronsPrevious - 1) {
          //printf("SAIDA: %.6f \n",simbolicOutput[i]);
        }
      }
    }
  }
  simbolicOutput[restrictionsSize-1] += bias;
}

void positiveWeights(float* coefficients, float* positiveWeights){
  for(int i = 0; i < restrictionNeuronsWidth-1; i++) {
    if(coefficients[i] > 0)
      positiveWeights[i] = coefficients[i];
    else
      positiveWeights[i] = 0;
  }
}

void negativeWeights(float* coefficients, float* negativeWeights){
  for(int i = 0; i < restrictionNeuronsWidth-1; i++) {
    if(coefficients[i] < 0)
      negativeWeights[i] = coefficients[i];
    else
      negativeWeights[i] = 0;
  }
}

void maximumVector(float* intervals, float* maximumVector) {
  for(int i = 0; i < restrictionNeuronsWidth-1; i++) {
    maximumVector[i] = intervals[(i*2)+1];
  }
}

void minimumVector(float* intervals, float* minimumVector) {
  for(int i = 0; i < restrictionNeuronsWidth-1; i++) {
    minimumVector[i] = intervals[i*2];
  }
}

void concretize(float* interval, esbmc_nnet* net, int layer, int neuron) {
  float resultUp = 0;
  float resultLow = 0;
  float* positives;
  positives = (float*) malloc(sizeof(float)*(restrictionNeuronsWidth-1));
  float* negatives;
  negatives = (float*) malloc(sizeof(float)*(restrictionNeuronsWidth-1));
  float* maximum;
  maximum = (float*) malloc(sizeof(float)*(restrictionNeuronsWidth-1));
  float* minimum;
  minimum = (float*) malloc(sizeof(float)*(restrictionNeuronsWidth-1));

  positiveWeights(&(net->layers[layer].restrictionsHIGHER[neuron*restrictionNeuronsWidth]), positives);
  negativeWeights(&(net->layers[layer].restrictionsHIGHER[neuron*restrictionNeuronsWidth]), negatives);
  maximumVector(interval, maximum);
  minimumVector(interval, minimum);
  for(int i =0; i < restrictionNeuronsWidth-1; i++) {
    resultUp += positives[i]*maximum[i] + negatives[i]*minimum[i];
    resultLow += positives[i]*minimum[i] + negatives[i]*maximum[i];
  }
  resultUp += net->layers[layer].restrictionsHIGHER[neuron*restrictionNeuronsWidth + (restrictionNeuronsWidth-1)];
  resultLow += net->layers[layer].restrictionsLOWER[neuron*restrictionNeuronsWidth + (restrictionNeuronsWidth-1)];
  if(resultUp<=0){
    net->layers[layer].allowsSimbolic[neuron*2]= 0;
    net->layers[layer].allowsSimbolic[(neuron*2)+1]= 0;
    net->layers[layer].concretization[neuron*2] = 0;
    net->layers[layer].concretization[(neuron*2)+1]= 0;
  }
  else if(resultUp > 0 && resultLow < 0) {
    net->layers[layer].allowsSimbolic[neuron*2]= 0;
    net->layers[layer].allowsSimbolic[(neuron*2)+1]= 1;
    net->layers[layer].concretization[neuron*2] = 0;
    net->layers[layer].concretization[(neuron*2)+1]= resultUp;
  }
  else {
    net->layers[layer].allowsSimbolic[neuron*2]= 1;
    net->layers[layer].allowsSimbolic[(neuron*2)+1]= 1;
    net->layers[layer].concretization[neuron*2] = resultLow;
    net->layers[layer].concretization[(neuron*2)+1]= resultUp;
  }
  free(positives);
  free(negatives);
  free(maximum);
  free(minimum);
}

void generateSimbolicBoundedEquationsFirstLayer(float* interval, esbmc_nnet* net){
  int inputs = net->layers[0].neurons;
  int currentNeurons = net->layers[1].neurons;
  for(int j = 0; j < currentNeurons; j++){
    memcpy(&(net->layers[1].restrictionsLOWER[j*restrictionNeuronsWidth]), &(net->layers[1].weights[j*inputs]), sizeof(float) * inputs);
    memcpy(&(net->layers[1].restrictionsHIGHER[j*restrictionNeuronsWidth]), &(net->layers[1].weights[j*inputs]), sizeof(float) * inputs);
    memcpy(&(net->layers[1].restrictionsLOWER[(j*restrictionNeuronsWidth)+inputs]), &(net->layers[1].bias[j]), sizeof(float));
    memcpy(&(net->layers[1].restrictionsHIGHER[(j*restrictionNeuronsWidth)+inputs]), &(net->layers[1].bias[j]), sizeof(float));
    concretize(interval, net, 1, j);
  }
}

void generateSimbolicBoundedEquations(float* interval, int layer, esbmc_nnet* net){
  int currentNeurons = net->layers[layer].neurons;
  int previousNeurons = net->layers[layer-1].neurons;
  int inputs = net->layers[0].neurons;
  float* restrictionsAuxUp;
  float* restrictionsAuxLow;
  restrictionsAuxUp = (float*) malloc(sizeof(float)*previousNeurons*(restrictionNeuronsWidth));
  restrictionsAuxLow = (float*) malloc(sizeof(float)*previousNeurons*(restrictionNeuronsWidth));
  for(int neuron = 0; neuron < currentNeurons; neuron++){
    for(int previousNeuron = 0; previousNeuron < previousNeurons; previousNeuron++) {
      if(net->layers[layer-1].allowsSimbolic[previousNeuron*2] == 1) {
        for(int i = 0; i < restrictionNeuronsWidth; i++){
          restrictionsAuxUp[previousNeuron*restrictionNeuronsWidth + i] = net->layers[layer].weights[neuron*previousNeurons]*net->layers[layer-1].restrictionsHIGHER[previousNeuron*restrictionNeuronsWidth + i];
          restrictionsAuxLow[previousNeuron*restrictionNeuronsWidth + i] = net->layers[layer].weights[neuron*previousNeurons]*net->layers[layer-1].restrictionsLOWER[previousNeuron*restrictionNeuronsWidth + i];
        }
      } else{
        for(int i = 0; i < restrictionNeuronsWidth-1; i++){
          restrictionsAuxUp[previousNeuron*restrictionNeuronsWidth + i] = 0;
          restrictionsAuxLow[previousNeuron*restrictionNeuronsWidth + i] = 0;
        }
        if(net->layers[layer].weights[neuron*previousNeurons] >= 0){
          restrictionsAuxLow[previousNeuron*restrictionNeuronsWidth + inputs] = net->layers[layer].weights[neuron*previousNeurons]*net->layers[layer-1].concretization[previousNeuron*2];
          restrictionsAuxUp[previousNeuron*restrictionNeuronsWidth + inputs] = net->layers[layer].weights[neuron*previousNeurons]*net->layers[layer-1].concretization[(previousNeuron*2)+1];
        } else{
          restrictionsAuxLow[previousNeuron*restrictionNeuronsWidth + inputs] = net->layers[layer].weights[neuron*previousNeurons]*net->layers[layer-1].concretization[(previousNeuron*2)+1];
          restrictionsAuxUp[previousNeuron*restrictionNeuronsWidth + inputs] = net->layers[layer].weights[neuron*previousNeurons]*net->layers[layer-1].concretization[previousNeuron*2];
        }
      }
    }
    computeLayerSimbolicPropagation(restrictionsAuxLow, inputs+1 ,net->layers[layer].bias[neuron], previousNeurons, &(net->layers[layer].restrictionsLOWER[neuron*restrictionNeuronsWidth]));
    computeLayerSimbolicPropagation(restrictionsAuxUp, inputs+1 ,net->layers[layer].bias[neuron], previousNeurons,  &(net->layers[layer].restrictionsHIGHER[neuron*restrictionNeuronsWidth]));
    concretize(interval, net, layer, neuron);
  }
  free(restrictionsAuxLow);
  free(restrictionsAuxUp);
}

void printConcretizations(esbmc_nnet* net){
  int layers = net->layersNumber;
  printf("LAYER NUMBER %d \n", layers);
  for(int i = 1; i<layers; i++){
    printf("LAYER %d \n", i);
    int currentLayer = net->layers[i].neurons;
    for(int j = 0; j < currentLayer; j++) {
      printf("Allows simbolic: %d   %d Concretization: %.6f   %.6f \n", net->layers[i].allowsSimbolic[j*2],
      net->layers[i].allowsSimbolic[(j*2)+1], net->layers[i].concretization[j*2],
      net->layers[i].concretization[(j*2)+1]);
    }
    printfMatrix(&(net->layers[i].restrictionsLOWER[0]), currentLayer, restrictionNeuronsWidth);
    printfMatrix(&(net->layers[i].restrictionsHIGHER[0]), currentLayer, restrictionNeuronsWidth);
  }
}

void getSimbolicNNPropagation(esbmc_nnet* net, float* intervals){
  int inputs = net->layers[0].neurons;
  //printf("INPUTS %d \n",inputs);
  int layers = net->layersNumber;
  //printf("LAYERS %d \n",layers);
  //Luiz - 20200701 - restrictionNeuronsWidth represents the input size plus bias, that is the restriction elements.
  int totalNumberOfNeurons = 0;
  int neuronsSimbolicIndexVec[layers];
  neuronsSimbolicIndexVec[0] = 0;
  for(int i =1; i < layers; i++) {
    totalNumberOfNeurons += net->layers[i].neurons;
    neuronsSimbolicIndexVec[i] = neuronsSimbolicIndexVec[i-1] + net->layers[i].neurons;
  }
  //printf("TOTAL NEURONS %d \n",totalNumberOfNeurons);
  //printIVector(neuronsSimbolicIndexVec, layers);

  neuronsSimbolicRestrictions = (float*) malloc(sizeof(float)*restrictionNeuronsWidth*totalNumberOfNeurons);
  float* restrictionsAux;
  int currentLayerNeurons;
  int previousLayerNeurons;
  int layersNeuronIndex;
  int previousLayersNeuronIndex;
  for(int l = 1; l < layers; l++){
    //printf("RESTRICTIONS OF LAYER1: \n");
    currentLayerNeurons = net->layers[l].neurons;
    if(l==1){
      for(int j = 0; j < currentLayerNeurons; j++){
        //for(int i = 0; i < inputs; i++){
          //neuronsSimbolicRestrictions[i + j*(restrictionNeuronsWidth)] = net->layers[l].weights[i + j*inputs];
          memcpy(&(neuronsSimbolicRestrictions[j*restrictionNeuronsWidth]), &(net->layers[l].weights[j*inputs]), sizeof(float)*inputs);
          memcpy(&(neuronsSimbolicRestrictions[(j*restrictionNeuronsWidth)+inputs]), &(net->layers[l].bias[j]), sizeof(float));
          //printf("RESTRICTION %d : %.6f \n",i + j*(inputs+1), neuronsSimbolicRestrictions[i + j*(inputs+1)]);
        //}
        //neuronsSimbolicRestrictions[j*(restrictionNeuronsWidth) + inputs] = net->layers[l].bias[j];
        //printf("RESTRICTION %d : %.6f \n",j*(inputs+1) + inputs, neuronsSimbolicRestrictions[j*(inputs+1) + inputs]);
      }
      generateSimbolicBoundedEquationsFirstLayer(intervals, net);
    } else{
      //printf("RESTRICTIONS OF LAYER%d: \n", l);
      currentLayerNeurons = net->layers[l].neurons;
      previousLayerNeurons = net->layers[l-1].neurons;
      layersNeuronIndex = neuronsSimbolicIndexVec[l-1]*(restrictionNeuronsWidth);
      previousLayersNeuronIndex = neuronsSimbolicIndexVec[l-2]*(restrictionNeuronsWidth);
      //printf("previousLayersNeuronIndex %d: \n", previousLayersNeuronIndex);
      restrictionsAux = (float*) malloc(sizeof(float)*previousLayerNeurons*(restrictionNeuronsWidth));
      for(int j = 0; j < currentLayerNeurons; j++){
        for(int k = 0; k < previousLayerNeurons; k++){
          for(int i = 0; i <= inputs; i++){
            restrictionsAux[i + k*(restrictionNeuronsWidth)] = net->layers[l].weights[k + j*previousLayerNeurons]*neuronsSimbolicRestrictions[previousLayersNeuronIndex + (i + k*(restrictionNeuronsWidth))];
            //printf("RESTRICTION %d : %.6f \n",i + j*(inputs+1), restrictionsAux[i + j*(inputs+1)]);
          }
        }
        //printfMatrix(restrictionsAux, 2, 3);
        computeLayerSimbolicPropagation(restrictionsAux, inputs+1 ,net->layers[l].bias[j], previousLayerNeurons, &neuronsSimbolicRestrictions[layersNeuronIndex + j*(inputs+1)]);
      }
      generateSimbolicBoundedEquations(intervals, l, net);
    }
  }
  //printfMatrix(neuronsSimbolicRestrictions, 3, 3);
}

void printIntervals(float* inputsInterval){
  int inputsSize = restrictionNeuronsWidth -1;
  for(int i=0; i<inputsSize; i++){
    printf("  float x%d = nondet_float();\n", i);
    printf("  __ESBMC_assume(x%d >= %.6f && x%d <= %.6f);\n", i, inputsInterval[i*2],i, inputsInterval[(i*2)+1]);
  }
}

void exportIntervals(float* inputsInterval){
  int inputsSize = restrictionNeuronsWidth -1;
  for(int i=0; i<inputsSize; i++){
    fprintf(outputFile,"  float x%d = nondet_float();\n", i);
    fprintf(outputFile,"  __ESBMC_assume(x%d >= %.6f && x%d <= %.6f);\n", i, inputsInterval[i*2],i, inputsInterval[(i*2)+1]);
  }
}

void printRestrictions(esbmc_nnet* net){
  int inputs = net->layers[0].neurons;
  int layers = net->layersNumber;
  int neuronsSimbolicIndexVec[layers];
  neuronsSimbolicIndexVec[0]=0;
  if (layers <= 2)
    return;
  for(int i =1; i < layers; i++) {
    neuronsSimbolicIndexVec[i] = neuronsSimbolicIndexVec[i-1] + net->layers[i].neurons;
  }
  int lastNeuronIndex = neuronsSimbolicIndexVec[layers-2];
  for(int i = 0; i < lastNeuronIndex; i++){
    printf("  __ESBMC_assume(");
    for(int j = 0; j < restrictionNeuronsWidth; j++) {
      if(j==0){
          printf("%.6f*x%d ", neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j], j);
      }
      else if(j < restrictionNeuronsWidth-1){
        if(neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j] < 0){
          printf("- %.6f*x%d ", (-1)*neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j], j);
        }
        else if(neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j] > 0){
          printf("+ %.6f*x%d ", neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j], j);
        }
      }
      else{
        if(neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j] < 0){
          printf("- %.6f > 0);\n", (-1)*neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j]);
        }
        else if(neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j] > 0){
          printf("+ %.6f > 0);\n", neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j]);
        }
        else{
          printf("> 0);\n");
        }
      }
    }
  }
}

void exportRestrictions(esbmc_nnet* net){
  int inputs = net->layers[0].neurons;
  int layers = net->layersNumber;
  int currentNeurons;
  if (layers <= 2)
    return;
  for(int l = 1; l < layers-1; l++){
    currentNeurons = net->layers[l].neurons;
    for(int i = 0; i < currentNeurons; i++){
      fprintf(outputFile,"//Low  __ESBMC_assume(");
      for(int j = 0; j < restrictionNeuronsWidth; j++) {
        if(j==0){
            //fprintf(outputFile,"%.6f*x%d ", neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j], j);
            fprintf(outputFile,"%.6f*x%d ", net->layers[l].restrictionsLOWER[i*restrictionNeuronsWidth + j], j);
        }
        else if(j < restrictionNeuronsWidth-1){
          if(net->layers[l].restrictionsLOWER[i*restrictionNeuronsWidth + j] < 0){
            //fprintf(outputFile,"- %.6f*x%d ", (-1)*neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j], j);
            fprintf(outputFile,"- %.6f*x%d ", (-1)*net->layers[l].restrictionsLOWER[i*restrictionNeuronsWidth + j], j);
          }
          else if(net->layers[l].restrictionsLOWER[i*restrictionNeuronsWidth + j] > 0){
            //fprintf(outputFile,"+ %.6f*x%d ", neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j], j);
            fprintf(outputFile,"+ %.6f*x%d ", net->layers[l].restrictionsLOWER[i*restrictionNeuronsWidth + j], j);
          }
        }
        else{
          if(net->layers[l].restrictionsLOWER[i*restrictionNeuronsWidth + j] < 0){
            //fprintf(outputFile,"- %.6f > 0);\n", (-1)*neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j]);
            fprintf(outputFile,"- %.6f > 0);\n", (-1)*net->layers[l].restrictionsLOWER[i*restrictionNeuronsWidth + j]);
          }
          else if(net->layers[l].restrictionsLOWER[i*restrictionNeuronsWidth + j] > 0){
            //fprintf(outputFile,"+ %.6f > 0);\n", neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j]);
            fprintf(outputFile,"+ %.6f > 0);\n", net->layers[l].restrictionsLOWER[i*restrictionNeuronsWidth + j]);
          }
          else{
            fprintf(outputFile,"> 0);\n");
          }
        }
      }
    }
    for(int i = 0; i < currentNeurons; i++){
      fprintf(outputFile,"//High  __ESBMC_assume(");
      for(int j = 0; j < restrictionNeuronsWidth; j++) {
        if(j==0){
            //fprintf(outputFile,"%.6f*x%d ", neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j], j);
            fprintf(outputFile,"%.6f*x%d ", net->layers[l].restrictionsHIGHER[i*restrictionNeuronsWidth + j], j);
        }
        else if(j < restrictionNeuronsWidth-1){
          if(net->layers[l].restrictionsHIGHER[i*restrictionNeuronsWidth + j] < 0){
            //fprintf(outputFile,"- %.6f*x%d ", (-1)*neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j], j);
            fprintf(outputFile,"- %.6f*x%d ", (-1)*net->layers[l].restrictionsHIGHER[i*restrictionNeuronsWidth + j], j);
          }
          else if(net->layers[l].restrictionsHIGHER[i*restrictionNeuronsWidth + j] > 0){
            //fprintf(outputFile,"+ %.6f*x%d ", neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j], j);
            fprintf(outputFile,"+ %.6f*x%d ", net->layers[l].restrictionsHIGHER[i*restrictionNeuronsWidth + j], j);
          }
        }
        else{
          if(net->layers[l].restrictionsHIGHER[i*restrictionNeuronsWidth + j] < 0){
            //fprintf(outputFile,"- %.6f > 0);\n", (-1)*neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j]);
            fprintf(outputFile,"- %.6f > 0);\n", (-1)*net->layers[l].restrictionsHIGHER[i*restrictionNeuronsWidth + j]);
          }
          else if(net->layers[l].restrictionsHIGHER[i*restrictionNeuronsWidth + j] > 0){
            //fprintf(outputFile,"+ %.6f > 0);\n", neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j]);
            fprintf(outputFile,"+ %.6f > 0);\n", net->layers[l].restrictionsHIGHER[i*restrictionNeuronsWidth + j]);
          }
          else{
            fprintf(outputFile,"> 0);\n");
          }
        }
      }
    }
  }
}

void printProperties(esbmc_nnet* net, float safeLimit){
  int layers = net->layersNumber;
  int neuronsSimbolicIndexVec[layers];
  neuronsSimbolicIndexVec[0]=0;
  for(int i =1; i < layers; i++) {
    neuronsSimbolicIndexVec[i] = neuronsSimbolicIndexVec[i-1] + net->layers[i].neurons;
  }
  int startIndex;
  int lastNeuronIndex;
  if(net->layersNumber < 2) {
    startIndex = 0;
    lastNeuronIndex = neuronsSimbolicIndexVec[layers-1];
  } else {
    startIndex = neuronsSimbolicIndexVec[layers-2];
    lastNeuronIndex = neuronsSimbolicIndexVec[layers-1];
  }
  printf("  __ESBMC_assert(");
  for(int i = startIndex; i < lastNeuronIndex; i++) {
    for(int j = 0; j < restrictionNeuronsWidth; j++){
      if(j==0){
          printf("%.6f*x%d ", neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j], j);
      }
      else if(j < restrictionNeuronsWidth-1){
        if(neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j] < 0){
          printf("- %.6f*x%d ", (-1)*neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j], j);
        }
        else if(neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j] > 0){
          printf("+ %.6f*x%d ", neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j], j);
        }
      }
      else{
        if(neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j] < 0){
          printf("- %.6f <= %.6f, \"Safety property violated\");\n", (-1)*neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j], safeLimit);
        }
        else if(neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j] > 0){
          printf("+ %.6f <= %.6f, \"Safety property violated\");\n", neuronsSimbolicRestrictions[i*restrictionNeuronsWidth + j], safeLimit);
        }
        else{
          printf("<= %.6f, \"Safety property violated\");\n", safeLimit);
        }
      }
    }
  }
}

void exportProperties(esbmc_nnet* net, float safeLimit){
  int layers = net->layersNumber - 1;
  int currentNeurons = net->layers[layers].neurons;
  for(int i = 0; i < currentNeurons; i++) {
    fprintf(outputFile,"  __ESBMC_assert(");
    for(int j = 0; j < restrictionNeuronsWidth; j++){
      if(j==0){
          fprintf(outputFile,"%.6f*x%d ", net->layers[layers].restrictionsLOWER[i*restrictionNeuronsWidth + j], j);
      }
      else if(j < restrictionNeuronsWidth-1){
        if(net->layers[layers].restrictionsLOWER[i*restrictionNeuronsWidth + j] < 0){
          fprintf(outputFile,"- %.6f*x%d ", (-1)*net->layers[layers].restrictionsLOWER[i*restrictionNeuronsWidth + j], j);
        }
        else if(net->layers[layers].restrictionsLOWER[i*restrictionNeuronsWidth + j] > 0){
          fprintf(outputFile,"+ %.6f*x%d ", net->layers[layers].restrictionsLOWER[i*restrictionNeuronsWidth + j], j);
        }
      }
      else{
        if(net->layers[layers].restrictionsLOWER[i*restrictionNeuronsWidth + j] < 0){
          fprintf(outputFile,"- %.6f <= %.6f, \"Safety property violated\");\n", (-1)*net->layers[layers].restrictionsLOWER[i*restrictionNeuronsWidth + j], safeLimit);
        }
        else if(net->layers[layers].restrictionsLOWER[i*restrictionNeuronsWidth + j] > 0){
          fprintf(outputFile,"+ %.6f <= %.6f, \"Safety property violated\");\n", net->layers[layers].restrictionsLOWER[i*restrictionNeuronsWidth + j], safeLimit);
        }
        else{
          fprintf(outputFile,"<= %.6f, \"Safety property violated\");\n", safeLimit);
        }
      }
    }
  }

  for(int i = 0; i < currentNeurons; i++) {
    fprintf(outputFile,"  __ESBMC_assert(");
    for(int j = 0; j < restrictionNeuronsWidth; j++){
      if(j==0){
          fprintf(outputFile,"%.6f*x%d ", net->layers[layers].restrictionsHIGHER[i*restrictionNeuronsWidth + j], j);
      }
      else if(j < restrictionNeuronsWidth-1){
        if(net->layers[layers].restrictionsHIGHER[i*restrictionNeuronsWidth + j] < 0){
          fprintf(outputFile,"- %.6f*x%d ", (-1)*net->layers[layers].restrictionsHIGHER[i*restrictionNeuronsWidth + j], j);
        }
        else if(net->layers[layers].restrictionsHIGHER[i*restrictionNeuronsWidth + j] > 0){
          fprintf(outputFile,"+ %.6f*x%d ", net->layers[layers].restrictionsHIGHER[i*restrictionNeuronsWidth + j], j);
        }
      }
      else{
        if(net->layers[layers].restrictionsHIGHER[i*restrictionNeuronsWidth + j] < 0){
          fprintf(outputFile,"- %.6f <= %.6f, \"Safety property violated\");\n", (-1)*net->layers[layers].restrictionsHIGHER[i*restrictionNeuronsWidth + j], safeLimit);
        }
        else if(net->layers[layers].restrictionsHIGHER[i*restrictionNeuronsWidth + j] > 0){
          fprintf(outputFile,"+ %.6f <= %.6f, \"Safety property violated\");\n", net->layers[layers].restrictionsHIGHER[i*restrictionNeuronsWidth + j], safeLimit);
        }
        else{
          fprintf(outputFile,"<= %.6f, \"Safety property violated\");\n", safeLimit);
        }
      }
    }
  }
}

void printSimbolicPropagationCode(esbmc_nnet* net, float* inputsInterval){
  printf("#include <stdio.h>\n#include <math.h>\n#include <stdlib.h>\n#include <time.h>\n  float UpLinearRelaxation(float input, float up, float low) {\n    float relaxation = (up/(up-low))*(input-low);\n    return relaxation;\n  }\n\n  float LowLinearRelaxation(float input, float up, float low) {\n    float relaxation = up/(up-low)*(input);\n    return relaxation;\n  }\n\n");
  printf("int main(){\n");
  //printing intervals;
  printIntervals(inputsInterval);
  printf("//RESTRICTIONS \n");
  printRestrictions(net);
  printf("//PROPERTIES \n");
  printProperties(net, 5.5);
  printf("}\n");
}

void exportSimbolicPropagationCode(esbmc_nnet* net, float* inputsInterval){
  fprintf(outputFile,"#include <stdio.h>\n#include <math.h>\n#include <stdlib.h>\n#include <time.h>\n\n");
  //fprintf(outputFile,"float UpLinearRelaxation(float input, float up, float low) {\n    float relaxation = (up/(up-low))*(input-low);\n    return relaxation;\n  }\n\n  float LowLinearRelaxation(float input, float up, float low) {\n    float relaxation = up/(up-low)*(input);\n    return relaxation;\n  }\n\n");
  fprintf(outputFile,"int main(){\n");
  exportIntervals(inputsInterval);
  fprintf(outputFile,"//RESTRICTIONS \n");
  exportRestrictions(net);
  fprintf(outputFile,"//PROPERTIES \n");
  exportProperties(net, 5.5);
  fprintf(outputFile,"}\n");
}

void generateOutputFileForESBMC(esbmc_nnet* net, float* inputsInterval){
  outputFile = fopen(outPutPath, "w");
  exportSimbolicPropagationCode(net, inputsInterval);
  fclose(outputFile);
}

void importNNet(esbmc_nnet** nnet){
  nnetFile = fopen(nnetFilePath, "r");
  char str[80000];
  char line[80000];
  char *nnetElement;
  int lineIndex = 0;
  int layersNumber = 0;
  int layerIndex = 1;
  int input = 0;
  int output = 0;
  int * layersDescriptor;
  float * weightsBuffer;
  float * biasBuffer;
  int weightDim = 0;
  int biasDim = 0;
  int counter = 0;
  unsigned short isLayerBeginning = 0;
  unsigned short isBiasBeginning = 0;
  if(nnetFile == NULL) {
    perror("Error opening file");
    exit(-1);
  }
  while(fgets (str, 80000, nnetFile)!=NULL){
    //Reading 1st line containing header
    if(strstr(str, "//") != NULL && lineIndex == 0) {
      //Reading 2nd line containing NumberOfLayers,InputSize,OutputSize,MaximumLayerSize
      fgets (str, 80000, nnetFile);
      lineIndex++;
      strcpy(line, str);
      nnetElement = strtok(line, ",");
      layersNumber = atof(nnetElement);
      nnetElement = strtok(NULL, ",");
      input = atof(nnetElement);
      nnetElement = strtok(NULL, ",");
      output = atof(nnetElement);
      //Reading 3rd line containing LayerDimnesions
      fgets (str, 80000, nnetFile);
      strcpy(line, str);
      layersDescriptor = (int*) malloc(sizeof(int)*(layersNumber+1));
      nnetElement = strtok(line, ",");
      for(int i = 0; i <= layersNumber; i++){
        layersDescriptor[i] = atof(nnetElement);
        nnetElement = strtok(NULL, ",");
      }
      *nnet = initializeNNFromNNet(layersDescriptor, layersNumber+1);
      isLayerBeginning = 1;
      //Reading 4th line containing deprecated flags
      fgets (str, 80000, nnetFile);
    } else {
      strcpy(line, str);
      if(isLayerBeginning){
        isLayerBeginning = 0;
        weightDim = (*nnet)->layers[layerIndex-1].neurons*((*nnet)->layers[layerIndex].neurons);
        biasDim = (*nnet)->layers[layerIndex].neurons;
        weightsBuffer = (float*) malloc(sizeof(float)*weightDim);
        biasBuffer = (float*) malloc(sizeof(float)*biasDim);
        nnetElement = strtok(line, ",");
        while(nnetElement!=NULL){
          if(strcmp(nnetElement, "") != 0 && strlen(nnetElement) > 0 && strcmp(nnetElement, "\n") != 0){
            weightsBuffer[counter] = atof(nnetElement);
            counter++;
          }
          nnetElement = strtok(NULL, ",");
        }
        if(counter >= weightDim) {
          isBiasBeginning = 1;
          counter = 0;
        }
      } else{
        if(isBiasBeginning){
          nnetElement = strtok(line, ",");
          while(nnetElement!=NULL){
            if(strcmp(nnetElement, "") != 0 && strlen(nnetElement) > 0 && strcmp(nnetElement, "\n") != 0){
              biasBuffer[counter] = atof(nnetElement);
              counter++;
            }
            nnetElement = strtok(NULL, ",");
          }
          if(counter >= biasDim){
            counter = 0;
            isBiasBeginning = 0;
            isLayerBeginning = 1;
            addLayerDescription(*nnet, layerIndex, weightsBuffer, biasBuffer);
            free(weightsBuffer);
            free(biasBuffer);
            layerIndex++;
          }
        } else{
          nnetElement = strtok(line, ",");
          while(nnetElement!=NULL){
            if(strcmp(nnetElement, "") != 0 && strlen(nnetElement) > 0 && strcmp(nnetElement, "\n") != 0){
              weightsBuffer[counter] = atof(nnetElement);
              counter++;
            }
            nnetElement = strtok(NULL, ",");
          }
          if(counter >= weightDim) {
            isBiasBeginning = 1;
            counter = 0;
          }
        }
      }
    }
  }
  fclose(nnetFile);
  //printNeuralNetworkDescriptors(nnet);
}

int neuralNetPrediction(esbmc_nnet** nnet){
  int classification = 0;
  int layers = (*nnet)->layersNumber;
  int inputs = (*nnet)->layers[0].neurons;
  int outputs = (*nnet)->layers[(*nnet)->layersNumber - 1].neurons;
  int neurons;
  int previous;
  cublasHandle_t cublasHandle;
  cublasCreate(&cublasHandle);

  float alpha;
  float beta;
  alpha = 1;
  beta = 0;
  float *onevec;
  onevec = (float*) malloc(sizeof(float)*inputs);
  setVectorValue(onevec, 1, inputs);
  //printfVector(nnet->inputs, inputs);
  normalizef((*nnet)->inputs, inputs);
  //printfVector((*nnet)->inputs, inputs);
  for(int i=1; i < layers; i++) {
    neurons = (*nnet)->layers[i].neurons;
    previous = (*nnet)->layers[i-1].neurons;
    if(i==1) {
      cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_N, neurons, 1, inputs, &alpha,
                  (*nnet)->layers[1].weights, inputs, (*nnet)->inputs, 1, &beta, (*nnet)->layers[1].outputLayer, 1);
      cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_N, neurons, 1, 1, &alpha, (*nnet)->layers[1].bias,
                  1, onevec, 1, &alpha, (*nnet)->layers[1].outputLayer, 1);
      RELU((*nnet)->layers[1].outputLayer, neurons);
      printfLayerResults((*nnet)->layers[i].outputLayer, neurons, i);
    } else {
      cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_N, neurons, 1, previous, &alpha,
                  (*nnet)->layers[i].weights, previous, (*nnet)->layers[i-1].outputLayer, 1, &beta, (*nnet)->layers[i].outputLayer, 1);
      cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_N, neurons, 1, 1, &alpha, (*nnet)->layers[i].bias,
                  1, onevec, 1, &alpha, (*nnet)->layers[i].outputLayer, 1);
      if(i != layers -1){
        RELU((*nnet)->layers[i].outputLayer, neurons);
      }
      printfLayerResults((*nnet)->layers[i].outputLayer, neurons, i);
     }
  }
  classification = biggest((*nnet)->layers[layers-1].outputLayer, outputs);
  return classification;
  //printfLayerResults(nnet->layers[layers-1].outputLayer, neurons, 3);
  //printf("CLASSIFICATION %d \n", biggest(nnet->layers[nnet->layersNumber - 1].outputLayer, outputs));
}

void exportAssumes(int * input, int range, int size) {
  int min = 0;
  int max = 0;
  for(int i = 0; i < size; i++) {
    fprintf(ann2cFile,"int x%d = nondet_int();\n", i);
    max = input[i] + range;
    min = input[i] - range;
    if((input[i] + range) > 255){
      max = 255;
      min = 255 - 2*range;
    }
    else if ((input[i] - range) < 0){
      min = 0;
      max = 0 + 2*range;
    } else {
      max = input[i] + range;
      min = input[i] - range;
    }
    if(max>255)
      max = 255;
    if(min < 0)
      min = 0;
    fprintf(ann2cFile,"__ESBMC_assume((x%d >= %d)&&(x%d <=%d));\n",i, min,i, max);
  }
  fprintf(ann2cFile,"float i[%d];\n", size);
  for(int j = 0; j< size;j++){
    fprintf(ann2cFile,"i[%d] = ((float) x%d)*norm;\n", j, j);
  }
  fprintf(ann2cFile,"\n\n");
}

void exportANNC(esbmc_nnet** nnet, int classification, int range){
  int layers = (*nnet)->layersNumber;
  int inputs = (*nnet)->layers[0].neurons;
  int outputs = (*nnet)->layers[(*nnet)->layersNumber - 1].neurons;
  char sufix[100];
  int neurons;
  int previous;
  char cwd[PATH_MAX];
  if (getcwd(cwd, sizeof(cwd)) != NULL) {
    printf("Current working dir: %s\n", cwd);
  } else {
    perror("Unable to get current path. getcwd() error");
    exit(1);
  }
  strcpy(ANN2CPath, cwd);
  strcat(ANN2CPath, nnetFileName);
  sprintf(sufix, "_L%d_R%d.c", classification, range);
  strcat(ANN2CPath, sufix);
  printf("path: %s\n", ANN2CPath);
  ann2cFile = fopen(ANN2CPath, "w");
  fprintf(ann2cFile,"#include <stdio.h>\n#include <math.h>\n#include <stdlib.h>\n#include <time.h>\n\n");
  //fprintf(outputFile,"float UpLinearRelaxation(float input, float up, float low) {\n    float relaxation = (up/(up-low))*(input-low);\n    return relaxation;\n  }\n\n  float LowLinearRelaxation(float input, float up, float low) {\n    float relaxation = up/(up-low)*(input);\n    return relaxation;\n  }\n\n");
  fprintf(ann2cFile,"int main(){\n");
  fprintf(ann2cFile,"float norm = (float)1/(float)255;\n");
  exportAssumes((*nnet)->nonNormInputs, range, inputs);

  for(int i=1; i < layers; i++) {
    neurons = (*nnet)->layers[i].neurons;
    previous = (*nnet)->layers[i-1].neurons;
    fprintf(ann2cFile, "float layer%d[%d];\n", i, neurons);
    if(i==1) {
      for(int j = 0; j < neurons; j++) {
        fprintf(ann2cFile, "layer%d[%d]= ", i, j);
        for(int k =0; k < previous; k++){
          fprintf(ann2cFile, "(%.6f)*i[%d] + ", (*nnet)->layers[i].weights[j*inputs + k], k);
        }
          fprintf(ann2cFile, "(%.6f);\n", (*nnet)->layers[i].bias[j]);
          fprintf(ann2cFile, "if (layer%d[%d] < 0) layer%d[%d]=0;\n", i, j, i, j);
      }
    } else {
      for(int j = 0; j < neurons; j++) {
        fprintf(ann2cFile, "layer%d[%d]= ", i, j);
        for(int k =0; k < previous; k++){
          fprintf(ann2cFile, "%.6f*layer%d[%d] + ", (*nnet)->layers[i].weights[j*inputs + k],i-1, k);
        }
          fprintf(ann2cFile, "%.6f;\n", (*nnet)->layers[i].bias[j]);

      if(i != layers -1){
        fprintf(ann2cFile, "if (layer%d[%d] < 0) layer%d[%d]=0;\n", i, j, i, j);
      }
    }
     }
  }
  for(int n =0; n < outputs; n++){
    if(n != classification)
      fprintf(ann2cFile, "__ESBMC_assert(layer%d[%d] > layer%d[%d], \"Classification is not a %d anymore. It is %d.\");\n", layers-1, classification, layers-1, n, classification, n);
  }
  fprintf(ann2cFile, "}\n");
  fclose(ann2cFile);
}


int main(int argc,char* argv[]){
  clock_t t;
  t = clock();
  int range[5] = {10, 20, 40, 80, 120};
  esbmc_nnet* nnet;
  //number 7
  float img0[784] = {0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,84.0,185.0,159.0,151.0,60.0,36.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,222.0,254.0,254.0,254.0,254.0,241.0,198.0,198.0,198.0,198.0,198.0,198.0,198.0,198.0,170.0,52.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,67.0,114.0,72.0,114.0,163.0,227.0,254.0,225.0,254.0,254.0,254.0,250.0,229.0,254.0,254.0,140.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,17.0,66.0,14.0,67.0,67.0,67.0,59.0,21.0,236.0,254.0,106.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,83.0,253.0,209.0,18.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,22.0,233.0,255.0,83.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,129.0,254.0,238.0,44.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,59.0,249.0,254.0,62.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,133.0,254.0,187.0,5.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,9.0,205.0,248.0,58.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,126.0,254.0,182.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,75.0,251.0,240.0,57.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,19.0,221.0,254.0,166.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,3.0,203.0,254.0,219.0,35.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,38.0,254.0,254.0,77.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,31.0,224.0,254.0,115.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,133.0,254.0,254.0,52.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,61.0,242.0,254.0,254.0,52.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,121.0,254.0,254.0,219.0,40.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,121.0,254.0,207.0,18.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};

//number 2
  float img1[784] =
  {0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,116.0,125.0,171.0,255.0,255.0,150.0,93.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,169.0,253.0,253.0,253.0,253.0,253.0,253.0,218.0,30.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,169.0,253.0,253.0,253.0,213.0,142.0,176.0,253.0,253.0,122.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,52.0,250.0,253.0,210.0,32.0,12.0,0.0,6.0,206.0,253.0,140.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,77.0,251.0,210.0,25.0,0.0,0.0,0.0,122.0,248.0,253.0,65.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,31.0,18.0,0.0,0.0,0.0,0.0,209.0,253.0,253.0,65.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,117.0,247.0,253.0,198.0,10.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,76.0,247.0,253.0,231.0,63.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,128.0,253.0,253.0,144.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,176.0,246.0,253.0,159.0,12.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,234.0,253.0,233.0,35.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,198.0,253.0,253.0,141.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,78.0,248.0,253.0,189.0,12.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,19.0,200.0,253.0,253.0,141.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,134.0,253.0,253.0,173.0,12.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,248.0,253.0,253.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,248.0,253.0,253.0,43.0,20.0,20.0,20.0,20.0,5.0,0.0,5.0,20.0,20.0,37.0,150.0,150.0,150.0,147.0,10.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,248.0,253.0,253.0,253.0,253.0,253.0,253.0,253.0,168.0,143.0,166.0,253.0,253.0,253.0,253.0,253.0,253.0,253.0,123.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,174.0,253.0,253.0,253.0,253.0,253.0,253.0,253.0,253.0,253.0,253.0,253.0,249.0,247.0,247.0,169.0,117.0,117.0,57.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,118.0,123.0,123.0,123.0,166.0,253.0,253.0,253.0,155.0,123.0,123.0,41.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};

//number 1
  float img2[784] =
  {0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,38.0,254.0,109.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,87.0,252.0,82.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,135.0,241.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,45.0,244.0,150.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,84.0,254.0,63.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,202.0,223.0,11.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,32.0,254.0,216.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,95.0,254.0,195.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,140.0,254.0,77.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,57.0,237.0,205.0,8.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,124.0,255.0,165.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,171.0,254.0,81.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,24.0,232.0,215.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,120.0,254.0,159.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,151.0,254.0,142.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,228.0,254.0,66.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,61.0,251.0,254.0,66.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,141.0,254.0,205.0,3.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,10.0,215.0,254.0,121.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,5.0,198.0,176.0,10.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};

//number 0
  float img3[784] =
  {0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,11.0,150.0,253.0,202.0,31.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,37.0,251.0,251.0,253.0,107.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,21.0,197.0,251.0,251.0,253.0,107.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,110.0,190.0,251.0,251.0,251.0,253.0,169.0,109.0,62.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,253.0,251.0,251.0,251.0,251.0,253.0,251.0,251.0,220.0,51.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,182.0,255.0,253.0,253.0,253.0,253.0,234.0,222.0,253.0,253.0,253.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,63.0,221.0,253.0,251.0,251.0,251.0,147.0,77.0,62.0,128.0,251.0,251.0,105.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,32.0,231.0,251.0,253.0,251.0,220.0,137.0,10.0,0.0,0.0,31.0,230.0,251.0,243.0,113.0,5.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,37.0,251.0,251.0,253.0,188.0,20.0,0.0,0.0,0.0,0.0,0.0,109.0,251.0,253.0,251.0,35.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,37.0,251.0,251.0,201.0,30.0,0.0,0.0,0.0,0.0,0.0,0.0,31.0,200.0,253.0,251.0,35.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,37.0,253.0,253.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,32.0,202.0,255.0,253.0,164.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,140.0,251.0,251.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,109.0,251.0,253.0,251.0,35.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,217.0,251.0,251.0,0.0,0.0,0.0,0.0,0.0,0.0,21.0,63.0,231.0,251.0,253.0,230.0,30.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,217.0,251.0,251.0,0.0,0.0,0.0,0.0,0.0,0.0,144.0,251.0,251.0,251.0,221.0,61.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,217.0,251.0,251.0,0.0,0.0,0.0,0.0,0.0,182.0,221.0,251.0,251.0,251.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,218.0,253.0,253.0,73.0,73.0,228.0,253.0,253.0,255.0,253.0,253.0,253.0,253.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,113.0,251.0,251.0,253.0,251.0,251.0,251.0,251.0,253.0,251.0,251.0,251.0,147.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,31.0,230.0,251.0,253.0,251.0,251.0,251.0,251.0,253.0,230.0,189.0,35.0,10.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,62.0,142.0,253.0,251.0,251.0,251.0,251.0,253.0,107.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,72.0,174.0,251.0,173.0,71.0,72.0,30.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};

//number 4
  float img4[784] =
  {0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,50.0,224.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,70.0,29.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,121.0,231.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,148.0,168.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,4.0,195.0,231.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,96.0,210.0,11.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,69.0,252.0,134.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,114.0,252.0,21.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,45.0,236.0,217.0,12.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,192.0,252.0,21.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,168.0,247.0,53.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,18.0,255.0,253.0,21.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,84.0,242.0,211.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,141.0,253.0,189.0,5.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,169.0,252.0,106.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,32.0,232.0,250.0,66.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,225.0,252.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,134.0,252.0,211.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,22.0,252.0,164.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,169.0,252.0,167.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,9.0,204.0,209.0,18.0,0.0,0.0,0.0,0.0,0.0,0.0,22.0,253.0,253.0,107.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,169.0,252.0,199.0,85.0,85.0,85.0,85.0,129.0,164.0,195.0,252.0,252.0,106.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,41.0,170.0,245.0,252.0,252.0,252.0,252.0,232.0,231.0,251.0,252.0,252.0,9.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,49.0,84.0,84.0,84.0,84.0,0.0,0.0,161.0,252.0,252.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,127.0,252.0,252.0,45.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,128.0,253.0,253.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,127.0,252.0,252.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,135.0,252.0,244.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,232.0,236.0,111.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,179.0,66.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};
  if(argc < 3){
    printf("Error. Atleast the output path and .nnet file must be passed to the program.\n");
    exit(-1);
  } else {
    strcpy(outPutPath, argv[1]);
    strcat(outPutPath, fileName);
    if(strstr(argv[2], nnetExt) != NULL) {
      char buff[100] = "/";
      strcpy(nnetFilePath, argv[2]);
      strcat(buff, basename(argv[2]));
      strncpy(nnetFileName, buff, strlen(buff)-5);
      printf("FILE NAME %s \n", nnetFileName);
      importNNet(&nnet);
    } else {
      strcpy(nnetFileName, ANN2C);
    }
  }

  setImg(&nnet, img4);


  int classification = 0;
  classification = neuralNetPrediction(&nnet);
  printf("CLASSIFICATION : %d.\n", classification);
  for(int i = 0; i < arraySize(range); i++){
    exportANNC(&nnet, classification, range[i]);
  }
  //printNeuralNetworkDescriptors(nnet);

  t = clock() - t;
  double time_taken = ((double)t)/CLOCKS_PER_SEC; // calculate the elapsed time
  printf("The program took %f seconds to execute\n", time_taken);
}
