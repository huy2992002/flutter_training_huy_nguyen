//Generate a random number between 1 and 100. Ask the user to guess the number,
//then tell them whether they guessed too low, too high, or exactly right.

import 'package:dart_practice/utils/math.dart';
import 'package:dart_practice/utils/validator.dart';

void main(List<String> args) {
  guessNumber();
}

void guessNumber() {
  final numberRandom = Math.randomInt(100) + 1;
  int numberGuess;
  
  do {
    numberGuess = Validator.inputInt('Guess a number from 1 to 100: ');
    if (numberGuess < 1 || numberGuess > 100) {
      print('Please guess a number from 1 to 100');
    }
  } while (numberGuess < 1 || numberGuess > 100);

  if (numberGuess > numberRandom) {
    print('The number you guessed is larger than the random number');
  } else if (numberGuess < numberRandom) {
    print('The number you guessed is smaller than the random number');
  } else {
    print('The number you guessed is a the random number');
  }
}
