
#pragma once

export module Tomato;

import AbstractFruit;

#include "notfruitsalad_export.h"

export class NOTFRUITSALAD_EXPORT Tomato : public AbstractFruit {
public:
  void setSize(int size);
  int size() const;

  bool isForFruitSalad() const override;

private:
  int m_size = 1;
};
