dir=$(pwd)
if [ $1 == "esbmc-gpu" ]; then
	echo "ESBMC"
	command="./../esbmc-gpu verifynn.c -I ~/library/ --force-malloc-success --state-hashing --no-div-by-zero-check --no-pointer-check > output.txt"
fi
echo $command

for d in $(find $(dir) -maxdepth 1 -type d)
do
	cd "$dir"/"$d"
	pwd
	$command | tee "$dir"/"$d"/teste.txt
done
