 
 

#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime_api.h>
#include <math_functions.h>

typedef double(*funcType)(double);

__device__ double bar(double x) {
  return sin(x);
}

__global__ void foo(double x, int i)
{
  funcType f;

  if (i == 0)
    f = bar;
  else
    f = cos;

  double z = f(x);
	assert(z != NULL);

  printf("z: %f ", z);
}

int main(){

	int select_function = 1;  
	double angle = 1.57;
{	__set_CUDAConfig(1, 2); 
          
	foo (angle, select_function);}
          
	 

	cudaThreadSynchronize();

	return 0;
}
