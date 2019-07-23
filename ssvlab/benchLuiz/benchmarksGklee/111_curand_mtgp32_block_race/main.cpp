 
 

#include <curand_kernel.h>
 
#include <stdio.h>

#define N 32  

__global__ void curand_test(curandStateMtgp32_t *state, float *A) {
  if (threadIdx.x == 0) {
    A[blockIdx.x] = curand(state);
  }
}

int main() {
	typedef curandStateMtgp32_t tipo;
	float *a;
	float *dev_a;
	tipo *dev_state;
	mtgp32_kernel_params *devKernelParams;

	int size = N*sizeof(float);

	a = (float*)malloc(size);
	cudaMalloc ((void**) &dev_a, size);

	printf("old a:  ");
	for (int i = 0; i < N; i++)
	printf("%f	", a[i]);

	cudaMalloc ( (void**) &dev_state, N*sizeof( tipo ) );

	cudaMalloc((void**)&devKernelParams,sizeof(mtgp32_kernel_params));

	curandMakeMTGP32Constants(mtgp32dc_params_fast_11213, devKernelParams);  
		 
		 

	curandMakeMTGP32KernelState(dev_state, mtgp32dc_params_fast_11213, devKernelParams,N, 3412);
{	__set_CUDAConfig(1, N); 
          
	curand_test(dev_state, dev_a);}
          
	 

	cudaMemcpy(a,dev_a,size,cudaMemcpyDeviceToHost);

	printf("\nnew a:  ");
	for (int i = 0; i < N; i++)
		printf("%f	", a[i]);

	free(a);
	cudaFree(&dev_a);
	cudaFree(&dev_state);
	cudaFree(&devKernelParams);

	return 0;
}
