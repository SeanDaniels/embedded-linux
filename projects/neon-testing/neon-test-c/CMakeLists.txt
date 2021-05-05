cmake_minimum_required(VERSION 2.8)
project("ntc")
set(TARGET ntc)
set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)
include_directories(/opt/vc/include)
include_directories(/opt/vc/include/interface/vcos/pthreads)
include_directories(/opt/vc/include/interface/vmcs_host)
include_directories(/opt/vc/include/interface/vmcs_host/linux)
include_directories(/home/pi/src/raspberrypi/userland)
include_directories(/opt/vc/src/hello_pi/libs/vgfont)
include_directories(../inc)
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
add_executable(ntc main.c)
