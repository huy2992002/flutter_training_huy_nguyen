//Load the birthday dictionary from a JSON file on disk, rather than having the dictionary defined in the program.

import 'package:dart_practice/utils/constants.dart';
import 'package:dart_practice/utils/services.dart';
import 'package:dart_practice/utils/validator.dart';

void main(List<String> args) {
  const path = Constants.dataPath;

  getBirthDay(path);
}

void getBirthDay(String path) {
  final dictionary = Services.getDataJson(path);
  final name = Validator.inputString("who's birthday do you want look up?: ");
  if (dictionary[name] != null) {
    print("$name's birthday is ${dictionary[name]}");
  } else {
    final birthday =
        Validator.inputBirthday("Please update $name's birthday: ");
    dictionary.putIfAbsent(name, () => birthday);
    print('Update successfully');
    Services.saveDataJson(dictionary, path);
  }
}
