import 'dart:math' as math;

class Math {
  static int randomInt(int max) {
    final number = math.Random().nextInt(max) + 1;
    return number;
  }

  static String randomUUid({required int length}) {
    const lowercaseLetter = 'qwertyuiopasdfghjklzxcvbnm';
    const uppercaseLetter = 'QWERTYUIOPASDFGHJKLZXCVBNM';
    const numbers = '0123456789';

    final allChars =
        '$lowercaseLetter$uppercaseLetter$numbers'.split('');
    var value = '';
    for (var i = 0; i < length; i++) {
      final index = math.Random().nextInt(allChars.length);
      value = '$value${allChars[index]}';
    }
    return value;
  }
}
