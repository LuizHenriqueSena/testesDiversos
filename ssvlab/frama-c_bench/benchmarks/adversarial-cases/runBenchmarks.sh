if ! [ -x "$(command -v esbmc)" ]; then
    echo 'Error: esbmc is not installed.' >&2
    exit 1
fi

if ! [ -x "$(command -v g++)" ]; then
    echo 'Error: g++ is not installed.' >&2
    exit 1
fi

dir=$(pwd)

cp -r ../../library $HOME

echo "About to run benchmarks with ESBMC"

g++ runner.cpp -o runner -std=c++11 -lpthread

./runner
