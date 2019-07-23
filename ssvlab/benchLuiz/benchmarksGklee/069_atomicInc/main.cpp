 
 

#include <cuda.h>
#include <stdio.h>

#define N 2  

__global__ void definitions (unsigned int* B)
{
  atomicInc(B,7); 
  	   
}

int main (){

	unsigned int b = 5;
	unsigned int *dev_b;

	cudaMalloc ((void**) &dev_b, sizeof(unsigned int));

	cudaMemcpy(dev_b, &b, sizeof(unsigned int),cudaMemcpyHostToDevice);
{	__set_CUDAConfig(1, N); 
          
	definitions (dev_b);}
          
	 
	cudaMemcpy(&b,dev_b,sizeof(unsigned int),cudaMemcpyDeviceToHost);

	printf("B: %u\n", b);

	assert(b==7);

	cudaFree(dev_b);
	return 0;

}
