//Ask the user for a number. 
//Depending on whether the number is even or odd, 
//print out an appropriate message to the user.

import 'package:dart_practice/utils/validator.dart';

void main(List<String> args) {
  final number = Validator.inputInt('Choose a number: ');

  checkOddEven(number);
}

void checkOddEven(int number) {
  if(number.isEven) {
    print('This number is an even number');
  }else {
    print('This number is an odd number');
  }
}
