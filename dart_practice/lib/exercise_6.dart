//Generate a random number between 1 and 100. Ask the user to guess the number,
//then tell them whether they guessed too low, too high, or exactly right.

import 'package:dart_practice/utils/maths.dart';
import 'package:dart_practice/utils/validators.dart';

void main(List<String> args) {
  int random = Maths.randomInt(100);

  int guess = numberGuess();

  if (checkNumberGuess(random, guess) == 0) {
    print('The number you guessed is a the random number');
  } else if (checkNumberGuess(random, guess) > 0) {
    print('The number you guessed is smaller than the random number');
  } else {
    print('The number you guessed is larger than the random number');
  }
}

int numberGuess() {
  int numberGuess;

  do {
    numberGuess = Validators.inputInt('Guess a number from 1 to 100: ');
    if (numberGuess < 1 || numberGuess > 100) {
      print('Please guess a number from 1 to 100');
    }
  } while (numberGuess < 1 || numberGuess > 100);
  return numberGuess;
}

int checkNumberGuess(int numberRandom, int numberGuess) {
  return numberRandom - numberGuess;
}
