// To use this library in your code with keyword 'math':
import 'dart:math' as math;

void main(List<String> args) {
  // Random is a generator of bool, int or double values.
  print(math.Random().nextInt(10));
  print(math.Random().nextDouble());
  print(math.Random().nextBool());

  print(math.pi);

  print(math.sqrt(4)); // 2
}

