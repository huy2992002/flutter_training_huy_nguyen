//Ask the user for a number.
//Depending on whether the number is even or odd,
//print out an appropriate message to the user.

import 'package:dart_practice/utils/validators.dart';

void main(List<String> args) {
  final number = Validators.inputInt('Choose a number: ');

  final result = checkOddEven(number);

  print('This number is an ${result ? 'even' : 'odd'} number');
}

bool checkOddEven(int number) {
  return number.isEven;
}
