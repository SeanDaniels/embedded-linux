# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Produce verbose output by default.
VERBOSE = 1

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pi/embedded-linux/projects/p3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/embedded-linux/projects/p3

# Include any dependencies generated for this target.
include src/CMakeFiles/istool1.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/istool1.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/istool1.dir/flags.make

src/CMakeFiles/istool1.dir/keyboard.c.o: src/CMakeFiles/istool1.dir/flags.make
src/CMakeFiles/istool1.dir/keyboard.c.o: src/keyboard.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/embedded-linux/projects/p3/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/CMakeFiles/istool1.dir/keyboard.c.o"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/istool1.dir/keyboard.c.o   -c /home/pi/embedded-linux/projects/p3/src/keyboard.c

src/CMakeFiles/istool1.dir/keyboard.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/istool1.dir/keyboard.c.i"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/embedded-linux/projects/p3/src/keyboard.c > CMakeFiles/istool1.dir/keyboard.c.i

src/CMakeFiles/istool1.dir/keyboard.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/istool1.dir/keyboard.c.s"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/embedded-linux/projects/p3/src/keyboard.c -o CMakeFiles/istool1.dir/keyboard.c.s

src/CMakeFiles/istool1.dir/is_options.c.o: src/CMakeFiles/istool1.dir/flags.make
src/CMakeFiles/istool1.dir/is_options.c.o: src/is_options.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/embedded-linux/projects/p3/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/CMakeFiles/istool1.dir/is_options.c.o"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/istool1.dir/is_options.c.o   -c /home/pi/embedded-linux/projects/p3/src/is_options.c

src/CMakeFiles/istool1.dir/is_options.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/istool1.dir/is_options.c.i"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/embedded-linux/projects/p3/src/is_options.c > CMakeFiles/istool1.dir/is_options.c.i

src/CMakeFiles/istool1.dir/is_options.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/istool1.dir/is_options.c.s"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/embedded-linux/projects/p3/src/is_options.c -o CMakeFiles/istool1.dir/is_options.c.s

src/CMakeFiles/istool1.dir/buffer_demo_base.c.o: src/CMakeFiles/istool1.dir/flags.make
src/CMakeFiles/istool1.dir/buffer_demo_base.c.o: src/buffer_demo_base.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/embedded-linux/projects/p3/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object src/CMakeFiles/istool1.dir/buffer_demo_base.c.o"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/istool1.dir/buffer_demo_base.c.o   -c /home/pi/embedded-linux/projects/p3/src/buffer_demo_base.c

src/CMakeFiles/istool1.dir/buffer_demo_base.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/istool1.dir/buffer_demo_base.c.i"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/embedded-linux/projects/p3/src/buffer_demo_base.c > CMakeFiles/istool1.dir/buffer_demo_base.c.i

src/CMakeFiles/istool1.dir/buffer_demo_base.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/istool1.dir/buffer_demo_base.c.s"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/embedded-linux/projects/p3/src/buffer_demo_base.c -o CMakeFiles/istool1.dir/buffer_demo_base.c.s

src/CMakeFiles/istool1.dir/yuv.c.o: src/CMakeFiles/istool1.dir/flags.make
src/CMakeFiles/istool1.dir/yuv.c.o: src/yuv.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/embedded-linux/projects/p3/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object src/CMakeFiles/istool1.dir/yuv.c.o"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/istool1.dir/yuv.c.o   -c /home/pi/embedded-linux/projects/p3/src/yuv.c

src/CMakeFiles/istool1.dir/yuv.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/istool1.dir/yuv.c.i"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/embedded-linux/projects/p3/src/yuv.c > CMakeFiles/istool1.dir/yuv.c.i

src/CMakeFiles/istool1.dir/yuv.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/istool1.dir/yuv.c.s"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/embedded-linux/projects/p3/src/yuv.c -o CMakeFiles/istool1.dir/yuv.c.s

src/CMakeFiles/istool1.dir/video_callback.c.o: src/CMakeFiles/istool1.dir/flags.make
src/CMakeFiles/istool1.dir/video_callback.c.o: src/video_callback.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/embedded-linux/projects/p3/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object src/CMakeFiles/istool1.dir/video_callback.c.o"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/istool1.dir/video_callback.c.o   -c /home/pi/embedded-linux/projects/p3/src/video_callback.c

src/CMakeFiles/istool1.dir/video_callback.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/istool1.dir/video_callback.c.i"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/embedded-linux/projects/p3/src/video_callback.c > CMakeFiles/istool1.dir/video_callback.c.i

src/CMakeFiles/istool1.dir/video_callback.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/istool1.dir/video_callback.c.s"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/embedded-linux/projects/p3/src/video_callback.c -o CMakeFiles/istool1.dir/video_callback.c.s

src/CMakeFiles/istool1.dir/sccb_bus.c.o: src/CMakeFiles/istool1.dir/flags.make
src/CMakeFiles/istool1.dir/sccb_bus.c.o: src/sccb_bus.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/embedded-linux/projects/p3/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object src/CMakeFiles/istool1.dir/sccb_bus.c.o"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/istool1.dir/sccb_bus.c.o   -c /home/pi/embedded-linux/projects/p3/src/sccb_bus.c

src/CMakeFiles/istool1.dir/sccb_bus.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/istool1.dir/sccb_bus.c.i"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/embedded-linux/projects/p3/src/sccb_bus.c > CMakeFiles/istool1.dir/sccb_bus.c.i

src/CMakeFiles/istool1.dir/sccb_bus.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/istool1.dir/sccb_bus.c.s"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/embedded-linux/projects/p3/src/sccb_bus.c -o CMakeFiles/istool1.dir/sccb_bus.c.s

src/CMakeFiles/istool1.dir/PCA9685_servo_driver.c.o: src/CMakeFiles/istool1.dir/flags.make
src/CMakeFiles/istool1.dir/PCA9685_servo_driver.c.o: src/PCA9685_servo_driver.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/embedded-linux/projects/p3/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object src/CMakeFiles/istool1.dir/PCA9685_servo_driver.c.o"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/istool1.dir/PCA9685_servo_driver.c.o   -c /home/pi/embedded-linux/projects/p3/src/PCA9685_servo_driver.c

src/CMakeFiles/istool1.dir/PCA9685_servo_driver.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/istool1.dir/PCA9685_servo_driver.c.i"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/embedded-linux/projects/p3/src/PCA9685_servo_driver.c > CMakeFiles/istool1.dir/PCA9685_servo_driver.c.i

src/CMakeFiles/istool1.dir/PCA9685_servo_driver.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/istool1.dir/PCA9685_servo_driver.c.s"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/embedded-linux/projects/p3/src/PCA9685_servo_driver.c -o CMakeFiles/istool1.dir/PCA9685_servo_driver.c.s

src/CMakeFiles/istool1.dir/bcm283x_board_driver.c.o: src/CMakeFiles/istool1.dir/flags.make
src/CMakeFiles/istool1.dir/bcm283x_board_driver.c.o: src/bcm283x_board_driver.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/embedded-linux/projects/p3/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object src/CMakeFiles/istool1.dir/bcm283x_board_driver.c.o"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/istool1.dir/bcm283x_board_driver.c.o   -c /home/pi/embedded-linux/projects/p3/src/bcm283x_board_driver.c

src/CMakeFiles/istool1.dir/bcm283x_board_driver.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/istool1.dir/bcm283x_board_driver.c.i"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/embedded-linux/projects/p3/src/bcm283x_board_driver.c > CMakeFiles/istool1.dir/bcm283x_board_driver.c.i

src/CMakeFiles/istool1.dir/bcm283x_board_driver.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/istool1.dir/bcm283x_board_driver.c.s"
	cd /home/pi/embedded-linux/projects/p3/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/embedded-linux/projects/p3/src/bcm283x_board_driver.c -o CMakeFiles/istool1.dir/bcm283x_board_driver.c.s

# Object files for target istool1
istool1_OBJECTS = \
"CMakeFiles/istool1.dir/keyboard.c.o" \
"CMakeFiles/istool1.dir/is_options.c.o" \
"CMakeFiles/istool1.dir/buffer_demo_base.c.o" \
"CMakeFiles/istool1.dir/yuv.c.o" \
"CMakeFiles/istool1.dir/video_callback.c.o" \
"CMakeFiles/istool1.dir/sccb_bus.c.o" \
"CMakeFiles/istool1.dir/PCA9685_servo_driver.c.o" \
"CMakeFiles/istool1.dir/bcm283x_board_driver.c.o"

# External object files for target istool1
istool1_EXTERNAL_OBJECTS =

bin/istool1: src/CMakeFiles/istool1.dir/keyboard.c.o
bin/istool1: src/CMakeFiles/istool1.dir/is_options.c.o
bin/istool1: src/CMakeFiles/istool1.dir/buffer_demo_base.c.o
bin/istool1: src/CMakeFiles/istool1.dir/yuv.c.o
bin/istool1: src/CMakeFiles/istool1.dir/video_callback.c.o
bin/istool1: src/CMakeFiles/istool1.dir/sccb_bus.c.o
bin/istool1: src/CMakeFiles/istool1.dir/PCA9685_servo_driver.c.o
bin/istool1: src/CMakeFiles/istool1.dir/bcm283x_board_driver.c.o
bin/istool1: src/CMakeFiles/istool1.dir/build.make
bin/istool1: src/CMakeFiles/istool1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/embedded-linux/projects/p3/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking C executable ../bin/istool1"
	cd /home/pi/embedded-linux/projects/p3/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/istool1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/istool1.dir/build: bin/istool1

.PHONY : src/CMakeFiles/istool1.dir/build

src/CMakeFiles/istool1.dir/clean:
	cd /home/pi/embedded-linux/projects/p3/src && $(CMAKE_COMMAND) -P CMakeFiles/istool1.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/istool1.dir/clean

src/CMakeFiles/istool1.dir/depend:
	cd /home/pi/embedded-linux/projects/p3 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/embedded-linux/projects/p3 /home/pi/embedded-linux/projects/p3/src /home/pi/embedded-linux/projects/p3 /home/pi/embedded-linux/projects/p3/src /home/pi/embedded-linux/projects/p3/src/CMakeFiles/istool1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/istool1.dir/depend

