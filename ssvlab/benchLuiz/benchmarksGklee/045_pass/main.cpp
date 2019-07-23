#include <stdio.h>
#include <stdlib.h>
#include <cuda.h>
#include <assert.h>

#define N 2 

__device__ int bar () {
  return 0;
}

__global__ void foo() {
  assert (bar() ==0);
}

int main(){
{	__set_CUDAConfig(1, N); 
          
	foo();}
          
	 

	cudaThreadSynchronize();
	
	return 0;
}
