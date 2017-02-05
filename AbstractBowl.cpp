
#include "AbstractBowl.h"

AbstractBowl::~AbstractBowl() = default;

std::unique_ptr<AbstractFruit> AbstractBowl::takeAt(int index) {
  auto fruit = std::move(m_fruits[index]);
  m_fruits.erase(m_fruits.begin() + index);
  return fruit;
}

void AbstractBowl::doAdd(std::unique_ptr<AbstractFruit> fruit) {
  m_fruits.emplace_back(std::move(fruit));
}
