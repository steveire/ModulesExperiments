
#include "FruitBowl.h"

#include "Apple.h"

FruitBowl::FruitBowl() {
  add(std::make_unique<Apple>());
}

std::unique_ptr<AbstractFruit>
FruitBowl::add(std::unique_ptr<AbstractFruit> fruit) {
  doAdd(std::move(fruit));
  return {};
}
