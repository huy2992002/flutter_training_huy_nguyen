//For this exercise, we will keep track of when our friend’s birthdays are,
//and be able to find that information based on their name.
//Create a dictionary (in your file) of names and birthdays.
//When you run your program it should ask the user to enter a name, and return the birthday of that person back to them.
//The interaction should look something like this

import 'package:dart_practice/utils/validators.dart';

void main(List<String> args) {
  Map<String, String> dictionaryBirthday = {
    'Dang Quoc Hoang': '2002/07/15',
    'Nguyen Phuc Kim Thuy': '2002/11/09',
    'Nguyen Ngoc Son': '2004/11/28',
  };

  getBirthDay(dictionaryBirthday);
}

void getBirthDay(Map<String, dynamic> dictionary) {
  int count = 0;
  String name = Validators.inputString("who's birthday do you want look up?: ");
  for (String e in dictionary.keys) {
    if (e.toLowerCase().contains(name.toLowerCase())) {
      print("$e's birthday is ${dictionary[e]}");
      count++;
    }
  }
  if (count == 0) {
    print('The birthday of the person you are looking for could not be found');
  }
}
