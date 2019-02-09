#include <stdio.h>

float sqrtt(float num)
{
    if (num==0.0)
      return 0;
    float guess, e, upperbound;
    guess = 1;
    e = 0.001;
    do
    {
        upperbound = num / guess;
        guess = (upperbound + guess) / 2;
    } while (!(guess * guess >= num - e &&
               guess * guess <= num + e));
    return guess;
}

int isCloseEnough(float* img, float* adversarial, float b, int size) {
		int i = 0;
		float normDistance = 0;
		for(i=0;i<size;i++) {
			normDistance += (img[i]-adversarial[i])*(img[i]-adversarial[i]);
		}
      printf("result %.6f \n", normDistance);
			normDistance = sqrtt(normDistance);
      printf("result %.6f \n", normDistance);
			if(normDistance <= b)
				return 1;
			else
				return 0;
}

void normalizef(float* image, int size) {
	int i = 0;
	for(i=0;i<size;i++) {
			image[i] = image[i]/255;
	}
}

int main() {
  float imgA[25] = {255,255,255,255,255,255,0,0,0,255,255,255,255,255,255,255,0,0,0,255,255,0,0,0,255};
  float imgE[25] = {255,255,255,255,255,255,0,0,0,0,255,255,255,255,255,255,0,0,0,0,255,255,255,255,255};
  float imgI[25] = {255,255,255,255,255,0,0,255,0,0,0,0,255,0,0,0,0,255,0,0,255,255,255,255,255};
  float imgO[25] = {255,255,255,255,255,255,0,0,0,255,255,0,0,0,255,255,0,0,0,255,255,255,255,255,255};
  float imgU[25] = {255,0,0,0,255,255,0,0,0,255,255,0,0,0,255,255,0,0,0,255,255,255,255,255,255};
  float img[25] = {255,0,0,0,255,255,0,0,0,255,255,0,0,0,255,255,0,0,0,255,255,255,255,255,255};
  float adversarial[25] = {255,255,255,255,255,255,0,0,0,255,255,255,255,255,255,255,0,0,0,255,255,0,0,0,255};
  //float adversarial[25] = {255,0,0,0,255,255,0,0,0,255,255,0,0,0,255,255,0,0,0,255,255,255,255,255,255};
  normalizef(imgA,25);
  normalizef(imgE,25);
  normalizef(imgI,25);
  normalizef(imgO,25);
  normalizef(imgU,25);
  isCloseEnough(imgU, imgO, 1, 25);
}
