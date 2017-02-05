
#include "Grape.h"

void Grape::setSeedless(int seedless) { m_seedless = seedless; }

int Grape::seedless() const { return m_seedless; }

bool Grape::isForFruitSalad() const { return true; }
