#include "gpu.hu"

#include <cstdio>

__global__ void kernel() {
    printf("kernel!\n");
}