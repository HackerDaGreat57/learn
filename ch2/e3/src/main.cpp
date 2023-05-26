//main.cpp: calculate the height of a tree with my distance from the tree, the height of my viewpoint and the angle of the viewpoint

//Includes
#include <iostream> //Console streams (essential)
#include <cmath> //tan() function

int main(int argc, char *argv[]) {
  long double distance;
  std::cout << "Please enter your distance from the tree: ";
  std::cin >> distance;

  long double height;
  std::cout << "Please enter the height of your viewpoint: ";
  std::cin >> height;

  long double angle;
  std::cout << "Please enter the angle: ";
  std::cin >> angle;

  long double result = height + distance * tan(angle);
  std::cout << std::endl << "The height of the tree is " << result << std::endl;

  return 0;
}