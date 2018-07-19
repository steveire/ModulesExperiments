
#pragma once

export module SaladBowl;

import AbstractFruit;
import AbstractBowl;
import std;

#include "bowls_export.h"

export class BOWLS_EXPORT SaladBowl : public AbstractBowl {
public:
  std::unique_ptr<AbstractFruit>
  add(std::unique_ptr<AbstractFruit> fruit) override;
};
