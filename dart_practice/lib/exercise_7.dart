//Write a program that takes a list of numbers for example
//a = [5, 10, 15, 20, 25]
//and makes a new list of only the first and last elements of the given list. For practice, write this code inside a function.

void main(List<String> args) {
  final arr = [5, 10, 15, 20, 25];

  print(getFirstLastList(arr));
}

List<int> getFirstLastList(List<int> arr) {
  return [arr.first,arr.last];
}
