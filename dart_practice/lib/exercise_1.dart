//Create a program that asks the user to enter their name and their age. 
//Print out a message that tells how many years they have to be 100 years old.

import 'package:dart_practice/utils/validator.dart';

void main(List<String> args) {
  checkAgeToHundred();
}

void checkAgeToHundred() {
  final name = Validator.inputString('Input name: ');
  final age = Validator.inputInt('Input age: ');
  print('$name has ${100 - age} more years to be 100 years old');
}
