//You, the user, will have in your head a number between 0 and 100.
//The program will guess a number, and you, the user, will say whether it is too high, too low, or your number.
//At the end of this exchange, your program should print out how many guesses it took to get your number.

import 'package:dart_practice/utils/maths.dart';
import 'package:dart_practice/utils/validators.dart';

void main(List<String> args) {
  guessNumber();
}

void guessNumber() {
  final numberRandom = Maths.randomInt(100) + 1;

  int numberGuess;
  var min = 1;
  var max = 100;
  do {
    do {
      numberGuess = Validators.inputInt('Guess a number: ');
      if (numberGuess < min || numberGuess > max) {
        print('Please guess a number larger than $min and smaller $max');
      }
    } while (numberGuess < min || numberGuess > max);

    if (numberGuess > numberRandom) {
      print('The number to find is smaller than the number you guess');
      max = numberGuess - 1;
    } else if (numberGuess < numberRandom) {
      print('The number to find is large than the number you guess');
      min = numberGuess + 1;
    } else {
      print('The exact number to look for is $numberRandom');
    }
  } while (numberGuess != numberRandom);
}
