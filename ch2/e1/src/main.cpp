//main.cpp: converts inches to feet and inches

//Includes
#include <iostream> //Console streams (essential)
#include <stdint.h> //Integers (uint64_t)

int main(int argc, char *argv[]) {
  uint64_t in;
  std::cout << "Please enter the number of inches: ";
  std::cin >> in;

  uint64_t inches = in % 12;
  uint64_t feet = in / 12;

  std::cout << std::endl << "Feet: " << feet << std::endl << "Inches: " << inches << std::endl;

  return 0;
}