import 'package:dart_examples/class_modifiers/examples_final.dart';

Vehicle myVehicle = Vehicle();

// ERROR: Cannot be inherited outside of the current library
// class Car extends Vehicle {
//   int passengers = 4;
//   // ...
// }


// ERROR: Cannot be implemented outside of the current library
// class MockVehicle implements Vehicle {
//   @override
//   void moveForward(int meters) {
//     // ...
//   }
// }