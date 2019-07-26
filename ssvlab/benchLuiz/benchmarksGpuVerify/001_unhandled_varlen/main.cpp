 
 

 
 

#define N 2 

#include <stdio.h>
#include <cuda.h>


__device__ int bar(void){
	int value;
	return value;
}

__global__ void kernel(uint4 *out) {
  uint4 vector;
  int len = bar();
   memset(&vector, 5, len);  
  out[threadIdx.x] = vector;
}
