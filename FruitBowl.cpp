module FruitBowl;

import Apple;

import AbstractFruit;
import std;

// Buggily required import, likely
import AbstractBowl;

FruitBowl::FruitBowl() {
  add(std::make_unique<Apple>());
}

std::unique_ptr<AbstractFruit>
FruitBowl::add(std::unique_ptr<AbstractFruit> fruit) {
  doAdd(std::move(fruit));
  return {};
}
