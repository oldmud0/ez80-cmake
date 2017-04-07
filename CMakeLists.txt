set(CMAKE_TOOLCHAIN_FILE cmake/eZ80Toolchain.cmake)

cmake_minimum_required(VERSION 2.8.5)

# Sets up example project
project(eZ80-Example C)
add_subdirectory(example)