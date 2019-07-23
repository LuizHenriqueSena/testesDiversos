 
 

#include <cuda.h>
#include <stdio.h>
#define N 2

__device__ void bar(int* q) {

}

__global__ void foo(int* p) {

  __shared__ int A[10];

  bar(p);

  bar(A);

}

int main(){

	int* a;
{	__set_CUDAConfig(N, N); 
          
	foo(a);}
          
	 

	cudaThreadSynchronize();
}
