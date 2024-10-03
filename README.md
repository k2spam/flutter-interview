# Flatter interview

## Общие вопросы

### ООП

Основные принципы ООП:

- Инкапсуляция
- Наследование
- Полиморфизм
- Абстракция

`Инкапсуляция` это механизм, который объединяет данные и методы, которые работают с этими данными в один объект и защищает их от внешнего воздействия. Поля класса обычно делаются приватными, а доступ к ним осуществляется через методы (`геттеры` и `сеттеры`). В Dart это реализуется через использование префикса `_` для скрытия полей и методов от внешнего мира.

```dart
class User {
    String _name; // Приватное поле
    User(this._name)

    String get name => _name; // геттер

    set(String newName) { // сеттер
        _name = newName;
    }
}

void main() {
    User user = User('Mike');
    print(user.name); // Mike
    user.name = 'Jim';
    print(user.name); // Jim
}
```

`Наследование` позволяет одному классу наследовать свойства и методы другого класса. Это позволяет избежать дублирования кода и повторно использовать уже существующую функциональность. В Dart наследование реализуется с помощью ключегово слова `extends`.

```dart
class Person {
    String name;
    Person(this.name);

    void greet() {
        print('My name is $name');
    }
}

class Employee extends Person { // Наследуем класс Person
    int employeeId;
    Employee(String name, this.employeeId) : super(name);

    void showId() {
        print('My employee ID is $employeeId');
    }
}

void main() {
    Employee worker = Employee('Mike', 1);
    worker.greet(); // My name is Mike
    worker.showId(); // My employee ID is 1
}
```

`Полиморфизм` это способность объектов разных типов обрабатывать данные через одинаковый интерфейс. Есть 2 типа полиморфизма: `компиляционный` (перегрузка методов) и `рантайм полиморфизм` (использование наследования). В Dart используется `рантайм полиморфизм` с помощью наследования и переопределения методов.

```dart
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

    animal.sound(); // Animal makes a sound
    dog.sound(); // Dog barks
}
```

`Абстракция` позволяет скрывать детали реализации и предоставлять только фажную функциональность. В Dart можно реализовать через абстрактные классы или интерфейсы. Абстрактные классы нельзя инстанцииоровать напрямую, они могут содержать как абстрактные методы (без реализации), так и конкретные методы с реализацией.

```dart
abstract class Vehicle {
    void drive(); // Абстрактный метод требующий реализации в классе потоке
}

class Car extends Vehicle {
    void drive() { // Реализация абстрактного метода
        print('Car is driving');
    }
}

void main() {
    Vehicle car = Car();
    car.drive(); // Car is driving
}
```

---

### Разница между абстрактным классом и интерфейсом

`Абстрактный класс` не может быть истанциирован напрямую, то есть мы не можем создать экземпляр абстрактного класса, так как он может содержать абстрактные мотоды, которые не имеют реализации. Абстрактный класс служит основой для других классов, он необходим, чтобы обозначить базовую функциональность, которую можно будет реализовать и расширить уже в классах потомках. Чтобы унаследовать абстрактный класс используется ключево слово `extends`

```dart
abstract class Vehicle {
    void engineStart(); // Абстрактный метод без реализации

    void stopEngine() { // Метод с реализаций
        print('Engine stopped'); 
    }
}

class Car extends Vehicle {
    void engineStart() { // Абстрактные методы обязательно должны быть реализованы
        print('Car engine started');
    }
}

void main() {
    Vehicle car = Car();
    car.engineStart(); // Car engine started
    car.engineStop(); // Engine stopped
}
```

`Интерфейс` в Dart не является отдельным типом сущности, любой класс может быть использован как интерфейс. Для использования класса как интерфейса есть ключевое слово `implements`. Основное различие между интерфейсом и абстрактным классом в том, что при использование класса как интерфейса обязывает потомка реализовать все методы интерфейса даже если они реализованы в классе интерфейсе. Для этого используется ключевое слово `@override`

```dart
class Vehicle { 
    void startEngine() {
        print('Engine started');
    }

    void stopEngine() {
        print('Engine stopped');
    }
}

class Car implements Vehicle { // Указываем класс Vehicle как интерфейс
    @override // Обязательно реализуем все методы класса Vehicle заново
    void startEngine() { 
        print('Car engine started');
    }

    @override // Обязательно реализуем все методы класса Vehicle заново
    void stopEngine() {
        print('Car engine stopped');
    }
}
```

---

### SOLID

---

### Паттерны/шаблоны проектирования

---

### Виды архитектур MVP, MVC MVVM

---

## Вопросы по языку Dart

### Отличия final от const

---

### Future

---

### EventLoop

---

### Isolate

---

### Stream

---

### Null safety

---

### dynamic, object, null

---

### extension, mixin и abstract class

---

### hash and equals

---

## Вопросы по фреймворку Flutter

### Statful и Stateless widgets

---

### Жизненный цикл виджетов

---

### InheritedWidget

---

### Widget, element, renderObject

---

### Platform channel

---

### Анимации
