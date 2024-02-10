cmake_minimum_required(VERSION 3.13)

include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)

set(CMAKE_C_COMPILER "arm-none-eabi-gcc")
set(CMAKE_CXX_COMPILER "arm-none-eabi-g++")
set(CMAKE_ASM_COMPILER "arm-none-eabi-gcc")

project(twoscomp_8bit C CXX ASM)

set(CMAKE_C_STANDARD 17)
set(CMAKE_CXX_STANDARD 20)

pico_sdk_init()

include_directories(${CMAKE_SOURCE_DIR})

add_executable(twoscomp_8bit
  main.S
)

pico_enable_stdio_uart(twoscomp_8bit 1) # Output mode
pico_enable_stdio_usb(twoscomp_8bit 0)

pico_add_extra_outputs(twoscomp_8bit)

target_link_libraries(twoscomp_8bit pico_stdlib)
