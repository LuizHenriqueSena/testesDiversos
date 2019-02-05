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
  float img[25] = {255,0,0,0,255,255,0,0,0,255,255,0,0,0,255,255,0,0,0,255,255,255,255,255,255};
  float adversarial[25] = {255,255,255,255,255,255,0,0,0,255,255,255,255,255,255,255,0,0,0,255,255,0,0,0,255};
  //float adversarial[25] = {255,0,0,0,255,255,0,0,0,255,255,0,0,0,255,255,0,0,0,255,255,255,255,255,255};
  normalizef(img,25);
  normalizef(adversarial,25);
  isCloseEnough(img, adversarial, 1, 25);
}
