
#include "Apple.h"

void Apple::setColorIndex(int colorIndex) { m_colorIndex = colorIndex; }

int Apple::colorIndex() const { return m_colorIndex; }

bool Apple::isForFruitSalad() const { return true; }
