#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>
#include "cuda_operational_model.h"

//sudo gcc -o main6 intervalSets.c -I . -lm
void printfMatrix(float * mat, int rows, int column) {
int i =0, j = 0;
for(i = 0; i< rows; i++) {
  for(j = 0; j<column; j++) {
    printf("  %.6f", mat[i*column + j]);
  }
  printf("\n");
}
}

void printfMatrixT(float * mat, int rows, int column) {
int i =0, j = 0;
for(j = 0; j<column; j++) {
  for(i = 0; i< rows; i++) {
    printf("  %.6f", mat[i*column + j]);
  }
  printf("\n");
}
}

void concatVectorsAsColumns(float* vec1, float* vec2, int size, float* out) {
  int i = 0;
  for(i = 0; i<size; i++) {
    out[i*2] = vec1[i];
    out[i*2 + 1] = vec2[i];
  }
}

void activationRELU(float* input, int size, float* output){
  for(int i =0; i< size; i++){
    if(input[i] > 0){
      output[i] = input[i];
    }
    else
      output[i] = 0;
  }
}

void printIMatrix(int * mat, int rows, int column) {
int i =0, j = 0;
for(i = 0; i< rows; i++) {
  for(j = 0; j<column; j++) {
    printf("  %d", mat[i*column + j]);
  }
  printf("\n");
}
}

void printIMatrixT(int * mat, int rows, int column) {
int i =0, j = 0;
for(j = 0; j<column; j++) {
  for(i = 0; i< rows; i++) {
    printf("  %d", mat[i*column + j]);
  }
  printf("\n");
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

void diag(float* vec, int size, float* out) {
  int i = 0;
  for(i = 0; i<size; i++) {
    out[i] = vec[i*size + i];
  }
}

int* sign(float* w, int size) {
  int* out = (int*)malloc(size* sizeof(int));
  int i = 0;
  for(i = 0; i < size; i++) {
    if(w[i] < 0) {
      out[i] = -1;
    }
    else if (w[i] == 0) {
      out[i] = 0;
    }
    else {
      out[i] = 1;
    }
  }
  return out;
}

void inferiorIntervalMapping(float* I, float* W, int rows, int columns, float* out) {
  int* signMatrix;
  signMatrix = sign(W, rows*columns);
  int i = 0;
  int j = 0;
  for(i = 0; i < rows; i++) {
    for(j = 0; j < columns; j++) {
      if(signMatrix[j + i*columns] == 1) {
        out[j + i*columns] = I[j*2];
      }
      else {
        out[j + i*columns] = I[(j*2)+1];
      }
    }
  }
}

void superiorIntervalMapping(float* I, float* W, int rows, int columns, float* out) {
  int* signMatrix;
  signMatrix = sign(W, rows*columns);
  int i = 0;
  int j = 0;
  for(i = 0; i < rows; i++) {
    for(j = 0; j < columns; j++) {
      if(signMatrix[j + i*columns] == 1) {
        out[j + i*columns] = I[(j*2)+1];
      }
      else {
        out[j + i*columns] = I[j*2];
      }
    }
  }
}


void generateIntervalFromInputLabelAndRange(int* label,int labelSize, int range, float* outputLabel) {
    int i = 0;
    for(i=0; i<labelSize; i++) {
      if((label[i] + range) > 255) {
        outputLabel[(i*2)+1] = (float)255;
      }
      else{
        outputLabel[(i*2)+1] = (float)(label[i] + range);
      }

      if((label[i] - range) < 0) {
        outputLabel[i*2] = (float)0;
      }
      else {
        outputLabel[i*2] = (float)(label[i] - range);
      }
    }
}

void generateIntervalFromInputLabelAndRangeAndArea(float* label,int rows, int columns, int range, int position, int sizeOfWindow, float * outputLabel) {
    int i = 0;
    int j = 0;
    int isInsideWindow = 0;
    int numberOfWindows = ((rows-sizeOfWindow)+1)*((columns-sizeOfWindow)+1);
    if(position >= numberOfWindows || sizeOfWindow == 0 || rows-sizeOfWindow < 0 || columns-sizeOfWindow < 0) {
        printf("Wrong setting parameters for sizeWindow: %d and rows: %d and columns: %d or position: %d \n",sizeOfWindow,rows, columns, position);
        exit(0);
    }
    int y = position/((columns-sizeOfWindow)+1);
    int x = position%((columns-sizeOfWindow)+1);
    for(i = 0; i< rows; i++) {
      for(j = 0; j<columns; j++) {
        isInsideWindow = 0;
        if((j < x+sizeOfWindow) && (j >= x)) {
          if((i < y+sizeOfWindow) && (i >= y)) {
            isInsideWindow = 1;

            if((label[i*columns + j] + range) > 255) {
              outputLabel[((i*columns + j)*2)+1] = (float)255;
            }
            else {
              outputLabel[((i*columns + j)*2)+1] = (float)(label[(i*columns + j)] + range);
            }

            if((label[i*columns + j] - range) < 0) {
              outputLabel[(i*columns + j)*2] = (float)0;
            }
            else {
              outputLabel[(i*columns + j)*2] = (float)(label[(i*columns + j)] - range);
            }
          }
        }
        if(!isInsideWindow) {
          outputLabel[(i*columns + j)*2] = label[(i*columns + j)];
          outputLabel[((i*columns + j)*2)+1] = label[(i*columns + j)];
        }
      }
    }
}


void printIntervalFromInputLabelAndRangeAndArea(int* label,int rows, int columns, int range, int position, int sizeOfWindow) {
    int i = 0;
    int j = 0;
    int isInsideWindow = 0;
    int numberOfWindows = ((rows-sizeOfWindow)+1)*((columns-sizeOfWindow)+1);
    if(position >= numberOfWindows) {
        return;
    }
    int y = position/((columns-sizeOfWindow)+1);
    int x = position%((columns-sizeOfWindow)+1);
    for(i = 0; i< rows; i++) {
      for(j = 0; j<columns; j++) {
        isInsideWindow = 0;
        if((j < x+sizeOfWindow) && (j >= x)) {
          if((i < y+sizeOfWindow) && (i >= y)) {
            isInsideWindow = 1;
            printf("  %.6f", (float)100);
          }
        }
        if(!isInsideWindow) {
          printf("  %.6f", (float) 0);
        }
      }
      printf("\n");
    }
}

int probableAdversarialExample(float* outputInterval, int outputNeuronNumber, int label) {
  int i =0;
  int indexOfBiggestMaxInterval = -1;
  float auxBiggest = -1;
for(i = 0; i<outputNeuronNumber; i++) {
  if(i!=label) {
    if(indexOfBiggestMaxInterval < 0) {
      indexOfBiggestMaxInterval = i;
      auxBiggest = outputInterval[i*2+1];
    }
    if((outputInterval[(i*2)+1]) > auxBiggest) {
      indexOfBiggestMaxInterval = i;
      auxBiggest = outputInterval[(i*2)+1];
    }
  }
}
  if(outputInterval[label*2] < auxBiggest) {
    return indexOfBiggestMaxInterval;
  }
  else
    return -1;
}

int biggest(float* vec, int size) {
  int i = 0;
  float biggest = vec[0];
  int biggestIndex = 0;
  for(i=1; i<size;i++) {
    if(vec[i] > biggest) {
      printf("1: %.6f e 2: %.6f e index: %d \n",vec[i], biggest, i);
      biggestIndex = i;
      biggest = vec[i];
    }
  }
  return biggestIndex;
}

int sizeOfOutputMatrix(int* intervalBreaksVec){
  int inputSize = (int) sizeof(intervalBreaksVec)/sizeof(intervalBreaksVec[0]);
  int outputSize = 0;
  for(int i =0; i < inputSize; i++) {
      outputSize += (intervalBreaksVec[i]+1);
  }
  return outputSize;
}

void printLattices(float* intputBreaksIntervals,int* intervalBreaksVec){
  int intVecSize = (int) sizeof(intervalBreaksVec)/sizeof(intervalBreaksVec[0]);
  int outIndex = 0;
  for(int i = 0; i < intVecSize; i++) {
      for(int j = 0; j <= intervalBreaksVec[i]; j++) {
        printf("%.6f  ",intputBreaksIntervals[outIndex]);
        outIndex++;
  }
  printf("\n");
}
}

void generateLattices(float* interval, int* intervalBreaksVec, float* intputBreaksIntervals) {
  int intVecSize = (int) sizeof(intervalBreaksVec)/sizeof(intervalBreaksVec[0]);
  int outIndex = 0;
  for(int i = 0; i < intVecSize; i++) {
    int inputBreaks = intervalBreaksVec[i];
    float inputRange = (interval[(i*2)+1] - interval[i*2])/inputBreaks;
    for(int j = 0; j <= inputBreaks; j++) {
      intputBreaksIntervals[outIndex] = interval[i*2] + inputRange*j;
      outIndex++;
    }
  }
}

void generateInvertedAcumulated(int* intervalBreaksVec, int* invertedAcumulated) {
  int intVecSize = (int) sizeof(intervalBreaksVec)/sizeof(intervalBreaksVec[0]);
  int acumulated = 1;
    for(int i = intVecSize; i > 0; i--) {
      acumulated *= intervalBreaksVec[i - 1];
      invertedAcumulated[i - 1] = acumulated;
    }
}


void generateBeginningIndex(int* intervalBreaksVec, int*beginningIndexVec) {
  int intVecSize = (int) sizeof(intervalBreaksVec)/sizeof(intervalBreaksVec[0]);
  int acumulated = intervalBreaksVec[0] + 1;
  beginningIndexVec[0] = 0;
  for(int i = 1; i < intVecSize; i++) {
    beginningIndexVec[i] = acumulated;
    acumulated += (beginningIndexVec[i]+1);
  }
}

void performUnion(float* unionVec, int* size, float* setInclude) {
  if(*size==0) {
    unionVec[0] = setInclude[0];
    unionVec[1] = setInclude[1];
    *size = *size + 1;
    return;
  }
    for(int i = *size-1; i >= 0; i--) {
      if(unionVec[i*2] <= setInclude[0] && unionVec[(i*2)+1] >= setInclude[1]) {
          return;
      } else if(unionVec[i*2] >= setInclude[0] && unionVec[(i*2)+1] <= setInclude[1]) {
          unionVec[i*2] = setInclude[0];
          unionVec[(i*2)+1] = setInclude[1];
          return;
      }
      else {
          if(unionVec[i*2] <= setInclude[0]) {
            if(unionVec[(i*2)+1] >= setInclude[0]) {
              unionVec[(i*2)+1] = setInclude[1];
              return;
            }
          }
          else if(unionVec[i*2] >= setInclude[0]){
            if(unionVec[i*2] <= setInclude[1]) {
              unionVec[i*2] = setInclude[0];
              return;
            }
          }
        }
      }
        unionVec[*size*2] = setInclude[0];
        unionVec[(*size*2)+1] = setInclude[1];
        *size = *size+1;
}

void getOneIntervalFromLattices(float* intputBreaksIntervals,int index, int* beginningIndexVec, int* invertedAcumulated, float* intervalDomain) {
  int intVecSize = (int) sizeof(beginningIndexVec)/sizeof(beginningIndexVec[0]);
  int currentNeuronIndex = 0;
  int rest = index;
  int order = 0;
  for(int i=0; i< intVecSize; i++) {
    if(i == intVecSize-1){
      order = rest;
    } else {
      order = index/invertedAcumulated[i+1];
      rest = rest - order*invertedAcumulated[i+1];
    }
    currentNeuronIndex = beginningIndexVec[i];
    intervalDomain[i*2] = intputBreaksIntervals[currentNeuronIndex+order];
    intervalDomain[(i*2)+1] = intputBreaksIntervals[currentNeuronIndex+order+1];
  }
}

void increaseLattices( int* intervalBreaksVec, int number){
  int intVecSize = (int) sizeof(intervalBreaksVec)/sizeof(intervalBreaksVec[0]);
  for(int i=0; i< intVecSize; i++) {
    intervalBreaksVec[i] += number;
  }
}

void computeLayerSimbolicPropagation(float* layerAux, float* bias, int size, int neuronsPrevious, float* simbolicOutput){
  for(int i = 0; i < size+1; i++) {
    for(int j = 0; j < neuronsPrevious; j++){
      if(j==0){
        simbolicOutput[i] = layerAux[i+(j*(size+1))];
      } else{
        simbolicOutput[i] += layerAux[i+(j*(size+1))];
      }
    }
  }
}

void getSimbolicPropagationOfNN(float* w1, float* bias1, float* w2, float* bias2, int* inputSize, float* simbolicOperator){
  int dimension1 = (inputSize[0]+1)*inputSize[1];
  int inputs = inputSize[0];
  int neuronsIn = inputSize[1];
  int neuronsOut = inputSize[2];
  float* layer1Aux;
  layer1Aux = (float*)malloc((dimension1)* sizeof(int));
  for(int k = 0; k < neuronsOut; k++) {
    for(int i = 0; i < neuronsIn; i++) {
      for(int j = 0; j < inputs; j++) {
        layer1Aux[i*(inputs+1) + j] = w1[i*inputs + j] * w2[k*neuronsIn + i];
      }
      layer1Aux[i*(inputs+1)+(inputs) ] = bias1[i]*w2[k*neuronsIn + i];
    }
  }
  printf("Restrictions\n");
  printfMatrix(layer1Aux, 2, 3);
  float* layer2Simbolic;
  layer2Simbolic = (float*)malloc((inputs+1)* sizeof(int));
  computeLayerSimbolicPropagation(layer1Aux, bias2, inputSize[0], inputSize[1], layer2Simbolic);
  printf("Simbolic Propagation:\n");
  printfMatrix(layer2Simbolic, 1, 3);
}

int imageIntervalFromLattices(float* interval, int* intervalBreaksVec, float safeLimit) {
  int safe = 0;

  float w1[4]= {-3, 2,
                4, 1};

  float bias1[2] = {0, 0};

  float w2[2] = {1, 1};

  float bias2[1] = {0};

  int inputSize[3] = {2, 2, 1};
  float* simbolicOperator;
  simbolicOperator = (float*)malloc((inputSize[0]+1)* sizeof(int));

  getSimbolicPropagationOfNN(w1, bias1, w2, bias2, inputSize, simbolicOperator);

  cublasHandle_t cublasHandle;
  cublasCreate(&cublasHandle);

  float alpha;
  float beta;
  alpha = 1;
  beta = 0;
  float onevec[1] = {1};

  int intputBreaksIntervalsSize = sizeOfOutputMatrix(intervalBreaksVec);
  float* intputBreaksIntervals;
  intputBreaksIntervals = (float*)malloc(intputBreaksIntervalsSize* sizeof(float));
  generateLattices(interval, intervalBreaksVec,intputBreaksIntervals);
  //printf("INPUT LATTICES\n");
  //printLattices(intputBreaksIntervals, intervalBreaksVec);

  int* beginningIndexVec;
  int* invertedAcumulated;
  beginningIndexVec = (int*)malloc(intputBreaksIntervalsSize* sizeof(int));
  invertedAcumulated = (int*)malloc(intputBreaksIntervalsSize* sizeof(int));
  generateBeginningIndex(intervalBreaksVec, beginningIndexVec);
  generateInvertedAcumulated(intervalBreaksVec, invertedAcumulated);
  //printIMatrix(invertedAcumulated, 2, 1);

  float* domainInterval;
  domainInterval = (float*)malloc(intputBreaksIntervalsSize*2* sizeof(float));

   float* diagonalInf1;
   float* diagonalSup1;
   diagonalInf1 = (float*)malloc(2* sizeof(float));
   diagonalSup1 = (float*)malloc(2* sizeof(float));

    float inferiorLayer1Map[4];
    float superiorLayer1Map[4];
    float inferiorLayer1[4];
    float superiorLayer1[4];
    float intervalLayer1[4];

    float* diagonalInf2;
    float* diagonalSup2;
    diagonalInf2 = (float*)malloc(1* sizeof(float));
    diagonalSup2 = (float*)malloc(1* sizeof(float));

    float inferiorLayer2Map[2];
    float superiorLayer2Map[2];
    float inferiorLayer2[1];
    float superiorLayer2[1];
    float intervalLayer2[2];

    int unionsSize = 0;
    float* unitedSets;
    unitedSets = (float*)malloc(2*invertedAcumulated[0]*sizeof(float));
    for(int i =0; i<invertedAcumulated[0]; i++){
      getOneIntervalFromLattices(intputBreaksIntervals, i,beginningIndexVec, invertedAcumulated, domainInterval);
      printf("ENTRADA \n");
      printfMatrix(domainInterval, 2, 2);

    inferiorIntervalMapping(domainInterval, w1, 2, 2, inferiorLayer1Map);

    superiorIntervalMapping(domainInterval, w1, 2, 2, superiorLayer1Map);

    cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 2, 2, 2, &alpha,
                w1, 2, inferiorLayer1Map , 1, &beta, inferiorLayer1, 1);

    cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 2, 2, 1, &alpha, bias1,
                1, onevec, 1, &alpha, inferiorLayer1, 1);


    cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 2, 2, 2, &alpha,
                w1, 2, superiorLayer1Map , 1, &beta, superiorLayer1, 1);

    cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 2, 2, 1, &alpha, bias1,
                1, onevec, 1, &alpha, superiorLayer1, 1);

    diag(inferiorLayer1, 2, diagonalInf1);
    diag(superiorLayer1, 2,diagonalSup1);

    concatVectorsAsColumns(diagonalInf1, diagonalSup1, 2, intervalLayer1);

    inferiorIntervalMapping(intervalLayer1, w2, 1, 2, inferiorLayer2Map);

    superiorIntervalMapping(intervalLayer1, w2, 1, 2, superiorLayer2Map);

    cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 1, 1, 2, &alpha,
                w2, 2, inferiorLayer2Map , 1, &beta, inferiorLayer2, 1);

    cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 1, 1, 1, &alpha, bias2,
                1, onevec, 1, &alpha, inferiorLayer2, 1);

    cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 1, 1, 2, &alpha,
                w2, 2, superiorLayer2Map , 1, &beta, superiorLayer2, 1);

    cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 1, 1, 1, &alpha, bias2,
                1, onevec, 1, &alpha, superiorLayer2, 1);

    diag(inferiorLayer2, 1, diagonalInf2);
    diag(superiorLayer2, 1,diagonalSup2);

    concatVectorsAsColumns(diagonalInf2, diagonalSup2, 2, intervalLayer2);
    performUnion(unitedSets, &unionsSize, intervalLayer2);

    if(intervalLayer2[0] > safeLimit || intervalLayer2[1] > safeLimit) {
      safe = 0;
      printf("Output Set Union \n");
      printfMatrix(unitedSets, unionsSize*2, 1);
      printf("UNSAFE \n");
      return 0;
    }
    else{
      safe = 1;
    }
  }
  printf("Output Set Union \n");
  printfMatrix(unitedSets, unionsSize*2, 1);
  free(diagonalInf1);
  free(diagonalSup1);
  free(diagonalInf2);
  free(diagonalSup2);
  return safe;
}



int main(){
  clock_t t;
  t = clock();

  int safe = 0;

  float w1[4]= {-3, 2,
                4, 1};

  float bias1[2] = {0, 0};

  float w2[2] = {1, 1};

  float bias2[1] = {0};

  int inputSize[3] = {2, 2, 1};
  float* simbolicOperator;
  simbolicOperator = (float*)malloc((inputSize[0]+1)* sizeof(int));

  getSimbolicPropagationOfNN(w1, bias1, w2, bias2, inputSize, simbolicOperator);
  t = clock() - t;
  double time_taken = ((double)t)/CLOCKS_PER_SEC; // calculate the elapsed time
  printf("The program took %f seconds to execute\n", time_taken);
}
