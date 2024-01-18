void main(List<String> args) {
  var numList = [1, 2, 3];
// List pattern [a, b, c] destructures the three elements from numList...
  var [a, b, c] = numList;
// ...and assigns them to new variables.
  print(a + b + c);

  int obj = 1;

  switch (obj) {
    // Matches if 1 == obj.
    case 1:
      print('one');

    // Matches if the value of obj is between the
    // constant values of 0 and 10.
    case >= 0 && <= 10:
      print('in range');

    // Matches if obj is a record with two fields,
    // then assigns the fields to 'a' and 'b'.
    case (var a, var b):
      print('a = $a, b = $b');

    default:
  }
}
