cmake_minimum_required(VERSION 3.5.0)
project(conan_with_cmake)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# include custom cmake code
include(cmake/Dependencies.cmake)

# generate obj files
add_subdirectory(src/utils)
add_executable(main.out src/main.cpp)

# link libs
target_link_libraries(main.out utils spdlog::spdlog)



