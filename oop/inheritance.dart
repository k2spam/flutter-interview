class Person { 
  String name;
  Person(this.name);

  void greet() {
    print('My name is $name');
  }
}

class Employee extends Person { 
  int employeeId;
  Employee(String name, this.employeeId) : super(name);

  void showId() {
    print('My employee ID is $employeeId');
  }
}

void main() {
  Employee worker = Employee('Mike', 1);
  worker.greet();
  worker.showId();
}