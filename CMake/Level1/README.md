# How to build an executable, install that executable on your computer , how to build a static library and how to install it.  

Yes, we can install executables in our /usr/local/bin and then call them directly from the terminal , all done locally. 

### install an executable

1) add this command in yout CMake file : 
```
install(TARGETS {name of the executable} DESTINATION bin)
```
### Build a static library 

1) define your types in a .h file. The actual function definitions would be stored in a .cpp file. That cpp file is our library. 
2) have a namespace in yout library and types , because it helps to identify functions. 
3) add the following command in your CMakeLists.txt filw : 

```
add_library({name_of_the_library} {actual definition of the library : the .cpp file})
```

This will generate a static library. 

### Testing and downloading that library in our std C library locally on our OS so that linker knows which lib to call when it sees the header file declration. 

1) normally if you want to use that header file anywhere, you will have to link the library generated : 

```
add_executable({executable_name} {code_of_the_executable})
target_link_directories({executable_name} PRIVATE ${CMAKE_SOURCE_DIR}/../out/build/)
target_link_libraries({executable_name} {name_of_the_library})
```

2) To avoid all this hastle, we can download the library directly through the following command and then call it freely. 

```
add_library({library_name} {Library definition})
set_target_properties({library_name} PROPERTIES PUBLIC_HEADER {Header file for our library})
install(TARGETS {library_name} LIBRARY DESTINATION lib
        PUBLIC_HEADER DESTINATION include   
        )
```
3) after this our library would be downloaded and we can call it freely by just addding this to the makefile : 

```
target_link_libraries({Executable_name} {Library_name})
```

## And we are done . 