class Vehicle {
  void startEngine() {
    print('Engine started');
  }

  void stopEngine() {
    print('Engine stopped');
  }
}

class Car implements Vehicle {
  @override 
  void startEngine() {
    print('Car engine started');
  }

  @override
  void stopEngine() {
    print('Car engine stopped');
  }
}

void main () {
  Vehicle car = Car();
  car.startEngine();
  car.stopEngine();
}