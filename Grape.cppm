#pragma once

export module Grape;
import AbstractFruit;

#include "fruitsalad_export.h"

export class FRUITSALAD_EXPORT Grape : public AbstractFruit {
public:
  void setSeedless(int seedless);
  int seedless() const;

  bool isForFruitSalad() const override;

private:
  int m_seedless = 0;
};
