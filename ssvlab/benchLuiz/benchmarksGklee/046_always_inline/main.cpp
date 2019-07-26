#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <cuda.h>

#define N 2 

__device__ int bar() __attribute__((always_inline));

__device__ int bar()
{
  return 5;
}

__global__ void foo()
{
  int x = bar();
  assert(x == 5);
 

}

int main(){
{	__set_CUDAConfig(1, N); 
          
	foo();}
          
	 

	cudaThreadSynchronize();

	return 0;
}
