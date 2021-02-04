#include <stdio.h>
//#include "/home/rique/.opam/system/share/frama-c/libc/__fc_builtin.h"
#include "__fc_builtin.h"

int main(){
	unsigned int n = Frama_C_interval(0, 255);
	int i = 0;
	//assert(n <= 256 && n >=0);
	int y = i + n;
	Frama_C_show_each(y);
	//@assert(y < 255);
}
