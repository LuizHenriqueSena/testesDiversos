#include <cuda.h>
#include <cuda_runtime_api.h>

#include <stdio.h>
#include <assert.h>

#define N 2 

__device__  double C[2][2][2];

__device__ int index (int a, int b, int c){
	return 4*a + 2*b + c;
}

__global__ void foo(double *H) {

	int idx = index (threadIdx.x,threadIdx.y,threadIdx.z);

	H[idx] = C[threadIdx.x][threadIdx.y][threadIdx.z];
}

int main(){
	double *a;
	double *dev_a;
	int size = N*sizeof(double);

	cudaMalloc((void**)&dev_a, size);

	a = (double*)malloc(N*size);

	for (int i = 0; i < N; i++)
		a[i] = i;

	cudaMemcpy(dev_a,a,size, cudaMemcpyHostToDevice);

	dim3 blockDim(2,2,2);
{	__set_CUDAConfig(1, blockDim); 
          
	foo(dev_a);}
          
	 

	cudaMemcpy(a,dev_a,size,cudaMemcpyDeviceToHost);
	
	free(a);

	cudaFree(dev_a);

	return 0;
}
