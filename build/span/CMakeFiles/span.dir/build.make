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
include span/CMakeFiles/span.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include span/CMakeFiles/span.dir/compiler_depend.make

# Include the progress variables for this target.
include span/CMakeFiles/span.dir/progress.make

# Include the compile flags for this target's objects.
include span/CMakeFiles/span.dir/flags.make

span/CMakeFiles/span.dir/span.c.obj: span/CMakeFiles/span.dir/flags.make
span/CMakeFiles/span.dir/span.c.obj: span/CMakeFiles/span.dir/includes_C.rsp
span/CMakeFiles/span.dir/span.c.obj: C:/Users/asus/OneDrive/Desktop/project/c_std/span/span.c
span/CMakeFiles/span.dir/span.c.obj: span/CMakeFiles/span.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=C:/Users/asus/OneDrive/Desktop/project/c_std/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object span/CMakeFiles/span.dir/span.c.obj"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/span && C:/msys64/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT span/CMakeFiles/span.dir/span.c.obj -MF CMakeFiles/span.dir/span.c.obj.d -o CMakeFiles/span.dir/span.c.obj -c C:/Users/asus/OneDrive/Desktop/project/c_std/span/span.c

span/CMakeFiles/span.dir/span.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/span.dir/span.c.i"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/span && C:/msys64/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:/Users/asus/OneDrive/Desktop/project/c_std/span/span.c > CMakeFiles/span.dir/span.c.i

span/CMakeFiles/span.dir/span.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/span.dir/span.c.s"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/span && C:/msys64/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:/Users/asus/OneDrive/Desktop/project/c_std/span/span.c -o CMakeFiles/span.dir/span.c.s

# Object files for target span
span_OBJECTS = \
"CMakeFiles/span.dir/span.c.obj"

# External object files for target span
span_EXTERNAL_OBJECTS =

build/libspan.dll: span/CMakeFiles/span.dir/span.c.obj
build/libspan.dll: span/CMakeFiles/span.dir/build.make
build/libspan.dll: fmt/libfmt.dll.a
build/libspan.dll: encoding/libencoding.dll.a
build/libspan.dll: string/libstdstring.dll.a
build/libspan.dll: span/CMakeFiles/span.dir/linkLibs.rsp
build/libspan.dll: span/CMakeFiles/span.dir/objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=C:/Users/asus/OneDrive/Desktop/project/c_std/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library ../build/libspan.dll"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/span && "C:/Program Files/CMake/bin/cmake.exe" -E rm -f CMakeFiles/span.dir/objects.a
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/span && C:/msys64/mingw64/bin/ar.exe qc CMakeFiles/span.dir/objects.a @CMakeFiles/span.dir/objects1.rsp
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/span && C:/msys64/mingw64/bin/cc.exe  -g  -O3 -march=native -funroll-loops -Wall -Wextra -pedantic -Wno-deprecated-declarations -s  -Wl,--enable-auto-import -shared -o ../build/libspan.dll -Wl,--out-implib,libspan.dll.a -Wl,--major-image-version,0,--minor-image-version,0 -Wl,--whole-archive CMakeFiles/span.dir/objects.a -Wl,--no-whole-archive @CMakeFiles/span.dir/linkLibs.rsp

# Rule to build all files generated by this target.
span/CMakeFiles/span.dir/build: build/libspan.dll
.PHONY : span/CMakeFiles/span.dir/build

span/CMakeFiles/span.dir/clean:
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/span && $(CMAKE_COMMAND) -P CMakeFiles/span.dir/cmake_clean.cmake
.PHONY : span/CMakeFiles/span.dir/clean

span/CMakeFiles/span.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" C:/Users/asus/OneDrive/Desktop/project/c_std C:/Users/asus/OneDrive/Desktop/project/c_std/span C:/Users/asus/OneDrive/Desktop/project/c_std/build C:/Users/asus/OneDrive/Desktop/project/c_std/build/span C:/Users/asus/OneDrive/Desktop/project/c_std/build/span/CMakeFiles/span.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : span/CMakeFiles/span.dir/depend

