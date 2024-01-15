import 'package:dart_practice/utils/validator.dart';

void main(List<String> args) {
  checkAgeToHunderd();
}

void checkAgeToHunderd() {
  String name = Validator.inputString('Input name: ');
  int age = Validator.inputInt('Input age: ');
  print('$name has ${100 - age} more years to be 100 years old');
}
