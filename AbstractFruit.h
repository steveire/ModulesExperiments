
#pragma once

#include "abstractfruit_export.h"

class ABSTRACTFRUIT_EXPORT AbstractFruit {
public:
  virtual ~AbstractFruit();

  void grow();

  virtual bool isForFruitSalad() const = 0;
};
