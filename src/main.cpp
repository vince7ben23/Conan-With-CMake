#include <iostream>
#include "spdlog/spdlog.h"
#include "utils/foo.hpp"

using namespace std;

int main()
{
    spdlog::info("Welcome to spdlog!");

    // int *a; //  causes segmentation fault
    int *a = new int;

    foo(a);
    printf("a is %d\n", *a);

    spdlog::info("*a is {}", *a);
    spdlog::info("&a is {}", (void *)&a);
    spdlog::info("a is {}", (void *)a);

    delete a;

    return 0;
}