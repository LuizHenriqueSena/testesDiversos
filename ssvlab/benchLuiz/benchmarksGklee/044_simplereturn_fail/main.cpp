 
 

#include <stdio.h>
#include <cuda.h>
#include <stdlib.h>
#include <assert.h>

#define N 2 

__device__ int f(int x) {
	
	return x + 1;
}

__global__ void foo(int *y) {

	*y = f(2);

}

int main() {
	int *a = (int*)malloc(sizeof(int));
	int *dev_a;

	cudaMalloc((void**)&dev_a, sizeof(int));
{	__set_CUDAConfig(1, N); 
          
	foo(dev_a);}
          
	 

	cudaMemcpy(a, dev_a, sizeof(int), cudaMemcpyDeviceToHost);

 

	assert(*a != 3);

	free(a);
	cudaFree(dev_a);

	return 0;
}
