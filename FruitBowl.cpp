
#include "FruitBowl.h"

#include "Apple.h"
#include "Grape.h"

FruitBowl::FruitBowl() {
  add(std::make_unique<Apple>());
  add(std::make_unique<Grape>());
}

std::unique_ptr<AbstractFruit>
FruitBowl::add(std::unique_ptr<AbstractFruit> fruit) {
  doAdd(std::move(fruit));
  return {};
}
