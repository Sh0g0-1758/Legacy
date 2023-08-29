# Git submodules

Here I have added glfw windowing library as a submodule. 

Run the following command to add a submodule. 

```bash
git add submodule {repo:url} external
```

Basically a submodule is kinda a magical thing. It allows use to someone else code and redirects us to that repo in github. 

In the CMakeLists.txt file, do the following changes : 


```C
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

```bash
git submodule update --init --recursive
```

Or , you can let CMake handle all the things by adding this script in your CMakeLists.txt

```C
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

## To add versioning in your project. 

Add the following lines in your CMakeLists.txt file : 

```C
configure_file(${PROJECT_NAME}.h.in ${PROJECT_NAME}.h)


add_executable(${PROJECT_NAME} main.cpp)


target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_BINARY_DIR})
```

Then make a ${PROJECT_NAME}Config.h.in file and add the following lines of code in it : 


```cpp
#define ${PROJECT_NAME}_VERSION_MAJOR @${PROJECT_NAME}_VERSION_MAJOR@
#define ${PROJECT_NAME}_VERSION_MINOR @${PROJECT_NAME}_VERSION_MINOR@
```

Now in your main.cpp file you can easily access the Version of your project using : 

```cpp
std::cout << argv[0] << " Version " << ${PROJECT_NAME}_VERSION_MAJOR << "." << ${PROJECT_NAME}_VERSION_MINOR << "\n";
// Also don't forget to include the header file #include <${PROJECT_NAME}Config.h>
```

## To Let the user choose which library to use while running the project. 

make use of if else and endif statements in the cmake file. Give the user an option to use that library or not. 

```C
option(USE_ADDER "A Simple library for adding 2 floats. " ON)

if(USE_ADDER)
    add_subdirectory(Adder)

    list(APPEND EXTRA_LIBS Adder)
    list(APPEND EXTRA_INCLUDES ${PROJECT_SOURCE_DIR}/Adder)

    target_include_directories(${PROJECT_NAME} PUBLIC Adder)

    target_link_directories(${PROJECT_NAME} PUBLIC Adder)
endif()

```

Now add ifdef and endif statements in your main cpp file.
whether to use that library or not according to the user preference. 

Something like : 

```cpp
#ifdef USE_ADDER
    #include<adder.h>
#endif

// ---------------------------------
    #ifdef USE_ADDER
        std::cout << "namespace output : " << namespace::add(72.1f,73.8f) << "\n";
    #else
        std::cout << 72.1f + 73.8f << "\n";
    #endif
```

## To install your project

Add the following to CMakeLists.txt

```C
install(TARGETS ${PROJECT_NAME} DESTINATION bin)
install(FILES "${PROJECT_BINARY_DIR}/{ProjectName}Config.h" DESTINATION include)
```

and change configure.sh to 

```C
cmake -DGLFW_BUILD_DOCS=OFF -DUSE_ADDER=ON -S . -B out/build // To not make the docs
```