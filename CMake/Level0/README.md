# How to configure your project using CMake. 

Start with CMakeLists.txt. {the name should be exactly this}
add some top level info in it. 
Create a folder. prefer making an out/build folder. 
then run these command in the folder which contains the CMakeLists.txt file. 
```
cmake -S . -B out/build
cd /out/build
make
./{binary_name}
```