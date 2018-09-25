#include <cublas.h>
#include <stdlib.h>

#define data 25
#define fc1 5
#define fc2 4
#define fc3 5



float wfc1[125]={ 1.970468,  2.423296,  0.435727,  1.275527,  -4.261239,  1.006091,  1.107535,  1.313832,  -0.809127,  0.047271,  2.676003,  -2.188766,  -1.522162,  -2.832704,  1.007046,  -5.945631,  0.105879,  -0.734428,  -1.441228,  0.079340,  -2.782155,  1.057083,  2.385269,  2.610979,  -0.293510,
1.006091,  1.107535,  1.313832,  -0.809127,  0.047271,  2.676003,  -2.188766,  -1.522162,  -2.832704,  1.007046,  -5.945631,  0.105879,  -0.734428,  -1.441228,  0.079340,  -2.782155,  1.057083,  2.385269,  2.610979,  -0.293510,  -0.655228,  0.840528,  3.752916,  4.024786,  -0.185966,
2.676003,  -2.188766,  -1.522162,  -2.832704,  1.007046,  -5.945631,  0.105879,  -0.734428,  -1.441228,  0.079340,  -2.782155,  1.057083,  2.385269,  2.610979,  -0.293510,  -0.655228,  0.840528,  3.752916,  4.024786,  -0.185966,  -0.557577,  0.347608,  0.182873,  1.228352,  2.242404,
-5.945631,  0.105879,  -0.734428,  -1.441228,  0.079340,  -2.782155,  1.057083,  2.385269,  2.610979,  -0.293510,  -0.655228,  0.840528,  3.752916,  4.024786,  -0.185966,  -0.557577,  0.347608,  0.182873,  1.228352,  2.242404,  0.453818,  1.010989,  1.383240,  0.303532,  2.991412,
-2.782155,  1.057083,  2.385269,  2.610979,  -0.293510,  -0.655228,  0.840528,  3.752916,  4.024786,  -0.185966,  -0.557577,  0.347608,  0.182873,  1.228352,  2.242404,  0.453818,  1.010989,  1.383240,  0.303532,  2.991412,  0.182096,  -0.900650,  -1.028396,  -1.138674,  -1.137320 };

float bfc1[5]={ -0.655228, -0.557577, 0.453818, 0.182096, -0.470664 };

float wfc2[20]={ -4.614690,  -0.756363,  4.531339,  6.194548,  4.053905,
-4.696574,  -6.640641,  -3.875166,  3.610351,  0.610921,
-1.593992,  -0.853030,  0.442089,  0.747879,  0.538543,
-5.173825,  0.765471,  -4.656419,  3.552163,  -3.771640 };

float bfc2[4]={ -4.696574, -1.593992, -5.173825, 3.851689 };

float wfc3[20]={ 1.612329,  9.417582,  0.285620,  3.286632,
6.672903,  -7.849225,  -0.756157,  11.433008,
7.017607,  -3.456313,  -1.225585,  -17.258355,
-7.576870,  -2.014877,  -1.180677,  -13.202812,
-8.468269,  -1.179162,  -0.948335,  10.941313 };

float bfc3[5]={ -9.345803, -14.640325, -3.539087, 3.432404, -7.202527 };


void imprimeResultante(float* matriz, int size) {
int cont = 0;
        for(cont = 0; cont < size; cont++) {
                printf("resultante: %d com valor: %.6f \n", cont, matriz[cont]);
        }
        //printf("limiar de ativacao da posicao: %d com valor: %.2f \n", cont, pesosSinapticos[xn]);
}


void checkNN(float* wfc1, float* bfc1, float* wfc2, float* bfc2, float* wfc3, float* bfc3) {

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

}

int main() {
	checkNN(wfc1, bfc1, wfc2, bfc2, wfc3, bfc3);


}
