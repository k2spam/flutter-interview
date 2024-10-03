abstract class Vehicle {
  void drive(); 
}

class Car extends Vehicle {
  void drive() {
    print('Car is driving');
  }
}

void main() {
  Vehicle car = Car();
  car.drive();
}