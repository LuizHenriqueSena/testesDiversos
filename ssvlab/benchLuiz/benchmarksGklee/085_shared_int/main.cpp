 
 
 
#include "cuda.h"
#define N dim*dim
#define dim 2

__global__ void foo() {

  __shared__ int a;

  a = threadIdx.x;
}

int main(){
{	__set_CUDAConfig(N, N); 
          
	foo ();}
          
	 

	cudaThreadSynchronize();

}
