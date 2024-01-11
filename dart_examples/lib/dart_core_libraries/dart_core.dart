//dart:core library is automatically imported.

void main(List<String> args) {
  string();

  print(regularExpressions('123aa')); // true
  print(regularExpressions('abcd')); // true

  collections();

  dateTime();

  uri();
}

void string() {
  // Some classes in dart:core library, such as String and StringBuffer
  String st1 = 'Hello !!!';
  print(st1.length);
  var moreShakespeare = StringBuffer();
  moreShakespeare.write('And all the men and women ');
}

bool regularExpressions(String st) {
  //For example, here's a regular expression that matches a substring containing one or more digits:
  var numbers = RegExp(r'\d+');

  if (numbers.hasMatch(st)) {
    return true;
  } else {
    return false;
  }
}

void collections() {
  // List
  var superheroes = ['Batman', 'Superman', 'Harry Potter'];

  // Set
  var villains = {'Joker'};
  print(villains.length); // 1
  villains.addAll([
    'Joker',
    'Lex Luthor',
    'Voldemort'
  ]); // 'Joker' is already in the set so it cannot be added
  print(villains.length); // 3
}

void dateTime() {
  // DateTime

  var now = DateTime.now();
  var berlinWallFell = DateTime(1989, 11, 9);
  var moonLanding = DateTime.parse("1969-07-20");
}

void uri() {
  //A Uri object represents a uniform resource identifier, which identifies a resource, for example on the web.

  var dartlang = Uri.parse('http://dartlang.org/');
}
