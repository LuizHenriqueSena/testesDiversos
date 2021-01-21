#include <stdio.h>
//#include "/home/rique/.opam/system/share/frama-c/libc/__fc_builtin.h"
#include "__fc_builtin.h"

int main(){
	int n = Frama_C_interval(0, 255);
	//int n = nondet_int();
	int i = 200;
	//assert(n <= 255 && n >=0);
	//@assert((i+n) < 255);
	//if(!(i <= 255 && i >=0)) return 0;
	return 1;
}
