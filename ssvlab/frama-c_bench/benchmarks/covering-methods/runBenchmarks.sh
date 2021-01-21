dir=$(pwd)
if [ $1 == "esbmc" ]; then
	echo "ESBMC"
	command="esbmc-gpu verifynn.c --force-malloc-success --no-bounds-check --no-div-by-zero-check --no-pointer-check"
fi
echo $command

for d in $(find $(dir) -maxdepth 1 -type d)
do
	cd "$dir"/"$d"
	pwd
	"$dir/../../"$command -I ~/library | tee "$dir"/"$d"/output.txt
done
