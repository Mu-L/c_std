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
include list/CMakeFiles/list.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include list/CMakeFiles/list.dir/compiler_depend.make

# Include the progress variables for this target.
include list/CMakeFiles/list.dir/progress.make

# Include the compile flags for this target's objects.
include list/CMakeFiles/list.dir/flags.make

list/CMakeFiles/list.dir/list.c.obj: list/CMakeFiles/list.dir/flags.make
list/CMakeFiles/list.dir/list.c.obj: list/CMakeFiles/list.dir/includes_C.rsp
list/CMakeFiles/list.dir/list.c.obj: C:/Users/asus/OneDrive/Desktop/project/c_std/list/list.c
list/CMakeFiles/list.dir/list.c.obj: list/CMakeFiles/list.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=C:/Users/asus/OneDrive/Desktop/project/c_std/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object list/CMakeFiles/list.dir/list.c.obj"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/list && C:/msys64/mingw64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT list/CMakeFiles/list.dir/list.c.obj -MF CMakeFiles/list.dir/list.c.obj.d -o CMakeFiles/list.dir/list.c.obj -c C:/Users/asus/OneDrive/Desktop/project/c_std/list/list.c

list/CMakeFiles/list.dir/list.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/list.dir/list.c.i"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/list && C:/msys64/mingw64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:/Users/asus/OneDrive/Desktop/project/c_std/list/list.c > CMakeFiles/list.dir/list.c.i

list/CMakeFiles/list.dir/list.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/list.dir/list.c.s"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/list && C:/msys64/mingw64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:/Users/asus/OneDrive/Desktop/project/c_std/list/list.c -o CMakeFiles/list.dir/list.c.s

# Object files for target list
list_OBJECTS = \
"CMakeFiles/list.dir/list.c.obj"

# External object files for target list
list_EXTERNAL_OBJECTS =

build/liblist.dll: list/CMakeFiles/list.dir/list.c.obj
build/liblist.dll: list/CMakeFiles/list.dir/build.make
build/liblist.dll: fmt/libfmt.dll.a
build/liblist.dll: encoding/libencoding.dll.a
build/liblist.dll: string/libstdstring.dll.a
build/liblist.dll: list/CMakeFiles/list.dir/linkLibs.rsp
build/liblist.dll: list/CMakeFiles/list.dir/objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=C:/Users/asus/OneDrive/Desktop/project/c_std/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library ../build/liblist.dll"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/list && "C:/Program Files/CMake/bin/cmake.exe" -E rm -f CMakeFiles/list.dir/objects.a
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/list && C:/msys64/mingw64/bin/ar.exe qc CMakeFiles/list.dir/objects.a @CMakeFiles/list.dir/objects1.rsp
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/list && C:/msys64/mingw64/bin/gcc.exe  -g -O3 -march=native -funroll-loops -Wall -Wextra -pedantic -Wno-deprecated-declarations -s  -Wl,--enable-auto-import -shared -o ../build/liblist.dll -Wl,--out-implib,liblist.dll.a -Wl,--major-image-version,0,--minor-image-version,0 -Wl,--whole-archive CMakeFiles/list.dir/objects.a -Wl,--no-whole-archive @CMakeFiles/list.dir/linkLibs.rsp

# Rule to build all files generated by this target.
list/CMakeFiles/list.dir/build: build/liblist.dll
.PHONY : list/CMakeFiles/list.dir/build

list/CMakeFiles/list.dir/clean:
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/list && $(CMAKE_COMMAND) -P CMakeFiles/list.dir/cmake_clean.cmake
.PHONY : list/CMakeFiles/list.dir/clean

list/CMakeFiles/list.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" C:/Users/asus/OneDrive/Desktop/project/c_std C:/Users/asus/OneDrive/Desktop/project/c_std/list C:/Users/asus/OneDrive/Desktop/project/c_std/build C:/Users/asus/OneDrive/Desktop/project/c_std/build/list C:/Users/asus/OneDrive/Desktop/project/c_std/build/list/CMakeFiles/list.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : list/CMakeFiles/list.dir/depend
