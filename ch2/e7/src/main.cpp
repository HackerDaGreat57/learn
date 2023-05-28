//main.cpp: produce a table with some common numeric values and Unicode characters

//Includes
#include <iostream> //Console streams (essential)
#include <format> //Output text manipulation
#include <cmath> //Mathematical functions

int main(int argc, char *argv[]) {
  std::cout << "╔═════════════════════╤═════════════════════╤═════════════════════╗" << std::endl;
  std::cout << std::format("║ {:20}│ {:20}│ {:20}║", "Constant", "Description", "Approx. Value") << std::endl;
  std::cout << "╟━━━━━━━━━━━━━━━━━━━━━┿━━━━━━━━━━━━━━━━━━━━━┿━━━━━━━━━━━━━━━━━━━━━╢" << std::endl;
  std::cout << std::format("║ {:20}│ {:20}│ {:<20}║", "std::numbers::e", "The base of the", std::numbers::e) << std::endl;
  std::cout << std::format("║ {:20}│ {:20}│ {:20}║", " ", "natural logarithm", " ") << std::endl;
  std::cout << "╟─────────────────────┼─────────────────────┼─────────────────────╢" << std::endl;
  std::cout << std::format("║ {:20}│ {:20} │ {:<20}║", "std::numbers::pi", "π", std::numbers::pi) << std::endl;
  std::cout << "╟─────────────────────┼─────────────────────┼─────────────────────╢" << std::endl;
  std::cout << std::format("║ {:20}│ {:20}│ {:<20}║", "std::numbers::sqrt2", "Square root of 2", std::numbers::sqrt2) << std::endl;
  std::cout << "╟─────────────────────┼─────────────────────┼─────────────────────╢" << std::endl;
  std::cout << std::format("║ {:20}│ {:20}│ {:<20}║", "std::numbers::phi", "The golden ratio", std::numbers::e) << std::endl;
  std::cout << std::format("║ {:20}│ {:20} │ {:20}║", " ", "constant φ", " ") << std::endl;
  std::cout << "╟─────────────────────┼─────────────────────┼─────────────────────╢" << std::endl;
  std::cout << std::format("║ {:20} │ {:20}│ {:<20.5E}║", "sin(π/4)", "Challenge number", static_cast<long double>(sin(std::numbers::pi/4))) << std::endl;
  std::cout << "╚═════════════════════╧═════════════════════╧═════════════════════╝" << std::endl;

  return 0;
}