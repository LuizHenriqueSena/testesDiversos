dir=$(pwd)
if [ $1 == "esbmc-gpu" ]; then
	echo "ESBMC"
	comando="esbmc-gpu main.cu --unwind 33 -I ~/libraries/ --force-malloc-success --state-hashing --context-switch 2"
elif [ $1 == "gklee" ]; then
	echo "gklee"
	comando2= "gklee-nvcc main.cu"
	comando="gklee main"
elif [ $1 == "gpuverify" ]; then
	echo "gpuverify"
	comando="gpuverify --gridDim=1 --blockDim=32 main.cu"
fi
echo $comando

for d in $(find $(dir) -maxdepth 1 -type d)
do
	cd "$dir"/"$d"
	pwd
if [ $1 == "gklee" ]; then
	$comando2
fi
	$comando | tee "$dir"/"$d"/teste.txt
done
