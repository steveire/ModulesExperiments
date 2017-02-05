
#include "FruitBowl.h"
#include "SaladBowl.h"

#include "Apple.h"
#include "Grape.h"
#include "Tomato.h"

#include <iostream>

int main() {
  FruitBowl fb;

  fb.add(std::make_unique<Tomato>());

  SaladBowl sb;
  std::vector<std::unique_ptr<AbstractFruit>> rejects;
  while (fb.size() > 0) {
    auto fruit = fb.takeAt(0);
    fruit = sb.add(std::move(fruit));
    if (fruit) {
      rejects.emplace_back(std::move(fruit));
    }
  }

  for (auto it = rejects.begin(); it != rejects.end(); ++it) {
    fb.add(std::move(*it));
  }
  rejects.clear();

  std::cout << "In fruit bowl: " << fb.size() << std::endl;
  std::cout << "In salad bowl: " << sb.size() << std::endl;

  return 0;
}
