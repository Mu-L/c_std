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
include random/CMakeFiles/random.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include random/CMakeFiles/random.dir/compiler_depend.make

# Include the progress variables for this target.
include random/CMakeFiles/random.dir/progress.make

# Include the compile flags for this target's objects.
include random/CMakeFiles/random.dir/flags.make

random/CMakeFiles/random.dir/random.c.obj: random/CMakeFiles/random.dir/flags.make
random/CMakeFiles/random.dir/random.c.obj: random/CMakeFiles/random.dir/includes_C.rsp
random/CMakeFiles/random.dir/random.c.obj: C:/Users/asus/OneDrive/Desktop/project/c_std/random/random.c
random/CMakeFiles/random.dir/random.c.obj: random/CMakeFiles/random.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=C:/Users/asus/OneDrive/Desktop/project/c_std/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object random/CMakeFiles/random.dir/random.c.obj"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/random && C:/msys64/mingw64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT random/CMakeFiles/random.dir/random.c.obj -MF CMakeFiles/random.dir/random.c.obj.d -o CMakeFiles/random.dir/random.c.obj -c C:/Users/asus/OneDrive/Desktop/project/c_std/random/random.c

random/CMakeFiles/random.dir/random.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/random.dir/random.c.i"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/random && C:/msys64/mingw64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:/Users/asus/OneDrive/Desktop/project/c_std/random/random.c > CMakeFiles/random.dir/random.c.i

random/CMakeFiles/random.dir/random.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/random.dir/random.c.s"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/random && C:/msys64/mingw64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:/Users/asus/OneDrive/Desktop/project/c_std/random/random.c -o CMakeFiles/random.dir/random.c.s

# Object files for target random
random_OBJECTS = \
"CMakeFiles/random.dir/random.c.obj"

# External object files for target random
random_EXTERNAL_OBJECTS =

build/librandom.dll: random/CMakeFiles/random.dir/random.c.obj
build/librandom.dll: random/CMakeFiles/random.dir/build.make
build/librandom.dll: random/CMakeFiles/random.dir/linkLibs.rsp
build/librandom.dll: random/CMakeFiles/random.dir/objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=C:/Users/asus/OneDrive/Desktop/project/c_std/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library ../build/librandom.dll"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/random && "C:/Program Files/CMake/bin/cmake.exe" -E rm -f CMakeFiles/random.dir/objects.a
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/random && C:/msys64/mingw64/bin/ar.exe qc CMakeFiles/random.dir/objects.a @CMakeFiles/random.dir/objects1.rsp
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/random && C:/msys64/mingw64/bin/gcc.exe  -g -O3 -march=native -funroll-loops -Wall -Wextra -pedantic -Wno-deprecated-declarations -s  -Wl,--enable-auto-import -shared -o ../build/librandom.dll -Wl,--out-implib,librandom.dll.a -Wl,--major-image-version,0,--minor-image-version,0 -Wl,--whole-archive CMakeFiles/random.dir/objects.a -Wl,--no-whole-archive @CMakeFiles/random.dir/linkLibs.rsp

# Rule to build all files generated by this target.
random/CMakeFiles/random.dir/build: build/librandom.dll
.PHONY : random/CMakeFiles/random.dir/build

random/CMakeFiles/random.dir/clean:
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/random && $(CMAKE_COMMAND) -P CMakeFiles/random.dir/cmake_clean.cmake
.PHONY : random/CMakeFiles/random.dir/clean

random/CMakeFiles/random.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" C:/Users/asus/OneDrive/Desktop/project/c_std C:/Users/asus/OneDrive/Desktop/project/c_std/random C:/Users/asus/OneDrive/Desktop/project/c_std/build C:/Users/asus/OneDrive/Desktop/project/c_std/build/random C:/Users/asus/OneDrive/Desktop/project/c_std/build/random/CMakeFiles/random.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : random/CMakeFiles/random.dir/depend
