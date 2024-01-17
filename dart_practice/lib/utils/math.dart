import 'dart:math' as math;

class Math {
  static int randomInt(int max) {
    final number = math.Random().nextInt(max) + 1;
    return number;
  }
}
