// Create a program that asks the user for a number and then prints out a list of all the divisors of that number.

import 'dart:io';
import 'package:dart_practice/utils/validators.dart';

void main(List<String> args) {
  final number = Validators.inputInt('Choose a number to find the divisor: ');
  final results = divisorsInteger(number);

  if (results.isNotEmpty) {
    for (final e in results) {
      stdout.write('$e ');
    }
  } else {
    print('No found divisor of $number');
  }
}

List<int> divisorsInteger(int number) {
  final results = <int>[];
  for (var i = 1; i <= number; i++) {
    if (number % i == 0) results.add(i);
  }

  return results;
}
