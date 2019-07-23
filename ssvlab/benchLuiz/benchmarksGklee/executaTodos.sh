dir=$(pwd)
for d in $(find $(dir) -maxdepth 1 -type d)
do
	cd "$dir"/"$d"
	pwd
	gklee main | tee "$dir"/"$d"/teste.txt
done
