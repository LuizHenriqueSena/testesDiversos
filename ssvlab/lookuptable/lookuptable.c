#include <stdio.h>
#include <math.h>

float sigmoidFunction(float u) {
	float retorno;
	retorno = (1/(1 + powf(2.718281,(u*(-1)))));
	return retorno;
}

void printLookUpTableForCVectorSigmoid(int number, int decimalNumber, int simetric) {
	int sizetable = 0;
	int shift = 0;
	if(simetric)
		shift = number/2;
	if(decimalNumber==0) {
		sizetable = number;
	} else {
		sizetable= number*((int)pow(10, decimalNumber));
	}
	int i = 1;
	printf("float lookup[%d] = {", sizetable);
	printf("%.6f ,", sigmoidFunction(-shift));
	for(i=1;i<sizetable;i++) {
			printf("%.6f ,", sigmoidFunction(((i/100)-shift)));
			if(i==sizetable-1) {
				printf("};\n");
			}
			else if(i%10==9){
				printf("\n");
			}
	}
}


int main(){
	printLookUpTableForCVectorSigmoid(40, 2, 1);

}
