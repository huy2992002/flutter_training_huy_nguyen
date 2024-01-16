//Load the birthday dictionary from a JSON file on disk, rather than having the dictionary defined in the program.

import 'dart:convert';
import 'dart:io';
import 'package:dart_practice/exercise_11.dart';

void main(List<String> args) {
  const path =
      'D:/inter_flutter/flutter_training_huy_nguyen/dart_practice/lib/data.json';
  final data = File(path).readAsStringSync();
  final dictionary = jsonDecode(data) as Map<String, dynamic>;

  getBirthDay(dictionary);
}
