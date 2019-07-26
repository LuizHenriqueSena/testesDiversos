 
 
 
 

#include <stdio.h>
#include <stdlib.h>
#include <cuda.h>

#define N 2 

__global__ void example(float * A, int x) {

	 

    if(threadIdx.x == 0) {
        A[threadIdx.x + x] = threadIdx.x;  
    }

    if(threadIdx.x == 1) {
        A[threadIdx.x] = threadIdx.x;  
   }
}

int main() {
	int c=1;
	float *a;
	float *dev_a;

	a = (float*)malloc(N*sizeof(float));

	cudaMalloc((void**)&dev_a, N*sizeof(float));

	cudaMemcpy(dev_a, a, N*sizeof(float), cudaMemcpyHostToDevice);
{	__set_CUDAConfig(1, N); 
          
	example(dev_a, c);}
          
		 

	cudaMemcpy(a, dev_a, N*sizeof(float), cudaMemcpyDeviceToHost);

	assert(a[1] == 0 || a[1] == 1);	

	free(a);
	cudaFree(dev_a);

	return 0;
}
