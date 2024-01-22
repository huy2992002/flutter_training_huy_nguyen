//Load the birthday dictionary from a JSON file on disk, rather than having the dictionary defined in the program.

import 'package:dart_practice/utils/constants.dart';
import 'package:dart_practice/utils/services.dart';
import 'package:dart_practice/utils/validators.dart';

void main(List<String> args) {
  String path = Constants.dataPath;

  getBirthDay(path);
}

void getBirthDay(String path) {
  Map<String, dynamic> dictionary = Services.getDataJson(path);
  final name = Validators.inputString("who's birthday do you want look up?: ");
  if (dictionary[name] != null) {
    print("$name's birthday is ${dictionary[name]}");
  } else {
    String birthday = Validators.inputBirthday(
      "Please update $name's birthday (yyyy-mm-dd): ",
    );
    dictionary.putIfAbsent(name, () => birthday);
    print('Update successfully');
    Services.saveDataJson(dictionary, path);
  }
}
