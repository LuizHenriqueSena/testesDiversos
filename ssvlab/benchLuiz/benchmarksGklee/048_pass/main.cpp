 
 
#include <stdio.h>
#include <stdlib.h>
#include "cuda.h"

#define N 2 


__global__ void foo() {

  float x = (float)2;

}

int main(){
{	__set_CUDAConfig(1, N); 
          
	foo();}
          
	 

	cudaThreadSynchronize();	

	return 0;

}
