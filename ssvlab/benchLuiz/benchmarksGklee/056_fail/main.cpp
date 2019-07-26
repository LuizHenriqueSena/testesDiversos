 
 

#include <cuda.h>
#include <stdio.h>
#include <assert.h>
#define N 2 

__global__ void foo(float *A, int sz) {
	assert(sz == blockDim.x);
	for(int i = threadIdx.x; i < 1*sz; i += sz) {
		A[i] *= 2.0f;
  }
}

int main() {

    float *a;
    float *b;
    float *dev_a;
    int size = N*sizeof(float);

    cudaMalloc((void**)&dev_a, size);

    a = (float*)malloc(N*size);
    b = (float*)malloc(N*size);

    for (int i = 0; i < N; i++)
        a[i] = i;

    cudaMemcpy(dev_a,a,size, cudaMemcpyHostToDevice);
{	__set_CUDAConfig(1, N); 
          
	foo(dev_a, N);}
          
		 

    cudaMemcpy(b,dev_a,size,cudaMemcpyDeviceToHost);

    for (int i = 0; i < N; i++){
        assert(b[i]!=2*a[i]);
    }

    free(a); free(b);
    cudaFree(dev_a);

    return 0;
}
