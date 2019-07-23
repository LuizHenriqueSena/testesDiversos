 
 

#include <stdio.h>
#include "cuda.h"
#include <assert.h>
#define N 2  

__global__ void foo(float* A, float c) {

  A[threadIdx.x ? 2*threadIdx.x : 1] = c ;

}

int main()
{
	float* dev_b;
	float* b;
	float c = 2.0f;

	b = (float*)malloc(2*N*sizeof(float));  

	cudaMalloc((void**)&dev_b, 2*N*sizeof(float));
{	__set_CUDAConfig(1, N); 
          
	foo(dev_b, c);}
          
	 

	cudaMemcpy(b, dev_b, 2*N*sizeof(float), cudaMemcpyDeviceToHost);

 

	for (int i = 0; i < 2*N; ++i){
 
	   if((i>0)&&(i%2==0))
		   assert(b[i] == c);
	}

	free(b);
	cudaFree(dev_b);
	return 0;
}
