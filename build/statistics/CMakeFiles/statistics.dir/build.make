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
include statistics/CMakeFiles/statistics.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include statistics/CMakeFiles/statistics.dir/compiler_depend.make

# Include the progress variables for this target.
include statistics/CMakeFiles/statistics.dir/progress.make

# Include the compile flags for this target's objects.
include statistics/CMakeFiles/statistics.dir/flags.make

statistics/CMakeFiles/statistics.dir/statistics.c.obj: statistics/CMakeFiles/statistics.dir/flags.make
statistics/CMakeFiles/statistics.dir/statistics.c.obj: statistics/CMakeFiles/statistics.dir/includes_C.rsp
statistics/CMakeFiles/statistics.dir/statistics.c.obj: C:/Users/asus/OneDrive/Desktop/project/c_std/statistics/statistics.c
statistics/CMakeFiles/statistics.dir/statistics.c.obj: statistics/CMakeFiles/statistics.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=C:/Users/asus/OneDrive/Desktop/project/c_std/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object statistics/CMakeFiles/statistics.dir/statistics.c.obj"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/statistics && C:/msys64/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT statistics/CMakeFiles/statistics.dir/statistics.c.obj -MF CMakeFiles/statistics.dir/statistics.c.obj.d -o CMakeFiles/statistics.dir/statistics.c.obj -c C:/Users/asus/OneDrive/Desktop/project/c_std/statistics/statistics.c

statistics/CMakeFiles/statistics.dir/statistics.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/statistics.dir/statistics.c.i"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/statistics && C:/msys64/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:/Users/asus/OneDrive/Desktop/project/c_std/statistics/statistics.c > CMakeFiles/statistics.dir/statistics.c.i

statistics/CMakeFiles/statistics.dir/statistics.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/statistics.dir/statistics.c.s"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/statistics && C:/msys64/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:/Users/asus/OneDrive/Desktop/project/c_std/statistics/statistics.c -o CMakeFiles/statistics.dir/statistics.c.s

# Object files for target statistics
statistics_OBJECTS = \
"CMakeFiles/statistics.dir/statistics.c.obj"

# External object files for target statistics
statistics_EXTERNAL_OBJECTS =

build/libstatistics.dll: statistics/CMakeFiles/statistics.dir/statistics.c.obj
build/libstatistics.dll: statistics/CMakeFiles/statistics.dir/build.make
build/libstatistics.dll: statistics/CMakeFiles/statistics.dir/linkLibs.rsp
build/libstatistics.dll: statistics/CMakeFiles/statistics.dir/objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=C:/Users/asus/OneDrive/Desktop/project/c_std/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library ../build/libstatistics.dll"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/statistics && "C:/Program Files/CMake/bin/cmake.exe" -E rm -f CMakeFiles/statistics.dir/objects.a
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/statistics && C:/msys64/mingw64/bin/ar.exe qc CMakeFiles/statistics.dir/objects.a @CMakeFiles/statistics.dir/objects1.rsp
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/statistics && C:/msys64/mingw64/bin/cc.exe  -g  -O3 -march=native -funroll-loops -Wall -Wextra -pedantic -Wno-deprecated-declarations -s  -Wl,--enable-auto-import -shared -o ../build/libstatistics.dll -Wl,--out-implib,libstatistics.dll.a -Wl,--major-image-version,0,--minor-image-version,0 -Wl,--whole-archive CMakeFiles/statistics.dir/objects.a -Wl,--no-whole-archive @CMakeFiles/statistics.dir/linkLibs.rsp

# Rule to build all files generated by this target.
statistics/CMakeFiles/statistics.dir/build: build/libstatistics.dll
.PHONY : statistics/CMakeFiles/statistics.dir/build

statistics/CMakeFiles/statistics.dir/clean:
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/statistics && $(CMAKE_COMMAND) -P CMakeFiles/statistics.dir/cmake_clean.cmake
.PHONY : statistics/CMakeFiles/statistics.dir/clean

statistics/CMakeFiles/statistics.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" C:/Users/asus/OneDrive/Desktop/project/c_std C:/Users/asus/OneDrive/Desktop/project/c_std/statistics C:/Users/asus/OneDrive/Desktop/project/c_std/build C:/Users/asus/OneDrive/Desktop/project/c_std/build/statistics C:/Users/asus/OneDrive/Desktop/project/c_std/build/statistics/CMakeFiles/statistics.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : statistics/CMakeFiles/statistics.dir/depend

