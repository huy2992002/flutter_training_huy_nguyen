// Create a program that asks the user for a number and then prints out a list of all the divisors of that number.
// ignore_for_file: inference_failure_on_collection_literal

import 'dart:io';

import 'package:dart_practice/utils/validator.dart';

void main(List<String> args) {
  final n = Validator.inputInt('Choose a number to find the divisor: ');
  divisorsInterger(n);
}

void divisorsInterger(int number) {
  for (var i = 1; i <= number; i++) {
    if (number % i == 0) stdout.write('$i ');
  }
}
