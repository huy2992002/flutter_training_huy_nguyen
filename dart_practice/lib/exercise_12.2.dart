//Load that JSON file from disk, extract the months of all the birthdays,
//and count how many scientists have a birthday in each month.
//Your program should output something like:

import 'package:dart_practice/utils/extension.dart';
import 'package:dart_practice/utils/services.dart';

void main(List<String> args) {
  const path = 'dart_practice/lib/data.json';
  final dictionary = getDataJson(path);
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
