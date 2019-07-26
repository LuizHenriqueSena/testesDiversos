#include <stdio.h>
#include <stdlib.h>
#include <cuda.h>
#include <cuda_runtime_api.h>

#define N 2

__global__ void foo()
{
	__shared__ int A[8];
	A[0] = threadIdx.x;
}

int main(){
{	__set_CUDAConfig(1, N); 
          
	foo();}
          
	 

	cudaThreadSynchronize();

	return 0;
}
