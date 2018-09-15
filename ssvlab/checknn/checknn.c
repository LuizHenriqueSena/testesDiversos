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

	float input[25] = {1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,0,0,0,1,1,0,0,0,1};

	//wfc1 = (float*)malloc(data*fc1*sizeof(float));

	float wfc1[125]={-0.169,-0.557,-0.921,-1.467,0.590,0.503,-0.479,0.127,1.259,0.793,0.431,-2.681,-3.333,-1.920,-0.227,0.537,1.259,1.024,0.626,0.455,2.305,1.360,0.258,3.167,-1.684,-0.435,
	 0.503,-0.479,0.127,1.259,0.793,0.431,-2.681,-3.333,-1.920,-0.227,0.537,1.259,1.024,0.626,0.455,2.305,1.360,0.258,3.167,-1.684,-0.435,-1.183,-1.471,1.196,-0.795,0.894,
	 0.431,-2.681,-3.333,-1.920,-0.227,0.537,1.259,1.024,0.626,0.455,2.305,1.360,0.258,3.167,-1.684,-0.435,-1.183,-1.471,1.196,-0.795,0.894,1.705,4.274,2.546,-3.277,-0.487,
	 0.537,1.259,1.024,0.626,0.455,2.305,1.360,0.258,3.167,-1.684,-0.435,-1.183,-1.471,1.196,-0.795,0.894,1.705,4.274,2.546,-3.277,-0.487,-0.154,0.411,0.386,-0.787,-1.042,
	 2.305,1.360,0.258,3.167,-1.684,-0.435,-1.183,-1.471,1.196,-0.795,0.894,1.705,4.274,2.546,-3.277,-0.487,-0.154,0.411,0.386,-0.787,-1.042,0.187,0.434,0.166,0.797,0.625};

	float bfc1[5] = {-1.183, 1.705, -0.154, 0.187, 0};

	 float wfc2[fc1*fc2] = {0.914,3.206,5.752,2.188,-1.811, 
	 -1.945,-3.814,2.407,5.813,-0.984,
	 -7.467,-0.233,0.423,2.741,3.038,
	 -5.521,4.360,3.371,-2.952,-2.165};

	float bfc2[4] = {-1.945, -7.467, -5.521, 0.534};

	float wfc3[fc2*fc3] = {-7.751,-3.227,-0.747,4.821,
	 0.046,5.889,-2.660,5.998,
	 -6.609,3.418,2.187,-5.619,
	 -2.100,-6.095,-0.207,-6.735,
	 3.223,-3.136,-7.677,1.716};

	float bfc3[5] = {-12.488, -12.278, -4.207, 12.955, -2.953};

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

	imprimeResultante(out1, fc1);

	cublasSgemm(cublasHandle,
                        CUBLAS_OP_N, CUBLAS_OP_N,
                        fc1, 1, 1,
                        &alpha,
                        bfc1, 1,
                        onevec, 1,
                        &alpha,
                        out1, 1);

	imprimeResultante(out1, fc1);
	calculaPotencial(out1, fc1);
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

	calculaPotencial(out2,fc2);

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

	calculaPotencial(out3,fc3);
	
	imprimeResultante(out3, fc3);

	return 0;
}

