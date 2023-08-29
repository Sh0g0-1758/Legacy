cmake_minimum_required(VERSION 3.22.1)

project(shodow)

add_executable(${PROJECT_NAME} main.cpp)

add_subdirectory(external/glfw)

target_link_libraries(shodow shogomath)

target_include_directories(${PROJECT_NAME}
    PUBLIC external/glfw/src
)

target_link_directories(${PROJECT_NAME}
    PRIVATE external/glfw/src
)

target_link_libraries(${PROJECT_NAME} glfw)