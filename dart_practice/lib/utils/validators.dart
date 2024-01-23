import 'dart:io';

class Validators {
  static int inputInt(String prompt) {
    int value = 0;

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

  static int? inputIntCanNull(String prompt) {
    int value = 0;

    bool isValid;

    do {
      try {
        stdout.write(prompt);
        String input = stdin.readLineSync().toString();
        if (input.isEmpty) return null;
        value = int.parse(input);
        isValid = true;
      } catch (e) {
        print('Error, Invalid Number !!!');
        isValid = false;
      }
    } while (!isValid);

    return value;
  }

  static int inputPositiveInt(String prompt) {
    int value = 0;

    bool isValid;

    do {
      value = Validators.inputInt(prompt);
      value < 0 ? isValid = false : isValid = true;
      if (value < 0) print('Please enter a positive integer');
    } while (!isValid);

    return value;
  }

  static int? inputPositiveIntCanNull(String prompt) {
    int? value = 0;

    bool isValid;

    do {
      value = Validators.inputIntCanNull(prompt);
      if (value == null) return null;
      value < 0 ? isValid = false : isValid = true;
      if (value < 0) print('Please enter a positive integer');
    } while (!isValid);

    return value;
  }

  static double inputDouble(String prompt) {
    double value = 0;

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

  static double? inputDoubleCanNull(String prompt) {
    double value = 0;

    bool isValid;

    do {
      try {
        stdout.write(prompt);
        String input = stdin.readLineSync().toString();
        if (input.isEmpty) return null;
        value = double.parse(input);
        isValid = true;
      } catch (e) {
        print('Error, Invalid Number !!!');
        isValid = false;
      }
    } while (!isValid);

    return value;
  }

  static String inputString(String prompt) {
    String value = '';

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

  static String? inputStringCanNull(String prompt) {
    stdout.write(prompt);
    final value = stdin.readLineSync().toString();
    if (value.isEmpty) {
      return null;
    }
    return value;
  }

  static String inputBirthday(String prompt) {
    String value = '';

    bool isValid;

    do {
      stdout.write(prompt);
      value = stdin.readLineSync().toString();
      try {
        DateTime.parse(value);
        isValid = true;
      } catch (e) {
        print('Error, Invalid Birthday');
        isValid = false;
      }
    } while (!isValid);
    return value;
  }
}
