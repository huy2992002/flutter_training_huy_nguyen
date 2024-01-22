//Let’s say you are given a list saved in a variable:
//a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100].
//Write a Dart code that takes this list and makes a new list that has only the even elements of this list in it.

void main(List<String> args) {
  List<int> listNumber = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100];

  print(evenNumbersInList(listNumber));
}

// return list number even in a list
List<int> evenNumbersInList(List<int> list) {
  List<int> list = [];

  for (int e in list) {
    if (e.isEven) list.add(e);
  }

  return list;
}
