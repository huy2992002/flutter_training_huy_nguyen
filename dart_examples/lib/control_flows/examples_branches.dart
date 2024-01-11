void main(List<String> args) {
  evenOddNumber(4); // This is an even number !!!
  evenOddNumber(3); // This is an odd number !!!
  print(daysInMonth(2024, 2)); // 29
  print(daysInMonth(2023, 2)); // 28
}

//The condition in parentheses after if must be an expression that evaluates to a boolean:

void evenOddNumber(int n) {
  if (n % 2 == 0) {
    print('This is an even number !!!');
  } else {
    print('This is an odd number !!!');
  }
}

int daysInMonth(int year, int month) {
  if (month < 1 || month > 12) {
    throw ArgumentError('Month must be between 1 and 12');
  }

  if (month == 2) {
    // Determine leap year to calculate days in February
    if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
      return 29; // If it's a leap year, February has 29 days
    } else {
      return 28; // If it's not a leap year, February has 28 days
    }
  } else if ([1, 3, 5, 7, 8, 10, 12].contains(month)) {
    return 31; // Months with 31 days
  } else {
    return 30; // Months with 30 days
  }
}
