 
 

#include <cuda.h>
#include <cuda_runtime_api.h>
#include <stdio.h>

#define N 512

__global__ void helloCUDA(int x)
{
 
    __shared__ float S[256*32];
    __shared__ float F[256];

    unsigned int idx;

     
    for(int i = 0;
    
            i < x;
            i += (blockDim.x/32))  
		
    {
        if((i+(threadIdx.x/32)) < x){
            idx = (i+(threadIdx.x/32))*32+(threadIdx.x%32);
            S[idx] = F[i+(threadIdx.x/32)];
        }
    }

}
int main (){
{	__set_CUDAConfig(1, N); 
          
	helloCUDA (143);}
          
	 
	
	cudaThreadSynchronize();

	return 0;
}
