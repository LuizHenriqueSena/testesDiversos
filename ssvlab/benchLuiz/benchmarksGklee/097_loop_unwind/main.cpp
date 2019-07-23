 
 
 

#include <cuda.h>
#include <cuda_runtime_api.h>
#include <stdio.h>
#include <assert.h>

#define N 2 

extern "C" {

__global__ void helloCUDA(float *A)
{
    __shared__ float B[256];

    for(int i = 0; i < N*2; i ++) {
        B[i] = A[i];
    }
}

}

int main() {

	float *A;
	float *dev_A;

	float size= N*sizeof(float);

	A=(float*)malloc(size);

	cudaMalloc((void**)&dev_A, size);

	for (int i = 0; i < N; i++)
		A[i] = 5;


	cudaMemcpy(dev_A, A, size, cudaMemcpyHostToDevice);
{	__set_CUDAConfig(64, N); 
          
	helloCUDA(dev_A);}
          
	 

	cudaMemcpy(A, dev_A, size, cudaMemcpyDeviceToHost);

	cudaFree(dev_A);
	free(A);

}
