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
    printf("size of breaked vec %d \n",outputSize );
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
  printf("\n",intputBreaksIntervals[outIndex]);
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
void getOneIntervalFromLattices(intervalBreaksVec, 0, intervalDomain) {
  
}

void imageIntervalFromLattices(float* interval, int* intervalBreaksVec) {
  float bias1[1] = {0};

  float w1[2] = {3, 1};

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
  printLattices(intputBreaksIntervals, intervalBreaksVec);

  float* intervalDomain;
  intervalDomain = (float*)malloc(intputBreaksIntervalsSize sizeof(float));
  getOneIntervalFromLattices(intervalBreaksVec, 0, intervalDomain);

 //  float* diagonalInf1;
 //  float* diagonalSup1;
 //  float* intervalInf1;
 //  float* intervalSup1;
 //  intervalInf1 = (float*)malloc(5*5* sizeof(float));
 //  intervalSup1 = (float*)malloc(5*5* sizeof(float));
 //  diagonalInf1 = (float*)malloc(5* sizeof(float));
 //  diagonalSup1 = (float*)malloc(5* sizeof(float));
 //
 //   float inferiorLayer1Map[25*5];
 //   float superiorLayer1Map[25*5];
 //   float inferiorLayer1[5*5];
 //   float superiorLayer1[5*5];
 //
 //   inferiorIntervalMapping(domainInterval, w1, 5, 25, inferiorLayer1Map);
 //   superiorIntervalMapping(domainInterval, w1, 5, 25, superiorLayer1Map);
 //   cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 5, 5, 25, &alpha,
 //               w1, 25, inferiorLayer1Map , 1, &beta, inferiorLayer1, 1);
 //   cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 5, 5, 1, &alpha, bias1,
 //               1, onevec, 1, &alpha, inferiorLayer1, 1);
 //
 //
 //   diag(inferiorLayer1, 5,diagonalInf1);
 //
 //
 //   cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 5, 5, 25, &alpha,
 //               w1, 25, superiorLayer1Map , 1, &beta, superiorLayer1, 1);
 //   cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 5, 5, 1, &alpha, bias1,
 //               1, onevec, 1, &alpha, superiorLayer1, 1);
 //
 //   diag(superiorLayer1, 5,diagonalSup1);
 //
 //   float* intervalLayer1;
 //   float *intervalLayer2;
 //   float *intervalLayer3;
 //   float *intervalClass;
 //   intervalLayer1 = (float*)malloc(5*2* sizeof(float));
 //   intervalLayer2 = (float*)malloc(4*2* sizeof(float));
 //   intervalLayer3 = (float*)malloc(5*2* sizeof(float));
 //   intervalClass = (float*)malloc(5*2* sizeof(float));
 //
 //   concatVectorsAsColumns(intervalInf1, intervalSup1, 5, intervalLayer1);
 //
 // free(intervalInf1);
 // free(intervalSup1);
 // free(diagonalInf1);
 // free(diagonalSup1);
 // free(intervalLayer1);
}



int main(){
  clock_t t;
  t = clock();

  float interval[2][2] = {
    {0, 1}, //x
    {0, 1}, //y
 };
  int intervalBreaksVec[2] = {1, 1};

  imageIntervalFromLattices(interval, intervalBreaksVec);
 t = clock() - t;
 double time_taken = ((double)t)/CLOCKS_PER_SEC; // calculate the elapsed time
printf("The program took %f seconds to execute\n", time_taken);


}