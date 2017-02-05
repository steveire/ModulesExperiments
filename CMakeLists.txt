
cmake_minimum_required(VERSION 3.7.2)

project(modulestest)

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

add_library(abstractfruit SHARED AbstractFruit.cpp)
target_compile_definitions(abstractfruit PRIVATE abstractfruit_EXPORTS)

add_library(fruitsalad SHARED Apple.cpp Grape.cpp)
target_compile_definitions(fruitsalad PRIVATE fruitsalad_EXPORTS)
target_link_libraries(fruitsalad PUBLIC abstractfruit)

add_library(notfruitsalad SHARED Tomato.cpp)
target_compile_definitions(notfruitsalad PRIVATE notfruitsalad_EXPORTS)
target_link_libraries(notfruitsalad PUBLIC abstractfruit)

add_library(bowls SHARED
    AbstractBowl.cpp
    FruitBowl.cpp
    SaladBowl.cpp
)
target_compile_definitions(bowls PRIVATE bowls_EXPORTS)
target_link_libraries(bowls
    PUBLIC abstractfruit
    PRIVATE fruitsalad
)

add_executable(dinnerparty dinnerparty.cpp)
target_link_libraries(dinnerparty
    fruitsalad
    notfruitsalad
    bowls
)
