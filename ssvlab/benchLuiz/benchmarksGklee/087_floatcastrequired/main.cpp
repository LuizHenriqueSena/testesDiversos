#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include <cuda.h>
#include <cuda_runtime_api.h>
#include <math_functions.h>

#define N 2 

__global__ void foo(float *x, float y) {
	x[threadIdx.x] = __exp10f(y);	 
}

int main(void){
	float *A;
	float *dev_A;

	float size= N*sizeof(float);

	A=(float*)malloc(size);

	cudaMalloc((void**)&dev_A, size);

	cudaMemcpy(dev_A, A, size, cudaMemcpyHostToDevice);
{	__set_CUDAConfig(1, N); 
          
	foo(dev_A, 2);}
          
	 

	cudaMemcpy(A, dev_A, size, cudaMemcpyDeviceToHost);

	printf("\n");

	for(int t=0; t<N; t++){
		printf("%.1f ", A[t]);
		assert (A[t] == 100);
	}

	cudaFree(dev_A);
	free(A); 

	return 0;
}
