//main.cpp: calculate the area of a circle

//Includes
#include <iostream> //Console streams (essential)
#include <cmath> //For Pi

int main(int argc, char *argv[]) {
  long double radius;
  std::cout << "Please enter the radius of your circle: ";
  std::cin >> radius;

  long double area = M_PI * radius * radius;
  std::cout << "The area of your circle is " << area << std::endl;

  return 0;
}