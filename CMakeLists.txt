cmake_minimum_required(VERSION 2.8.4)
set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")
project(c_skeleton)

set(CMAKE_CXX_STANDARD 11)

add_executable(c_skeleton
        src/main.c)
