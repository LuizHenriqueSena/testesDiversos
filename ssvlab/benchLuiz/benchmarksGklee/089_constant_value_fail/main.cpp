 
 
 

#include <stdio.h>
#include <assert.h>
#include <cuda.h>
#include <cuda_runtime_api.h>

#define N 2 

#define tid (blockIdx.x * blockDim.x + threadIdx.x)

__device__ float multiplyByTwo(float *v, unsigned int index)
{
    return v[index] * 2.0f;
}

__device__ float divideByTwo(float *v, unsigned int index)
{
    return v[index] * 0.5f;
}

typedef float(*funcType)(float*, unsigned int);

__global__ void foo(float *v)
{
    funcType f = (funcType)3;  
    v[tid] = (*f)(v, tid);
}

int main(){

	float* w;
	float* dev_w;

	int size = N*sizeof(float);

	w =(float*) malloc(size);

	for (int i = 0; i < N; ++i){
		w[i] = i;
	}


	cudaMalloc((void**)&dev_w, size);

	cudaMemcpy(dev_w,w, size,cudaMemcpyHostToDevice);
{	__set_CUDAConfig(1, N); 
          
	foo (dev_w);}
          
	 

	cudaMemcpy(w,dev_w,size,cudaMemcpyDeviceToHost);

	printf("\nw:");
	for (int i = 0; i < N; ++i){
		printf(" %f	",	w[i]);
 
	}

	 

	free(w);
	cudaFree(dev_w);

	return 0;
}
