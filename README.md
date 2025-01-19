# Build CMake Cpp project with conan

## Prepapre python env
- conan is a python-based package manager.
- prepare a python virtual env to use conan.

```bash
# install miniconda if it is not installed
conda create -n cpp_manager python==3.10
conda activate cpp_manager  
pip install conan==2.11.0 
```

## Create conan profile
```bash
conan profile detect --force
conan profile detect --force --name debug
```

- create profiles
```
# default
[settings]
arch=x86_64
build_type=Release
compiler=gcc
compiler.cppstd=gnu11
compiler.libcxx=libstdc++11
compiler.version=9
os=Linux

# debug
[settings]
arch=x86_64
build_type=Debug
compiler=gcc
compiler.cppstd=gnu11
compiler.libcxx=libstdc++11
compiler.version=9
os=Linux
```

## Build project
```bash
./build.sh

# build with debug info
./build.sh -g
```


