 
 

 

#define N 2 

#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime_api.h>

__global__ void kernel(uint4 *out) {
  uint4 vector;
  memset(0, 0, 16);
  out[threadIdx.x] = vector;
   
}

int main(){
	uint4 *a;
	uint4 *dev_a;
	int size = N*sizeof(uint4);

	a = (uint4*)malloc(size);

	 
	for (int i = 0; i < N; i++) {
		a[i].x = i; a[i].y = i; a[i].z = i, a[i].w = i;
	}

	cudaMalloc((void**)&dev_a, size);

	cudaMemcpy(dev_a,a,size, cudaMemcpyHostToDevice);
{	__set_CUDAConfig(1, N); 
          
	kernel(dev_a);}
          
		 

	cudaMemcpy(a,dev_a,size,cudaMemcpyDeviceToHost);

 
	cudaFree(dev_a);
	free(a);
	return 0;
}
