 
 
 

#include <cuda.h>
#include <cuda_runtime_api.h>
#include <stdio.h>
#include <assert.h>

#define N 2 

__constant__ int A[N] = {0, 1, 2, 3};

__global__ void foo(int *B) {

 
	A[threadIdx.x] = B[threadIdx.x];
 
	__syncthreads();

	B[threadIdx.x] = A[threadIdx.x];

}

int main(){

	int *a;
	int *dev_a;
	int size = N*sizeof(int);

	cudaMalloc((void**)&dev_a, size);

	a = (int*)malloc(size);

	for (int i = 0; i < N; i++)
		a[i] = 1;

	cudaMemcpy(dev_a,a,size, cudaMemcpyHostToDevice);

	printf("a:  ");
	for (int i = 0; i < N; i++)
		printf("%d	", a[i]);
{	__set_CUDAConfig(1, N); 
          
	foo(dev_a);}
          
	 

	cudaMemcpy(a,dev_a,size,cudaMemcpyDeviceToHost);

	printf("\nThe function results:\n   ");

	for (int i = 0; i < N; i++){
		printf("%d	", a[i]);
	 
	}

	free(a);

	cudaFree(dev_a);

	return 0;
}
