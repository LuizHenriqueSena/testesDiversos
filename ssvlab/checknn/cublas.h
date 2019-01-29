//#include <cuda.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#define data 25
#define fc1 5
#define fc2 4
#define fc3 5

typedef enum cublasstatus { CUBLAS_STATUS_SUCCESS,
	CUBLAS_STATUS_NOT_INITIALIZED,
	CUBLAS_STATUS_ALLOC_FAILED,
	CUBLAS_STATUS_INVALID_VALUE,
	CUBLAS_STATUS_ARCH_MISMATCH,
	CUBLAS_STATUS_MAPPING_ERROR,
	CUBLAS_STATUS_EXECUTION_FAILED,
	CUBLAS_STATUS_INTERNAL_ERROR,
	CUBLAS_STATUS_NOT_SUPPORTED,
	CUBLAS_STATUS_LICENSE_ERROR} custatusResult;

typedef enum cublasstatus cublasStatus_t;
typedef struct cublashandle {
} cublasHandle_t;

typedef enum cublasoperation {CUBLAS_OP_N,
	CUBLAS_OP_T,
	CUBLAS_OP_C} cuoperation;

typedef enum cublasoperation cublasOperation_t;

cublasStatus_t cublasCreate(cublasHandle_t *handle) {
/*
This function initializes the CUBLAS library and creates a handle to an opaque structure holding the CUBLAS library context. It allocates hardware resources on the host and device and must be called prior to making any other CUBLAS library calls. The CUBLAS library context is tied to the current CUDA device. To use the library on multiple devices, one CUBLAS handle needs to be created for each device. Furthermore, for a given device, multiple CUBLAS handles with different configuration can be created. Because cublasCreate allocates some internal resources and the release of those resources by calling cublasDestroy will implicitly call cublasDeviceSynchronize, it is recommended to minimize the number of cublasCreate/cublasDestroy occurences. For multi-threaded applications that use the same device from different threads, the recommended programming model is to create one CUBLAS handle per thread and use that CUBLAS handle for the entire life of the thread.
*/
	return CUBLAS_STATUS_SUCCESS;
}




cublasStatus_t cublasDestroy(cublasHandle_t handle) {

/*
This function releases hardware resources used by the CUBLAS library. This function is usually the last call with a particular handle to the CUBLAS library. Because cublasCreate allocates some internal resources and the release of those resources by calling cublasDestroy will implicitly call cublasDeviceSynchronize, it is recommended to minimize the number of cublasCreate/cublasDestroy occurences.
*/

	return CUBLAS_STATUS_SUCCESS;
}

cublasStatus_t cublasSetMatrix(int rows, int cols, int elemSize,
                const void *A, int lda, void *B, int ldb) {
/*	This function copies a tile of rows x cols elements from a matrix A in host
memory space to a matrix B in GPU memory space. It is assumed that each element
requires storage of elemSize bytes and that both matrices are stored in column-major
 format, with the leading dimension of the source matrix A and destination matrix B
given in lda and ldb, respectively. The leading dimension indicates the number of rows
of the allocated matrix, even if only a submatrix of it is being used. In general,
 B is a device pointer that points to an object, or part of an object, that was
allocated in GPU memory space via cublasAlloc().
*/
	//Due to the Fortran column major the ldb must be the rows of matrix A
	//__ESBMC_assert(ldb == rows, "Full matrix is not bein copied");
        //cudaMemcpy(&B, &A, rows*cols*elemSize, cudaMemcpyDeviceToHost);


	return CUBLAS_STATUS_SUCCESS;
}


cublasStatus_t cublasGetMatrix(int rows, int cols, int elemSize,
                const void *A, int lda, void *B, int ldb) {
/*
This function copies a tile of rows x cols elements from a matrix A in GPU memory space
 to a matrix B in host memory space. It is assumed that each element requires storage
of elemSize bytes and that both matrices are stored in column-major format, with the
leading dimension of the source matrix A and destination matrix B given in lda and ldb,
 respectively. The leading dimension indicates the number of rows of the allocated
 matrix, even if only a submatrix of it is being used. In general, A is a device
pointer that points to an object, or part of an object, that was allocated in GPU
memory space via cublasAlloc().
*/

	//__ESBMC_assert(lda == cols, "Full matrix is not bein recovered");
	//cudaMemcpy(&B, &A, rows*cols*elemSize, cudaMemcpyDeviceToHost);
	return CUBLAS_STATUS_SUCCESS;

}

cublasStatus_t cublasSetVector(int n,  int elemSize,
                const void *A, int lda, void *B, int ldb) {


	//__ESBMC_assert(lda == ldb, "Full matrix is not bein copied");
        //cudaMemcpy(&B, &A, n*elemSize, cudaMemcpyHostToDevice);


	return CUBLAS_STATUS_SUCCESS;
}

cublasStatus_t cublasGetVector(int n,  int elemSize,
                const void *A, int lda, void *B, int ldb) {

	//__ESBMC_assert(ldb == lda, "Full matrix is not bein copied");
        //cudaMemcpy(&B, &A, n*elemSize, cudaMemcpyDeviceToHost);


	return CUBLAS_STATUS_SUCCESS;
}

cublasStatus_t cublasIsamin(cublasHandle_t handle, int n,
                            const float *x, int incx, int *result){

		int i = 0;
		int j;
		result = 0;
		for(i=0;i < n; i++){
			j = 1+(i-1)*incx;
			if(x[result[0]] >= x[j]) {
				result[0] = j;
		}
		return CUBLAS_STATUS_SUCCESS;
}
}

cublasStatus_t cublasIdamin(cublasHandle_t handle, int n,
                            const double *x, int incx, int *result){

		int i = 0;
		int j;
		result = 0;
		for(i=0;i < n; i++){
			j = 1+(i-1)*incx;
			if(x[result[0]] >= x[j]) {
				result[0] = j;
		}
		return CUBLAS_STATUS_SUCCESS;
}
}

cublasStatus_t  cublasSasum(cublasHandle_t handle, int n,
                            const float           *x, int incx, float  *result){

		int i = 0;
		int j;
		float calculate = 0;
		result = 0;
		for(i=0;i < n; i++){
			j = 1+(i-1)*incx;
			calculate = x[j] + calculate;
		}
		result[0] = calculate;
		return CUBLAS_STATUS_SUCCESS;
}



cublasStatus_t  cublasDasum(cublasHandle_t handle, int n,
                            const double          *x, int incx, double *result){

		int i = 0;
		int j;
		double calculate = 0;
		result = 0;
		for(i=0;i < n; i++){
			j = 1+(i-1)*incx;
			calculate = x[j] + calculate;
		}
		result[0] = calculate;
		return CUBLAS_STATUS_SUCCESS;
}


cublasStatus_t cublasIsamax(cublasHandle_t handle, int n,
                            const float *x, int incx, int *result){

		int i = 0;
		int j;
		result = 0;
		for(i=0;i < n; i++){
			j = 1+(i-1)*incx;
			if(x[result[0]] <= x[j]) {
				result[0] = j;
		}
		return CUBLAS_STATUS_SUCCESS;
}
}


cublasStatus_t cublasIdamax(cublasHandle_t handle, int n,
                            const double *x, int incx, int *result){

		int i = 0;
		int j;
		result = 0;
		for(i=0;i < n; i++){
			j = 1+(i-1)*incx;
			if(x[result[0]] <= x[j]) {
				result[0] = j;
		}
		return CUBLAS_STATUS_SUCCESS;
}
}


cublasStatus_t  cublasSscal(cublasHandle_t handle, int n,
                            const float           *alpha,
                            float           *x, int incx) {

		int i = 0;
		int j;
		for(i=0;i < n; i++){
			j = 1+(i-1)*incx;
			x[j]= ((float)alpha[0])*x[j];
		}
		return CUBLAS_STATUS_SUCCESS;
}

cublasStatus_t  cublasDscal(cublasHandle_t handle, int n,
                            const double           *alpha,
                            double           *x, int incx) {

		int i = 0;
		int j;
		for(i=0;i < n; i++){
			j = 1+(i-1)*incx;
			x[j]= ((double)alpha[0])*x[j];
		}
		return CUBLAS_STATUS_SUCCESS;
}


cublasStatus_t cublasSswap(cublasHandle_t handle, int n, float           *x,
                           int incx, float           *y, int incy){

		int i = 0;
		int j, k;;
		float aux = 0;
		for(i=0;i < n; i++){
			k = 1+(i-1)*incx;
			j = 1+(i-1)*incy;
			aux = y[j];
			y[j]= x[k];
			x[k] = y[j];
		}
		return CUBLAS_STATUS_SUCCESS;
}


cublasStatus_t cublasDswap(cublasHandle_t handle, int n, double          *x,
                           int incx, double          *y, int incy){

		int i = 0;
		int j, k;
		double aux = 0;
		for(i=0;i < n; i++){
			k = 1+(i-1)*incx;
			j = 1+(i-1)*incy;
			aux = y[j];
			y[j]= x[k];
			x[k] = y[j];
		}
		return CUBLAS_STATUS_SUCCESS;
}

cublasStatus_t cublasSdot (cublasHandle_t handle, int n,
                           const float           *x, int incx,
                           const float           *y, int incy,
                           float           *result){

		int i = 0;
		int j, k;
		float aux = 0;
		for(i=0;i < n; i++){
			k = 1+(i-1)*incx;
			j = 1+(i-1)*incy;
			aux = y[j]*x[k] + aux;
		}
		result[0] = aux;
		return CUBLAS_STATUS_SUCCESS;
}



cublasStatus_t cublasDdot (cublasHandle_t handle, int n,
                           const double          *x, int incx,
                           const double          *y, int incy,
                           double          *result){

		int i = 0;
		int j, k;
		double aux = 0;
		for(i=0;i < n; i++){
			k = 1+(i-1)*incx;
			j = 1+(i-1)*incy;
			aux = y[j]*x[k] + aux;
		}
		result[0] = aux;
		return CUBLAS_STATUS_SUCCESS;
}




cublasStatus_t cublasScopy(cublasHandle_t handle, int n,
                           const float           *x, int incx,
                           float                 *y, int incy){

		int i = 0;
		int j, k;
		for(i=0;i < n; i++){
			k = 1+(i-1)*incx;
			j = 1+(i-1)*incy;
			y[j]= x[k];
		}
		return CUBLAS_STATUS_SUCCESS;
}


cublasStatus_t cublasDcopy(cublasHandle_t handle, int n,
                           const double          *x, int incx,
                           double                *y, int incy){

		int i = 0;
		int j, k;
		for(i=0;i < n; i++){
			k = 1+(i-1)*incx;
			j = 1+(i-1)*incy;
			y[j]= x[k];
		}
		return CUBLAS_STATUS_SUCCESS;
}



cublasStatus_t cublasSgemm(cublasHandle_t handle,
			cublasOperation_t transa, cublasOperation_t transb,
			int m, int n, int k,
			const float *alpha,
			const float *A, int lda,
			const float *B, int ldb,
			const float *beta,
			float *C, int ldc) {
	int contadorX = 0, contadorY = 0;
	int contadorZ = 0;
	float result = 0;
	//__ESBMC_assert(lda == m || lda == k, "The leading dimensions doens't correspond to matrix A dimensions. Array out of bounds.");
	//__ESBMC_assert(ldb == k || ldb == n, "The leading dimensions doens't correspond to matrix B dimensions. Array out of bounds.");
	//__ESBMC_assert(ldc == m || ldc == k, "The leading dimensions doens't correspond to matrix C dimensions. Array out of bounds.");
	if ((transa == CUBLAS_OP_N) && (transb == CUBLAS_OP_N)) {
		result = 0;
		for(contadorZ=0; contadorZ<m; contadorZ++){
			for(contadorY=0; contadorY<n; contadorY++) {
				result = 0;
				for(contadorX=0;contadorX<k; contadorX++) {
					//result =  (A[contadorX + contadorY*k] * B[contadorX*n + contadorY]) + result;
					result =  (A[contadorX + contadorZ*lda] * B[contadorX*ldb + contadorY]) + result;
					}
				C[contadorY + contadorZ*ldc] = alpha[0]*result + beta[0]*C[contadorY + contadorZ*ldc];
			}
		}
	}

	else if ((transa == CUBLAS_OP_N) && (transb == CUBLAS_OP_T)) {
		result = 0;
		for(contadorZ=0; contadorZ<m; contadorZ++){
			for(contadorY=0; contadorY<n; contadorY++) {
				result = 0;
				for(contadorX=0;contadorX<k; contadorX++) {
					//result =  (A[contadorX + contadorY*k] * B[contadorX*n + contadorY]) + result;
					result =  (A[contadorX + contadorZ*k] * B[contadorX + contadorY*n]) + result;
					}
				C[contadorY + contadorZ*m] = alpha[0]*result + beta[0]*C[contadorY + contadorZ*m];
			}
		}
	}
	else if ((transa == CUBLAS_OP_T) && (transb == CUBLAS_OP_N)) {
		result = 0;
		for(contadorZ=0; contadorZ<m; contadorZ++){
			for(contadorY=0; contadorY<n; contadorY++) {
				result = 0;
				for(contadorX=0;contadorX<k; contadorX++) {
					//result =  (A[contadorX + contadorY*k] * B[contadorX*n + contadorY]) + result;
					result =  (A[contadorX*k + contadorZ] * B[contadorX*n + contadorY]) + result;
					}
				C[contadorY + contadorZ*m] = alpha[0]*result + beta[0]*C[contadorY + contadorZ*m];
			}
		}
	}
	else if ((transa == CUBLAS_OP_T) && (transb == CUBLAS_OP_T)) {
		result = 0;
		for(contadorZ=0; contadorZ<m; contadorZ++){
			for(contadorY=0; contadorY<n; contadorY++) {
				result = 0;
				for(contadorX=0;contadorX<k; contadorX++) {
					//result =  (A[contadorX + contadorY*k] * B[contadorX*n + contadorY]) + result;
					result =  (A[contadorX*k + contadorZ] * B[contadorX + contadorY*n]) + result;
					}
				C[contadorY + contadorZ*m] = alpha[0]*result + beta[0]*C[contadorY + contadorZ*m];
			}
		}

	}
	return CUBLAS_STATUS_SUCCESS;

}

cublasStatus_t cublasDgemm(cublasHandle_t handle,
			cublasOperation_t transa, cublasOperation_t transb,
			int m, int n, int k,
			const double *alpha,
			const double *A, int lda,
			const double *B, int ldb,
			const double *beta,
			double *C, int ldc) {
	int contadorX = 0, contadorY = 0;
	int contadorZ = 0;
	double result = 0;

	if ((transa == CUBLAS_OP_N) && (transb == CUBLAS_OP_N)) {
		result = 0;
		for(contadorZ=0; contadorZ<m; contadorZ++){
			for(contadorY=0; contadorY<n; contadorY++) {
				result = 0;
				for(contadorX=0;contadorX<k; contadorX++) {
					//result =  (A[contadorX + contadorY*k] * B[contadorX*n + contadorY]) + result;
					result =  (A[contadorX + contadorZ*k] * B[contadorX*n + contadorY]) + result;
					}
				C[contadorY + contadorZ*m] = alpha[0]*result + beta[0]*C[contadorY + contadorZ*m];
			}
		}
	}
	else if ((transa == CUBLAS_OP_N) && (transb == CUBLAS_OP_T)) {
		result = 0;
		for(contadorZ=0; contadorZ<m; contadorZ++){
			for(contadorY=0; contadorY<n; contadorY++) {
				result = 0;
				for(contadorX=0;contadorX<k; contadorX++) {
					//result =  (A[contadorX + contadorY*k] * B[contadorX*n + contadorY]) + result;
					result =  (A[contadorX + contadorZ*k] * B[contadorX + contadorY*n]) + result;
					}
				C[contadorY + contadorZ*m] = alpha[0]*result + beta[0]*C[contadorY + contadorZ*m];
			}
		}
	}
	else if ((transa == CUBLAS_OP_T) && (transb == CUBLAS_OP_N)) {
		result = 0;
		for(contadorZ=0; contadorZ<m; contadorZ++){
			for(contadorY=0; contadorY<n; contadorY++) {
				result = 0;
				for(contadorX=0;contadorX<k; contadorX++) {
					//result =  (A[contadorX + contadorY*k] * B[contadorX*n + contadorY]) + result;
					result =  (A[contadorX*k + contadorZ] * B[contadorX*n + contadorY]) + result;
					}
				C[contadorY + contadorZ*m] = alpha[0]*result + beta[0]*C[contadorY + contadorZ*m];
			}
		}
	}
	else if ((transa == CUBLAS_OP_T) && (transb == CUBLAS_OP_T)) {
		result = 0;
		for(contadorZ=0; contadorZ<m; contadorZ++){
			for(contadorY=0; contadorY<n; contadorY++) {
				result = 0;
				for(contadorX=0;contadorX<k; contadorX++) {
					//result =  (A[contadorX + contadorY*k] * B[contadorX*n + contadorY]) + result;
					result =  (A[contadorX*k + contadorZ] * B[contadorX + contadorY*n]) + result;
					}
				C[contadorY + contadorZ*m] = alpha[0]*result + beta[0]*C[contadorY + contadorZ*m];
			}
		}

	}
	return CUBLAS_STATUS_SUCCESS;

}
cublasStatus_t cublasSaxpy(cublasHandle_t handle, int n,
                           const float           *alpha,
                           const float           *x, int incx,
                           float                 *y, int incy) {
		int i = 0;
		int k, j;
		for(i=0;i < n; i++){
			k = 1+(i-1)*incx;
			j = 1+(i-1)*incy;
			y[j]= ((float)alpha[0])*x[k] + y[j];
		}
		return CUBLAS_STATUS_SUCCESS;
}

cublasStatus_t cublasDaxpy(cublasHandle_t handle, int n,
                           const double          *alpha,
                           const double          *x, int incx,
                           double                *y, int incy) {
		int i = 0;
		int k, j;
		for(i=0;i < n; i++){
			k = 1+(i-1)*incx;
			j = 1+(i-1)*incy;
			y[j]= ((double)alpha[0])*x[k] + y[j];
		}
		return CUBLAS_STATUS_SUCCESS;
}


float sigmoidFunction(float u) {
	float retorno;
	retorno = (1/(1 + powf(2.718281,(u*(-1)))));
	return retorno;
}


void activeSigmoid(float* saida, int size) {
	int i;
	for(i = 0; i < size; i++) {
		saida[i] = sigmoidFunction(saida[i]);
	}
}

int signalChange(float v1, float v2) {
	if(v1 > 0 && v2 < 0)
		return 1;
	else if(v1 < 0 && v2 > 0)
		return 1;
	else
		return 0;
}

int distanceAbsoluteFunction(float v1, float v2, float d) {
	//precisa de validacao
	if (fabs(v1 - v2) > d)
		return 1;
	else
		return 0;
}

int valueChange(float v1, float v2, float d) {
	if((!signalChange(v1,v2) && distanceAbsoluteFunction(v1,v2,d)))
		return 1;
	else
		return 0;
}

int distanceChange(float* out1, float* out2, float normDistance, int size) {
	int i = 0;
	float normbasedDistance = 0;
	for(i=0;i++;i<size) {
			normbasedDistance += (out1[i] - out2[i])*(out1[i] - out2[i]);
			if(signalChange(out1[i], out2[i]))
				return 0;
	}
	if(sqrtf(normbasedDistance < normDistance))
		return 1;
	else
		return 0;
}

//Covering method
//Sign-sign Cover, or SSCover
int SSCover(float* layer1x1, float* layer1x2, float n2x1, float n2x2, int size1, int n1) {
	int i = 0;
	if (!signalChange(layer1x1[n1], layer1x2[n1]))
		return 0;
	for(i=0;i<size1;i++) {
		if (i=n1)
				continue;
		else if(signalChange(layer1x1[i], layer1x2[i]))
			return 0;
	}
	if(signalChange(n2x1, n2x2))
		return 1;
	else
		return 0;
}

//The method that prints the covered neurons
void printSSCover(float* layeri1, float* layeri2, float* layerj1, float* layerj2, int l1, int l2) {
	int i = 0;
	int n1 = -1;
	int n2 = -1;
	int *sc1, *sc2;
 	sc1 = malloc(l1*sizeof(int));
	sc2 = malloc(l2*sizeof(int));
	for(i =0; i <l1; i++) {
		sc1[i] = signalChange(layeri1[i], layeri2[i]);
		if((n1!=-1)&&(sc1[i]==1)) {
			printf("There is no SSCover neurons for these 2 test cases \n");
			return;
		}
		if((sc1[i]==1) && (n1==-1)) {
			n1 = i;
		}
		if(i==(l1-1)&&(n1==-1)) {
			printf("There is no SSCover neurons for these 2 test cases \n");
			return;
		}
	}
	for(i =0; i <l2; i++) {
		sc2[i] = signalChange(layerj1[i], layerj2[i]);
		if(sc2[i]) {
			printf("The neuron pair ni%d, nj%d is SSCovered by the 2 test cases.\n", n1, i);
			n2 = i;
		}
		if((n2==-1)&&(i==(l2-1))){
			printf("There is no SSCover neurons for these 2 test cases \n");
			return;
		}


	}

}

//Covering method
//Distance-Sign Cover, or DSCover
int DSCover(float* layer1x1, float* layer1x2, float n2x1, float n2x2, int size1, int n1, int normDistance) {
	int i = 0;
	if(!distanceChange(layer1x1, layer1x2, normDistance, size1))
		return 0;
	else {
		if(signalChange(n2x1,n2x2))
			return 1;
		else
			return 0;
	}
}

//The method that prints the covered neurons
void printDSCover(float* layeri1, float* layeri2, float* layerj1, float* layerj2, int l1, int l2) {
	int i = 0;
	int j = 0;
	int find = 0;
	if(!distanceChange(layeri1, layeri2, 1, l1)) {
		printf("There is no DSCover neurons for these 2 test cases \n");
		return;
	}

	for(i =0; i <l2; i++) {
		if(signalChange(layerj1[i], layerj2[i])){
				find=1;
				for(j=0; j<l1;j++) {
					printf("The neuron pair ni%d, nj%d is DSCovered by the 2 test cases.\n", j, i);
				}
		}
	}
		if(!find){
			printf("There is no DSCover neurons for these 2 test cases \n");
			return;
		}
	}

//Covering method
//Sign-Value Cover, or SVCover
int SVCover(float* layer1x1, float* layer1x2, float n2x1, float n2x2, int size1, int n1, int distance) {
	int i = 0;
	if (!signalChange(layer1x1[n1], layer1x2[n1]))
		return 0;
	for(i=0;i<size1;i++) {
		if (i=n1)
				continue;
		else if(signalChange(layer1x1[i], layer1x2[i]))
			return 0;
	}
	if(valueChange(n2x1, n2x2, distance))
		return 1;
	else
		return 0;
}

//The method that prints the covered neurons
void printSVCover(float* layeri1, float* layeri2, float* layerj1, float* layerj2, int l1, int l2, int distance){
	int i = 0;
	int n1 = -1;
	int n2 = -1;
	int *sc1, *sc2;
 	sc1 = malloc(l1*sizeof(int));
	sc2 = malloc(l2*sizeof(int));
	for(i =0; i <l1; i++) {
		sc1[i] = signalChange(layeri1[i], layeri2[i]);
		if((n1!=-1)&&(sc1[i]==1)) {
			printf("There is no SSCover neurons for these 2 test cases \n");
			return;
		}
		if((sc1[i]==1) && (n1==-1)) {
			n1 = i;
		}
		if(i==(l1-1)&&(n1==-1)) {
			printf("There is no SSCover neurons for these 2 test cases \n");
			return;
		}
	}
	for(i =0; i <l2; i++) {
		sc2[i] = valueChange(layerj1[i], layerj2[i], distance);
		if(sc2[i]) {
			printf("The neuron pair ni%d, nj%d is SSCovered by the 2 test cases.\n", n1, i);
			n2 = i;
		}
		if((n2==-1)&&(i==(l2-1))){
			printf("There is no SSCover neurons for these 2 test cases \n");
			return;
		}


	}
}
//Covering method
//Distance-Value Cover, or DVCover
int DVCover(float* layer1x1, float* layer1x2, float n2x1, float n2x2, int size1, int distance) {
	if(!distanceChange(layer1x1, layer1x2, distance, size1))
		return 0;
	if(valueChange(n2x1, n2x2, distance))
		return 1;
	else
		return 0;
}

//The method that prints the covered neurons
void printDVCover(float* layeri1, float* layeri2, float* layerj1, float* layerj2, int l1, int l2, int distance) {
	int i = 0;
	int j = 0;
	int find = 0;
	if(!distanceChange(layeri1, layeri2, 1, l1)) {
		printf("There is no DSCover neurons for these 2 test cases \n");
		return;
	}

	for(i =0; i <l2; i++) {
		if(valueChange(layerj1[i], layerj2[i], distance)){
				find=1;
				for(j=0; j<l1;j++) {
					printf("The neuron pair ni%d, nj%d is DSCovered by the 2 test cases.\n", j, i);
				}
		}
	}
		if(!find){
			printf("There is no DSCover neurons for these 2 test cases \n");
			return;
		}
}

//void checkSSCover(float* layer1, float* layer2, float* layer3,)


void normalizef(float* image, int size) {
	int i = 0;
	for(i=0;i++;i<size) {
			image[i] = image[i]/255;
	}
}

void normalized(double* image, int size) {
	int i = 0;
	for(i=0;i++;i<size) {
			image[i] = image[i]/255;
	}
}

void imprimeResultante(float* matriz, int size) {
int cont = 0;
        for(cont = 0; cont < size; cont++) {
                printf("resultante: %d com valor: %.6f \n", cont, matriz[cont]);
        }
        //printf("limiar de ativacao da posicao: %d com valor: %.2f \n", cont, pesosSinapticos[xn]);
}

void printLayerValues(float* layer1, float* layer2, int size) {
int cont = 0;
        for(cont = 0; cont < size; cont++) {
                printf("Neuron: %d : x1: %.6f   x2: %.6f \n", cont, layer1[cont], layer2[cont]);
        }
        //printf("limiar de ativacao da posicao: %d com valor: %.2f \n", cont, pesosSinapticos[xn]);
}


void checkNN(float* wfc1, float* bfc1, float* wfc2, float* bfc2, float* wfc3, float* bfc3, float* img, float* img2) {

	printf("Hello World \n");

	float *x1layer1;
	float *x1layer2;
	float *x1layer3;
	float *x2layer1;
	float *x2layer2;
	float *x2layer3;
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

	//wfc1 = (float*)malloc(data*fc1*sizeof(float));


	x1layer1 = (float*)malloc(fc1*sizeof(float));

	x1layer2 = (float*)malloc(fc2*sizeof(float));

	x1layer3 = (float*)malloc(fc3*sizeof(float));

	x2layer1 = (float*)malloc(fc1*sizeof(float));

	x2layer2 = (float*)malloc(fc2*sizeof(float));

	x2layer3 = (float*)malloc(fc3*sizeof(float));



  normalizef(img, 25); // ponteiro da entrada e tamanho da imagem

	cublasSgemm(cublasHandle,
			CUBLAS_OP_N, CUBLAS_OP_N,
			fc1, 1, data,
			&alpha,
			wfc1, data,
			img, 1,
			&beta,
			x1layer1, 1);

	cublasSgemm(cublasHandle,
      CUBLAS_OP_N, CUBLAS_OP_N,
      fc1, 1, 1,
      &alpha,
      bfc1, 1,
      onevec, 1,
      &alpha,
      x1layer1, 1);

	imprimeResultante(x1layer1, fc1);
	activeSigmoid(x1layer1, fc1);
	imprimeResultante(x1layer1, fc1);

//Computing the first layer of the second image x2 on the same Neural Network
	cublasSgemm(cublasHandle,
			CUBLAS_OP_N, CUBLAS_OP_N,
			fc1, 1, data,
			&alpha,
			wfc1, data,
			img2, 1,
			&beta,
			x2layer1, 1);

	cublasSgemm(cublasHandle,
			CUBLAS_OP_N, CUBLAS_OP_N,
			fc1, 1, 1,
			&alpha,
			bfc1, 1,
			onevec, 1,
			&alpha,
			x2layer1, 1);

	//imprimeResultante(x2layer1, fc1);
	activeSigmoid(x2layer1, fc1);
	//imprimeResultante(x2layer1, fc1);
	printLayerValues(x1layer1, x2layer1, fc1);

    cublasSgemm(cublasHandle,
      CUBLAS_OP_N, CUBLAS_OP_N,
      fc2, 1, fc1,
      &alpha,
      wfc2, fc1,
      x1layer1, 1,
      &beta,
      x1layer2, 1);

  cublasSgemm(cublasHandle,
      CUBLAS_OP_N, CUBLAS_OP_N,
      fc2, 1, 1,
      &alpha,
      bfc2, 1,
      onevec, 1,
      &alpha,
      x1layer2, 1);

	//imprimeResultante(x1layer2, fc2);
	activeSigmoid(x1layer2, fc2);
//	imprimeResultante(x1layer2, fc2);

	//Computing the second layer of the second image on the same Neural network

	cublasSgemm(cublasHandle,
			CUBLAS_OP_N, CUBLAS_OP_N,
			fc2, 1, fc1,
			&alpha,
			wfc2, fc1,
			x2layer1, 1,
			&beta,
			x2layer2, 1);

	cublasSgemm(cublasHandle,
			CUBLAS_OP_N, CUBLAS_OP_N,
			fc2, 1, 1,
			&alpha,
			bfc2, 1,
			onevec, 1,
			&alpha,
			x2layer2, 1);

//imprimeResultante(x2layer2, fc2);
activeSigmoid(x2layer2, fc2);
//imprimeResultante(x2layer2, fc2);

  cublasSgemm(cublasHandle,
      CUBLAS_OP_N, CUBLAS_OP_N,
      fc3, 1, fc2,
      &alpha,
      wfc3, fc2,
      x1layer2, 1,
      &beta,
      x1layer3, 1);

  cublasSgemm(cublasHandle,
    	CUBLAS_OP_N, CUBLAS_OP_N,
    	fc3, 1, 1,
    	&alpha,
    	bfc3, 1,
    	onevec, 1,
    	&alpha,
    	x1layer3, 1);

	//imprimeResultante(x1layer3, fc3);
	activeSigmoid(x1layer3, fc3);
//	imprimeResultante(x1layer3, fc3);

	//Computing the third layer of the second image on the same Neural network

	cublasSgemm(cublasHandle,
			CUBLAS_OP_N, CUBLAS_OP_N,
			fc3, 1, fc2,
			&alpha,
			wfc3, fc2,
			x2layer2, 1,
			&beta,
			x2layer3, 1);

	cublasSgemm(cublasHandle,
			CUBLAS_OP_N, CUBLAS_OP_N,
			fc3, 1, 1,
			&alpha,
			bfc3, 1,
			onevec, 1,
			&alpha,
			x2layer3, 1);

//imprimeResultante(x3layer3, fc3);
activeSigmoid(x2layer3, fc3);
//imprimeResultante(x3layer3, fc3);

}
