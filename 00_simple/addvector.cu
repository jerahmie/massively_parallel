#include <iostream>
#include <cuda.h>

__global__ void VecAdd(float* A, float* B, float* C, int n)
{
    int i = threadIdx.x;
    C[i] = A[i] + B[i];
}

int main()
{
    std::cout << "Hello World.\n";
}