
#pragma once

export module FruitBowl;

import AbstractFruit;
import AbstractBowl;
import std;

#include "bowls_export.h"

export class BOWLS_EXPORT FruitBowl : public AbstractBowl {
public:
  FruitBowl();

  std::unique_ptr<AbstractFruit>
  add(std::unique_ptr<AbstractFruit> fruit) override;
};
