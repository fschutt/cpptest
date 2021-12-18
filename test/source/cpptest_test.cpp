#include "lib.hpp"

auto main() -> int
{
  library lib;

  return lib.name == "cpptest" ? 0 : 1;
}
