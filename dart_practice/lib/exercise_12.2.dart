//Load that JSON file from disk, extract the months of all the birthdays,
//and count how many scientists have a birthday in each month.
//Your program should output something like:

import 'package:dart_practice/utils/constants.dart';
import 'package:dart_practice/utils/extension.dart';
import 'package:dart_practice/utils/services.dart';

void main(List<String> args) {
  String path = Constants.dataPath;
  Map<String, dynamic> dictionary = Services.getDataJson(path);
  countBirthDay(dictionary);
}

void countBirthDay(Map<String, dynamic> dictionary) {
  Map<String, int> map = {};

  for (final e in dictionary.values) {
    if (e is String) {
      String? month = DateTime.parse(e).month.toStringMonth();

      if (map.containsKey(month)) {
        map.update(month ?? '', (value) => value + 1);
      } else {
        map.putIfAbsent(month ?? '', () => 1);
      }
    } else {
      continue;
    }
  }

  print(map);
}
