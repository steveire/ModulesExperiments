
#pragma once

#include "fruitsalad_export.h"

#include "AbstractFruit.h"

class FRUITSALAD_EXPORT Apple : public AbstractFruit {
public:
  void setColorIndex(int colorIndex);
  int colorIndex() const;

  bool isForFruitSalad() const override;

private:
  int m_colorIndex = 0;
};
