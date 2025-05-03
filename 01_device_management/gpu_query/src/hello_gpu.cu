#include <stdio.h>
#include "cuda.h"

__global__ void hello_gpu_device() {
	printf("Hello World from GPU!\n");
}

extern "C" {
	void hello_gpu(void) {
		hello_gpu_device<<<1,1>>>();
	}
}
