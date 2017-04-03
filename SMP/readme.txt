
This is a small list of steps in order to build openssl into a msvc DLL and lib file.

The project contains Release and Debug builds for static lib files (Debug/Release)
  as well as dynamic shared dll files (DebugDLL/ReleaseDLL).
Choose whichever project configuration meets your requirements.

*** Building with YASM ***

In order to build gmp using msvc you must first download and install YASM.
YASM is required to compile all gmp assembly files.

1) Visual Studio YASM integration can be downloaded from https://github.com/ShiftMediaProject/VSYASM/releases/latest

2) Once downloaded simply follow the install instructions included in the download.


*** Generating ASM files ***

The build system requires several of the asm files to be built automatically. This should have already been done and the resulting
source files will be found in the SMP\crypto directory. If these files are missing then the project will try and automatically
generate new ones. If the files need to be forced to update then they can be simply deleted which will result in new files
being generated the next time the project is built.

In order for new files to be generated the project needs access to 'perl'. Ensure that perl has been correctly installed and is accessible
by Visual Studio. 