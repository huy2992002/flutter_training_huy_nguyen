//Take a list, say for example this one:
//a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
//and write a program that prints out all the elements of the list that are less than 5.

import 'dart:io';

void main(List<String> args) {
  final list = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  final results = itemLess5InList(list);
  if (results.isNotEmpty) {
    for (final e in results) {
      stdout.write('$e ');
    }
  } else {
    print('No element is less than 5');
  }
}

List<int> itemLess5InList(List<int> list) {
  final results = <int>[];
  for (final e in list) {
    if (e < 5) {
      results.add(e);
    }
  }
  return results;
}
