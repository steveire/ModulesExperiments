
#pragma once

#include "fruitsalad_export.h"

#include "AbstractFruit.h"

class FRUITSALAD_EXPORT Grape : public AbstractFruit {
public:
  void setSeedless(int seedless);
  int seedless() const;

  bool isForFruitSalad() const override;

private:
  int m_seedless = 0;
};
