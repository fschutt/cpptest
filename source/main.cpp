#include <iostream>
#include <string>

#include "azul-mini.h"

auto main() -> int {
  auto vector =  AzSvgVector { 5.0, 10.0 };
  auto normalized = AzSvgVector_normalize(&vector);
  std::cout << normalized.x << normalized.y << std::endl;
  return 0;
}
