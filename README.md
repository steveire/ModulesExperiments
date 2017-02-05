
Modules test
============

Install CMake version 3.7.2. Earlier versions do not support the Visual Studio "15" generator.

Build and run using:

    mkdir build
    cd build
    cmake .. -G "Visual Studio 15"
    cmake --build .
    Debug/dinnerparty.exe

Expected output:

    In fruit bowl: 1
    In salad bowl: 2

Build system
------------

Note the public and private dependencies between libraries in the buildsystem.
