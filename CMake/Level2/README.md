# Git submodules

Here I have added glfw windowing library as a submodule. 

Run the following command to add a submodule. 

```
git add submodule {repo:url} external
```

Basically a submodule is kinda a magical thing. It allows use to someone else code and redirects us to that repo in github. 

In the CMakeLists.txt file, do the following changes : 


```
add_subdirectory(external/glfw)

target_include_directories(${PROJECT_NAME}
    PUBLIC external/glfw/src
)

target_link_directories(${PROJECT_NAME}
    PRIVATE external/glfw/src
)

target_link_libraries(${PROJECT_NAME} glfw)
```

Also , dont forget to put your submodules in an external folder. It helps in structuring the project. 

### Streamlining workflow with scripts 

check out build.sh, configure.sh and run.sh

## To get all the submodules recursively 

Run this command : 

```
git submodule update --init --recursive
```

Or , you can let CMake handle all the things by adding this script in your CMakeLists.txt

```
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

```