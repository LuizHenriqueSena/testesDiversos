#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "cuda.h"

 
 

__global__ void foo() {

  __shared__ int A[10][10];
  A[threadIdx.y][threadIdx.x] = 2;
  assert(A[threadIdx.y][threadIdx.x]==2);
}

int main(){

	dim3 dimBlock(2,2);
{	__set_CUDAConfig(1, dimBlock); 
          
	foo();}
          
	 
	cudaThreadSynchronize();
}

