 
 

#include "cuda.h"
#include <stdio.h>

#define N 1

__device__ void bar (int *p){

	int a =2;
	
	p = &a;
	assert(*p == 2);
}

__global__ void foo (int* p, int* q){

    bar(p);

    bar(q);
	assert(*p == 2);
     
}

int main(){
	int *a, *b;
	int *dev_a, *dev_b;
	int size = N*sizeof(int);

	cudaMalloc((void**)&dev_a, size);
	cudaMalloc((void**)&dev_b, size);

	a = (int*)malloc(size);
	b = (int*)malloc(size);

	for (int i = 0; i < N; i++)
		a[i] = 1;

	for (int i = 0; i < N; i++)
		b[i] = 1;

	cudaMemcpy(dev_a,a,size, cudaMemcpyHostToDevice);
	cudaMemcpy(dev_b,b,size, cudaMemcpyHostToDevice);
{	__set_CUDAConfig(1, 2); 
          
	foo(dev_a,dev_b);}
          
		 

	cudaMemcpy(a,dev_a,size,cudaMemcpyDeviceToHost);
	cudaMemcpy(b,dev_b,size,cudaMemcpyDeviceToHost);

	free(a); free(b);

	cudaFree(dev_a);
	cudaFree(dev_b);

	return 0;
}
