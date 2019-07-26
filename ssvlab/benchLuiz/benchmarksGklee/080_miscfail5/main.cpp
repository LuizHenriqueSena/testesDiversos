 
 
 

#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime_api.h>

#define N 2 

__constant__ int global_constant[N];  

__global__ void foo(int *in) {

	global_constant[threadIdx.x] = in[threadIdx.x];

	__syncthreads();

	in[threadIdx.x] = global_constant[threadIdx.x];

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
{	__set_CUDAConfig(1, N); 
          
	foo(dev_a);}
          
	 

	cudaMemcpy(a,dev_a,size,cudaMemcpyDeviceToHost);

	printf("\nFunction results:\n   ");

	for (int i = 0; i < N; i++) {
		printf("%d	", a[i]);
	 
	}

	free(a);	
	
	cudaFree(dev_a);

	return 0;
}
