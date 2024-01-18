sealed class Vehicle {}

// can extends 
class Car extends Vehicle {}

// can implements
class Truck implements Vehicle {}

class Bicycle extends Vehicle {}

// ERROR: Cannot be instantiated
// Vehicle myVehicle = Vehicle();

// Subclasses can be instantiated
Vehicle myCar = Car();

Vehicle myBicycle = Bicycle();