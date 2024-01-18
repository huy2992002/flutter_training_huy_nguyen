//Create a program that asks the user to enter their name and their age.
//Print out a message that tells how many years they have to be 100 years old.

import 'package:dart_practice/utils/validators.dart';

void main(List<String> args) {
  checkAgeToHundred();
}

void checkAgeToHundred() {
  final name = Validators.inputString('Input name: ');
  final age = Validators.inputPositiveInt('Input age: ');
  final check = 100 - age > 1;
  if (check) {
    print('$name has ${100 - age} more years to be 100 years old');
  } else {
    print('You are over 100 years old');
  }
}
