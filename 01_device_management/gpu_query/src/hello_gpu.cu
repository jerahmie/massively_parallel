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
	printf(" uuid: %x\n", pdevprop->uuid);
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
        printf(" Max Texture 2D: %d, %d\n", pdevprop->maxTexture2D[0],
                                            pdevprop->maxTexture2D[1]);
        printf(" Max Texture 2D Mipmap: %d, %d\n", pdevprop->maxTexture2DMipmap[0],
                                                   pdevprop->maxTexture2DMipmap[1]);
        printf(" Max Texture 2D Linear: %d, %d, %d\n", pdevprop->maxTexture2DLinear[0],
                                                       pdevprop->maxTexture2DLinear[1],
                                                       pdevprop->maxTexture2DLinear[2]);
        printf(" Max Texture 2D Gather: %d, %d\n", pdevprop->maxTexture2DGather[0],
                                                   pdevprop->maxTexture2DGather[1]);
        printf(" Max Texture 3D: %d, %d, %d\n", pdevprop->maxTexture3D[0],
                                                pdevprop->maxTexture3D[1],
                                                pdevprop->maxTexture3D[2]);
        printf(" Max Texure 3D Alt: %d, %d, %d\n", pdevprop->maxTexture3DAlt[0],
                                                   pdevprop->maxTexture3DAlt[1],
                                                   pdevprop->maxTexture3DAlt[2]);
        printf(" Max Texture Cubemap: %d\n", pdevprop->maxTextureCubemap);
        printf(" Max Texture 1D Layered: %d, %d\n", pdevprop->maxTexture1DLayered[0],
                                                    pdevprop->maxTexture1DLayered[1]);
        printf(" Max Texture 2D Layered: %d, %d, %d\n", pdevprop->maxTexture2DLayered[0],
                                                        pdevprop->maxTexture2DLayered[1],
                                                        pdevprop->maxTexture2DLayered[2]);
        printf(" Max Texture Cubemap Layered: %d, %d\n", pdevprop->maxTextureCubemapLayered[0],
                                                         pdevprop->maxTextureCubemapLayered[1]);
        printf(" Max Surface 1D: %d\n", pdevprop->maxSurface1D);
        printf(" Max Surface 2D: %d, %d\n", pdevprop->maxSurface2D[0],
                                            pdevprop->maxSurface2D[1]);
        printf(" Max Surface 3D: %d, %d, %d\n", pdevprop->maxSurface3D[0],
                                                pdevprop->maxSurface3D[1],
                                                pdevprop->maxSurface3D[2]);
        printf(" Max Surface 1D Layered: %d, %d\n", pdevprop->maxSurface1DLayered[0],
                                                    pdevprop->maxSurface1DLayered[1]);
        printf(" Max Surface 2D Layered: %d, %d, %d\n", pdevprop->maxSurface2DLayered[0],
                                                        pdevprop->maxSurface2DLayered[1],
                                                        pdevprop->maxSurface2DLayered[2]);
        printf(" Max Surface Cubemap: %d\n", pdevprop->maxSurfaceCubemap);
        printf(" Max Surface Cubemap Layered: %d, %d\n", pdevprop->maxSurfaceCubemapLayered[0],
                                                         pdevprop->maxSurfaceCubemapLayered[1]);
        printf(" Surface Alignment: %lu\n", pdevprop->surfaceAlignment);
        printf(" Concurrent Kernels: %d\n", pdevprop->concurrentKernels);
        printf(" ECC Enabled: %d\n", pdevprop->ECCEnabled);
        printf(" PCI Bus ID: %d\n", pdevprop->pciBusID);
        printf(" PCI Device ID: %d\n", pdevprop->pciDeviceID);
        printf(" PCI Domain ID: %d\n", pdevprop->pciDomainID);
        printf(" TCC Driver: %d\n", pdevprop->tccDriver);
        printf(" Async Engine Count: %d\n", pdevprop->asyncEngineCount);
        printf(" Unified Addressing: %d\n", pdevprop->unifiedAddressing);
        printf(" Memory Clock Rate: %d\n", pdevprop->memoryClockRate);
        printf(" Memory Bus Width: %d\n", pdevprop->memoryBusWidth);
        printf(" L2 Cache Size: %d\n", pdevprop->l2CacheSize);
        printf(" Persisting L2 Cache Max Size: %d\n", pdevprop->persistingL2CacheMaxSize);
        printf(" Max Thread Per Multiprocessor: %d\n", pdevprop->maxThreadsPerMultiProcessor);
        printf(" Stream Priorities Supported: %d\n", pdevprop->streamPrioritiesSupported);
        printf(" Global L1 Cache Supported: %d\n", pdevprop->globalL1CacheSupported);
        printf(" Local L1 Cache Supported: %d\n", pdevprop->localL1CacheSupported);
        printf(" Shared Mem Per Multiprocessor: %lu\n", pdevprop->sharedMemPerMultiprocessor);
        printf(" Registers Per Multiprocessor: %d\n", pdevprop->regsPerMultiprocessor);
        printf(" Managed Memory: %d\n", pdevprop->managedMemory);
        printf(" Is Multi GPU Board: %d\n", pdevprop->isMultiGpuBoard);
        printf(" Multi-GPU Board Group ID: %d\n", pdevprop->multiGpuBoardGroupID);
        printf(" Single to Double Precision Perf Ratio: %d\n", pdevprop->singleToDoublePrecisionPerfRatio);
        printf(" Pageable Memory Access: %d\n", pdevprop->pageableMemoryAccess);
        printf(" Concurrent Managed Access: %d\n", pdevprop->concurrentManagedAccess);
        printf(" Compute Preemption Supported: %d\n", pdevprop->computePreemptionSupported);
        printf(" Can Use Host Pointer for Registered Memory: %d\n", pdevprop->canUseHostPointerForRegisteredMem);
        printf(" Cooperative Launch: %d\n", pdevprop->cooperativeLaunch);
        printf(" Cooperative Multi-Device Launch %d\n", pdevprop->cooperativeMultiDeviceLaunch);
        printf(" Pageable Memory access Uses Host Page Tables: %d\n", pdevprop->pageableMemoryAccessUsesHostPageTables);
        printf(" Direct Managed Memory Access From Host: %d\n", pdevprop->directManagedMemAccessFromHost);
        printf(" Access Policy Max Windows Size: %d\n", pdevprop->accessPolicyMaxWindowSize);

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

