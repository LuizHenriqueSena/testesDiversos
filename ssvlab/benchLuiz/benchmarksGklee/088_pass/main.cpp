 
 

#include <stdio.h>
#include <assert.h>

#include <cuda.h>
#include <cuda_runtime_api.h>
#include <math_functions.h>

#define DIM 2  
#define N 2 

__global__ void mul24_test (int* A, int* B)
{
  int idxa          = __mul24(blockIdx.x, blockDim.x) + threadIdx.x;
  unsigned int idxb = __umul24(blockIdx.x, blockDim.x) + threadIdx.x;

  A[idxa] = idxa;
  B[idxb] = idxa;
}

int main (){
	int *a, *b;
	int *dev_a, *dev_b;
	int size = N*sizeof(int);

	cudaMalloc((void**)&dev_a, size);
	cudaMalloc((void**)&dev_b, size);

	a = (int*)malloc(size);
	b = (int*)malloc(size);

	for (int i = 0; i < N; i++)
		a[i] = 1;

	for (int i = 0; i < N; i++)
		b[i] = 1;

	cudaMemcpy(dev_a,a,size, cudaMemcpyHostToDevice);
	cudaMemcpy(dev_b,b,size, cudaMemcpyHostToDevice);
{	__set_CUDAConfig(DIM, DIM); 
          
	mul24_test(dev_a,dev_b);}
          
	 

	cudaMemcpy(a,dev_a,size,cudaMemcpyDeviceToHost);
	cudaMemcpy(b,dev_b,size,cudaMemcpyDeviceToHost);

	for (int i = 0; i < N; i++)
		assert (a[i] == i);	

	for (int i = 0; i < N; i++) 
		assert (b[i] == i);	

	free(a); free(b);

	cudaFree(dev_a);
	cudaFree(dev_b);

	return 0;
}
