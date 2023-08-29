cmake_minimum_required(VERSION 3.22.1)

project(shodow VERSION 1.0)

add_executable(${PROJECT_NAME} main.cpp)
# adder use logic
option(USE_ADDER "A Simple library for adding 2 floats. " ON)

if(USE_ADDER)
    add_subdirectory(Adder)

    list(APPEND EXTRA_LIBS Adder)
    list(APPEND EXTRA_INCLUDES ${PROJECT_SOURCE_DIR}/Adder)

    target_include_directories(${PROJECT_NAME} PUBLIC Adder)

    target_link_directories(${PROJECT_NAME} PUBLIC Adder)
endif()

# Versioning the project


configure_file(shodowConfig.h.in shodowConfig.h)
target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_BINARY_DIR})

#                    DOWNLOAD ALL THE SUBMODULES
find_package(Git QUIET)
if(GIT_FOUND AND EXISTS "${PROJECT_SOURCE_DIR}/.git")
# Update submodules as needed
    option(GIT_SUBMODULE "Check submodules during build" ON)
    if(GIT_SUBMODULE)
        message(STATUS "Submodule update")
        execute_process(COMMAND ${GIT_EXECUTABLE} submodule update --init --recursive WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} RESULT_VARIABLE GIT_SUBMOD_RESULT)
        if(NOT GIT_SUBMOD_RESULT EQUAL "0")
            message(FATAL_ERROR "git submodule update --init failed with ${GIT_SUBMOD_RESULT}, please check once")
        endif()
    endif()
endif()


#                        CHECK ALL THE SUBMODULES

if(NOT EXISTS "${PROJECT_SOURCE_DIR}/external/glfw/CMakeLists.txt")
    message(FATAL_ERROR "The glfw submodules were not downloaded! GIT_SUBMODULE was turned off or it failed. ")
endif()

add_subdirectory(external/glfw)

target_link_libraries(shodow shogomath)

target_include_directories(${PROJECT_NAME}
    PUBLIC external/glfw/src
    ${EXTRA_INCLUDES}
)

target_link_directories(${PROJECT_NAME}
    PRIVATE external/glfw/src
    ${EXTRA_LIBS}
)

target_link_libraries(${PROJECT_NAME} glfw)