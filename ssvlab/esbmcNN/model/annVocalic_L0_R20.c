#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>
#include "utils.h"
//#include "__fc_builtin.h"

int main(){
float norm = (float)1/(float)255;
int x0 = nondet_int();
__ESBMC_assume((x0 >= 215)&&(x0 <=255));
int x1 = nondet_int();
__ESBMC_assume((x1 >= 215)&&(x1 <=255));
int x2 = nondet_int();
__ESBMC_assume((x2 >= 215)&&(x2 <=255));
int x3 = nondet_int();
__ESBMC_assume((x3 >= 215)&&(x3 <=255));
int x4 = nondet_int();
__ESBMC_assume((x4 >= 215)&&(x4 <=255));
int x5 = nondet_int();
__ESBMC_assume((x5 >= 215)&&(x5 <=255));
int x6 = nondet_int();
__ESBMC_assume((x6 >= 0)&&(x6 <=40));
int x7 = nondet_int();
__ESBMC_assume((x7 >= 0)&&(x7 <=40));
int x8 = nondet_int();
__ESBMC_assume((x8 >= 0)&&(x8 <=40));
int x9 = nondet_int();
__ESBMC_assume((x9 >= 215)&&(x9 <=255));
int x10 = nondet_int();
__ESBMC_assume((x10 >= 215)&&(x10 <=255));
int x11 = nondet_int();
__ESBMC_assume((x11 >= 215)&&(x11 <=255));
int x12 = nondet_int();
__ESBMC_assume((x12 >= 215)&&(x12 <=255));
int x13 = nondet_int();
__ESBMC_assume((x13 >= 215)&&(x13 <=255));
int x14 = nondet_int();
__ESBMC_assume((x14 >= 215)&&(x14 <=255));
int x15 = nondet_int();
__ESBMC_assume((x15 >= 215)&&(x15 <=255));
int x16 = nondet_int();
__ESBMC_assume((x16 >= 0)&&(x16 <=40));
int x17 = nondet_int();
__ESBMC_assume((x17 >= 0)&&(x17 <=40));
int x18 = nondet_int();
__ESBMC_assume((x18 >= 0)&&(x18 <=40));
int x19 = nondet_int();
__ESBMC_assume((x19 >= 215)&&(x19 <=255));
int x20 = nondet_int();
__ESBMC_assume((x20 >= 215)&&(x20 <=255));
int x21 = nondet_int();
__ESBMC_assume((x21 >= 0)&&(x21 <=40));
int x22 = nondet_int();
__ESBMC_assume((x22 >= 0)&&(x22 <=40));
int x23 = nondet_int();
__ESBMC_assume((x23 >= 0)&&(x23 <=40));
int x24 = nondet_int();
__ESBMC_assume((x24 >= 215)&&(x24 <=255));
// unsigned int x0 = Frama_C_interval(215, 255);
// unsigned int x1 = Frama_C_interval(215, 255);
// unsigned int x2 = Frama_C_interval(215, 255);
// unsigned int x3 = Frama_C_interval(215, 255);
// unsigned int x4 = Frama_C_interval(215, 255);
// unsigned int x5 = Frama_C_interval(215, 255);
// unsigned int x6 = Frama_C_interval(0, 40);
// unsigned int x7 = Frama_C_interval(0, 40);
// unsigned int x8 = Frama_C_interval(0, 40);
// unsigned int x9 = Frama_C_interval(215, 255);
// unsigned int x10 = Frama_C_interval(215, 255);
// unsigned int x11 = Frama_C_interval(215, 255);
// unsigned int x12 = Frama_C_interval(215, 255);
// unsigned int x13 = Frama_C_interval(215, 255);
// unsigned int x14 = Frama_C_interval(215, 255);
// unsigned int x15 = Frama_C_interval(215, 255);
// unsigned int x16 = Frama_C_interval(0, 40);
// unsigned int x17 = Frama_C_interval(0, 40);
// unsigned int x18 = Frama_C_interval(0, 40);
// unsigned int x19 = Frama_C_interval(215, 255);
// unsigned int x20 = Frama_C_interval(215, 255);
// unsigned int x21 = Frama_C_interval(0, 40);
// unsigned int x22 = Frama_C_interval(0, 40);
// unsigned int x23 = Frama_C_interval(0, 40);
// unsigned int x24 = Frama_C_interval(215, 255);
float i[25];
i[0] = x0*norm;
i[1] = x1*norm;
i[2] = x2*norm;
i[3] = x3*norm;
i[4] = x4*norm;
i[5] = x5*norm;
i[6] = x6*norm;
i[7] = x7*norm;
i[8] = x8*norm;
i[9] = x9*norm;
i[10] = x10*norm;
i[11] = x11*norm;
i[12] = x12*norm;
i[13] = x13*norm;
i[14] = x14*norm;
i[15] = x15*norm;
i[16] = x16*norm;
i[17] = x17*norm;
i[18] = x18*norm;
i[19] = x19*norm;
i[20] = x20*norm;
i[21] = x21*norm;
i[22] = x22*norm;
i[23] = x23*norm;
i[24] = x24*norm;


float layer1[5];
layer1[0]= (0.207958f)*i[0] + (0.044154f)*i[1] + (-4.232451f)*i[2] + (0.745003f)*i[3] + (-1.340141f)*i[4] + (-1.486082f)*i[5] + (-1.869501f)*i[6] + (-1.486536f)*i[7] + (-0.624669f)*i[8] + (1.210342f)*i[9] + (-4.070879f)*i[10] + (-0.600616f)*i[11] + (-5.623879f)*i[12] + (-3.807880f)*i[13] + (1.362974f)*i[14] + (1.334723f)*i[15] + (-2.295741f)*i[16] + (3.483194f)*i[17] + (-4.446033f)*i[18] + (0.078016f)*i[19] + (4.587534f)*i[20] + (-0.206197f)*i[21] + (0.977980f)*i[22] + (1.286488f)*i[23] + (0.772414f)*i[24] + (-0.095517f);
layer1[0] = sigmoidLUT(layer1[0]);
__ESBMC_assume((layer1[0] >= 9.99999997475e-07) && (layer1[0] <=0.0012379999971));
layer1[1]= (-1.486082f)*i[0] + (-1.869501f)*i[1] + (-1.486536f)*i[2] + (-0.624669f)*i[3] + (1.210342f)*i[4] + (-4.070879f)*i[5] + (-0.600616f)*i[6] + (-5.623879f)*i[7] + (-3.807880f)*i[8] + (1.362974f)*i[9] + (1.334723f)*i[10] + (-2.295741f)*i[11] + (3.483194f)*i[12] + (-4.446033f)*i[13] + (0.078016f)*i[14] + (4.587534f)*i[15] + (-0.206197f)*i[16] + (0.977980f)*i[17] + (1.286488f)*i[18] + (0.772414f)*i[19] + (-0.095517f)*i[20] + (-0.237044f)*i[21] + (1.996482f)*i[22] + (2.389851f)*i[23] + (-0.082591f)*i[24] + (2.035967f);
layer1[1] = sigmoidLUT(layer1[1]);
__ESBMC_assume((layer1[1] >= 0.00523100001737) && (layer1[1] <=0.884115993977));
layer1[2]= (-4.070879f)*i[0] + (-0.600616f)*i[1] + (-5.623879f)*i[2] + (-3.807880f)*i[3] + (1.362974f)*i[4] + (1.334723f)*i[5] + (-2.295741f)*i[6] + (3.483194f)*i[7] + (-4.446033f)*i[8] + (0.078016f)*i[9] + (4.587534f)*i[10] + (-0.206197f)*i[11] + (0.977980f)*i[12] + (1.286488f)*i[13] + (0.772414f)*i[14] + (-0.095517f)*i[15] + (-0.237044f)*i[16] + (1.996482f)*i[17] + (2.389851f)*i[18] + (-0.082591f)*i[19] + (2.035967f)*i[20] + (-1.636084f)*i[21] + (-2.794725f)*i[22] + (-1.262111f)*i[23] + (6.436423f)*i[24] + (-0.922335f);
layer1[2] = sigmoidLUT(layer1[2]);
__ESBMC_assume((layer1[2] >= 0.184672996402) && (layer1[2] <=0.999059975147));
layer1[3]= (1.334723f)*i[0] + (-2.295741f)*i[1] + (3.483194f)*i[2] + (-4.446033f)*i[3] + (0.078016f)*i[4] + (4.587534f)*i[5] + (-0.206197f)*i[6] + (0.977980f)*i[7] + (1.286488f)*i[8] + (0.772414f)*i[9] + (-0.095517f)*i[10] + (-0.237044f)*i[11] + (1.996482f)*i[12] + (2.389851f)*i[13] + (-0.082591f)*i[14] + (2.035967f)*i[15] + (-1.636084f)*i[16] + (-2.794725f)*i[17] + (-1.262111f)*i[18] + (6.436423f)*i[19] + (-0.922335f)*i[20] + (-2.358342f)*i[21] + (-0.142077f)*i[22] + (-4.891456f)*i[23] + (-2.749024f)*i[24] + (0.042693f);
layer1[3] = sigmoidLUT(layer1[3]);
__ESBMC_assume((layer1[3] >= 0.998665988445) && (layer1[3] <=0.999998986721));
layer1[4]= (4.587534f)*i[0] + (-0.206197f)*i[1] + (0.977980f)*i[2] + (1.286488f)*i[3] + (0.772414f)*i[4] + (-0.095517f)*i[5] + (-0.237044f)*i[6] + (1.996482f)*i[7] + (2.389851f)*i[8] + (-0.082591f)*i[9] + (2.035967f)*i[10] + (-1.636084f)*i[11] + (-2.794725f)*i[12] + (-1.262111f)*i[13] + (6.436423f)*i[14] + (-0.922335f)*i[15] + (-2.358342f)*i[16] + (-0.142077f)*i[17] + (-4.891456f)*i[18] + (-2.749024f)*i[19] + (0.042693f)*i[20] + (0.455576f)*i[21] + (0.108683f)*i[22] + (0.724179f)*i[23] + (0.679236f)*i[24] + (2.473645f);
layer1[4] = sigmoidLUT(layer1[4]);
__ESBMC_assume((layer1[4] >= 0.99669200182) && (layer1[4] <=0.999993979931));
float layer2[4];
layer2[0]= (-8.332183f)*layer1[0] + (-3.040542f)*layer1[1] + (3.758681f)*layer1[2] + (-4.049425f)*layer1[3] + (3.050940f)*layer1[4] + (-0.894016f);
layer2[0] = sigmoidLUT(layer2[0]);
__ESBMC_assume((layer2[0] >= 0.0197240002453) && (layer2[0] <=0.864362001419));
layer2[1]= (-0.894016f)*layer1[0] + (-1.446080f)*layer1[1] + (6.029086f)*layer1[2] + (5.837497f)*layer1[3] + (-1.206468f)*layer1[4] + (-2.927471f);
layer2[1] = sigmoidLUT(layer2[1]);
__ESBMC_assume((layer2[1] >= 0.821860015392) && (layer2[1] <=0.999557971954));
layer2[2]= (-2.927471f)*layer1[0] + (-4.145836f)*layer1[1] + (1.903108f)*layer1[2] + (3.409983f)*layer1[3] + (0.191798f)*layer1[4] + (-4.116436f);
layer2[2] = sigmoidLUT(layer2[2]);
__ESBMC_assume((layer2[2] >= 0.0211030002683) && (layer2[2] <=0.796409010887));
layer2[3]= (-4.116436f)*layer1[0] + (-7.171240f)*layer1[1] + (2.687001f)*layer1[2] + (-1.662798f)*layer1[3] + (3.236128f)*layer1[4] + (4.911131f);
layer2[3] = sigmoidLUT(layer2[3]);
__ESBMC_assume((layer2[3] >= 0.651127994061) && (layer2[3] <=0.999891996384));
float layer3[5];
layer3[0]= (5.578862f)*layer2[0] + (5.071550f)*layer2[1] + (6.798682f)*layer2[2] + (-0.259254f)*layer2[3] + (-12.202182f);
layer3[0] = sigmoidLUT(layer3[0]);
__ESBMC_assume((layer3[0] >= 0.000322999985656) && (layer3[0] <=0.949549973011));
int r = 0;
layer3[1]= (10.556403f)*layer2[0] + (-9.337465f)*layer2[1] + (-0.761154f)*layer2[2] + (2.529015f)*layer2[3] + (-8.269168f);
layer3[1] = sigmoidLUT(layer3[1]);
__ESBMC_assume((layer3[1] >= 0) && (layer3[1] <=0.0133079998195));
if (layer3[1] > layer3[r]) r = 1;
layer3[2]= (-11.307169f)*layer2[0] + (-8.039979f)*layer2[1] + (-2.417081f)*layer2[2] + (9.576913f)*layer2[3] + (-6.212107f);
layer3[2] = sigmoidLUT(layer3[2]);
__ESBMC_assume((layer3[2] >= 0) && (layer3[2] <=0.0288319997489));
if (layer3[2] > layer3[r]) r = 2;
layer3[3]= (-2.461208f)*layer2[0] + (-6.955447f)*layer2[1] + (-1.412636f)*layer2[2] + (-12.198679f)*layer2[3] + (3.503773f);
layer3[3] = sigmoidLUT(layer3[3]);
__ESBMC_assume((layer3[3] >= 0) && (layer3[3] <=3.60000012734e-05));
if (layer3[3] > layer3[r]) r = 3;
layer3[4]= (-2.784967f)*layer2[0] + (8.339398f)*layer2[1] + (-1.883454f)*layer2[2] + (-9.724778f)*layer2[3] + (-3.755674f);
layer3[4] = sigmoidLUT(layer3[4]);
__ESBMC_assume((layer3[4] >= 2.70000000455e-05) && (layer3[4] <=0.136343002319));
if (layer3[4] > layer3[r]) r = 4;
__ESBMC_assert(r == 0, "Classification is not a 0 anymore.");
//@assert(r == 0);
}
