@echo off
rem This must be run from Developer Command Prompt or by initializing current using vcvarsall.bat. I'm not sure
rem how it can be referenced in a general way, so this is just an example where you might be able to find it.
rem call "c:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat" x64

rem '/module:interface' tells compiler to compile file as module interface file
rem '/module:output <module interface file path>' will write module interface file into specific location
rem '/module:reference <module interface file path>' will reference single module interface file
rem '/module:search <directory>' will search for module interface files in given directory
rem '/module:export <source file path>' Helper for automatically creating module interface file to source file.
rem '/module:name <ModuleName>' Set module name of module in automatically created module interface file.
rem '/module:wrapper <header file path>' Possibly variation of /module:export for headers.
rem '/module:exportActiveMacros' Creates wrapper header with an import and macros.
rem '/module:exportMacro <macro name>' For selective version of /module:exportActiveMacros
rem '/module:stdIfcDir <path to standard ifc directory>' For working with standard library modules.
rem Module definition name in code doesn't need to match file names.

rem .ixx extension is required by cl.exe
rem /MD and /EHsc required to use standard library modules bundled with visual studio, otherwise we get warnings about compile flags not matching.

rem Note: You can also reference each ifc separately, it's just easier to use search path instead. Problems with dependencies between ifc-s still apply.

set flags_common=/nologo /c /std:c++latest /experimental:module /module:search ifc\ /MD /EHsc

if not exist bin mkdir bin
if not exist ifc mkdir ifc
if not exist obj mkdir obj

rem In theory, it should be possible to re-export and hide the fact that there is no std module. Unfortunately, it doesn't seem to work right on MSVC.
rem I think it's because the compiler detects module name starting with 'std' and ignores normal module references and uses /module:stdIfcDir instead.
rem When I copied std.ifc to MSVC dir with std.core.ifc and other ifc-s, it worked as expected. Specifying /module:stdIfcDir will overwrite default
rem location and I'm not sure it's possible to just append an extra path to it.
cl %flags_common% /module:interface /module:output ifc\std.ifc /Fo: obj\std.ifc.obj std.ixx

cl %flags_common% /Dabstractfruit_EXPORTS /module:interface /module:output ifc\AbstractFruit.ifc /Fo: obj\AbstractFruit.ifc.obj AbstractFruit.ixx

cl %flags_common% /Dfruitsalad_EXPORTS    /module:interface /module:output ifc\Apple.ifc /Fo: obj\Apple.ifc.obj Apple.ixx
cl %flags_common% /Dfruitsalad_EXPORTS    /module:interface /module:output ifc\Grape.ifc /Fo: obj\Grape.ifc.obj Grape.ixx

cl %flags_common% /Dnotfruitsalad_EXPORTS /module:interface /module:output ifc\Tomato.ifc /Fo: obj\Tomato.ifc.obj Tomato.ixx

cl %flags_common% /Dbowls_EXPORTS         /module:interface /module:output ifc\AbstractBowl.ifc /Fo: obj\AbstractBowl.ifc.obj AbstractBowl.ixx
cl %flags_common% /Dbowls_EXPORTS         /module:interface /module:output ifc\FruitBowl.ifc    /Fo: obj\FruitBowl.ifc.obj    FruitBowl.ixx
cl %flags_common% /Dbowls_EXPORTS         /module:interface /module:output ifc\SaladBowl.ifc    /Fo: obj\SaladBowl.ifc.obj    SaladBowl.ixx

cl %flags_common% /Fo: obj\AbstractFruit.obj AbstractFruit.cpp
cl %flags_common% /Fo: obj\Apple.obj         Apple.cpp
cl %flags_common% /Fo: obj\Grape.obj         Grape.cpp
cl %flags_common% /Fo: obj\Tomato.obj        Tomato.cpp

cl %flags_common% /Fo: obj\AbstractBowl.obj AbstractBowl.cpp
cl %flags_common% /Fo: obj\FruitBowl.obj    FruitBowl.cpp
cl %flags_common% /Fo: obj\SaladBowl.obj    SaladBowl.cpp

link /nologo /DLL /OUT:bin\AbstractFruit.dll obj\AbstractFruit.obj obj\AbstractFruit.ifc.obj
link /nologo /DLL /OUT:bin\FruitSalad.dll    obj\Apple.obj obj\Apple.ifc.obj obj\Grape.obj obj\Grape.ifc.obj bin\AbstractFruit.lib
link /nologo /DLL /OUT:bin\NotFruitSalad.dll obj\Tomato.obj obj\Tomato.ifc.obj bin\AbstractFruit.lib
link /nologo /DLL /OUT:bin\Bowls.dll         obj\AbstractBowl.obj obj\FruitBowl.obj obj\SaladBowl.obj obj\AbstractBowl.ifc.obj obj\FruitBowl.ifc.obj obj\SaladBowl.ifc.obj bin\FruitSalad.lib bin\AbstractFruit.lib
