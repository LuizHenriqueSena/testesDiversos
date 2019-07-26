 
 

#include <cuda.h>
#include <assert.h>
#define N 2 

__global__ void foo(int* A)
{
 
  
	assert(threadIdx.x < blockDim.x);

}

int main(){

	int *a,*dev_a;
	a = (int*)malloc(N*sizeof(int));
	
	cudaMalloc((void**)&dev_a,N*sizeof(int));
	cudaMemcpy(dev_a,a,N*sizeof(int),cudaMemcpyHostToDevice);
{	__set_CUDAConfig(1, N); 
          
	foo(dev_a);}
          
	 
	
	cudaFree(dev_a);
	free(a);

}

