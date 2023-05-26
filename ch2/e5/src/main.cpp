//main.cpp: calculate my BMI (only one decimal digit)

//Includes
#include <iostream> //Console streams (essential)
#include <format> //Output string manipulation (precision setting)

int main(int argc, char *argv[]) {
  long double weight;
  std::cout << "Please enter your weight in pounds: ";
  std::cin >> weight;

  long double height_feet;
  long double height_inches;
  std::cout << "Please enter your height. Enter the number of feet, then the number of inches, separated by a space: ";
  std::cin >> height_feet >> height_inches;

  long double weight_c = weight / 2.2; //1 kilogram = 2.2 pounds
  long double height_c = (height_feet * 0.3048) + ((height_inches / 12) * 0.3048); //1 foot is 0.3048 meters
  long double bmi = weight_c / (height_c * height_c);

  std::cout << std::endl << std::format("Your BMI is {:.1f}", bmi) << std::endl; //Only allow one decimal digit after the point

  return 0;
}