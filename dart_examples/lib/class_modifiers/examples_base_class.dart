import 'package:dart_examples/class_modifiers/examples_base.dart';

void main(List<String> args) {
  Vehicle myVehicle = Vehicle(); // Can be Construct

  myVehicle.moveForward(23);
}

// Can be extended
base class Car extends Vehicle {
  int passengers = 4;
  // ...
}

// ERROR: Cannot be implemented
// base class MockVehicle implements Vehicle {
//   @override
//   void moveForward(int meters) {
//     // ...
//   }
// }
