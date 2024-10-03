abstract class Vehicle {
  void startEngine();

  void stopEngine() {
    print("Engine stopped");
  }
}

class Car extends Vehicle {
  void startEngine() {
    print("Car engine started");
  }
}

void main() {
  Vehicle car = Car();
  car.startEngine();
  car.stopEngine();
}