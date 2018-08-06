#!/bin/bash
CLANG_EXE=clang++

set -x

# Shouldn't need this, but clang warns otherwise
DISABLE_PRAGMA_WARNING="-Wno-pragma-once-outside-header"

# Shouldn't need this, but clang reports errors without it.
STD_VISIBILITY_FLAGS="-fvisibility=hidden"

# We simply take all pcm.o files generated and put them on the link lines in case any of them contain implementation of inline methods


$CLANG_EXE -std=c++17 -o std.pcm -fmodules -fno-implicit-module-maps -fno-implicit-modules -Xclang -fmodules-codegen -Xclang -emit-module -xc++ -fmodule-name=std $STD_VISIBILITY_FLAGS -c std.cppmap
$CLANG_EXE -std=c++17 -o std.pcm.o -fmodules -fno-implicit-module-maps -fno-implicit-modules $STD_VISIBILITY_FLAGS -c std.pcm

ABSTRACT_FRUIT_COMPILE_FLAGS="-Dabstractfruit_EXPORTS -fPIC -fvisibility=hidden"
$CLANG_EXE -std=c++17 -fmodules-ts -Xclang -fmodules-codegen --precompile $ABSTRACT_FRUIT_COMPILE_FLAGS $DISABLE_PRAGMA_WARNING -c AbstractFruit.cppm
$CLANG_EXE -std=c++17 -fmodules-ts $ABSTRACT_FRUIT_COMPILE_FLAGS -o AbstractFruit.pcm.o -c AbstractFruit.pcm
$CLANG_EXE -std=c++17 -fmodules-ts $ABSTRACT_FRUIT_COMPILE_FLAGS -o AbstractFruit.cpp.o -fmodule-file=AbstractFruit.pcm -c AbstractFruit.cpp
$CLANG_EXE -fPIC -shared -o libabstractfruit.so AbstractFruit.cpp.o AbstractFruit.pcm.o

FRUITSALAD_COMPILE_FLAGS="-Dfruitsalad_EXPORTS -fPIC -fvisibility=hidden"
$CLANG_EXE -std=c++17 -fmodules-ts -Xclang -fmodules-codegen --precompile $FRUITSALAD_COMPILE_FLAGS $DISABLE_PRAGMA_WARNING -c Apple.cppm -fmodule-file=AbstractFruit.pcm
$CLANG_EXE -std=c++17 -fmodules-ts -Xclang -fmodules-codegen --precompile $FRUITSALAD_COMPILE_FLAGS $DISABLE_PRAGMA_WARNING -c Grape.cppm -fmodule-file=AbstractFruit.pcm
$CLANG_EXE -std=c++17 -fmodules-ts $FRUITSALAD_COMPILE_FLAGS -o Apple.pcm.o -c Apple.pcm
$CLANG_EXE -std=c++17 -fmodules-ts $FRUITSALAD_COMPILE_FLAGS -o Grape.pcm.o -c Grape.pcm
$CLANG_EXE -std=c++17 -fmodules-ts $FRUITSALAD_COMPILE_FLAGS -o Apple.cpp.o -fmodule-file=Apple.pcm -c Apple.cpp
$CLANG_EXE -std=c++17 -fmodules-ts $FRUITSALAD_COMPILE_FLAGS -o Grape.cpp.o -fmodule-file=Grape.pcm -c Grape.cpp
$CLANG_EXE -fPIC -shared -o libfruitsalad.so Apple.cpp.o Grape.cpp.o Apple.pcm.o Grape.pcm.o libabstractfruit.so

NOTFRUITSALAD_COMPILE_FLAGS="-Dnotfruitsalad_EXPORTS -fPIC -fvisibility=hidden"
$CLANG_EXE -std=c++17 -fmodules-ts -Xclang -fmodules-codegen --precompile $NOTFRUITSALAD_COMPILE_FLAGS $DISABLE_PRAGMA_WARNING -c Tomato.cppm -fmodule-file=AbstractFruit.pcm
$CLANG_EXE -std=c++17 -fmodules-ts $NOTFRUITSALAD_COMPILE_FLAGS -o Tomato.pcm.o -c Tomato.pcm
$CLANG_EXE -std=c++17 -fmodules-ts $NOTFRUITSALAD_COMPILE_FLAGS -o Tomato.cpp.o -fmodule-file=Tomato.pcm -c Tomato.cpp
$CLANG_EXE -fPIC -shared -o libnotfruitsalad.so Tomato.cpp.o Tomato.pcm.o libabstractfruit.so

BOWLS_COMPILE_FLAGS="-Dbowls_EXPORTS -fPIC -fvisibility=hidden"
$CLANG_EXE -std=c++17 -fmodules-ts -Xclang -fmodules-codegen --precompile $BOWLS_COMPILE_FLAGS $DISABLE_PRAGMA_WARNING -fmodule-file=AbstractFruit.pcm -fmodule-file=std.pcm -c AbstractBowl.cppm
$CLANG_EXE -std=c++17 -fmodules-ts -Xclang -fmodules-codegen --precompile $BOWLS_COMPILE_FLAGS $DISABLE_PRAGMA_WARNING -fmodule-file=AbstractBowl.pcm -c FruitBowl.cppm
$CLANG_EXE -std=c++17 -fmodules-ts -Xclang -fmodules-codegen --precompile $BOWLS_COMPILE_FLAGS $DISABLE_PRAGMA_WARNING -fmodule-file=AbstractBowl.pcm -fmodule-file=AbstractFruit.pcm -c SaladBowl.cppm
$CLANG_EXE -std=c++17 -fmodules-ts $BOWLS_COMPILE_FLAGS -o AbstractBowl.pcm.o -c AbstractBowl.pcm
$CLANG_EXE -std=c++17 -fmodules-ts $BOWLS_COMPILE_FLAGS -o FruitBowl.pcm.o -c FruitBowl.pcm
$CLANG_EXE -std=c++17 -fmodules-ts $BOWLS_COMPILE_FLAGS -o SaladBowl.pcm.o -c SaladBowl.pcm
$CLANG_EXE -std=c++17 -fmodules-ts $BOWLS_COMPILE_FLAGS -o AbstractBowl.cpp.o -fmodule-file=AbstractBowl.pcm -c AbstractBowl.cpp
$CLANG_EXE -std=c++17 -fmodules-ts $BOWLS_COMPILE_FLAGS -o FruitBowl.cpp.o -fmodule-file=FruitBowl.pcm -fmodule-file=Apple.pcm -fmodule-file=Grape.pcm -c FruitBowl.cpp
$CLANG_EXE -std=c++17 -fmodules-ts $BOWLS_COMPILE_FLAGS -o SaladBowl.cpp.o -fmodule-file=SaladBowl.pcm -fmodule-file=AbstractFruit.pcm -c SaladBowl.cpp
# NOTE: Need to list AbstractBowl.pcm.o here for AbstractBowl::size, which is inline.
$CLANG_EXE -fPIC -shared -o libbowls.so AbstractBowl.cpp.o FruitBowl.cpp.o SaladBowl.cpp.o AbstractBowl.pcm.o FruitBowl.pcm.o SaladBowl.pcm.o libfruitsalad.so libabstractfruit.so

# Should not be needed for dinnerparty - Clang bug
HIDDEN_VISIBILITY_FLAG="-fvisibility=hidden"

DINNERPARTY_COMPILE_FLAGS="-fPIC"
$CLANG_EXE -std=c++17 -fmodules-ts $DINNERPARTY_COMPILE_FLAGS $HIDDEN_VISIBILITY_FLAG \
  -fmodule-file=Tomato.pcm -fmodule-file=FruitBowl.pcm -fmodule-file=SaladBowl.pcm \
  -o dinnerparty.cpp.o -c dinnerparty.cpp
$CLANG_EXE dinnerparty.cpp.o -o dinnerparty libnotfruitsalad.so libbowls.so libfruitsalad.so libabstractfruit.so
