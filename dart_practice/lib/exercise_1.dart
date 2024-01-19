//Create a program that asks the user to enter their name and their age.
//Print out a message that tells how many years they have to be 100 years old.

import 'package:dart_practice/utils/validators.dart';

void main(List<String> args) {
  final name = Validators.inputString('Input name: ');
  final age = Validators.inputPositiveInt('Input age: ');

  if (ageToHundred(age) > 1) {
    print('$name has ${100 - age} more years to be 100 years old');
  } else {
    print('You are over 100 years old');
  }
}

int ageToHundred(int age) {
  return 100 - age;
}
