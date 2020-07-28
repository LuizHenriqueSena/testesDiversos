#!/bin/bash
if [ -z "$1" ]
then
  echo "No argument supplied. You must pass the name of the Neural Network .c file you desire to verify."
else
  gcc -o importNN $1
  ./importNN > importNN.c
  rm importNN
  esbmc importNN.c --force-malloc-success --no-bounds-check --no-div-by-zero-check --no-pointer-check --incremental-bmc --interval-analysis | tee output.txt
  #rm importNN.c
fi
