#include <stdio.h>
#include <stdlib.h>
#include <cuda.h>
#include <cuda_runtime_api.h>
#include <assert.h>
//#include <time.h>
#define N 4

__global__ void *MoreSums(int *a, int *b, int *c){
	c[blockIdx.x] = a[blockIdx.x] + b[blockIdx.x];
}

int main(void){

	int *dev_a, *dev_b, *dev_c;
	int size = N*sizeof(int);

	cudaMalloc((void**)&dev_a, size);
	cudaMalloc((void**) &dev_b, size);
	cudaMalloc((void**)&dev_c,size);

		int a[N] = {1, 2, 3, 4};//, 1, 2, 3, 4};
		int b[N] = {1, 2, 3, 4};//, 1, 2, 3, 4};
		int c[N] = {1, 2, 3, 4};//, 1, 2, 3, 4};

	cudaMemcpy(dev_a,&a,size, cudaMemcpyHostToDevice);
	cudaMemcpy(dev_b,&b,size, cudaMemcpyHostToDevice);
/*
	printf("a: ");
	for (int i = 0; i < N; i++)
		printf("%d  ", a[i]);

	printf("\nb: ");
	for (int i = 0; i < N; i++)
		printf("%d  ", b[i]); */

	//MoreSums<<<N,1>>>(dev_a,dev_b,dev_c);	//MODIFICAR: usar N threads em vez de blocos
	//verify_kernel_with_three_args(MoreSums,N,1,dev_a,dev_b,dev_c);
	verify_kernel(MoreSums,N,1,dev_a,dev_b,dev_c);

	cudaMemcpy(&c,dev_c,size,cudaMemcpyDeviceToHost);

	printf("\nResultado da soma de a e b eh:\n   ");

	for (int i = 0; i < N; i++){
		printf("%d  ", c[i]);
		assert(c[i]==a[i]+b[i]);
	}

	cudaFree(dev_a);
	cudaFree(dev_b);
	cudaFree(dev_c);

	return 0;

}

