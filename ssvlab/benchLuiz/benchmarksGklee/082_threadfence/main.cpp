 
 

#include <cuda.h>

__global__ void foo() {
    __threadfence();
}

int main(){
{	__set_CUDAConfig(1, 2); 
          
	foo();}
          
	 

	cudaThreadSynchronize();

	return 0;
}
