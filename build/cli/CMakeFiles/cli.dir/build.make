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
include cli/CMakeFiles/cli.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include cli/CMakeFiles/cli.dir/compiler_depend.make

# Include the progress variables for this target.
include cli/CMakeFiles/cli.dir/progress.make

# Include the compile flags for this target's objects.
include cli/CMakeFiles/cli.dir/flags.make

cli/CMakeFiles/cli.dir/cli.c.obj: cli/CMakeFiles/cli.dir/flags.make
cli/CMakeFiles/cli.dir/cli.c.obj: cli/CMakeFiles/cli.dir/includes_C.rsp
cli/CMakeFiles/cli.dir/cli.c.obj: C:/Users/asus/OneDrive/Desktop/project/c_std/cli/cli.c
cli/CMakeFiles/cli.dir/cli.c.obj: cli/CMakeFiles/cli.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=C:/Users/asus/OneDrive/Desktop/project/c_std/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object cli/CMakeFiles/cli.dir/cli.c.obj"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/cli && C:/msys64/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT cli/CMakeFiles/cli.dir/cli.c.obj -MF CMakeFiles/cli.dir/cli.c.obj.d -o CMakeFiles/cli.dir/cli.c.obj -c C:/Users/asus/OneDrive/Desktop/project/c_std/cli/cli.c

cli/CMakeFiles/cli.dir/cli.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/cli.dir/cli.c.i"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/cli && C:/msys64/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:/Users/asus/OneDrive/Desktop/project/c_std/cli/cli.c > CMakeFiles/cli.dir/cli.c.i

cli/CMakeFiles/cli.dir/cli.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/cli.dir/cli.c.s"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/cli && C:/msys64/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:/Users/asus/OneDrive/Desktop/project/c_std/cli/cli.c -o CMakeFiles/cli.dir/cli.c.s

# Object files for target cli
cli_OBJECTS = \
"CMakeFiles/cli.dir/cli.c.obj"

# External object files for target cli
cli_EXTERNAL_OBJECTS =

build/libcli.dll: cli/CMakeFiles/cli.dir/cli.c.obj
build/libcli.dll: cli/CMakeFiles/cli.dir/build.make
build/libcli.dll: fmt/libfmt.dll.a
build/libcli.dll: string/libstdstring.dll.a
build/libcli.dll: encoding/libencoding.dll.a
build/libcli.dll: cli/CMakeFiles/cli.dir/linkLibs.rsp
build/libcli.dll: cli/CMakeFiles/cli.dir/objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=C:/Users/asus/OneDrive/Desktop/project/c_std/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library ../build/libcli.dll"
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/cli && "C:/Program Files/CMake/bin/cmake.exe" -E rm -f CMakeFiles/cli.dir/objects.a
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/cli && C:/msys64/mingw64/bin/ar.exe qc CMakeFiles/cli.dir/objects.a @CMakeFiles/cli.dir/objects1.rsp
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/cli && C:/msys64/mingw64/bin/cc.exe  -g  -O3 -march=native -funroll-loops -Wall -Wextra -pedantic -Wno-deprecated-declarations -s  -Wl,--enable-auto-import -shared -o ../build/libcli.dll -Wl,--out-implib,libcli.dll.a -Wl,--major-image-version,0,--minor-image-version,0 -Wl,--whole-archive CMakeFiles/cli.dir/objects.a -Wl,--no-whole-archive @CMakeFiles/cli.dir/linkLibs.rsp

# Rule to build all files generated by this target.
cli/CMakeFiles/cli.dir/build: build/libcli.dll
.PHONY : cli/CMakeFiles/cli.dir/build

cli/CMakeFiles/cli.dir/clean:
	cd C:/Users/asus/OneDrive/Desktop/project/c_std/build/cli && $(CMAKE_COMMAND) -P CMakeFiles/cli.dir/cmake_clean.cmake
.PHONY : cli/CMakeFiles/cli.dir/clean

cli/CMakeFiles/cli.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" C:/Users/asus/OneDrive/Desktop/project/c_std C:/Users/asus/OneDrive/Desktop/project/c_std/cli C:/Users/asus/OneDrive/Desktop/project/c_std/build C:/Users/asus/OneDrive/Desktop/project/c_std/build/cli C:/Users/asus/OneDrive/Desktop/project/c_std/build/cli/CMakeFiles/cli.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : cli/CMakeFiles/cli.dir/depend

