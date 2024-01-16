import 'dart:io';

class Validator {
  static int inputInt(String prompt) {
    var value = 0;

    bool isValid;

    do {
      try {
        stdout.write(prompt);
        value = int.parse(stdin.readLineSync().toString());
        isValid = true;
      } catch (e) {
        print('Error, Invalid Number !!!');
        isValid = false;
      }
    } while (!isValid);

    return value;
  }

  static double inputDouble(String prompt) {
    var value = 0.0;

    bool isValid;

    do {
      try {
        stdout.write(prompt);
        value = double.parse(stdin.readLineSync().toString());
        isValid = true;
      } catch (e) {
        print('Error, Invalid Number !!!');
        isValid = false;
      }
    } while (!isValid);

    return value;
  }

  static String inputString(String prompt) {
    var value = '';

    bool isValid;

    do {
      stdout.write(prompt);
      value = stdin.readLineSync().toString();
      if (value.trim().isEmpty) {
        print('Error, Value cannot be empty !!!');
        isValid = false;
      } else {
        isValid = true;
      }
    } while (!isValid);
    return value;
  }

  static String inputBirthday(String prompt) {
    var value = '';

    bool isValid;

    do {
      stdout.write(prompt);
      value = stdin.readLineSync().toString();
      try {
        DateTime.parse(value);
        isValid = true;
      } catch (e) {
        print('Error, Invalid Birtday');
        isValid = false;
      }
    } while (!isValid);
    return value;
  }
}
