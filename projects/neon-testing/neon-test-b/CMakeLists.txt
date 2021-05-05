cmake_minimum_required(VERSION 2.8)
project("nt2")
set(TARGET nt2)
set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)
add_compile_options(-Wall
  -O3
  -Ofast
  -mcpu=cortex-a72
  -funroll-loops
  -mfloat-abi=hard
  -mfpu=crypto-neon-fp-armv8
  -mvectorize-with-neon-quad
  -ftree-vectorize
  -ggdb)
# set(CMAKE_CXX_FLAGS "-Wall -O3 -g -funrool-loops -mcpu=cortext-a72 -mfloat-abi=hard -mfpu=neon")
add_executable(nt2 main.c)
