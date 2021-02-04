// Remove this line for verification with floating point
#include "verifynn.h"
#include <stdlib.h>

// esbmc-gpu verifynn.c -I . --force-malloc-success --state-hashing --unwind 30

float bfc1[5] = {-1.391982, -3.072579, -1.939275, 2.767071, 1.220037};

float wfc1[125] = {
    1.747817,  2.078215,  1.525674,  2.068568,  -1.229014, 0.096640,  1.373888,
    -1.629306, 0.364461,  0.015546,  -0.487300, -1.058555, -0.007535, -2.282920,
    -0.921622, -0.796065, -2.911950, 0.410396,  -3.916576, 3.228107,  0.979340,
    -0.437140, -2.585713, -1.588195, 0.614454,  0.096640,  1.373888,  -1.629306,
    0.364461,  0.015546,  -0.487300, -1.058555, -0.007535, -2.282920, -0.921622,
    -0.796065, -2.911950, 0.410396,  -3.916576, 3.228107,  0.979340,  -0.437140,
    -2.585713, -1.588195, 0.614454,  -1.391982, 1.676011,  0.300922,  -0.260411,
    1.649863,  -0.487300, -1.058555, -0.007535, -2.282920, -0.921622, -0.796065,
    -2.911950, 0.410396,  -3.916576, 3.228107,  0.979340,  -0.437140, -2.585713,
    -1.588195, 0.614454,  -1.391982, 1.676011,  0.300922,  -0.260411, 1.649863,
    -3.072579, 0.432040,  0.027175,  0.626344,  -0.111208, -0.796065, -2.911950,
    0.410396,  -3.916576, 3.228107,  0.979340,  -0.437140, -2.585713, -1.588195,
    0.614454,  -1.391982, 1.676011,  0.300922,  -0.260411, 1.649863,  -3.072579,
    0.432040,  0.027175,  0.626344,  -0.111208, -1.939275, -0.147955, 1.194864,
    -0.840401, -0.479575, 0.979340,  -0.437140, -2.585713, -1.588195, 0.614454,
    -1.391982, 1.676011,  0.300922,  -0.260411, 1.649863,  -3.072579, 0.432040,
    0.027175,  0.626344,  -0.111208, -1.939275, -0.147955, 1.194864,  -0.840401,
    -0.479575, 2.767071,  0.506253,  0.660930,  0.893657,  -0.365246};

float bfc2[4] = {5.270865, -2.297887, 3.419328, 1.721100};

float wfc2[20] = {-7.533677, -1.473646, 0.474584,  0.692077,  3.606815,
                  5.270865,  -5.977878, -1.299591, 0.274884,  5.052619,
                  -2.297887, -5.343464, -0.671682, 2.775591,  -5.070639,
                  3.419328,  -3.875100, -2.314803, -4.254568, 0.203830};

float bfc3[5] = {-5.420448, -7.647144, -7.993252, 3.888156, 3.253492};

float wfc3[20] = {-9.077102, 6.026314, 2.987803,  1.921376,  3.633275,
                  -8.355824, 7.451096, 1.382562,  3.352142,  4.548234,
                  -8.615975, 4.114339, -7.865677, -4.624271, -4.619353,
                  0.750661,  1.141060, -5.205578, -3.401493, -9.008119};

int vocalicA[25] = {255, 255, 255, 255, 255, 255, 0,   0, 0,
                    255, 255, 255, 255, 255, 255, 255, 0, 0,
                    0,   255, 255, 0,   0,   0,   255};
int label = 0;

int main() {

  float *intervalDomain;
  intervalDomain = (float *)calloc(50, sizeof(float));
  float *outputInterval;
  outputInterval = (float *)calloc(10, sizeof(float));

  float imgNonDet[25];

  //int i = 0;
  //for (i = 0; i < 255; i++) {
    generateIntervalFromInputLabelAndRange(vocalicA, 25, 51, intervalDomain);
    normalizef(intervalDomain, 50);
    imageInterval(intervalDomain, outputInterval);
//    if (probableAdversarialExample(outputInterval, 5, label) > 0) {
//      break;
  //  }
  //}
  generateReducedNonDetVectorFromInterval(outputInterval, imgNonDet);
  checkNNLUT(wfc1, bfc1, wfc2, bfc2, wfc3, bfc3, imgNonDet, 0);

  return 0;
}