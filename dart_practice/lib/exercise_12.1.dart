//Load the birthday dictionary from a JSON file on disk, rather than having the dictionary defined in the program.

import 'dart:convert';
import 'dart:io';
import 'package:dart_practice/utils/validator.dart';

void main(List<String> args) {
  const path = 'dart_practice/lib/data.json';

  getBirthDay(path);
}

Map<String, dynamic> getDictionary(String path) {
  final data = File(path).readAsStringSync();
  final dictionary = jsonDecode(data) as Map<String, dynamic>;
  return dictionary;
}

void saveDictionary(Map<String, dynamic> dictionary, String path) {
  final file = File(path);
  final content = json.encode(dictionary);
  file.writeAsStringSync(content);
}

void getBirthDay(String path) {
  final dictionary = getDictionary(path);
  final name = Validator.inputString("who's birthday do you want look up?: ");
  if (dictionary[name] != null) {
    print("$name's birthday is ${dictionary[name]}");
  } else {
    final birthday =
        Validator.inputBirthday("Please update $name's birthday: ");
    dictionary.putIfAbsent(name, () => birthday);
    print('Update successfully');
    saveDictionary(dictionary, path);
  }
}
