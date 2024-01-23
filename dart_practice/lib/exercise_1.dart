//Create a program that asks the user to enter their name and their age.
//Print out a message that tells how many years they have to be 100 years old.

import 'package:dart_practice/utils/validators.dart';

void main(List<String> args) {
  String name = Validators.inputString('Input name: ');
  int age = Validators.inputPositiveInt('Input age: ');

  int ageSpace = ageToHundred(age);

  if (ageSpace > 1) {
    print('$name has $ageSpace more years to be 100 years old');
  } else {
    print('You are over 100 years old');
  }
}

int ageToHundred(int age) {
  return 100 - age;
}
