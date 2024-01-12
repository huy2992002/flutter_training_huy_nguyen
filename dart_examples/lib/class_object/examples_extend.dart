void main(List<String> args) {
  Television tv = Television('Name 1');

  tv.turnOn(); // Turn on

  SmartTelevision stv = SmartTelevision('Name 2');
  stv.turnOn();
  // Turn on
  // Connected Internet
}

class Television {
  String name;

  Television(this.name);

  void turnOn() {
    print('Turn on');
  }

  void turnOff() {
    print('Turn off');
  }
}

class SmartTelevision extends Television {
  SmartTelevision(super.name);

  // class SmartTelevision extends Television and override turnOn method
  @override
  void turnOn() {
    super.turnOn();
    print("Connected Internet");
  }
}
