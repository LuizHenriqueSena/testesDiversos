#include <stdio.h>
#include <math.h>

float sigmoidFunction(float u) {
	float retorno;
	retorno = (1/(1 + powf(2.718281,(u*(-1)))));
	return retorno;
}

void printLookUpTableForCVectorSigmoid(int number, int decimalPlaces) {
	int sizetable = 0;
	int shift = 0;
	int decimalNumber = (int)pow(10, decimalPlaces);
	shift = number/2;
	if(decimalPlaces==0) {
		sizetable = number+1;
	} else {
		sizetable= number*decimalNumber + 1;
	}
	int i = 1;
	printf("float lookup[%d] = {", sizetable);
	printf("%.6f ,", sigmoidFunction(-shift));
	for(i=1;i<sizetable;i++) {
			printf("%.6f ,", sigmoidFunction((((float)i/(float)decimalNumber)-(float)shift)));
			if(i==sizetable-1) {
				printf("};\n");
			}
			else if(i%10==9){
				printf("\n");
			}
	}
}

void printLookUpTableForCVectorExp(int number, int decimalPlaces, int fromZero) {
	int sizetable = 0;
	int shift = 0;
	int decimalNumber = (int)pow(10, decimalPlaces);
	if(fromZero==0) {
		shift = number/2;
	} else {
		shift = 0;
	}
	if(decimalPlaces==0) {
		sizetable = number+1;
	} else {
		sizetable= number*decimalNumber + 1;
	}
	int i = 1;
	printf("float lookup[%d] = {", sizetable);
	printf("%.6f ,", exp(-shift));
	for(i=1;i<sizetable;i++) {
			printf("%.6f ,", exp((((float)i/(float)decimalNumber)-(float)shift)));
			if(i==sizetable-1) {
				printf("};\n");
			}
			else if(i%10==9){
				printf("\n");
			}
	}
}


int main(){
	//printLookUpTableForCVectorSigmoid(40,3);
	printLookUpTableForCVectorExp(2, 3, 0);
}
