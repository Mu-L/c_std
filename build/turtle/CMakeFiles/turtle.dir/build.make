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
include turtle/CMakeFiles/turtle.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include turtle/CMakeFiles/turtle.dir/compiler_depend.make

# Include the progress variables for this target.
include turtle/CMakeFiles/turtle.dir/progress.make

# Include the compile flags for this target's objects.
include turtle/CMakeFiles/turtle.dir/flags.make

turtle/CMakeFiles/turtle.dir/turtle.c.obj: turtle/CMakeFiles/turtle.dir/flags.make
turtle/CMakeFiles/turtle.dir/turtle.c.obj: turtle/CMakeFiles/turtle.dir/includes_C.rsp
turtle/CMakeFiles/turtle.dir/turtle.c.obj: C:/Users/asus/OneDrive/Desktop/project/c_std/turtle/turtle.c
turtle/CMakeFiles/turtle.dir/turtle.c.obj: turtle/CMakeFiles/turtle.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=C:/Users/asus/OneDrive/Desktop/project/c_std/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object turtle/CMakeFiles/turtle.dir/turtle.c.obj"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/turtle && C:/msys64/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT turtle/CMakeFiles/turtle.dir/turtle.c.obj -MF CMakeFiles/turtle.dir/turtle.c.obj.d -o CMakeFiles/turtle.dir/turtle.c.obj -c C:/Users/asus/OneDrive/Desktop/project/c_std/turtle/turtle.c

turtle/CMakeFiles/turtle.dir/turtle.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/turtle.dir/turtle.c.i"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/turtle && C:/msys64/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:/Users/asus/OneDrive/Desktop/project/c_std/turtle/turtle.c > CMakeFiles/turtle.dir/turtle.c.i

turtle/CMakeFiles/turtle.dir/turtle.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/turtle.dir/turtle.c.s"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/turtle && C:/msys64/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:/Users/asus/OneDrive/Desktop/project/c_std/turtle/turtle.c -o CMakeFiles/turtle.dir/turtle.c.s

# Object files for target turtle
turtle_OBJECTS = \
"CMakeFiles/turtle.dir/turtle.c.obj"

# External object files for target turtle
turtle_EXTERNAL_OBJECTS =

build/libturtle.dll: turtle/CMakeFiles/turtle.dir/turtle.c.obj
build/libturtle.dll: turtle/CMakeFiles/turtle.dir/build.make
build/libturtle.dll: turtle/CMakeFiles/turtle.dir/linkLibs.rsp
build/libturtle.dll: turtle/CMakeFiles/turtle.dir/objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=C:/Users/asus/OneDrive/Desktop/project/c_std/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library ../build/libturtle.dll"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/turtle && "C:/Program Files/CMake/bin/cmake.exe" -E rm -f CMakeFiles/turtle.dir/objects.a
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/turtle && C:/msys64/mingw64/bin/ar.exe qc CMakeFiles/turtle.dir/objects.a @CMakeFiles/turtle.dir/objects1.rsp
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/turtle && C:/msys64/mingw64/bin/cc.exe  -g  -O3 -march=native -funroll-loops -Wall -Wextra -pedantic -Wno-deprecated-declarations -s  -Wl,--enable-auto-import -shared -o ../build/libturtle.dll -Wl,--out-implib,libturtle.dll.a -Wl,--major-image-version,0,--minor-image-version,0 -Wl,--whole-archive CMakeFiles/turtle.dir/objects.a -Wl,--no-whole-archive @CMakeFiles/turtle.dir/linkLibs.rsp

# Rule to build all files generated by this target.
turtle/CMakeFiles/turtle.dir/build: build/libturtle.dll
.PHONY : turtle/CMakeFiles/turtle.dir/build

turtle/CMakeFiles/turtle.dir/clean:
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/turtle && $(CMAKE_COMMAND) -P CMakeFiles/turtle.dir/cmake_clean.cmake
.PHONY : turtle/CMakeFiles/turtle.dir/clean

turtle/CMakeFiles/turtle.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" C:/Users/asus/OneDrive/Desktop/project/c_std C:/Users/asus/OneDrive/Desktop/project/c_std/turtle C:/Users/asus/OneDrive/Desktop/project/c_std/build C:/Users/asus/OneDrive/Desktop/project/c_std/build/turtle C:/Users/asus/OneDrive/Desktop/project/c_std/build/turtle/CMakeFiles/turtle.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : turtle/CMakeFiles/turtle.dir/depend

