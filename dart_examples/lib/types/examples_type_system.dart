// ignore_for_file: unused_local_variable

void main(List<String> args) {
  final a = [];
  a.add(1);
  a.add('2');
  // printInts(a); error because List (dynamic) printInts(List<>int)

  final b = <int>[];
  b.add(1);
  b.add(2);
  printInts(b); // success

  var c = 3;
  // c = 4.0; error because c is inferred as an int.

  num d = 3;
  d = 4.0; // success because num can be double or int.
}

// create func parameter List<int>
void printInts(List<int> a) => print(a);
