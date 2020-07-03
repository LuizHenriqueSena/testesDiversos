#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#define arraySize(x)  (int)(sizeof(x) / sizeof((x)[0]))

float* neuronsSimbolicRestrictions;

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

void printNeuralNetworkDescriptors(esbmc_nnet* net) {
  //printf("#include <stdio.h> \n#include <math.h>\n#include <stdlib.h>\n#include <time.h>\nfloat UpLinearRelaxation(float input, float up, float low) {\n  float relaxation = (up/(up-low))*(input-low);\n  return relaxation;\n}\nfloat LowLinearRelaxation(float input, float up, float low) {\n  float relaxation = up/(up-low)*(input);\n  return relaxation;\n}\nint main(){\n    clock_t t;\n    t = clock();\n    float y = nondet_float();\n    __ESBMC_assume(y >= 0 && y <= 1);\n    float x = nondet_float();\n    __ESBMC_assume(x >= 0 && x <= 1);\n    float safeLimit = 3.8;\n");
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

void computeLayerSimbolicPropagation(float* restrictions, int restrictionsSize, float bias, int neuronsPrevious, float* simbolicOutput){
  printfMatrix(restrictions, 2, 3);
  for(int i = 0; i < restrictionsSize; i++) {
    for(int j = 0; j < neuronsPrevious; j++){
      if(j==0){
        simbolicOutput[i] = restrictions[i+(j*(restrictionsSize))];
        printf("SAIDA %d : %.6f \n",i+(j*(restrictionsSize)), restrictions[i+(j*(restrictionsSize))]);
      } else{
        simbolicOutput[i] += restrictions[i+(j*(restrictionsSize))];
        printf("SAIDA %d : %.6f \n",i+(j*(restrictionsSize)), restrictions[i+(j*(restrictionsSize))]);
        if(j == neuronsPrevious - 1) {
          printf("SAIDA: %.6f \n",simbolicOutput[i]);
        }
      }
    }
  }
  simbolicOutput[restrictionsSize-1] += bias;
}


void getSimbolicNNPropagation(esbmc_nnet* net){
  int inputs = net->layers[0].neurons;
  printf("INPUTS %d \n",inputs);
  int layers = net->layersNumber;
  printf("LAYERS %d \n",layers);
  //Luiz - 20200701 - restrictionNeuronsSize represents the input size plus bias, that is the restriction elements.
  int restrictionNeuronsSize = inputs + 1;
  int totalNumberOfNeurons = 0;
  int neuronsSimbolicIndexVec[layers];
  neuronsSimbolicIndexVec[0] = 0;
  for(int i =1; i < layers; i++) {
    totalNumberOfNeurons += net->layers[i].neurons;
    neuronsSimbolicIndexVec[i] = neuronsSimbolicIndexVec[i-1] + net->layers[i].neurons;
  }
  printf("TOTAL NEURONS %d \n",totalNumberOfNeurons);
  printIVector(neuronsSimbolicIndexVec, layers);

  neuronsSimbolicRestrictions = (float*) malloc(sizeof(float)*restrictionNeuronsSize*totalNumberOfNeurons);
  float* restrictionsAux;
  int currentLayerNeurons;
  int previousLayerNeurons;
  int layersNeuronIndex;
  int previousLayersNeuronIndex;
  for(int l = 1; l < layers; l++){
    printf("RESTRICTIONS OF LAYER1: \n");
    currentLayerNeurons = net->layers[l].neurons;
    if(l==1){
      for(int j = 0; j < currentLayerNeurons; j++){
        for(int i = 0; i < inputs; i++){
          neuronsSimbolicRestrictions[i + j*(inputs+1)] = net->layers[l].weights[i + j*inputs];
          printf("RESTRICTION %d : %.6f \n",i + j*(inputs+1), neuronsSimbolicRestrictions[i + j*(inputs+1)]);
        }
        neuronsSimbolicRestrictions[j*(inputs+1) + inputs] = net->layers[l].bias[j];
        printf("RESTRICTION %d : %.6f \n",j*(inputs+1) + inputs, neuronsSimbolicRestrictions[j*(inputs+1) + inputs]);
      }
    } else{
      printf("RESTRICTIONS OF LAYER%d: \n", l);
      currentLayerNeurons = net->layers[l].neurons;
      previousLayerNeurons = net->layers[l-1].neurons;
      layersNeuronIndex = neuronsSimbolicIndexVec[l-1]*(inputs+1);
      previousLayersNeuronIndex = neuronsSimbolicIndexVec[l-2]*(inputs+1);
      printf("previousLayersNeuronIndex %d: \n", previousLayersNeuronIndex);
      restrictionsAux = (float*) malloc(sizeof(float)*previousLayerNeurons*(inputs+1));
      for(int j = 0; j < currentLayerNeurons; j++){
        for(int k = 0; k < previousLayerNeurons; k++){
          for(int i = 0; i <= inputs; i++){
            restrictionsAux[i + k*(inputs+1)] = net->layers[l].weights[k + j*previousLayerNeurons]*neuronsSimbolicRestrictions[previousLayersNeuronIndex + (i + k*(inputs+1))];
            printf("RESTRICTION %d : %.6f \n",i + j*(inputs+1), restrictionsAux[i + j*(inputs+1)]);
          }
        }
        printfMatrix(restrictionsAux, 2, 3);
        computeLayerSimbolicPropagation(restrictionsAux, inputs+1 ,net->layers[l].bias[j], previousLayerNeurons, &neuronsSimbolicRestrictions[layersNeuronIndex + j*(inputs+1)]);
      }
    }
  }
  printfMatrix(neuronsSimbolicRestrictions, 3, 3);
}

int main(){
  int hiddenLayers[1] = {2};
  // float w1[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  // float bias1[10] = {1, 2, 3, 4, 5, 7, 7, 8, 9, 10};
  // float w2[20] = {1, 2, 3, 4, 5, 7, 7, 8, 9, 10, 1, 2, 3, 4, 5, 7, 7, 8, 9, 10};
  // float bias2[2] = {2, 20};
  // float w3[8] = {31, 32, 33, 34, 35, 37, 37, 38};
  // float bias3[4] = {2, 20, 4, 5};
  // float w4[40] = {1, 2, 3, 4,
  //   5, 7, 7, 8,
  //   9, 10, 1, 2,
  //   3, 4, 5, 7,
  //   7, 8, 9, 10,
  //   1, 2, 3, 4,
  //   5, 7, 7, 8,
  //   9, 10, 1, 2,
  //   3, 4, 5, 7,
  //   7, 8, 9, 10};
  // float bias4[10] = {1, 2, 3, 4, 5, 7, 7, 8, 9, 10};

  float w1[4]= {-3, 2,
                4, 1};

  float bias1[2] = {1, 0};

  float w2[2] = {1, 1};

  float bias2[1] = {5};

   esbmc_nnet* nnet = initializeNN(hiddenLayers, arraySize(hiddenLayers));
   configNet(nnet,2,1);
    addLayerDescription(nnet, 1, w1, bias1);
    addLayerDescription(nnet, 2, w2, bias2);
   // addLayerDescription(nnet, 3, w3, bias3);
   // addLayerDescription(nnet, 4, w4, bias4);
   printfLayers(nnet);
  printNeuralNetworkDescriptors(nnet);
  getSimbolicNNPropagation(nnet);

}
