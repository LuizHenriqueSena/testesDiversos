#include <cublas.h>
#include <stdlib.h>

#define data 25
#define fc1 5
#define fc2 4
#define fc3 5

void imprimeResultante(float* matriz, int size) {
int cont = 0;
        for(cont = 0; cont < size; cont++) {
                printf("resultante: %d com valor: %.6f \n", cont, matriz[cont]);
        }
        //printf("limiar de ativacao da posicao: %d com valor: %.2f \n", cont, pesosSinapticos[xn]);
}


int main() {

	printf("Hello World \n");

	float *out1;
	float *out2;
	float *out3;
	float alpha;
	float beta;
	//float* dev_result;
	
	//initializing cublas handle
	cublasHandle_t cublasHandle;
	cublasCreate(&cublasHandle);

	alpha = 1;
	beta = 0;
	/* sets the size of v */
	//data = (float*)malloc(data*sizeof(float));
	float onevec[25] = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};

	float input[25] = {1,0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,1,1,1,1};

	//wfc1 = (float*)malloc(data*fc1*sizeof(float));

float wfc1[125]={ 1.258661,  0.049868,  1.112589,  0.245352,  1.394398,  1.192949,  -0.192907,  1.305498,  0.573822,  -1.724734,  0.673821,  -0.058803,  -0.932644,  -0.113101,  2.950707,  1.219266,  0.684948,  -3.008961,  -1.466600,  -0.094031,  -1.654675,  -0.517850,  -0.655066,  -3.174277,  1.473454,  
1.192949,  -0.192907,  1.305498,  0.573822,  -1.724734,  0.673821,  -0.058803,  -0.932644,  -0.113101,  2.950707,  1.219266,  0.684948,  -3.008961,  -1.466600,  -0.094031,  -1.654675,  -0.517850,  -0.655066,  -3.174277,  1.473454,  0.840567,  -1.731841,  0.104144,  -1.323098,  1.962424,  
0.673821,  -0.058803,  -0.932644,  -0.113101,  2.950707,  1.219266,  0.684948,  -3.008961,  -1.466600,  -0.094031,  -1.654675,  -0.517850,  -0.655066,  -3.174277,  1.473454,  0.840567,  -1.731841,  0.104144,  -1.323098,  1.962424,  -1.744107,  2.449296,  -0.845956,  1.118361,  -1.791705,  
1.219266,  0.684948,  -3.008961,  -1.466600,  -0.094031,  -1.654675,  -0.517850,  -0.655066,  -3.174277,  1.473454,  0.840567,  -1.731841,  0.104144,  -1.323098,  1.962424,  -1.744107,  2.449296,  -0.845956,  1.118361,  -1.791705,  -1.058875,  2.210286,  0.615978,  0.425506,  0.800284,  
-1.654675,  -0.517850,  -0.655066,  -3.174277,  1.473454,  0.840567,  -1.731841,  0.104144,  -1.323098,  1.962424,  -1.744107,  2.449296,  -0.845956,  1.118361,  -1.791705,  -1.058875,  2.210286,  0.615978,  0.425506,  0.800284,  0.119619,  -0.124198,  0.880882,  1.135407,  -1.708733 }; 

float bfc1[5]={ 0.840567, -1.744107, -1.058875, 0.119619, 3.342170 }; 
 
float wfc2[20]={ -6.455629,  -2.063805,  -1.070658,  -0.025911,  -3.224621,  
1.968671,  -6.552913,  -0.812295,  -1.692483,  -2.872416,  
-0.787887,  -5.348913,  -0.965724,  2.774678,  4.462130,  
3.541384,  -2.678091,  -5.088965,  -1.677636,  -1.765207 }; 

float bfc2[4]={ 1.968671, -0.787887, 3.541384, 3.293591 }; 
 
float wfc3[20]={ -2.904599,  -4.735837,  -6.718532,  8.735992,  
-4.419761,  8.374344,  0.351957,  0.985244,  
8.762576,  -0.682047,  -0.103353,  2.371276,  
-1.962216,  -2.210617,  -8.127038,  -5.494590,  
-2.694704,  -3.585555,  3.497879,  -11.987477 }; 

float bfc3[5]={ -4.796374, -6.776394, -7.034788, 4.254948, -0.322288 };
	out1 = (float*)malloc(fc1*sizeof(float));

	out2 = (float*)malloc(fc2*sizeof(float));

	out3 = (float*)malloc(fc3*sizeof(float));



	cublasSgemm(cublasHandle,
			CUBLAS_OP_N, CUBLAS_OP_N,
			fc1, 1, data,
			&alpha,
			wfc1, data,
			input, 1,
			&beta,
			out1, 1);

	cublasSgemm(cublasHandle,
                        CUBLAS_OP_N, CUBLAS_OP_N,
                        fc1, 1, 1,
                        &alpha,
                        bfc1, 1,
                        onevec, 1,
                        &alpha,
                        out1, 1);

	imprimeResultante(out1, fc1);
	activeSigmoid(out1, fc1);
	imprimeResultante(out1, fc1);

        cublasSgemm(cublasHandle,
                        CUBLAS_OP_N, CUBLAS_OP_N,
                        fc2, 1, fc1,
                        &alpha,
                        wfc2, fc1,
                        out1, 1,
                        &beta,
                        out2, 1);

        cublasSgemm(cublasHandle,
                        CUBLAS_OP_N, CUBLAS_OP_N,
                        fc2, 1, 1,
                        &alpha,
                        bfc2, 1,
                        onevec, 1,
                        &alpha,
                        out2, 1);

	imprimeResultante(out2, fc2);
	activeSigmoid(out2, fc2);
	imprimeResultante(out2, fc2);

        cublasSgemm(cublasHandle,
                        CUBLAS_OP_N, CUBLAS_OP_N,
                        fc3, 1, fc2,
                        &alpha,
                        wfc3, fc2,
                        out2, 1,
                        &beta,
                        out3, 1);

        cublasSgemm(cublasHandle,
                        CUBLAS_OP_N, CUBLAS_OP_N,
                        fc3, 1, 1,
                        &alpha,
                        bfc3, 1,
                        onevec, 1,
                        &alpha,
                        out3, 1);

	imprimeResultante(out3, fc3);
	activeSigmoid(out3, fc3);
	imprimeResultante(out3, fc3);

	return 0;
}

