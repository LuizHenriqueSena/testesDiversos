 
 
#include <cuda.h>
#include <cuda_runtime_api.h>
#include <stdio.h>
#include <assert.h>

#define N 2 

__device__ void f(float *odata, int* ai) {
    int thid = threadIdx.x;
    *ai = thid;
    odata[*ai] = 2*threadIdx.x;
}

__global__ void k(float *g_odata) {
    int ai;
    f(g_odata,&ai);
}


int main(){
	float *d;
	float *dev_d;

	d = (float*)malloc(N*sizeof(float));
	cudaMalloc ((void**) &dev_d, N*sizeof(float));

	cudaMemcpy(dev_d, d, N*sizeof(float),cudaMemcpyHostToDevice);
{	__set_CUDAConfig(1, N); 
          
	k (dev_d);}
          
	 

	cudaMemcpy(d,dev_d,N*sizeof(float),cudaMemcpyDeviceToHost);

	printf("D: ");
	for (int i = 0; i < N; ++i) {
		printf(" %f		", d[i]);
		assert(!(d[i] == 2*i));
	}
	cudaFree(dev_d);

	return 0;
}
