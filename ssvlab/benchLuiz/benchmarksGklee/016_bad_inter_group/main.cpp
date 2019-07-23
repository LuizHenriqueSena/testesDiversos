 
 
 
 
#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime_api.h>
#define N dim*dim
#define dim 2 

__global__ void foo(int* A) {

   A[ blockIdx.x*blockDim.x + threadIdx.x ] += (A[ (blockIdx.x + 1)*blockDim.x + threadIdx.x ]);

}

int main(){
 
    int *a;
    int *dev_a;
    int size = N*sizeof(int);

    cudaMalloc((void**)&dev_a, size);

    a = (int*)malloc(N*size);

    for (int i = 0; i < N; i++)
        a[i] = i;

    cudaMemcpy(dev_a,a,size, cudaMemcpyHostToDevice);
{ __set_CUDAConfig(dim, dim); 
          
 foo(dev_a);}
          
	 

    cudaMemcpy(a,dev_a,size,cudaMemcpyDeviceToHost);

    free(a);
    cudaFree(dev_a);

    return 0;
}
