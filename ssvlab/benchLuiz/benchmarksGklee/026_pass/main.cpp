#include <stdio.h>
#include <stdlib.h>
#include <cuda.h>
#include <cuda_runtime_api.h>
#include <assert.h>
 
#define N 2

__global__ void MoreSums(int *a, int *b, int *c){
	c[blockIdx.x] = a[blockIdx.x] + b[blockIdx.x];
}

int main(void){

	int *dev_a, *dev_b, *dev_c;
	int size = N*sizeof(int);

	cudaMalloc((void**)&dev_a, size);
	cudaMalloc((void**) &dev_b, size);
	cudaMalloc((void**)&dev_c,size);

		int a[N] = {1, 2, 3, 4}; 
		int b[N] = {1, 2, 3, 4}; 
		int c[N] = {1, 2, 3, 4}; 

	cudaMemcpy(dev_a,&a,size, cudaMemcpyHostToDevice);
	cudaMemcpy(dev_b,&b,size, cudaMemcpyHostToDevice);
{	__set_CUDAConfig(N, 1); 
          
	MoreSums(dev_a,dev_b,dev_c);}
          	 
	 

	cudaMemcpy(&c,dev_c,size,cudaMemcpyDeviceToHost);

	 

	for (int i = 0; i < N; i++){
	 
		assert(c[i]==a[i]+b[i]);
	}

	cudaFree(dev_a);
	cudaFree(dev_c);
	cudaFree(dev_b);

	return 0;
}
