 
#include <stdio.h>
#include <assert.h>
#include <cuda.h>
#define N 2 

__global__ void foo(int* glob) {

  int a;

  int* p;

  a = 0;

  p = &a;

  *p = threadIdx.x;

  glob[*p] = threadIdx.x;
}

int main(){

	int* v;
	int* dev_v;

	 
	v = (int*)malloc(N*sizeof(int));  

	for (int i = 0; i < N; ++i)
		v[i] = rand() %20+1;;

	for (int i = 0; i < N; ++i)
		printf(" %d    :", v[i]);

	cudaMalloc((void**)&dev_v, N*sizeof(int));  

	cudaMemcpy(dev_v, v, N*sizeof(int), cudaMemcpyHostToDevice);
{	__set_CUDAConfig(1, N); 
          
	foo(dev_v);}
          
	 

	cudaMemcpy(v, dev_v, N*sizeof(int), cudaMemcpyDeviceToHost);

	printf("\n\n\n");

	for (int i = 0; i < N; ++i){
		printf(" %d    :", v[i]);
		assert(v[i]==i);
	}
	free(v);
	cudaFree(dev_v);

	return 0;
}
