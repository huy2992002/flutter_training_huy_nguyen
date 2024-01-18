// ignore_for_file: unused_local_variable

import 'dart:io';

void main(List<String> args) {
  // print('Input a: ');
  // int a = int.parse(stdin.readLineSync().toString()); // if input a String '1' will throw exception

  // use try catch exception
  try {
    print('Input a: ');
    int a = int.parse(stdin.readLineSync().toString());
  } catch (e) {
    print("Error, Invalid value");
  }

  int b = validatorInt("Input b: ");
}

// use try catch create method required input value int :
int validatorInt(String prompt) {
  int value = 0;
  bool isValid;
  do {
    try {
      print(prompt);
      int value = int.parse(stdin.readLineSync().toString());
      isValid = true;
    } catch (e) {
      print("Error, Invalid value");
      isValid = false;
    }
  } while (!isValid);

  return value;
}
