 
 

#include <cuda.h>
#include <assert.h>
#include <stdio.h>

#define N 2 

__global__ void helloCUDA(volatile int* p)
{
     
    p[threadIdx.x] = threadIdx.x;
}

int main () {
	 int *a;
	 int *dev_a;

	int size = N*sizeof(int);

	a = (int*)malloc(size);
	cudaMalloc ((void**) &dev_a, size);
{	__set_CUDAConfig(1, N); 
          
	helloCUDA(dev_a);}
          
	 

	cudaMemcpy(a,dev_a,size,cudaMemcpyDeviceToHost);

	for (int i = 0; i < N; i++) {
		assert(!(a[i] == i));  
	}

	free(a);
	cudaFree(dev_a);

	return 0;
}
