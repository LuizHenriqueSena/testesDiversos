#include <stdio.h>
#include <math.h>

float sigmoidFunction(float u) {
	float retorno;
	retorno = (1/(1 + powf(2.718281,(u*(-1)))));
	return retorno;
}

void printLookUpTableForCVectorSigmoid(int number, int decimalNumber) {
	int size = 0;
	if(decimalNumber==0) {
		size = number;
	} else {
		size= number*((int)pow(10, decimalNumber));
	}
	int i = 1;
	printf("float lookup[%d] = {", size);
	printf("%.6f ,", sigmoidFunction(0));
	for(i=1;i<size;i++) {
			printf("%.6f ,", sigmoidFunction(i/100));
			if(i%10==0)
				printf("\n");
			}
}


int main(){
	printLookUpTableForCVectorSigmoid(10, 10);

}
