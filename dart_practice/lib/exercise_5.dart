//Let’s say you are given a list saved in a variable:
//a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100].
//Write a Dart code that takes this list and makes a new list that has only the even elements of this list in it.

void main(List<String> args) {
  final a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100];

  print(evenNumbersInList(a));
}

List<int> evenNumbersInList(List<int> a) {
  final list = <int>[];

  for (final e in a) {
    if (e.isEven) list.add(e);
  }

  return list;
}
