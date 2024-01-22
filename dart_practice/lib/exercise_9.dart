//Write a password generator in Dart.
//Be creative with how you generate passwords
//Strong passwords have a mix of lowercase letters, uppercase letters, numbers, and symbols.
//The passwords should be random, generating a new password every time the user asks for a new password.
//Include your run-time code in a main method.
//Ask the user how strong they want their password to be. For weak passwords, pick a word or two from a list.

import 'dart:math' as math;

import 'package:dart_practice/utils/validators.dart';

void main(List<String> args) {
  int i;

  do {
    printOptions();
    do {
      i = Validators.inputInt('Choice: ');
    } while (i < 1 || i > 4);

    switch (i) {
      case 1:
        print("Your password is '${getPasswordWeak()}'");
      case 2:
        print("Your password is '${generatePassword(8)}'");
      case 3:
        print("Your password is '${generatePassword(15)}'");
      case 4:
        print('Program is finished !!!');
    }
  } while (i != 4);
}

void printOptions() {
  print('Please select an option.');
  print('1. Password weak.');
  print('2. Password medium.');
  print('3. Password strong.');
  print('4. Exit.');
}

String generatePassword(int length) {
  String lowercaseLetter = 'qwertyuiopasdfghjklzxcvbnm';
  String uppercaseLetter = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  String numbers = '0123456789';
  String symbols = r'!@#$%^&*()_+';

  List<String> allChars =
      '$lowercaseLetter$uppercaseLetter$numbers$symbols'.split('');
  var password = '';
  for (var i = 0; i < length; i++) {
    int index = math.Random().nextInt(allChars.length);
    password = '$password${allChars[index]}';
  }
  return password;
}

String getPassDefault() {
  List<String> listPasswordDefault = [
    'password1',
    'password2',
    'password3',
  ];

  int index = math.Random().nextInt(listPasswordDefault.length);

  return listPasswordDefault[index];
}

String getPasswordWeak() {
  int i;
  String passwordDefault = getPassDefault();
  String passwordGenerate = generatePassword(4);

  print('Please choice password: ');
  print('1. $passwordDefault ');
  print('2. $passwordGenerate ');
  do {
    i = Validators.inputInt('Choice a password: ');
  } while (i < 1 || i > 2);

  return i == 1 ? passwordDefault : passwordGenerate;
}
