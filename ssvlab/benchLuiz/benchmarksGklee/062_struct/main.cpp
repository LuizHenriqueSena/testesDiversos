 
 

#include <cuda.h>
#include <stdio.h>
#include <assert.h>

#define DIM 2  
#define N 2 

typedef struct {
  float x,y,z,w;
} myfloat4;

__global__ void k(float * i0) {
  myfloat4 f4;
  f4.x = 2;
  i0[threadIdx.x + blockDim.x*blockIdx.x] = f4.x;
}

int main(){
	float *a;
	float *dev_a;
	int size = N*sizeof(float);

	cudaMalloc((void**)&dev_a, size);

	a = (float*)malloc(size);

	for (int i = 0; i < N; i++)
		a[i] = 5;

	cudaMemcpy(dev_a,a,size, cudaMemcpyHostToDevice);
{	__set_CUDAConfig(DIM, DIM); 
          
	k(dev_a);}
          
		 

	cudaMemcpy(a,dev_a,size,cudaMemcpyDeviceToHost);

	for (int i = 0; i < N; i++) {
		assert(a[i] == 2);
	}

	free(a);

	cudaFree(dev_a);

	return 0;
}
