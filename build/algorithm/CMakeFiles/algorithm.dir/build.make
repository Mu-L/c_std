# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.30

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
CMAKE_COMMAND = "C:/Program Files/CMake/bin/cmake.exe"

# The command to remove a file.
RM = "C:/Program Files/CMake/bin/cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:/Users/asus/OneDrive/Desktop/project/c_std

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:/Users/asus/OneDrive/Desktop/project/c_std/build

# Include any dependencies generated for this target.
include algorithm/CMakeFiles/algorithm.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include algorithm/CMakeFiles/algorithm.dir/compiler_depend.make

# Include the progress variables for this target.
include algorithm/CMakeFiles/algorithm.dir/progress.make

# Include the compile flags for this target's objects.
include algorithm/CMakeFiles/algorithm.dir/flags.make

algorithm/CMakeFiles/algorithm.dir/algorithm.c.obj: algorithm/CMakeFiles/algorithm.dir/flags.make
algorithm/CMakeFiles/algorithm.dir/algorithm.c.obj: algorithm/CMakeFiles/algorithm.dir/includes_C.rsp
algorithm/CMakeFiles/algorithm.dir/algorithm.c.obj: C:/Users/asus/OneDrive/Desktop/project/c_std/algorithm/algorithm.c
algorithm/CMakeFiles/algorithm.dir/algorithm.c.obj: algorithm/CMakeFiles/algorithm.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=C:/Users/asus/OneDrive/Desktop/project/c_std/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object algorithm/CMakeFiles/algorithm.dir/algorithm.c.obj"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/algorithm && C:/msys64/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT algorithm/CMakeFiles/algorithm.dir/algorithm.c.obj -MF CMakeFiles/algorithm.dir/algorithm.c.obj.d -o CMakeFiles/algorithm.dir/algorithm.c.obj -c C:/Users/asus/OneDrive/Desktop/project/c_std/algorithm/algorithm.c

algorithm/CMakeFiles/algorithm.dir/algorithm.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/algorithm.dir/algorithm.c.i"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/algorithm && C:/msys64/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:/Users/asus/OneDrive/Desktop/project/c_std/algorithm/algorithm.c > CMakeFiles/algorithm.dir/algorithm.c.i

algorithm/CMakeFiles/algorithm.dir/algorithm.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/algorithm.dir/algorithm.c.s"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/algorithm && C:/msys64/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:/Users/asus/OneDrive/Desktop/project/c_std/algorithm/algorithm.c -o CMakeFiles/algorithm.dir/algorithm.c.s

# Object files for target algorithm
algorithm_OBJECTS = \
"CMakeFiles/algorithm.dir/algorithm.c.obj"

# External object files for target algorithm
algorithm_EXTERNAL_OBJECTS =

build/libalgorithm.dll: algorithm/CMakeFiles/algorithm.dir/algorithm.c.obj
build/libalgorithm.dll: algorithm/CMakeFiles/algorithm.dir/build.make
build/libalgorithm.dll: algorithm/CMakeFiles/algorithm.dir/linkLibs.rsp
build/libalgorithm.dll: algorithm/CMakeFiles/algorithm.dir/objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=C:/Users/asus/OneDrive/Desktop/project/c_std/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library ../build/libalgorithm.dll"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/algorithm && "C:/Program Files/CMake/bin/cmake.exe" -E rm -f CMakeFiles/algorithm.dir/objects.a
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/algorithm && C:/msys64/mingw64/bin/ar.exe qc CMakeFiles/algorithm.dir/objects.a @CMakeFiles/algorithm.dir/objects1.rsp
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/algorithm && C:/msys64/mingw64/bin/cc.exe  -g  -O3 -march=native -funroll-loops -Wall -Wextra -pedantic -Wno-deprecated-declarations -s  -Wl,--enable-auto-import -shared -o ../build/libalgorithm.dll -Wl,--out-implib,libalgorithm.dll.a -Wl,--major-image-version,0,--minor-image-version,0 -Wl,--whole-archive CMakeFiles/algorithm.dir/objects.a -Wl,--no-whole-archive @CMakeFiles/algorithm.dir/linkLibs.rsp

# Rule to build all files generated by this target.
algorithm/CMakeFiles/algorithm.dir/build: build/libalgorithm.dll
.PHONY : algorithm/CMakeFiles/algorithm.dir/build

algorithm/CMakeFiles/algorithm.dir/clean:
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/algorithm && $(CMAKE_COMMAND) -P CMakeFiles/algorithm.dir/cmake_clean.cmake
.PHONY : algorithm/CMakeFiles/algorithm.dir/clean

algorithm/CMakeFiles/algorithm.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" C:/Users/asus/OneDrive/Desktop/project/c_std C:/Users/asus/OneDrive/Desktop/project/c_std/algorithm C:/Users/asus/OneDrive/Desktop/project/c_std/build C:/Users/asus/OneDrive/Desktop/project/c_std/build/algorithm C:/Users/asus/OneDrive/Desktop/project/c_std/build/algorithm/CMakeFiles/algorithm.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : algorithm/CMakeFiles/algorithm.dir/depend

