//Write a program (function) that takes a list and 
//returns a new list that contains all the elements of the first list minus all the duplicates.

void main(List<String> args) {
  final a = [5, 10, 5, 20, 25, 10, 32, 80,5];

  print(removeDuplicatesList(a));
}

List<int> removeDuplicatesList(List<int> arr) {
  return arr.toSet().toList();
}
