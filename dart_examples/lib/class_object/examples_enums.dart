void main(List<String> args) {
  print(Color.red.name); // red
  print(Color.green.name); // green

  Color a = Color.blue;
  print(a);
}

// create enums Color
enum Color { red, green, blue }