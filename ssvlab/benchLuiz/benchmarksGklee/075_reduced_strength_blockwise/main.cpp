 
 
#include <cuda.h>
#include <cuda_runtime_api.h>
#include <stdio.h>

#define GRIDDIM 1
#define BLOCKDIM 2 
#define WIDTH 2 
#define N WIDTH
 

__global__ void k(int *A) {
 
 
 
 

  for (int i=threadIdx.x; i<WIDTH; i+=blockDim.x) {

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

    A[blockIdx.x*WIDTH+i] = i;
  }

 
 
 
}

int main (){
	int *a;
	int *dev_a;
	int size = N*sizeof(int);

	cudaMalloc((void**)&dev_a, size);

	a = (int*)malloc(size);

	for (int i = 0; i < N; i++)
		a[i] = 0;

 
 
 

	cudaMemcpy(dev_a,a,size,cudaMemcpyHostToDevice);
{	__set_CUDAConfig(GRIDDIM, BLOCKDIM); 
          
	k (dev_a);}
          
	 

	cudaMemcpy(a,dev_a,size,cudaMemcpyDeviceToHost);

 

	for (int i = 0; i < N; i++){
 
		assert(a[i]== i);
	}

	free(a);
	cudaFree(dev_a);
	return 0;
}
