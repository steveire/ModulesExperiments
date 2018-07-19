
#pragma once

export module Apple;
import AbstractFruit;

#include "fruitsalad_export.h"

export class FRUITSALAD_EXPORT Apple : public AbstractFruit {
public:
  void setColorIndex(int colorIndex);
  int colorIndex() const;

  bool isForFruitSalad() const override;

private:
  int m_colorIndex = 0;
};
