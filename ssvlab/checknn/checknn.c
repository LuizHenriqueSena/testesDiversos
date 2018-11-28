#include <cublas.h>
#include <stdlib.h>

#define data 25
#define fc1 5
#define fc2 4
#define fc3 5



float wfc1[125]={ 0.207958,  0.044154,  -4.232451,  0.745003,  -1.340141,  -1.486082,  -1.869501,  -1.486536,  -0.624669,  1.210342,  -4.070879,  -0.600616,  -5.623879,  -3.807880,  1.362974,  1.334723,  -2.295741,  3.483194,  -4.446033,  0.078016,  4.587534,  -0.206197,  0.977980,  1.286488,  0.772414,
-1.486082,  -1.869501,  -1.486536,  -0.624669,  1.210342,  -4.070879,  -0.600616,  -5.623879,  -3.807880,  1.362974,  1.334723,  -2.295741,  3.483194,  -4.446033,  0.078016,  4.587534,  -0.206197,  0.977980,  1.286488,  0.772414,  -0.095517,  -0.237044,  1.996482,  2.389851,  -0.082591,
-4.070879,  -0.600616,  -5.623879,  -3.807880,  1.362974,  1.334723,  -2.295741,  3.483194,  -4.446033,  0.078016,  4.587534,  -0.206197,  0.977980,  1.286488,  0.772414,  -0.095517,  -0.237044,  1.996482,  2.389851,  -0.082591,  2.035967,  -1.636084,  -2.794725,  -1.262111,  6.436423,
1.334723,  -2.295741,  3.483194,  -4.446033,  0.078016,  4.587534,  -0.206197,  0.977980,  1.286488,  0.772414,  -0.095517,  -0.237044,  1.996482,  2.389851,  -0.082591,  2.035967,  -1.636084,  -2.794725,  -1.262111,  6.436423,  -0.922335,  -2.358342,  -0.142077,  -4.891456,  -2.749024,
4.587534,  -0.206197,  0.977980,  1.286488,  0.772414,  -0.095517,  -0.237044,  1.996482,  2.389851,  -0.082591,  2.035967,  -1.636084,  -2.794725,  -1.262111,  6.436423,  -0.922335,  -2.358342,  -0.142077,  -4.891456,  -2.749024,  0.042693,  0.455576,  0.108683,  0.724179,  0.679236 };

float bfc1[5]={ -0.095517, 2.035967, -0.922335, 0.042693, 2.473645 };

float wfc2[20]={ -8.332183,  -3.040542,  3.758681,  -4.049425,  3.050940,
-0.894016,  -1.446080,  6.029086,  5.837497,  -1.206468,
-2.927471,  -4.145836,  1.903108,  3.409983,  0.191798,
-4.116436,  -7.171240,  2.687001,  -1.662798,  3.236128 };

float bfc2[4]={ -0.894016, -2.927471, -4.116436, 4.911131 };

float wfc3[20]={ 5.578862,  5.071550,  6.798682,  -0.259254,
10.556403,  -9.337465,  -0.761154,  2.529015,
-11.307169,  -8.039979,  -2.417081,  9.576913,
-2.461208,  -6.955447,  -1.412636,  -12.198679,
-2.784967,  8.339398,  -1.883454,  -9.724778 };

float bfc3[5]={ -12.202182, -8.269168, -6.212107, 3.503773, -3.755674 };


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

	float input[25] = {255,0,0,0,255,255,0,0,0,255,255,0,0,0,255,255,0,0,0,255,255,255,255,255,255};

	//wfc1 = (float*)malloc(data*fc1*sizeof(float));


	out1 = (float*)malloc(fc1*sizeof(float));

	out2 = (float*)malloc(fc2*sizeof(float));

	out3 = (float*)malloc(fc3*sizeof(float));

  normalizef(input, 25); // ponteiro da entrada e tamanho da imagem

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
