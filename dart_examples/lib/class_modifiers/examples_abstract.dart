void main(List<String> args) {
  // Employee emp = Employee(); Error because Employee is Abstract class cannot be constructed

  Employee emp1 = Programmer('Huy', 22, 8000000, 10); //constructed Employee (Programmer)

  print(emp1.getSalary()); // use . to method getSalary

  Employee emp2 = Verifier('Hau', 28, 10000000, 10); //constructed Employee (Programmer)
  
  print(emp2.getSalary());

}

abstract class Employee {
  String name; // field is Employee
  int age;
  double basicSalary;

  // constructor
  Employee(this.name, this.age, this.basicSalary);

  // abstract method => Employee obligatory abstract class
  double getSalary();
}

class Programmer extends Employee {
  // Programmer extend Employee
  int overtimeHours;

  Programmer(String name, int age, double basicSalary, this.overtimeHours)
      : super(name, age, basicSalary); //super call constructor Employee

  // because Programmer extend Employee override abstract method getSalary
  @override
  double getSalary() {
    return basicSalary + overtimeHours * 30000;
  }
}

class Verifier extends Employee {
  int errorNumber;

  Verifier(String name, int age, double basicSalary, this.errorNumber)
      : super(name, age, basicSalary); //super call constructor Employee

  // because Verifier extend Employee override abstract method getSalary
  @override
  double getSalary() {
    return basicSalary = errorNumber * 10000;
  }
}
