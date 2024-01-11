import 'dart:io';

void main(List<String> args) {
  ascending([4, 5, 2, 3, 2, 1]); // 1 2 2 3 4 5
}

List<int> inputList(int lenght) {
  List<int> values = [];
  for (int i = 0; i < lenght; i++) {
    values.add(validatorInt('Input value ${i + 1}'));
  }
  return values;
}

void ascending(List<int> numbers) {
  // Use 2 loops for i to sort the list of numbers in ascending order
  for (int i = 0; i < numbers.length - 1; i++) {
    for (int j = i; j < numbers.length; j++) {
      if (numbers[i] > numbers[j]) {
        int temp = numbers[i];
        numbers[i] = numbers[j];
        numbers[j] = temp;
      }
    }
  }

  // User for each print list number
  for (int e in numbers) {
    print(e);
  }
}

int validatorInt(prompt) {
  int value = 0;

  bool isValid;

  do {
    try {
      print(prompt);
      value = int.parse(stdin.readLineSync().toString());
      isValid = true;
    } on () {
      print('Error, Invalid Number. ');
      isValid = false;
    }
  } while (!isValid);
  return value;
}
