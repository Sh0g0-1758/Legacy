# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/shogo/master/dev/mdg/game/CMake/Level1/test1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/shogo/master/dev/mdg/game/CMake/Level1/test1/out/build

# Include any dependencies generated for this target.
include CMakeFiles/shogomath.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/shogomath.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/shogomath.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/shogomath.dir/flags.make

CMakeFiles/shogomath.dir/adder.cpp.o: CMakeFiles/shogomath.dir/flags.make
CMakeFiles/shogomath.dir/adder.cpp.o: ../../adder.cpp
CMakeFiles/shogomath.dir/adder.cpp.o: CMakeFiles/shogomath.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/shogo/master/dev/mdg/game/CMake/Level1/test1/out/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/shogomath.dir/adder.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/shogomath.dir/adder.cpp.o -MF CMakeFiles/shogomath.dir/adder.cpp.o.d -o CMakeFiles/shogomath.dir/adder.cpp.o -c /home/shogo/master/dev/mdg/game/CMake/Level1/test1/adder.cpp

CMakeFiles/shogomath.dir/adder.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/shogomath.dir/adder.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shogo/master/dev/mdg/game/CMake/Level1/test1/adder.cpp > CMakeFiles/shogomath.dir/adder.cpp.i

CMakeFiles/shogomath.dir/adder.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/shogomath.dir/adder.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shogo/master/dev/mdg/game/CMake/Level1/test1/adder.cpp -o CMakeFiles/shogomath.dir/adder.cpp.s

# Object files for target shogomath
shogomath_OBJECTS = \
"CMakeFiles/shogomath.dir/adder.cpp.o"

# External object files for target shogomath
shogomath_EXTERNAL_OBJECTS =

libshogomath.a: CMakeFiles/shogomath.dir/adder.cpp.o
libshogomath.a: CMakeFiles/shogomath.dir/build.make
libshogomath.a: CMakeFiles/shogomath.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/shogo/master/dev/mdg/game/CMake/Level1/test1/out/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libshogomath.a"
	$(CMAKE_COMMAND) -P CMakeFiles/shogomath.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/shogomath.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/shogomath.dir/build: libshogomath.a
.PHONY : CMakeFiles/shogomath.dir/build

CMakeFiles/shogomath.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/shogomath.dir/cmake_clean.cmake
.PHONY : CMakeFiles/shogomath.dir/clean

CMakeFiles/shogomath.dir/depend:
	cd /home/shogo/master/dev/mdg/game/CMake/Level1/test1/out/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/shogo/master/dev/mdg/game/CMake/Level1/test1 /home/shogo/master/dev/mdg/game/CMake/Level1/test1 /home/shogo/master/dev/mdg/game/CMake/Level1/test1/out/build /home/shogo/master/dev/mdg/game/CMake/Level1/test1/out/build /home/shogo/master/dev/mdg/game/CMake/Level1/test1/out/build/CMakeFiles/shogomath.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/shogomath.dir/depend

