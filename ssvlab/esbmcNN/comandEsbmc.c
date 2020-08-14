#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MAX_CMN_LEN 1000

int main(int argc, char *argv[])
{
  clock_t t;
  t = clock();
    char cmd[MAX_CMN_LEN] = "", **p;

    if (argc < 2) /*no command specified*/
    {
        fprintf(stderr, "Usage: ./program_name terminal_command ...");
        exit(EXIT_FAILURE);
    }
    else
    {
        strcat(cmd, argv[1]);
        for (p = &argv[2]; *p; p++)
        {
            strcat(cmd, " ");
            strcat(cmd, *p);
        }
        system(cmd);
    }
    t = clock() - t;
    double time_taken = ((double)t)/CLOCKS_PER_SEC; // calculate the elapsed time
    printf("The program took %f seconds to execute\n", time_taken);
    return 0;
}
