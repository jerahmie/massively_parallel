#include <stdio.h>
#include "cuda.h"

__host__ void hello_gpu_device() {
	printf("Hello World from GPU!\n");
}

extern "C" {
	void hello_gpu(void) {
		hello_gpu_device();
	}

	int query_gpu(){
		cuInit(0);
		int device = -1;
		int deviceCount = 0;
		cuDeviceGetCount(&deviceCount);
		cudaGetDevice(&device);
		return deviceCount;

	}
}

