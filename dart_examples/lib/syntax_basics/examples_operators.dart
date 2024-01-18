void main(List<String> args) {
  arithmeticOperators();
  equalityRelationalOperators();
  typeTestOperators();
  assignmentOperators();
  logicalOperators();
}

void arithmeticOperators() {
  int op1 = 10;
  int op2 = 6;

  print(op1 + op2); // 16
  print(op1 - op2); // 4
  print(op1 * op2); // 60
  print(op1 / op2); // 1.6666666666666667
  print(op1 % op2); // 4
  print(op1 ~/ op2); // 1

  int op3 = 2;
  print(op3++); //2
  print(++op3); //4 ++expr execute immediately
}

void equalityRelationalOperators() {
  int op1 = 12;
  int op2 = 6;

  print(op1 == op2); // false  Equal
  print(op1 != op2); // true   Not equal
  print(op1 % op2 == 0); // true 
}

void typeTestOperators() {
  Object name = 'Bob';

  (name as String).length; // used to specify library prefixes

  dynamic age = 21;

  print(age is int); //true
  print(age !is String); // false
}

void assignmentOperators() {
  int a = 10;
  int b = 3;

  print(a += b); // 13  => a = a + b;
  print(a); // 13
}

void logicalOperators() {
  bool op1 = true;
  bool op2 = false;

  print(op1 == true || op2 == true); // true
  print(op1 == true && op2 == true); // false
}
