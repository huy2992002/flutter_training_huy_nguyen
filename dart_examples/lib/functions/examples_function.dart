void main(List<String> args) {
  sum(6, 7); // 13 call func sum with parameter(a = 6, b = 7)
  difference(5, 3); // 2
  hello('Hau'); //Hi Hau, how old are you?
  hello('Huy', yearOfBirth: 2002); //Hi huy, your age is 22
}

//create function
//return type - nameFunction - (List parameter) - {body}
double sum(double a, double b) {
  return a + b;
}

// create func only one line
double difference(double a, double b) => a - b;

//If want a named parameter to be mandatory, requiring callers to provide a value for the parameter
//use {required ...}
double rectangleArea({required double length, required double width}) {
  return length * width;
}

//Optional positional parameters
void hello(String name, {int? yearOfBirth}) {
  if (yearOfBirth != null) {
    int age = DateTime.now().year - yearOfBirth;
    print('Hi $name, your age is $age');
  } else {
    print('Hi $name, how old are you?');
  }
}

//Anonymous functions
void printList() {
  const abc = ['apples', 'bananas', 'oranges'];
  abc.map((e) => e.toLowerCase()).forEach((element) {
    print(element);
  });

  // map() and foreach() is Anonymous functions list
}
