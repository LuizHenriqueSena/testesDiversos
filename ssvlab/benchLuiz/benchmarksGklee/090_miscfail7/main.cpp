 
 
 
 

#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime_api.h> 
#define N 2 

__global__ void foo(int *H) {
  size_t tmp = (size_t)H;  
  tmp += sizeof(int);
  int *G = (int *)tmp;
  G -= 1;					 
  G[threadIdx.x] = threadIdx.x;
  __syncthreads();
  H[threadIdx.x] = G[threadIdx.x];
}

int main() {

	int *a;
	int *dev_a;
	int size = N*sizeof(int);

	cudaMalloc((void**)&dev_a, size);

	a = (int*)malloc(N*size);

	for (int i = 0; i < N; i++)
		a[i] = 1;

	cudaMemcpy(dev_a,a,size, cudaMemcpyHostToDevice);

	printf("a:  ");
	for (int i = 0; i < N; i++)
		printf("%d	", a[i]);
{	__set_CUDAConfig(1, N); 
          
	foo(dev_a);}
          
	 

	cudaMemcpy(a,dev_a,size,cudaMemcpyDeviceToHost);

	printf("\nFunction Results:\n   ");

	for (int i = 0; i < N; i++)
		printf("%d	", a[i]);

	free(a);

	cudaFree(dev_a);

	return 0;
}

