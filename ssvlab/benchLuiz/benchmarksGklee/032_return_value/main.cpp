 
 

#include <stdio.h>
#include <cuda.h>
#include <assert.h>
#define N 2 

typedef float(*funcType)(float*, unsigned int);

__device__ float multiplyByTwo(float *v, unsigned int tid)
{
    return v[tid] * 2.0f;
}

__device__ float divideByTwo(float *v, unsigned int tid)
{
    return v[tid] * 0.5f;
}

__device__ funcType grabFunction(int i) {
   
   
  if (i == 0)
    return multiplyByTwo;
  else
    return divideByTwo;
}

__global__ void foo(float *v, unsigned int size, int i)
{
     
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;
    funcType f = grabFunction(i);

    if (tid < size)
    {
    	float x = (*f)(v, tid);
		x += multiplyByTwo(v, tid);
		v[threadIdx.x] = x;
    }
}

int nondet_int(){
    int a;
    return a;
}

int main(){

	int c = 0;  
	float* v;
	float* a;
	float* dev_v;
	funcType fun;

	 

	printf("Digite 0 para multiplicar um vetor por 4 ou\nDigite outro valor para multiplicar um vetor por 2.5: \n");
    c = nondet_int();  

	v = (float*)malloc(N*sizeof(float));
	a = (float*)malloc(N*sizeof(float));

	for (int i = 0; i < N; ++i){
		v[i] = rand() %10+1;
		printf(" %.1f; ", v[i]);
	}

	printf("\n");

	cudaMalloc((void**)&dev_v, N*sizeof(float));

	cudaMemcpy(dev_v, v, N*sizeof(float), cudaMemcpyHostToDevice);
{	__set_CUDAConfig(1, N); 
          
	foo(dev_v, N, c);}
          
		 

	cudaMemcpy(a, dev_v, N*sizeof(float), cudaMemcpyDeviceToHost);


	for (int i = 0; i < N; ++i){
		printf(" %.1f; ", a[i]);
		if (c==0)
			assert(a[i]==4*v[i]);
		else
			assert(a[i]==2.5*v[i]);
	}

	free(v); free(a);
	cudaFree(dev_v);

   return 0;
}
