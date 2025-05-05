#include <stdio.h>


__global__ void firstParallel()
{
  printf("This should be running in parallel.\n");
}

int main()
{

    /* Task 1: Refactor the firstParallel function to launch as a CUDA kernel on the GPU */
    printf("Task 1:\n");
    firstParallel<<<1,1>>>();
    cudaDeviceSynchronize();


    /* Task 2: Refactor the firstParallel kernel to execute in parallel on 5 threads, all executing in a single thread block. */
    printf("Task 2:\n");
    firstParallel<<<1,5>>>();
    cudaDeviceSynchronize();

    /* Task 3: Refactor the firstParallel kernel again, this time to execute in parallel inside 5 thread blocks, each containing 5 threads. */
    printf("Task 3:\n");
    firstParallel<<<5,5>>>();
    cudaDeviceSynchronize();

}
