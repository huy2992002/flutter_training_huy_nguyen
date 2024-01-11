import 'dart:math';

void main(List<String> args) {
  var p1 = Point(2, 4); // point is Object class in library dart:math

  print(p1.x); // Use a dot (.) to refer to an instance variable or method:

  //new Object Person
  var person = Person('huy', 22);

  person.printInfo(); // Name: Huy, Age: $22

  Person.sayHello(); // call method static with name Class
}

class Person {
  String name; // field of Object
  int age;

  Person(this.name, this.age);

  // func in Class understand the operation of that object
  void printInfo() {
    print('Name: $name, Age: $age');
  }

  //static method
  static void sayHello(){
    print('Say Hello');
  }
}


