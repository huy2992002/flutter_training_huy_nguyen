import 'dart:math' as math;

class Math {
  static int randomInt(int max) {
    final number = math.Random().nextInt(max) + 1;
    return number;
  }

  static String genarateRandom({required int lenght}) {
    const lowercaseLetter = 'qwertyuiopasdfghjklzxcvbnm';
    const uppercaseLetter = 'QWERTYUIOPASDFGHJKLZXCVBNM';
    const numbers = '0123456789';
    const symbols = r'!@#$%^&*()_+';

    final allChars =
        '$lowercaseLetter$uppercaseLetter$numbers$symbols'.split('');
    var value = '';
    for (var i = 0; i < lenght; i++) {
      final index = math.Random().nextInt(allChars.length);
      value = '$value${allChars[index]}';
    }
    return value;
  }
}
