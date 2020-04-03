#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include "cuda_operational_model.h"

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

float * concatVectorsAsColumns(float* vec1, float* vec2, int size) {
  float* out = (float*)calloc(size*2,sizeof(float));
  int i = 0;
  for(i = 0; i<size; i++) {
    out[i*2] = vec1[i];
    out[i*2 + 1] = vec2[i];
  }
  return out;
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

float sigmoidFunction(float u) {
	float retorno;
	retorno = (1/(1 + powf(2.718281,(u*(-1)))));
	return retorno;
}

float* sigmoidVector(float* vec, int size) {
  float *out = (float*)calloc(size, sizeof(float));
  int i = 0;
	for(i = 0; i<size; i++) {
		out[i] = sigmoidFunction(vec[i]);
  }
  return &out[0];
}

float* diag(float* vec, int size) {
  float *out = (float*)calloc(size, sizeof(float));
  int i = 0;
  for(i = 0; i<size; i++) {
    out[i] = vec[i*size + i];
  }
  return &out[0];
}

int* sign(float* w, int size) {
  int* out = (int*)calloc(size, sizeof(int));
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
  int i = 0,j = 0;
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
  signMatrix = sign(&W[0], rows*columns);
  int i = 0,j = 0;
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

void imageInterval(float* domainInterval) {
  float bias1[5] = {-1.391982, -3.072579, -1.939275, 2.767071, 1.220037};

  float w1[125] = {1.747817,  2.078215,  1.525674,  2.068568,  -1.229014,  0.096640,  1.373888,  -1.629306,  0.364461,  0.015546,  -0.487300,  -1.058555,  -0.007535,  -2.282920,  -0.921622,  -0.796065,  -2.911950,  0.410396,  -3.916576,  3.228107,  0.979340,  -0.437140,  -2.585713,  -1.588195,  0.614454,
  0.096640,  1.373888,  -1.629306,  0.364461,  0.015546,  -0.487300,  -1.058555,  -0.007535,  -2.282920,  -0.921622,  -0.796065,  -2.911950,  0.410396,  -3.916576,  3.228107,  0.979340,  -0.437140,  -2.585713,  -1.588195,  0.614454,  -1.391982,  1.676011,  0.300922,  -0.260411,  1.649863,
  -0.487300,  -1.058555,  -0.007535,  -2.282920,  -0.921622,  -0.796065,  -2.911950,  0.410396,  -3.916576,  3.228107,  0.979340,  -0.437140,  -2.585713,  -1.588195,  0.614454,  -1.391982,  1.676011,  0.300922,  -0.260411,  1.649863,  -3.072579,  0.432040,  0.027175,  0.626344,  -0.111208,
  -0.796065,  -2.911950,  0.410396,  -3.916576,  3.228107,  0.979340,  -0.437140,  -2.585713,  -1.588195,  0.614454,  -1.391982,  1.676011,  0.300922,  -0.260411,  1.649863,  -3.072579,  0.432040,  0.027175,  0.626344,  -0.111208,  -1.939275,  -0.147955,  1.194864,  -0.840401,  -0.479575,
  0.979340,  -0.437140,  -2.585713,  -1.588195,  0.614454,  -1.391982,  1.676011,  0.300922,  -0.260411,  1.649863,  -3.072579,  0.432040,  0.027175,  0.626344,  -0.111208,  -1.939275,  -0.147955,  1.194864,  -0.840401,  -0.479575,  2.767071,  0.506253,  0.660930,  0.893657,  -0.365246};

  float bias2[4] = {5.270865, -2.297887, 3.419328, 1.721100};

  float w2[20]={-7.533677,  -1.473646,  0.474584,  0.692077,  3.606815,
  5.270865,  -5.977878,  -1.299591,  0.274884,  5.052619,
  -2.297887,  -5.343464,  -0.671682,  2.775591,  -5.070639,
  3.419328,  -3.875100,  -2.314803,  -4.254568,  0.203830};

  float bias3[5]={-5.420448, -7.647144, -7.993252, 3.888156, 3.253492};

  float w3[20] = {-9.077102,  6.026314,  2.987803,  1.921376,
  3.633275,  -8.355824,  7.451096,  1.382562,
  3.352142,  4.548234,  -8.615975,  4.114339,
  -7.865677,  -4.624271,  -4.619353,  0.750661,
  1.141060,  -5.205578,  -3.401493,  -9.008119};

  //normalizef(&domainInterval[0], 25);

  cublasHandle_t cublasHandle;
  cublasCreate(&cublasHandle);

  float alpha;
  float beta;
  alpha = 1;
  beta = 0;
  float onevec[25] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};

   float inferiorLayer1Map[25*5];
   float superiorLayer1Map[25*5];
   float inferiorLayer1[5*5];
   float superiorLayer1[5*5];
   inferiorIntervalMapping(domainInterval, w1, 5, 25, inferiorLayer1Map);
   superiorIntervalMapping(domainInterval, w1, 5, 25, superiorLayer1Map);
   cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 5, 5, 25, &alpha,
               w1, 25, inferiorLayer1Map , 1, &beta, inferiorLayer1, 1);
   cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 5, 5, 1, &alpha, bias1,
               1, onevec, 1, &alpha, inferiorLayer1, 1);
   float* diagonalInf1, *diagonalSup1, * intervalInf1, * intervalSup1;
   diagonalInf1 = diag(inferiorLayer1, 5);

   cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 5, 5, 25, &alpha,
               w1, 25, superiorLayer1Map , 1, &beta, superiorLayer1, 1);
   cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 5, 5, 1, &alpha, bias1,
               1, onevec, 1, &alpha, superiorLayer1, 1);
   diagonalSup1 = diag(superiorLayer1, 5);

  intervalInf1  = sigmoidVector(diagonalInf1, 5);
  intervalSup1  = sigmoidVector(diagonalSup1, 5);

   float* intervalLayer1 = concatVectorsAsColumns(intervalInf1, intervalSup1, 5);
   printfMatrix(intervalLayer1,5,2);

   float inferiorLayer2Map[5*4];
   float superiorLayer2Map[5*4];
   float inferiorLayer2[4*4];
   float superiorLayer2[4*4];
   inferiorIntervalMapping(intervalLayer1, w2, 4, 5, inferiorLayer2Map);
   superiorIntervalMapping(intervalLayer1, w2, 4, 5, superiorLayer2Map);

   cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 4, 4, 5, &alpha,
               w2, 1, inferiorLayer2Map , 1, &beta, inferiorLayer2, 1);
   cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 4, 4, 1, &alpha, bias2,
               1, onevec, 1, &alpha, inferiorLayer2, 1);

  cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 4, 4, 5, &alpha,
              w2, 1, superiorLayer2Map , 1, &beta, superiorLayer2, 1);
  cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 4, 4, 1, &alpha, bias2,
              1, onevec, 1, &alpha, superiorLayer2, 1);

  float* diagonalInf2, *diagonalSup2, * intervalInf2, * intervalSup2;
  diagonalInf2 = diag(inferiorLayer2, 4);
  diagonalSup2 = diag(superiorLayer2, 4);
  intervalInf2  = sigmoidVector(diagonalInf2, 4);
  intervalSup2  = sigmoidVector(diagonalSup2, 4);
  float* intervalLayer2 = concatVectorsAsColumns(intervalInf2, intervalSup2, 4);



  float inferiorLayer3Map[5*4];
  float superiorLayer3Map[5*4];
  float inferiorLayer3[5*5];
  float superiorLayer3[5*5];
  inferiorIntervalMapping(intervalLayer2, w3, 5, 4, inferiorLayer3Map);
  superiorIntervalMapping(intervalLayer2, w3, 5, 4, superiorLayer3Map);

  cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 5, 5, 4, &alpha,
              w3, 1, inferiorLayer3Map , 1, &beta, inferiorLayer3, 1);
  cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 5, 5, 1, &alpha, bias3,
              1, onevec, 1, &alpha, inferiorLayer3, 1);

 cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 5, 5, 4, &alpha,
             w3, 1, superiorLayer3Map , 1, &beta, superiorLayer3, 1);
 cublasSgemm(cublasHandle, CUBLAS_OP_N, CUBLAS_OP_T, 5, 5, 1, &alpha, bias3,
             1, onevec, 1, &alpha, superiorLayer3, 1);

 float* diagonalInf3, *diagonalSup3, * intervalInf3, * intervalSup3;
 diagonalInf3 = diag(inferiorLayer3, 5);
 diagonalSup3 = diag(superiorLayer3, 5);
 intervalInf3  = sigmoidVector(diagonalInf3, 5);
 intervalSup3  = sigmoidVector(diagonalSup3, 5);
 float* intervalLayer3 = concatVectorsAsColumns(intervalInf3, intervalSup3, 5);
 printf("OUTPUT 3 \n");
 printfMatrix(intervalLayer3,5,2);
}


int main(){
  float interval[25][2] = {
    {225, 255},
    {225, 255},
    {225, 255},
    {225, 255},
    {225, 255},
    {225, 255},
    {0, 30},
    {0, 30},
    {0, 30},
    {225, 255},
    {225, 255},
    {225, 255},
    {225, 255},
    {225, 255},
    {225, 255},
    {225, 255},
    {0, 30},
    {0, 30},
    {0, 30},
    {225, 255},
    {225, 255},
    {0, 30},
    {0, 30},
    {0, 30},
    {225, 255}
  };
  normalizef(interval,50);
  imageInterval(interval);
}
