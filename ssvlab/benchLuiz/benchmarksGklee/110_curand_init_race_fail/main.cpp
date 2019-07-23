 
 
 
 

#include <cuda.h>
#include <curand.h>
#include <curand_kernel.h>
#include <stdio.h>

#define N 8  

__global__ void init_test(curandState *state, unsigned int *A) {
   curand_init(0, 0, 0, state);

   __syncthreads();

   A[threadIdx.x] =  curand(&state[threadIdx.x]);
 
   
    
}

int main(){
	unsigned int *a;
	unsigned int *dev_a;
	curandState *dev_state; 

	int size = N*sizeof(unsigned int);

	a = (unsigned int*)malloc(size);
	cudaMalloc ((void**) &dev_a, size);

	printf("old a:  ");
	for (int i = 0; i < N; i++)
		printf("%u	", a[i]);

	cudaMalloc ( (void**) &dev_state, N*sizeof( curandState ) );
{	__set_CUDAConfig(1, N); 
          
	init_test(dev_state, dev_a);}
          

	cudaMemcpy(a,dev_a,size,cudaMemcpyDeviceToHost);

	printf("\nnew a:  ");
	for (int i = 0; i < N; i++) {
		printf("%u	", a[i]);
		 
		 
	}

	free(a);
	cudaFree(&dev_a);
	cudaFree(&dev_state);

	return 0;
}

