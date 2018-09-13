#include <stdio.h>
#include <math.h>

int main() {
	float i = 0;
	i = powf(2.25,5.30);
	printf("RESULT POWF : %.6f \n", i);
	__ESBMC_assert(i > 10.1, "ERRO NO CALCULO POWF");
}
