
#pragma once

#include "notfruitsalad_export.h"

#include "AbstractFruit.h"

class NOTFRUITSALAD_EXPORT Tomato : public AbstractFruit {
public:
  void setSize(int size);
  int size() const;

  bool isForFruitSalad() const override;

private:
  int m_size = 1;
};
