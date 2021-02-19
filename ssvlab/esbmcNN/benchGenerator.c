#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <limits.h>
#include "cuda_operational_model.h"
#include "structs.h"
#include "utils.h"
#include "esbmcnn.h"

// float wfc1[28] = {-0.25929332,  0.19504523,  0.46112162, -0.32455295,  0.40551952,  0.651486, 0.98171616,
//                 -0.14714487,  0.47430947, -0.4763746,  -0.542259 ,  0.22139049, -0.3677786, 0.72755915,
//                  -0.0706754,  -0.14839703,  0.24867742,  1.3328437,  -0.391765,  -0.22481388, -1.3633397,
//                  -0.39683023, -0.07987957, -0.5536187,  0.06810278,  0.33718756, -0.03761273, -1.4022148};
//
// float bfc1[7] = {-0.01923968, -0.01667709, -0.01758065, -0.11804342, -0.01850095, 0.07776947, 0.674765};
//
// float wfc2[21] = {-0.2284912, -0.7821734, -0.18252955,
//  -0.17247626, -0.3065301,  0.06489243,
//  -0.60870713, -0.4094945, 0.4076299,
//  -1.0031812, 0.96723956, -0.20540513,
// 0.51933247, -0.5088219, -0.14022094,
// 0.68667054, 0.1878914, 0.20478986,
//  -0.0288972, 0.9980791, -0.9013393};
//
// float bfc2[3] = {0.3422784, 0.04696991, 0.13186029};

float wfc1[125] = {
    0.207958,  0.044154,  -4.232451, 0.745003,  -1.340141, -1.486082, -1.869501,
    -1.486536, -0.624669, 1.210342,  -4.070879, -0.600616, -5.623879, -3.807880,
    1.362974,  1.334723,  -2.295741, 3.483194,  -4.446033, 0.078016,  4.587534,
    -0.206197, 0.977980,  1.286488,  0.772414,  -1.486082, -1.869501, -1.486536,
    -0.624669, 1.210342,  -4.070879, -0.600616, -5.623879, -3.807880, 1.362974,
    1.334723,  -2.295741, 3.483194,  -4.446033, 0.078016,  4.587534,  -0.206197,
    0.977980,  1.286488,  0.772414,  -0.095517, -0.237044, 1.996482,  2.389851,
    -0.082591, -4.070879, -0.600616, -5.623879, -3.807880, 1.362974,  1.334723,
    -2.295741, 3.483194,  -4.446033, 0.078016,  4.587534,  -0.206197, 0.977980,
    1.286488,  0.772414,  -0.095517, -0.237044, 1.996482,  2.389851,  -0.082591,
    2.035967,  -1.636084, -2.794725, -1.262111, 6.436423,  1.334723,  -2.295741,
    3.483194,  -4.446033, 0.078016,  4.587534,  -0.206197, 0.977980,  1.286488,
    0.772414,  -0.095517, -0.237044, 1.996482,  2.389851,  -0.082591, 2.035967,
    -1.636084, -2.794725, -1.262111, 6.436423,  -0.922335, -2.358342, -0.142077,
    -4.891456, -2.749024, 4.587534,  -0.206197, 0.977980,  1.286488,  0.772414,
    -0.095517, -0.237044, 1.996482,  2.389851,  -0.082591, 2.035967,  -1.636084,
    -2.794725, -1.262111, 6.436423,  -0.922335, -2.358342, -0.142077, -4.891456,
    -2.749024, 0.042693,  0.455576,  0.108683,  0.724179,  0.679236};

float bfc1[5] = {-0.095517, 2.035967, -0.922335, 0.042693, 2.473645};

float wfc2[20] = {-8.332183, -3.040542, 3.758681, -4.049425, 3.050940,
                  -0.894016, -1.446080, 6.029086, 5.837497,  -1.206468,
                  -2.927471, -4.145836, 1.903108, 3.409983,  0.191798,
                  -4.116436, -7.171240, 2.687001, -1.662798, 3.236128};

float bfc2[4] = {-0.894016, -2.927471, -4.116436, 4.911131};

float wfc3[20] = {5.578862,   5.071550,  6.798682,  -0.259254,  10.556403,
                  -9.337465,  -0.761154, 2.529015,  -11.307169, -8.039979,
                  -2.417081,  9.576913,  -2.461208, -6.955447,  -1.412636,
                  -12.198679, -2.784967, 8.339398,  -1.883454,  -9.724778};

float bfc3[5] = {-12.202182, -8.269168, -6.212107, 3.503773, -3.755674};

float imgA[25] = {255, 255, 255, 255, 255, 255, 0,   0,   0, 255, 255, 255, 255,
                  255, 255, 255, 0,   0,   0,   255, 255, 0, 0,   0,   255};
float imgE[25] = {255, 255, 255, 255, 255, 255, 0, 0,   0,   0,   255, 255, 255,
                  255, 255, 255, 0,   0,   0,   0, 255, 255, 255, 255, 255};
float imgI[25] = {255, 255, 255, 255, 255, 0, 0, 255, 0,   0,   0,   0,  255,
                  0,   0,   0,   0,   255, 0, 0, 255, 255, 255, 255, 255};
float imgO[25] = {255, 255, 255, 255, 255, 255, 0,   0,   0,   255, 255, 0,  0,
                  0,   255, 255, 0,   0,   0,   255, 255, 255, 255, 255, 255};
float imgU[25] = {255, 0,   0,   0, 255, 255, 0,   0,   0,   255, 255, 0,  0,
                  0,   255, 255, 0, 0,   0,   255, 255, 255, 255, 255, 255};


int main(int argc,char* argv[]){
  clock_t t;
  t = clock();
  int range[5] = {10, 20, 40, 80, 120};
  esbmc_nnet* nnet;
  int layersDescriptor[4] = {25, 5, 4, 5};
  int layersNumber = 3;
  //number 7

  // if(argc < 2){
  //   printf("Error. Atleast the output path and .nnet file must be passed to the program.\n");
  //   exit(-1);
  // } else {
  //   strcpy(outPutPath, argv[1]);
  //   strcat(outPutPath, fileName);
  //   if(strstr(argv[1], nnetExt) != NULL) {
  //     char buff[100] = "/";
  //     strcpy(nnetFilePath, argv[1]);
  //     strcat(buff, basename(argv[1]));
  //     strncpy(nnetFileName, buff, strlen(buff)-5);
  //     printf("FILE NAME %s \n", nnetFileName);
  //     importNNet(&nnet);
  //   } else {
  //     strcpy(nnetFileName, ANN2C);
  //   }
  // }
  nnet = initializeNNFromNNet(layersDescriptor, layersNumber+1);
  addLayerDescription(nnet, 1, wfc1, bfc1);
  addLayerDescription(nnet, 2, wfc2, bfc2);
  addLayerDescription(nnet, 3, wfc3, bfc3);

  // float iris0[4] = {4.9,3.0,1.4,0.2};
  // float iris1[4] = {6.4,3.2,4.5,1.5};
  // float iris2[4] = {6.2,3.4,5.4,2.3};

  setImg(&nnet, imgO);

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
