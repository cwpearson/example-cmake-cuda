#include "cpu.hpp"
#include "gpu.hu"

int main(void) {
    kernel<<<1,1>>>();
    cudaError_t err = cudaDeviceSynchronize();
    function();

    return 0;
}