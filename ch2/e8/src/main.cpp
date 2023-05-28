//main.cpp: identifies the larger of 2 positive integers
//          DISCLAIMER: I didn't do this myself, it was too hard
//          Solution copied from https://github.com/Apress/beginning-cpp20/blob/main/Exercises/Modules/Chapter%2002/Soln2_08.cpp

//Includes
#include <iostream> //Console streams (essential)
#include <stdint.h> //Integers (uint64_t)

int main(int argc, char *argv[]) {
  uint64_t int1;
  uint64_t int2;
  std::cout << "Please enter the first and second positive integers, separated by a space: ";
  std::cin >> int1 >> int2;

  //int1 / int2 equals zero if int1 < int2. So unless if int1 and int2 are equal, either int1/int2 or int2/int1 equals zero.
  //Meaning that in (int1 * (int1/int2) + int2 * (int2/int1)) one of both operands of + equals 0.
  // **I have no idea what this is, it was copied from the book. I tried. I couldn't.**
  uint64_t larger  = (int1 * (int1 / int2) + int2 * (int2 / int1)) / (int1 / int2 + int2 / int1);
  uint64_t smaller = (int2 * (int1 / int2) + int1 * (int2 / int1)) / (int1 / int2 + int2 / int1);

  std::cout << std::endl << "The smaller integer is " << smaller << ". The larger integer is " << larger << "." << std::endl;

  return 0;
}