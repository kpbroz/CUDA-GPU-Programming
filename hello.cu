#include <stdio.h>

void helloCPU()
{
  printf("Hello from the CPU.\n");
}

/*
 * The addition of `__global__` signifies that this function
 * should be launced on the GPU.
 */

__global__ void helloGPU()
{
  printf("Hello from the GPU.\n");
}

int main()
{

  /* Task 1: print the messages from functins helloCPU and helloGPU */

  printf("Task 1:\n");
  helloCPU();


  /*
   * Add an execution configuration with the <<<...>>> syntax
   * will launch this function as a kernel on the GPU.
   */

  helloGPU<<<1, 1>>>();

  /*
   * `cudaDeviceSynchronize` will block the CPU stream until
   * all GPU kernels have completed.
   */

  cudaDeviceSynchronize();

  printf("\n");

  /* Task 2: Hello from the GPU prints before Hello from the CPU */

  printf("Task 2:\n");
  helloGPU<<<1, 1>>>();
  cudaDeviceSynchronize();
  helloCPU();

  printf("\n");

  /* Task 3: Hello from the GPU prints twice, once before Hello from the CPU, and once after. */

  helloGPU<<<1, 1>>>();
  cudaDeviceSynchronize();
  helloCPU();
  helloGPU<<<1, 1>>>();
}
