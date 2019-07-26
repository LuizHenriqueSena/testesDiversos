 
 
 

#include <cuda.h>
#include <cuda_runtime_api.h>
#include <stdio.h>

#define N 2 

__global__ void shuffle (int* A)
{
	int tid = threadIdx.x;
	int warp = tid / 32;
	int* B = A + (warp*32);
	A[tid] = B[(tid + 1)%32];
}

int main() {
	int *a;
	int *dev_a;
	int size = N*sizeof(int);

	cudaMalloc((void**)&dev_a, size);

	a = (int*)malloc(N*size);

	for (int i = 0; i < N; i++)
		a[i] = i;

	cudaMemcpy(dev_a,a,size, cudaMemcpyHostToDevice);

	printf("a:  ");

	for (int i = 0; i < N; i++)
		printf("%d        ", a[i]);
{	__set_CUDAConfig(1, N); 
          
	shuffle(dev_a);}
          
	 

	cudaMemcpy(a,dev_a,size,cudaMemcpyDeviceToHost);

	printf("\nFunction Results:\n   ");

	for (int i = 0; i < N; i++)
		printf("%d        ", a[i]);

	free(a);

	cudaFree(dev_a);

	return 0;
}
