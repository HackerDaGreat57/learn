//main.cpp: produce a table with some numeric values and Unicode characters

//Includes
#include <iostream> //Console streams (essential)
#include <format> //Output text manipulation

int main(int argc, char *argv[]) {
  std::cout << std::format("{:*<52}", "") << std::endl;
  std::cout << std::format("| {:15}| {:15}| {:15}|", "Constant", "Value", "Approx. Value") << std::endl;

  return 0;
}