 
 

#include <stdio.h>
#include <cuda.h>

#define N 2 

__device__ float multiplyByTwo(float *v, unsigned int tid)
{
    return v[tid] * 2.0f;
}

__device__ float divideByTwo(float *v, unsigned int tid)
{
    return v[tid] * 0.5f;
}

typedef float(*funcType)(float*, unsigned int);

__global__ void foor(float *v, unsigned int size, unsigned int i)
{
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;
    funcType f;

	 
    if (i == 1)
      f = multiplyByTwo;
    else if (i == 2)
      f = divideByTwo;
    else
      f = NULL;

    if (tid < size)
    {
        float x = (*f)(v, tid);
        x += multiplyByTwo(v, tid);
        v[tid] = x;
    }
}

unsigned int nondet_uint(){
    unsigned int a;
    return a;
}

int main(){

	unsigned int c;  
	float* v;
	float* dev_v;

		printf("Digite 1 para multiplicar um vetor por 4 ou\nDigite 2 para multiplicar um vetor por 2.5: \n");
        c = nondet_uint();  

	 
	v = (float*)malloc(N*sizeof(float));  

	for (int i = 0; i < N; ++i)
		v[i] = i;

	cudaMalloc((void**)&dev_v, N*sizeof(float));  

	cudaMemcpy(dev_v, v, N*sizeof(float), cudaMemcpyHostToDevice);
{	__set_CUDAConfig(1, N); 
          
	foor(dev_v, N, c);}
          
		 
		
	cudaMemcpy(v, dev_v, N*sizeof(float), cudaMemcpyDeviceToHost);

	for (int i = 0; i < N; ++i) {
		if (c == 1)
			assert(v[i] == 4*i);
		else
			assert(v[i] == 2.5*i);
	}

	free(v);
	cudaFree(dev_v);

	return 0;
}
