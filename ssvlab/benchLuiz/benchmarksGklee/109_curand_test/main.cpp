#include <iostream>
#include <cuda.h>
#include <curand.h>
#include <curand_kernel.h>

#define N 4

int n = 20;  
using namespace std;

__device__ float generate( curandState* globalState, int ind )  
{
     
    curandState localState = globalState[ind];
    float RANDOM = curand_uniform( &localState );  
    											 
    globalState[ind] = localState;  
    return RANDOM;
}

__global__ void setup_seed ( curandState * state, unsigned long seed )
{
    int id = threadIdx.x;
    curand_init ( seed, id, 0, &state[id] );

     
     
}

__global__ void kernel(float* N3, curandState* globalState, int n)  
{
     
    for(int i=0;i<N;i++)
    {					 
        int k = generate(globalState, i) * (10*N/4);  
        while(k > n*n-1)  
 
        {
            k-=(n*n-1);  
        }
        N3[i] = k;  
    }
}

int main()
{
    curandState* devStates;
    cudaMalloc ( (void**) &devStates, N*sizeof( curandState ) );  

     
	
     
	

    float N2[N];  
    float* N3;  

    cudaMalloc((void**) &N3, sizeof(float)*N);
{ __set_CUDAConfig(1, 1); 
          
 kernel(N3, devStates, n);}
            
	 

    cudaMemcpy(N2, N3, sizeof(float)*N, cudaMemcpyDeviceToHost);

    for(int i=0;i<N;i++)
    {
        cout<<N2[i]<<endl;
    }

    return 0;
}
