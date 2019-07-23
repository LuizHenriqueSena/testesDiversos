#include <stdio.h>
#include <cuda.h>
#include <assert.h>

#define N 2 

__device__ int* bar(int* p) {

	 
	return p;
}

__global__ void foo(int* p) {

   
  *(bar(p)+threadIdx.x) = 2;
   

}

int main() {
	int *c;
	int *dev_c;
	c = (int*)malloc(N*sizeof(int));

	for (int i = 0; i < N; ++i)
		c[i] = 1;

	cudaMalloc((void**)&dev_c, N*sizeof(int));

	cudaMemcpy(dev_c, c, N*sizeof(int), cudaMemcpyHostToDevice);
{	__set_CUDAConfig(1, N); 
          
	foo(dev_c);}
          
	 

	cudaMemcpy(c, dev_c, N*sizeof(int), cudaMemcpyDeviceToHost);

	printf ("\n");

	for (int i = 0; i < N; ++i){
		printf(" %d; ", c[i]);
		assert(c[i]!=2);
	}

	free(c);
	cudaFree(dev_c);

	   return 0;
}
