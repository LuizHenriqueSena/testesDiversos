 
 

#include <stdio.h>
#include <assert.h>
#include <cuda.h>

#define N 2

__device__ void bar(int i);

__global__ void foo(int w, int h)
{
    
   for (int i = threadIdx.x;  
	   i < w; i += blockDim.x)   {

		   if (h == 0)
			   bar(5);	
		   else
			   assert(0);
   }
}

int main(){
{	__set_CUDAConfig(1, N); 
          
	foo(5, 0);}
          
	 

	cudaThreadSynchronize();

	return 0;

}
