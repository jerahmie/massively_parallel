#include <stdio.h>

#include "cuda.h"

__host__ void hello_gpu_device() {
    printf("Hello World from GPU!\n");
}

extern "C" {
    void hello_gpu(void) {
        hello_gpu_device();
    }

    int print_device_properties(cudaDeviceProp *pdevprop) {
        printf("CUDA Device Properties: \n\n");
        printf(" name: %s\n", pdevprop->name);
        printf(" uuid: %02X\n", pdevprop->uuid);
        printf(" Total global memory : %lu \n", pdevprop->totalGlobalMem);
        printf(" Shared memory per block: %lu\n", pdevprop->sharedMemPerBlock);
        printf(" Registers per block: %d\n", pdevprop->regsPerBlock);
        printf(" Warp Size: %d\n", pdevprop->warpSize);
        printf(" Memory Pitch: %lu\n", pdevprop->memPitch);
        printf(" Max Threads per Block: %d\n", pdevprop->maxThreadsPerBlock);
        printf(" Max Threads dimension: %d, %d, %d\n", pdevprop->maxThreadsDim[0], pdevprop->maxThreadsDim[1], pdevprop->maxThreadsDim[2]);
        printf(" Max Grid Size: %d, %d, %d\n", pdevprop->maxGridSize[0], pdevprop->maxGridSize[1], pdevprop->maxGridSize[2]);
        printf(" Clock Rage: %d\n", pdevprop->clockRate);
        printf(" Total Constant Memory: %lu\n", pdevprop->totalConstMem);
        printf(" Major: %d\n", pdevprop->major);
        printf(" Minor: %d\n", pdevprop->minor);
        printf(" Texture Alignment: %lu\n", pdevprop->textureAlignment);
        printf(" Texture Pitch Alignment: %lu\n", pdevprop->texturePitchAlignment);
        printf(" Device Overlap: %d\n", pdevprop->deviceOverlap);
        printf(" Mulitprocessor Count: %d\n", pdevprop->multiProcessorCount);
        printf(" Kernel Exec Timeout Enabled: %d\n", pdevprop->kernelExecTimeoutEnabled);
        printf(" Integrated: %d\n", pdevprop->integrated);
        printf(" Can Map Host Memory: %d\n", pdevprop->canMapHostMemory);
        printf(" Compute Mode: %d\n", pdevprop->computeMode);
        printf(" Max Texture 1D: %d\n", pdevprop->maxTexture1D);
        printf(" Max Texture 1D Mipmap: %d\n", pdevprop->maxTexture1DMipmap);
        printf(" Max Surface 1D Linear: %d\n", pdevprop->maxTexture1DLinear);

        return 0;
    }

    int device_properties(int device_id) {
        int  ret_val = 0;
        cudaDeviceProp dev_properties;
        ret_val = cudaGetDeviceProperties(&dev_properties, device_id);
        print_device_properties(&dev_properties);

        return ret_val;
    }
	

    int query_gpu(){
        cuInit(0);
        int device = -1;
        int deviceCount = 0;
        cuDeviceGetCount(&deviceCount);
        cudaGetDevice(&device);
        device_properties(device);

        return deviceCount;
    }
}

