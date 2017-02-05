
#pragma once

#include "bowls_export.h"

#include "AbstractBowl.h"
#include "AbstractFruit.h"

class BOWLS_EXPORT FruitBowl : public AbstractBowl {
public:
  FruitBowl();

  std::unique_ptr<AbstractFruit>
  add(std::unique_ptr<AbstractFruit> fruit) override;
};
