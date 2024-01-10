//import package file examples_operators.dart to use it
import 'package:dart_examples/syntax_basics/examples_operators.dart';

// import library dart:math to use library through keywork 'math'
import 'dart:math' as math;


void main(List<String> args) {
  logicalOperators(); // call method from file examples_operators.dart can import package

  int value = math.Random().nextInt(10); // Value is >= 0 and < 10
  print(value);
}