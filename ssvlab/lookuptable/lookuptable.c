#include <stdio.h>

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
	int i = 0;
	printf("float lookup[%d] = {", size);
	for(i=0;i<size;i++) {
		



int main(){
	
