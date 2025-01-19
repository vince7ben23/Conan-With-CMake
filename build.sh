#!/bin/bash

debug=$1

eval "$(conda shell.bash hook)"

if ! conda activate cpp_manager; then
    echo "Failed to activate conda environment"
    exit 1
fi

# conan profile detect --force

if [[ -n ${debug} ]] && [[ ${debug} == "-g" ]]; then
    echo "conan install with debug mode..."
    profile="debug"
    build_type="Debug"
else
    echo "conan install with release mode..."
    profile="default"
    build_type="Release"
fi

conan install . --output-folder=build --build=missing --profile=${profile}

cd ./build
cmake -DCMAKE_BUILD_TYPE=${build_type} -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake ..
cmake --build .
