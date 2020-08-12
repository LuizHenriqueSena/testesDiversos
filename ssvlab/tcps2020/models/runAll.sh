dir=$(pwd)
if [ $1 == "esbmc" ]; then
	echo "ESBMC"
	flags="--fixedbv --force-malloc-success --no-bounds-check --no-div-by-zero-check --no-pointer-check --incremental-bmc --memlimit 85g"
fi
echo $flags

for d in $(find $(dir) -type f -name "*.c")
do
	command="~/esbmc/v6.4.0/bin/esbmc"
	command="$command $d $flags"
	echo "$command"
done

