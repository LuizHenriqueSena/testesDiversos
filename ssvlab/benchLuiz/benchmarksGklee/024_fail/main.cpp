#include <stdio.h>
#include <stdlib.h>
#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime_api.h>
#include <assert.h>

__global__ void Asum(int *a, int *b, int *c){
	*c = *a + *b;
}

int main(void){
	int a, b, c;
	int *dev_a, *dev_b, *dev_c;		 
	int size = sizeof(int);			 

	cudaMalloc((void**)&dev_a,size);	 
						 
						 
						 
	cudaMalloc((void**)&dev_b,size);
	cudaMalloc((void**)&dev_c,size);	 
						 
	a = 2;
	b = 7;
	c = 8;

	cudaMemcpy(dev_a,&a,size, cudaMemcpyHostToDevice);	 
	cudaMemcpy(dev_b,&b,size, cudaMemcpyHostToDevice);
{	__set_CUDAConfig(1, 1); 
          
	Asum(dev_a,dev_b,dev_c);}
          
	 

	cudaMemcpy(&c,dev_c,size,cudaMemcpyDeviceToHost);

	printf("a + b = %d\n", c);

	assert(c != a+b);

	cudaFree(dev_a);
	cudaFree(dev_b);
	cudaFree(dev_c);

	return 0;
}
