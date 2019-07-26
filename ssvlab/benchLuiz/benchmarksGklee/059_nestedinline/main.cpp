 
 
#include <cuda.h>

inline __device__ void f() __attribute__((always_inline));
inline __device__ void f() {
}

inline __device__ void g() __attribute__((always_inline));
inline __device__ void g() {
  f();
}

__global__ void k() {
  g();
}


int main(){
{	__set_CUDAConfig(2, 2); 
          
	k();}
          
	 

	cudaThreadSynchronize();
}
