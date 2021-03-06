dir=$(pwd)
if [ $1 == "esbmc" ]; then
	echo "ESBMC"
	flags="--fixedbv --force-malloc-success --no-bounds-check --no-div-by-zero-check --no-pointer-check --incremental-bmc --memlimit 85g"
fi

for d in $(find $(dir) -type f -name "*.c")
do
	name=$(echo "$d" | cut -f 1 -d '.')
	command="/home/erickson.alves/esbmc/v6.4.0/bin/esbmc"
	command="$command $d $flags"
	echo "$command"
	$command | tee "$dir"/"$name"_LOG.txt
done
