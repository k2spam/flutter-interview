class Animal {
  void sound() {
    print('Animal makes a sound');
  }
}

class Dog extends Animal {
  @override
  void sound() {
    print('Dog barks');
  }
}

void main() {
  Animal animal = Animal();
  Animal dog = Dog();

  animal.sound(); 
  dog.sound(); 
}