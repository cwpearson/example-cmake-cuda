cmake_minimum_required(VERSION 3.17 FATAL_ERROR)

# CUDA - CUDA language support
project(example LANGUAGES CUDA CXX VERSION 0.1.0)

# if you need information about the  CUDA toolkit,
# for example, to give g++ CUDA's include directories or implicit link libraries
find_package(CUDAToolkit)

add_executable(example
  src/cpu.cpp
  src/gpu.cu
  src/main.cu
)

# set compile options for different kinds of files (CMake Generator Expressions)
target_compile_options(
    example
    PRIVATE
    $<$<COMPILE_LANGUAGE:CUDA>: # flags for CUDA objects
     -lineinfo
     -Xcompiler -Wall
     -Xcompiler -Wextra
    >
    $<$<COMPILE_LANGUAGE:CXX>: # flags for C++ objects
     -fno-omit-frame-pointer
    >
  )

# set GPU architecture flags if needed
# in CMake 3.18, can use CUDA_ARCHITECTURES
set(CMAKE_CUDA_FLAGS "-arch=sm_35")

# turn on separable compilation if needed (some CUDA features require this)
set_property(TARGET example PROPERTY CUDA_SEPARABLE_COMPILATION ON)
