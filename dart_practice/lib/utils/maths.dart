import 'dart:math' as math;

class Maths {
  static int randomInt(int max) {
    int number = math.Random().nextInt(max) + 1;
    return number;
  }

  static String randomUUid({required int length}) {
    const lowercaseLetter = 'qwertyuiopasdfghjklzxcvbnm';
    const uppercaseLetter = 'QWERTYUIOPASDFGHJKLZXCVBNM';
    const numbers = '0123456789';

    List<String> allChars =
        '$lowercaseLetter$uppercaseLetter$numbers'.split('');
    String value = '';
    for (var i = 0; i < length; i++) {
      int index = math.Random().nextInt(allChars.length);
      value = '$value${allChars[index]}';
    }
    return value;
  }
}
