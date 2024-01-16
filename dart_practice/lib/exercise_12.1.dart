//Load the birthday dictionary from a JSON file on disk, rather than having the dictionary defined in the program.

import 'dart:convert';
import 'dart:io';
import 'package:dart_practice/utils/validator.dart';

void main(List<String> args) {
  const path =
      'D:/inter_flutter/flutter_training_huy_nguyen/dart_practice/lib/data.json';
  final data = File(path).readAsStringSync();
  final dictionary = jsonDecode(data) as Map<String, dynamic>;

  getBirthDay(dictionary);
}

void getBirthDay(Map<String, dynamic> dictionary) {
  final name = Validator.inputString("who's birthday do you want look up?: ");
  if (dictionary[name] != null) {
    print("$name's birthday is ${dictionary[name]}");
  } else {
    print('The birthday of the person you are looking for could not be found');
  }
}
