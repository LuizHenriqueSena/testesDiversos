 
 

#include <cuda.h>
#include <stdio.h>
#include <assert.h>

#define N 2 

__device__ void bar(float x) {
	assert(1);
}

__global__ void foo(int* A) {

  bar(A[0]);

}

int main(){

	int *b;
	int *dev_b;

	b = (int*)malloc(N*sizeof(int));

	for (int i = 0; i < N; ++i){
		b[i] = i+1;
		 
	}

	cudaMalloc((void**)&dev_b, N*sizeof(float));

	cudaMemcpy(dev_b, b, N*sizeof(float), cudaMemcpyHostToDevice);
{	__set_CUDAConfig(1, N); 
          
	foo(dev_b);}
          
		 

	free(b);
	cudaFree(dev_b);
}
