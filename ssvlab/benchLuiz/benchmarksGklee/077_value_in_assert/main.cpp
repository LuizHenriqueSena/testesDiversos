 
 
 
 
 

#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime_api.h>
#include <assert.h>
#define N 2 

__global__ void example(unsigned a, unsigned b, unsigned c) {

     
     

     
	assert((a+b) != c);

}

int main(){

	unsigned a, b, c;

	a=12;
	b=36;
{	__set_CUDAConfig(N, N); 
          
	example(a,b,c);}
          
	 

	cudaThreadSynchronize();
}
