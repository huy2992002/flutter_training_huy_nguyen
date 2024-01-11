void main(List<String> args) {
  numbers();
  string();
  checkEvenOdd(2); // This is an even number !!!
  checkEvenOdd(5); // This is an odd number !!!
}

void numbers() {
  int a = 123;
  print(a); // 123
  double b = double.parse('2.33');
  print(b); // 2.33

  num c = 123;
  print(c); // 123
  num d = 12.123;
  print(d); // 12.123
}

void string() {
  String name = 'Hau';
  String hello = 'Hello $name'; // string concatenation
  print(hello); // Hello Hau

  // Multi-line String
  String c = ''' Dart has string interpolation, which is very handy. 
    Dart has string interpolation, 
        'which is very handy. ''';
  print(c);
}

void checkEvenOdd(int n) {
  bool check = n % 2 == 0;
  if (check) {
    print('This is an even number !!!');
  } else {
    print('This is an odd number !!!');
  }
}
