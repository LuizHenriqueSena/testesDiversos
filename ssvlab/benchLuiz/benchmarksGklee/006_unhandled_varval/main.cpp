 
 

 

 

#define N 2 

#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime_api.h>

__device__ int bar(void){
	int value;
	return value;
}

__global__ void kernel(uint4 *out) {
  uint4 vector;
  int val = bar();
   memset(&vector, val, 16);
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

	printf("new a:\n");
	for (int i = 0; i < N; i++) {
 		assert(a[i].x == 0);			
		assert(a[i].y == 0);
		assert(a[i].z == 0);			
		assert(a[i].w == 0);
}

	cudaFree(dev_a);
	free(a);
	return 0;
}
