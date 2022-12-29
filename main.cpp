#include <cstdlib>
#include <iostream>
#include <stdexcept>

#include "first_app.hpp"

int main() {
  try {
    lve::FirstApp app{};
    app.run();
  } catch (const std::exception& e) {
    std::cerr << e.what() << std::endl;
    return EXIT_FAILURE;
  }

  return EXIT_SUCCESS;
}