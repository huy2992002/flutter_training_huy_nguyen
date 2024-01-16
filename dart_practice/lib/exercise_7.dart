//Write a program that takes a list of numbers for example
//a = [5, 10, 15, 20, 25]
//and makes a new list of only the first and last elements of the given list. For practice, write this code inside a function.

void main(List<String> args) {
  final a = [5, 10, 15, 20, 25];

  print(firstLastList(a));
}

List<int> firstLastList(List<int> arr) {
  return [arr.first,arr.last];
}
