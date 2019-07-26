 
 

 
 
 

#include <stdio.h>
#include <assert.h>
#include <cuda.h>
#include <cuda_runtime_api.h>

#define N 2 
#define THREAD_CHANGE 1


__constant__ float A[8] = {0,1,2,3,4,5,6,7};

__global__ void globalarray(float* p) {
  int i = threadIdx.x;
  A[THREAD_CHANGE] = 0;		 
  int a = A[i];

  if(a != threadIdx.x) {
    p[0] = threadIdx.x;	   
  }
}

int main(){

	float *a;
	float *c;
	float *dev_a;
	int size = N*sizeof(float);

	cudaMalloc((void**)&dev_a, size);	

	a = (float*)malloc(size);
	c = (float*)malloc(size);

	for (int i = 0; i < N; i++)
		a[i] = 5;

	cudaMemcpy(dev_a,a,size, cudaMemcpyHostToDevice);
{	__set_CUDAConfig(1, N); 
          
	globalarray(dev_a);}
          	
	 

	cudaMemcpy(c,dev_a,size,cudaMemcpyDeviceToHost);
	
	 

	free(a);
	free(c);
	cudaFree(dev_a);

	return 0;
}
