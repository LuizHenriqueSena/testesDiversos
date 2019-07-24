# ESBMC-GPU v2.0

ESBMC-GPU is a context-bounded model checker based on the satisfiability
modulo theories (SMT) to check data race, deadlock, pointer safety,
array bounds, arithmetic overflow, division by zero, and user-specified
assertions in programs written in Compute Unified Device Architecture (CUDA).

* http://esbmc.org/gpu

This document has the execution process of ESBMC-GPU when applied to Neural Networks
with support to Ubuntu OS 16.04.


###### 1. Move the library folder and solvers to home directory with the command:

	mv library ~/
	mv boolector ~/
	mv z3 ~/
	mv lingeling ~/

###### 2. Edit the .bashrc file (in the home directory) and add at the end the following paths:

	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/boolector/
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/z3/lib/
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/lingeling/

###### 3. Restart the .bashrc file using the following command:

	source ~/.bashrc


## Running ESBMC-GPU to generate adversarial cases

## All benchmark folders have the information inside their name, Ex: iao03 means that the vocalic "a" will be verified with respect to the vocalic "o" with 0.3 as proximity parameter.

###### 1. Firstly, go to the benchmark folder inside the repository folder provide permission to the script:

	cd benchmarks
	chmod +x runBenchmarks.sh

###### 2. After this process run script runBenchmarks.sh with "esbmc" as argument:

	./runBenchmarks.sh esbmc

###### 3. Any benchmark can be run with the command:

./../esbmc-gpu "benchmarkfolder"/verifynn.c -I ~/library/ --force-malloc-success --state-hashing --no-div-by-zero-check --no-pointer-check
