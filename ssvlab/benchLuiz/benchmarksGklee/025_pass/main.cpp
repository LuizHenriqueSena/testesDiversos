#include <stdio.h>
#include <stdlib.h>
#include <cuda.h>
#include <assert.h>
static const int WORK_SIZE =   2;

 


__device__ unsigned int bitreverse1(unsigned int number) {
	number = ((0xf0f0f0f0 & number) >> 4) | ((0x0f0f0f0f & number) << 4);
	number = ((0xcccccccc & number) >> 2) | ((0x33333333 & number) << 2);
	number = ((0xaaaaaaaa & number) >> 1) | ((0x55555555 & number) << 1);
	return number;
}

 
__global__ void bitreverse(void *data) {
	unsigned int *idata = (unsigned int*) data;
	idata[threadIdx.x] = bitreverse1(idata[threadIdx.x]);
}

 
int main() {
	void *d = NULL;
	int i;
	unsigned int idata[WORK_SIZE], odata[WORK_SIZE];

	for (i = 0; i < WORK_SIZE; i++){
		idata[i] = (unsigned int) i+1;
		printf("%u; ", idata[i]);
	}

	printf("\n");

	cudaMalloc((void**) &d, sizeof(int) * WORK_SIZE);
	cudaMemcpy(d, idata, sizeof(int) * WORK_SIZE, cudaMemcpyHostToDevice);
{

	__set_CUDAConfig(1, WORK_SIZE, WORK_SIZE * sizeof(int)); 
          


	bitreverse(d);}
         
	 

	cudaThreadSynchronize();	 
	cudaGetLastError();
	cudaMemcpy(odata, d, sizeof(int) * WORK_SIZE, cudaMemcpyDeviceToHost);

	for (i = 0; i < WORK_SIZE; i++){
		printf("Input value: %u, device output: %u\n", idata[i], odata[i]);
		assert((idata[i]!=1)or(odata[i]!=128));
	}
	cudaFree((void*) d);
	cudaDeviceReset();

	return 0;
}
