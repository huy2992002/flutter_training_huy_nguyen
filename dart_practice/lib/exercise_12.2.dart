//Load that JSON file from disk, extract the months of all the birthdays,
//and count how many scientists have a birthday in each month.
//Your program should output something like:

import 'package:dart_practice/exercise_12.1.dart';
import 'package:dart_practice/utils/extension.dart';

void main(List<String> args) {
  const path =
      'D:/inter_flutter/flutter_training_huy_nguyen/dart_practice/lib/data.json';
  final dictionary = getDictionary(path);
  countBirthDay(dictionary);
}

void countBirthDay(Map<String, dynamic> dictionary) {
  final map = <String, int>{};

  for (final e in dictionary.values) {
    final month = DateTime.parse(e as String).month.toStringMonth();

    if (map.containsKey(month)) {
      map.update(month ?? '', (value) => value + 1);
    } else {
      map.putIfAbsent(month ?? '', () => 1);
    }
  }

  print(map);
}
