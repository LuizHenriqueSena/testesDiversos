#include "verifynn.h"
#include <stdlib.h>

//esbmc-gpu verifynn.c -I . --force-malloc-success --state-hashing --unwind 30

float wfc1[125]={ 0.207958,  0.044154,  -4.232451,  0.745003,  -1.340141,  -1.486082,  -1.869501,  -1.486536,  -0.624669,  1.210342,  -4.070879,  -0.600616,  -5.623879,  -3.807880,  1.362974,  1.334723,  -2.295741,  3.483194,  -4.446033,  0.078016,  4.587534,  -0.206197,  0.977980,  1.286488,  0.772414,
-1.486082,  -1.869501,  -1.486536,  -0.624669,  1.210342,  -4.070879,  -0.600616,  -5.623879,  -3.807880,  1.362974,  1.334723,  -2.295741,  3.483194,  -4.446033,  0.078016,  4.587534,  -0.206197,  0.977980,  1.286488,  0.772414,  -0.095517,  -0.237044,  1.996482,  2.389851,  -0.082591,
-4.070879,  -0.600616,  -5.623879,  -3.807880,  1.362974,  1.334723,  -2.295741,  3.483194,  -4.446033,  0.078016,  4.587534,  -0.206197,  0.977980,  1.286488,  0.772414,  -0.095517,  -0.237044,  1.996482,  2.389851,  -0.082591,  2.035967,  -1.636084,  -2.794725,  -1.262111,  6.436423,
1.334723,  -2.295741,  3.483194,  -4.446033,  0.078016,  4.587534,  -0.206197,  0.977980,  1.286488,  0.772414,  -0.095517,  -0.237044,  1.996482,  2.389851,  -0.082591,  2.035967,  -1.636084,  -2.794725,  -1.262111,  6.436423,  -0.922335,  -2.358342,  -0.142077,  -4.891456,  -2.749024,
4.587534,  -0.206197,  0.977980,  1.286488,  0.772414,  -0.095517,  -0.237044,  1.996482,  2.389851,  -0.082591,  2.035967,  -1.636084,  -2.794725,  -1.262111,  6.436423,  -0.922335,  -2.358342,  -0.142077,  -4.891456,  -2.749024,  0.042693,  0.455576,  0.108683,  0.724179,  0.679236 };

float bfc1[5]={ -0.095517, 2.035967, -0.922335, 0.042693, 2.473645 };

float wfc2[20]={ -8.332183,  -3.040542,  3.758681,  -4.049425,  3.050940,
-0.894016,  -1.446080,  6.029086,  5.837497,  -1.206468,
-2.927471,  -4.145836,  1.903108,  3.409983,  0.191798,
-4.116436,  -7.171240,  2.687001,  -1.662798,  3.236128 };

float bfc2[4]={ -0.894016, -2.927471, -4.116436, 4.911131 };

float wfc3[20]={ 5.578862,  5.071550,  6.798682,  -0.259254,
10.556403,  -9.337465,  -0.761154,  2.529015,
-11.307169,  -8.039979,  -2.417081,  9.576913,
-2.461208,  -6.955447,  -1.412636,  -12.198679,
-2.784967,  8.339398,  -1.883454,  -9.724778 };

float bfc3[5]={ -12.202182, -8.269168, -6.212107, 3.503773, -3.755674 };


float imgA[25] = {255,255,255,255,255,255,0,0,0,255,255,255,255,255,255,255,0,0,0,255,255,0,0,0,255};
float imgE[25] = {255,255,255,255,255,255,0,0,0,0,255,255,255,255,255,255,0,0,0,0,255,255,255,255,255};
float imgI[25] = {255,255,255,255,255,0,0,255,0,0,0,0,255,0,0,0,0,255,0,0,255,255,255,255,255};
float imgO[25] = {255,255,255,255,255,255,0,0,0,255,255,0,0,0,255,255,0,0,0,255,255,255,255,255,255};
float imgU[25] = {255,0,0,0,255,255,0,0,0,255,255,0,0,0,255,255,0,0,0,255,255,255,255,255,255};

int main() {
	unsigned int x1 = nondet_uint();
	__ESBMC_assume((x1 <= 255)&&(x1 >=0));
	unsigned int x2 = nondet_uint();
	__ESBMC_assume((x2 <= 255)&&(x2 >=0));
	unsigned int x3 = nondet_uint();
	__ESBMC_assume((x3 <= 255)&&(x3 >=0));
	unsigned int x4 = nondet_uint();
	__ESBMC_assume((x4 <= 255)&&(x4 >=0));
	unsigned int x5 = nondet_uint();
	__ESBMC_assume((x5 <= 255)&&(x5 >=0));
	unsigned int x6 = nondet_uint();
	__ESBMC_assume((x6 <= 255)&&(x6 >=0));
	unsigned int x7 = nondet_uint();
	__ESBMC_assume((x7 <= 255)&&(x7 >=0));
	unsigned int x8 = nondet_uint();
	__ESBMC_assume((x8 <= 255)&&(x8 >=0));
	unsigned int x9 = nondet_uint();
	__ESBMC_assume((x9 <= 255)&&(x9 >=0));
	unsigned int x10 = nondet_uint();
	__ESBMC_assume((x10 <= 255)&&(x10 >=0));
	unsigned int x11 = nondet_uint();
	__ESBMC_assume((x11 <= 255)&&(x11 >=0));
	unsigned int x12 = nondet_uint();
	__ESBMC_assume((x12 <= 255)&&(x12 >=0));
	unsigned int x13 = nondet_uint();
	__ESBMC_assume((x13 <= 255)&&(x13 >=0));
	unsigned int x14 = nondet_uint();
	__ESBMC_assume((x14 <= 255)&&(x14 >=0));
	unsigned int x15 = nondet_uint();
	__ESBMC_assume((x15 <= 255)&&(x15 >=0));
	unsigned int x16 = nondet_uint();
	__ESBMC_assume((x16 <= 255)&&(x16 >=0));
	unsigned int x17 = nondet_uint();
	__ESBMC_assume((x17 <= 255)&&(x17 >=0));
	unsigned int x18 = nondet_uint();
	__ESBMC_assume((x18 <= 255)&&(x18 >=0));
	unsigned int x19 = nondet_uint();
	__ESBMC_assume((x19 <= 255)&&(x19 >=0));
	unsigned int x20 = nondet_uint();
	__ESBMC_assume((x20 <= 255)&&(x20 >=0));
	unsigned int x21 = nondet_uint();
	__ESBMC_assume((x21 <= 255)&&(x21 >=0));
	unsigned int x22 = nondet_uint();
	__ESBMC_assume((x22 <= 255)&&(x22 >=0));
	unsigned int x23 = nondet_uint();
	__ESBMC_assume((x23 <= 255)&&(x23 >=0));
	unsigned int x24 = nondet_uint();
	__ESBMC_assume((x24 <= 255)&&(x24 >=0));
	unsigned int x25 = nondet_uint();
	__ESBMC_assume((x25 <= 255)&&(x25 >=0));

	float img2[25];
	img2[0] = (float) x1;
	img2[1] = (float) x2;
	img2[2] = (float) x3;
	img2[3] = (float) x4;
	img2[4] = (float) x5;
	img2[5] = (float) x6;
	img2[6] = (float) x7;
	img2[7] = (float) x8;
	img2[8] = (float) x9;
	img2[9] = (float) x10;
	img2[10] = (float) x11;
	img2[11] = (float) x12;
	img2[12] = (float) x13;
	img2[13] = (float) x14;
	img2[14] = (float) x15;
	img2[15] = (float) x16;
	img2[16] = (float) x17;
	img2[17] = (float) x18;
	img2[18] = (float) x19;
	img2[19] = (float) x20;
	img2[20] = (float) x21;
	img2[21] = (float) x22;
	img2[22] = (float) x23;
	img2[23] = (float) x24;
	img2[24] = (float) x25;

	normalizef(imgA,25);
	normalizef(imgE,25);
	normalizef(imgI,25);
	normalizef(imgO,25);
	normalizef(imgU,25);
	normalizef(img2,25);
//	unsigned int i = isCloseEnough(img,img2,10,25);
	__ESBMC_assume(isCloseEnough(imgE,img2,1.5,25) == 1);
//	__ESBMC_assert(isCloseEnough(img, 1), "Image is near");
	checkNNLUT(wfc1, bfc1, wfc2, bfc2, wfc3, bfc3, img2, 1, 3);
}
