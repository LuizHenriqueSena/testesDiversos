 
 

#include <cuda.h>
#include <stdio.h>
#include <assert.h>
#include <cuda_runtime_api.h>

#define N 2  

__global__ void curand_test(curandState *state, float *A) {
   A[threadIdx.x] =  curand(&state[threadIdx.x]);  
}

int main() {
	float *a;
	float *dev_a;
	curandState *dev_state;  

	int size = N*sizeof(float);

	a = (float*)malloc(size);
	cudaMalloc ((void**) &dev_a, size);

	printf("old a:  ");
	for (int i = 0; i < N; i++)
		printf("%f	", a[i]);

	cudaMalloc ( (void**) &dev_state, N*sizeof( curandState ) );
{	__set_CUDAConfig(1, N); 
          
	curand_test(dev_state, dev_a);}
          
	 
	
	cudaMemcpy(a,dev_a,size,cudaMemcpyDeviceToHost);

	printf("\nnew a:  ");
	for (int i = 0; i < N; i++) {
		printf("%f	", a[i]);
		 
		 
	}
	
	free(a);
	cudaFree(dev_a);
	cudaFree(dev_state);

	return 0;
}
