void main(List<String> args) {
  list();
  set();
  map();
}

void list() {
  var list = [
    'Car',
    'Boat',
    'Plane',
  ];

  print(list.length); // 3

  print(list[0]); // Car

  var list2 = [
    'Bus',
    ...list,
  ]; // concatenate list
  print(list2);
}

void set() {
  // set is a list with no duplicate elements
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  halogens.add('fluorine'); // Executing the code has no effect
}

void map() {
  Map<String, String> gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  for (String key in gifts.keys) {
    print(gifts[key]);
  }
}
