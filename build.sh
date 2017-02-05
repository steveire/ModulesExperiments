#!/bin/bash
CLANG_EXE=clang++

set -x

ABSTRACTFRUIT_COMPILE_FLAGS="-Dabstractfruit_EXPORTS -fPIC -fvisibility=hidden"
$CLANG_EXE $ABSTRACTFRUIT_COMPILE_FLAGS -o AbstractFruit.cpp.o -c AbstractFruit.cpp
$CLANG_EXE -fPIC -shared -o libabstractfruit.so AbstractFruit.cpp.o

FRUITSALAD_COMPILE_FLAGS="-Dfruitsalad_EXPORTS -fPIC -fvisibility=hidden"
$CLANG_EXE $FRUITSALAD_COMPILE_FLAGS -o Apple.cpp.o -c Apple.cpp
$CLANG_EXE $FRUITSALAD_COMPILE_FLAGS -o Grape.cpp.o -c Grape.cpp
$CLANG_EXE -fPIC -shared -o libfruitsalad.so Apple.cpp.o Grape.cpp.o libabstractfruit.so

NOTFRUITSALAD_COMPILE_FLAGS="-Dnotfruitsalad_EXPORTS -fPIC -fvisibility=hidden"
$CLANG_EXE $NOTFRUITSALAD_COMPILE_FLAGS -o Tomato.cpp.o -c Tomato.cpp
$CLANG_EXE -fPIC -shared -o libnotfruitsalad.so Tomato.cpp.o libabstractfruit.so

BOWLS_COMPILE_FLAGS="-Dbowls_EXPORTS -fPIC -fvisibility=hidden"
$CLANG_EXE $BOWLS_COMPILE_FLAGS -o AbstractBowl.cpp.o -c AbstractBowl.cpp
$CLANG_EXE $BOWLS_COMPILE_FLAGS -o FruitBowl.cpp.o -c FruitBowl.cpp
$CLANG_EXE $BOWLS_COMPILE_FLAGS -o SaladBowl.cpp.o -c SaladBowl.cpp
$CLANG_EXE -fPIC -shared -o libbowls.so AbstractBowl.cpp.o FruitBowl.cpp.o SaladBowl.cpp.o libfruitsalad.so libabstractfruit.so


DINNERPARTY_COMPILE_FLAGS="-fPIC"
$CLANG_EXE $DINNERPARTY_COMPILE_FLAGS -o dinnerparty.cpp.o -c dinnerparty.cpp
$CLANG_EXE dinnerparty.cpp.o -o dinnerparty libnotfruitsalad.so libbowls.so libfruitsalad.so libabstractfruit.so
