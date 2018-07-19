
#pragma once

export module AbstractFruit;

#include "abstractfruit_export.h"

export class ABSTRACTFRUIT_EXPORT AbstractFruit {
public:
  virtual ~AbstractFruit();

  void grow();

  virtual bool isForFruitSalad() const = 0;
};
