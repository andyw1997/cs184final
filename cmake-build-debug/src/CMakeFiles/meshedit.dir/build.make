# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/clion/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /opt/clion/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/samz/Documents/School/Graphics/cs184final

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug

# Include any dependencies generated for this target.
include src/CMakeFiles/meshedit.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/meshedit.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/meshedit.dir/flags.make

src/CMakeFiles/meshedit.dir/bezierPatch.cpp.o: src/CMakeFiles/meshedit.dir/flags.make
src/CMakeFiles/meshedit.dir/bezierPatch.cpp.o: ../src/bezierPatch.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/meshedit.dir/bezierPatch.cpp.o"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/meshedit.dir/bezierPatch.cpp.o -c /home/samz/Documents/School/Graphics/cs184final/src/bezierPatch.cpp

src/CMakeFiles/meshedit.dir/bezierPatch.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meshedit.dir/bezierPatch.cpp.i"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/samz/Documents/School/Graphics/cs184final/src/bezierPatch.cpp > CMakeFiles/meshedit.dir/bezierPatch.cpp.i

src/CMakeFiles/meshedit.dir/bezierPatch.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meshedit.dir/bezierPatch.cpp.s"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/samz/Documents/School/Graphics/cs184final/src/bezierPatch.cpp -o CMakeFiles/meshedit.dir/bezierPatch.cpp.s

src/CMakeFiles/meshedit.dir/bezierCurve.cpp.o: src/CMakeFiles/meshedit.dir/flags.make
src/CMakeFiles/meshedit.dir/bezierCurve.cpp.o: ../src/bezierCurve.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/CMakeFiles/meshedit.dir/bezierCurve.cpp.o"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/meshedit.dir/bezierCurve.cpp.o -c /home/samz/Documents/School/Graphics/cs184final/src/bezierCurve.cpp

src/CMakeFiles/meshedit.dir/bezierCurve.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meshedit.dir/bezierCurve.cpp.i"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/samz/Documents/School/Graphics/cs184final/src/bezierCurve.cpp > CMakeFiles/meshedit.dir/bezierCurve.cpp.i

src/CMakeFiles/meshedit.dir/bezierCurve.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meshedit.dir/bezierCurve.cpp.s"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/samz/Documents/School/Graphics/cs184final/src/bezierCurve.cpp -o CMakeFiles/meshedit.dir/bezierCurve.cpp.s

src/CMakeFiles/meshedit.dir/scene.cpp.o: src/CMakeFiles/meshedit.dir/flags.make
src/CMakeFiles/meshedit.dir/scene.cpp.o: ../src/scene.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/CMakeFiles/meshedit.dir/scene.cpp.o"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/meshedit.dir/scene.cpp.o -c /home/samz/Documents/School/Graphics/cs184final/src/scene.cpp

src/CMakeFiles/meshedit.dir/scene.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meshedit.dir/scene.cpp.i"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/samz/Documents/School/Graphics/cs184final/src/scene.cpp > CMakeFiles/meshedit.dir/scene.cpp.i

src/CMakeFiles/meshedit.dir/scene.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meshedit.dir/scene.cpp.s"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/samz/Documents/School/Graphics/cs184final/src/scene.cpp -o CMakeFiles/meshedit.dir/scene.cpp.s

src/CMakeFiles/meshedit.dir/camera.cpp.o: src/CMakeFiles/meshedit.dir/flags.make
src/CMakeFiles/meshedit.dir/camera.cpp.o: ../src/camera.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/CMakeFiles/meshedit.dir/camera.cpp.o"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/meshedit.dir/camera.cpp.o -c /home/samz/Documents/School/Graphics/cs184final/src/camera.cpp

src/CMakeFiles/meshedit.dir/camera.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meshedit.dir/camera.cpp.i"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/samz/Documents/School/Graphics/cs184final/src/camera.cpp > CMakeFiles/meshedit.dir/camera.cpp.i

src/CMakeFiles/meshedit.dir/camera.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meshedit.dir/camera.cpp.s"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/samz/Documents/School/Graphics/cs184final/src/camera.cpp -o CMakeFiles/meshedit.dir/camera.cpp.s

src/CMakeFiles/meshedit.dir/light.cpp.o: src/CMakeFiles/meshedit.dir/flags.make
src/CMakeFiles/meshedit.dir/light.cpp.o: ../src/light.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/CMakeFiles/meshedit.dir/light.cpp.o"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/meshedit.dir/light.cpp.o -c /home/samz/Documents/School/Graphics/cs184final/src/light.cpp

src/CMakeFiles/meshedit.dir/light.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meshedit.dir/light.cpp.i"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/samz/Documents/School/Graphics/cs184final/src/light.cpp > CMakeFiles/meshedit.dir/light.cpp.i

src/CMakeFiles/meshedit.dir/light.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meshedit.dir/light.cpp.s"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/samz/Documents/School/Graphics/cs184final/src/light.cpp -o CMakeFiles/meshedit.dir/light.cpp.s

src/CMakeFiles/meshedit.dir/mesh.cpp.o: src/CMakeFiles/meshedit.dir/flags.make
src/CMakeFiles/meshedit.dir/mesh.cpp.o: ../src/mesh.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/CMakeFiles/meshedit.dir/mesh.cpp.o"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/meshedit.dir/mesh.cpp.o -c /home/samz/Documents/School/Graphics/cs184final/src/mesh.cpp

src/CMakeFiles/meshedit.dir/mesh.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meshedit.dir/mesh.cpp.i"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/samz/Documents/School/Graphics/cs184final/src/mesh.cpp > CMakeFiles/meshedit.dir/mesh.cpp.i

src/CMakeFiles/meshedit.dir/mesh.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meshedit.dir/mesh.cpp.s"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/samz/Documents/School/Graphics/cs184final/src/mesh.cpp -o CMakeFiles/meshedit.dir/mesh.cpp.s

src/CMakeFiles/meshedit.dir/material.cpp.o: src/CMakeFiles/meshedit.dir/flags.make
src/CMakeFiles/meshedit.dir/material.cpp.o: ../src/material.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object src/CMakeFiles/meshedit.dir/material.cpp.o"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/meshedit.dir/material.cpp.o -c /home/samz/Documents/School/Graphics/cs184final/src/material.cpp

src/CMakeFiles/meshedit.dir/material.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meshedit.dir/material.cpp.i"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/samz/Documents/School/Graphics/cs184final/src/material.cpp > CMakeFiles/meshedit.dir/material.cpp.i

src/CMakeFiles/meshedit.dir/material.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meshedit.dir/material.cpp.s"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/samz/Documents/School/Graphics/cs184final/src/material.cpp -o CMakeFiles/meshedit.dir/material.cpp.s

src/CMakeFiles/meshedit.dir/texture.cpp.o: src/CMakeFiles/meshedit.dir/flags.make
src/CMakeFiles/meshedit.dir/texture.cpp.o: ../src/texture.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object src/CMakeFiles/meshedit.dir/texture.cpp.o"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/meshedit.dir/texture.cpp.o -c /home/samz/Documents/School/Graphics/cs184final/src/texture.cpp

src/CMakeFiles/meshedit.dir/texture.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meshedit.dir/texture.cpp.i"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/samz/Documents/School/Graphics/cs184final/src/texture.cpp > CMakeFiles/meshedit.dir/texture.cpp.i

src/CMakeFiles/meshedit.dir/texture.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meshedit.dir/texture.cpp.s"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/samz/Documents/School/Graphics/cs184final/src/texture.cpp -o CMakeFiles/meshedit.dir/texture.cpp.s

src/CMakeFiles/meshedit.dir/collada.cpp.o: src/CMakeFiles/meshedit.dir/flags.make
src/CMakeFiles/meshedit.dir/collada.cpp.o: ../src/collada.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object src/CMakeFiles/meshedit.dir/collada.cpp.o"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/meshedit.dir/collada.cpp.o -c /home/samz/Documents/School/Graphics/cs184final/src/collada.cpp

src/CMakeFiles/meshedit.dir/collada.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meshedit.dir/collada.cpp.i"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/samz/Documents/School/Graphics/cs184final/src/collada.cpp > CMakeFiles/meshedit.dir/collada.cpp.i

src/CMakeFiles/meshedit.dir/collada.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meshedit.dir/collada.cpp.s"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/samz/Documents/School/Graphics/cs184final/src/collada.cpp -o CMakeFiles/meshedit.dir/collada.cpp.s

src/CMakeFiles/meshedit.dir/halfEdgeMesh.cpp.o: src/CMakeFiles/meshedit.dir/flags.make
src/CMakeFiles/meshedit.dir/halfEdgeMesh.cpp.o: ../src/halfEdgeMesh.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object src/CMakeFiles/meshedit.dir/halfEdgeMesh.cpp.o"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/meshedit.dir/halfEdgeMesh.cpp.o -c /home/samz/Documents/School/Graphics/cs184final/src/halfEdgeMesh.cpp

src/CMakeFiles/meshedit.dir/halfEdgeMesh.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meshedit.dir/halfEdgeMesh.cpp.i"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/samz/Documents/School/Graphics/cs184final/src/halfEdgeMesh.cpp > CMakeFiles/meshedit.dir/halfEdgeMesh.cpp.i

src/CMakeFiles/meshedit.dir/halfEdgeMesh.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meshedit.dir/halfEdgeMesh.cpp.s"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/samz/Documents/School/Graphics/cs184final/src/halfEdgeMesh.cpp -o CMakeFiles/meshedit.dir/halfEdgeMesh.cpp.s

src/CMakeFiles/meshedit.dir/student_code.cpp.o: src/CMakeFiles/meshedit.dir/flags.make
src/CMakeFiles/meshedit.dir/student_code.cpp.o: ../src/student_code.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object src/CMakeFiles/meshedit.dir/student_code.cpp.o"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/meshedit.dir/student_code.cpp.o -c /home/samz/Documents/School/Graphics/cs184final/src/student_code.cpp

src/CMakeFiles/meshedit.dir/student_code.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meshedit.dir/student_code.cpp.i"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/samz/Documents/School/Graphics/cs184final/src/student_code.cpp > CMakeFiles/meshedit.dir/student_code.cpp.i

src/CMakeFiles/meshedit.dir/student_code.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meshedit.dir/student_code.cpp.s"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/samz/Documents/School/Graphics/cs184final/src/student_code.cpp -o CMakeFiles/meshedit.dir/student_code.cpp.s

src/CMakeFiles/meshedit.dir/meshEdit.cpp.o: src/CMakeFiles/meshedit.dir/flags.make
src/CMakeFiles/meshedit.dir/meshEdit.cpp.o: ../src/meshEdit.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object src/CMakeFiles/meshedit.dir/meshEdit.cpp.o"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/meshedit.dir/meshEdit.cpp.o -c /home/samz/Documents/School/Graphics/cs184final/src/meshEdit.cpp

src/CMakeFiles/meshedit.dir/meshEdit.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meshedit.dir/meshEdit.cpp.i"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/samz/Documents/School/Graphics/cs184final/src/meshEdit.cpp > CMakeFiles/meshedit.dir/meshEdit.cpp.i

src/CMakeFiles/meshedit.dir/meshEdit.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meshedit.dir/meshEdit.cpp.s"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/samz/Documents/School/Graphics/cs184final/src/meshEdit.cpp -o CMakeFiles/meshedit.dir/meshEdit.cpp.s

src/CMakeFiles/meshedit.dir/main.cpp.o: src/CMakeFiles/meshedit.dir/flags.make
src/CMakeFiles/meshedit.dir/main.cpp.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object src/CMakeFiles/meshedit.dir/main.cpp.o"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/meshedit.dir/main.cpp.o -c /home/samz/Documents/School/Graphics/cs184final/src/main.cpp

src/CMakeFiles/meshedit.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meshedit.dir/main.cpp.i"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/samz/Documents/School/Graphics/cs184final/src/main.cpp > CMakeFiles/meshedit.dir/main.cpp.i

src/CMakeFiles/meshedit.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meshedit.dir/main.cpp.s"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/samz/Documents/School/Graphics/cs184final/src/main.cpp -o CMakeFiles/meshedit.dir/main.cpp.s

src/CMakeFiles/meshedit.dir/png.cpp.o: src/CMakeFiles/meshedit.dir/flags.make
src/CMakeFiles/meshedit.dir/png.cpp.o: ../src/png.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object src/CMakeFiles/meshedit.dir/png.cpp.o"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/meshedit.dir/png.cpp.o -c /home/samz/Documents/School/Graphics/cs184final/src/png.cpp

src/CMakeFiles/meshedit.dir/png.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meshedit.dir/png.cpp.i"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/samz/Documents/School/Graphics/cs184final/src/png.cpp > CMakeFiles/meshedit.dir/png.cpp.i

src/CMakeFiles/meshedit.dir/png.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meshedit.dir/png.cpp.s"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/samz/Documents/School/Graphics/cs184final/src/png.cpp -o CMakeFiles/meshedit.dir/png.cpp.s

# Object files for target meshedit
meshedit_OBJECTS = \
"CMakeFiles/meshedit.dir/bezierPatch.cpp.o" \
"CMakeFiles/meshedit.dir/bezierCurve.cpp.o" \
"CMakeFiles/meshedit.dir/scene.cpp.o" \
"CMakeFiles/meshedit.dir/camera.cpp.o" \
"CMakeFiles/meshedit.dir/light.cpp.o" \
"CMakeFiles/meshedit.dir/mesh.cpp.o" \
"CMakeFiles/meshedit.dir/material.cpp.o" \
"CMakeFiles/meshedit.dir/texture.cpp.o" \
"CMakeFiles/meshedit.dir/collada.cpp.o" \
"CMakeFiles/meshedit.dir/halfEdgeMesh.cpp.o" \
"CMakeFiles/meshedit.dir/student_code.cpp.o" \
"CMakeFiles/meshedit.dir/meshEdit.cpp.o" \
"CMakeFiles/meshedit.dir/main.cpp.o" \
"CMakeFiles/meshedit.dir/png.cpp.o"

# External object files for target meshedit
meshedit_EXTERNAL_OBJECTS =

meshedit: src/CMakeFiles/meshedit.dir/bezierPatch.cpp.o
meshedit: src/CMakeFiles/meshedit.dir/bezierCurve.cpp.o
meshedit: src/CMakeFiles/meshedit.dir/scene.cpp.o
meshedit: src/CMakeFiles/meshedit.dir/camera.cpp.o
meshedit: src/CMakeFiles/meshedit.dir/light.cpp.o
meshedit: src/CMakeFiles/meshedit.dir/mesh.cpp.o
meshedit: src/CMakeFiles/meshedit.dir/material.cpp.o
meshedit: src/CMakeFiles/meshedit.dir/texture.cpp.o
meshedit: src/CMakeFiles/meshedit.dir/collada.cpp.o
meshedit: src/CMakeFiles/meshedit.dir/halfEdgeMesh.cpp.o
meshedit: src/CMakeFiles/meshedit.dir/student_code.cpp.o
meshedit: src/CMakeFiles/meshedit.dir/meshEdit.cpp.o
meshedit: src/CMakeFiles/meshedit.dir/main.cpp.o
meshedit: src/CMakeFiles/meshedit.dir/png.cpp.o
meshedit: src/CMakeFiles/meshedit.dir/build.make
meshedit: CGL/src/libCGL.a
meshedit: CGL/deps/glew/libglew.a
meshedit: CGL/deps/glfw/src/libglfw3.a
meshedit: /usr/lib/libX11.so
meshedit: /usr/lib/libXrandr.so
meshedit: /usr/lib/libXinerama.so
meshedit: /usr/lib/libXi.so
meshedit: /usr/lib/libXxf86vm.so
meshedit: /usr/lib/librt.so
meshedit: /usr/lib/libm.so
meshedit: /usr/lib/libXcursor.so
meshedit: /usr/lib/libGL.so
meshedit: /usr/lib/libGL.so
meshedit: /usr/lib/libGLU.so
meshedit: /usr/lib/libfreetype.so
meshedit: ../src/dirent/glut32.lib
meshedit: src/CMakeFiles/meshedit.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Linking CXX executable ../meshedit"
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/meshedit.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/meshedit.dir/build: meshedit

.PHONY : src/CMakeFiles/meshedit.dir/build

src/CMakeFiles/meshedit.dir/clean:
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src && $(CMAKE_COMMAND) -P CMakeFiles/meshedit.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/meshedit.dir/clean

src/CMakeFiles/meshedit.dir/depend:
	cd /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/samz/Documents/School/Graphics/cs184final /home/samz/Documents/School/Graphics/cs184final/src /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src /home/samz/Documents/School/Graphics/cs184final/cmake-build-debug/src/CMakeFiles/meshedit.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/meshedit.dir/depend

