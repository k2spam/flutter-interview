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
    void drive(); // Абстрактный метод требующий реализации в классе потомке
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

SOLID это 5 ключевых принципов написания кода

**S** - Single Responsibility Principle `(Принцип единственной ответственности)`

**O** - Open/Closed Principle `(Принцип открытости/Закрытости)`

**L** - Liskov Substitution Principle `(Принцип подстановки Барбары Лисков)`

**I** - Interface Sergeration Principle `(Принцип разделения интерфейса)`

**D** - Dependency Inversion Principle `(Принцип инверсии зависимостей)`

### Single Responsibility Principle

`(Принцип единственной ответственности)` это принцип согласно которому каждый класс  должен иметь одну зону ответственности, то есть выполнять только одну задачу.

Пример **нарушения** принципа:

```dart
class UserService { // Сервис работы с пользователем
    void updateUser() {} // Обновление данных пользователя
    void sendEmail() {} // Отправка сообщений
}
```

Правильное решение:

```dart
class UserService { // Сервис работы с пользователем
    void updateUser() {}
}

class EmailService { // Сервис отвечающий за работу сообщений
    void sendEmail() {}
}
```

### Open/Closed Principle

`(Принцип открытости/Закрытости)` это принцип согласно которому классы должны быть открыты для расширения и закрыты для изменений. Это означает, что для расширения функциональности класса не следует изменять и дополнять сам базовый класс, следует добавить расширенный функционал в классе потомке, базовый же класс должен отвечать только общий функционал или содержать набор необходимых методов, а конкретные решения должны находиться в классах потомках.

Пример **нарушения** принципа:

```dart
class Payment {
    void process(String type) {
        if('credit_card') {} 
        else if('mobile') {}
        else if('paypal') {}
    }
}
```

Правильное решение:

```dart
abstract class Payment {
    void process();
}

class CreditCardPayment implements Payment {
    void process() {
        // Платежи картами
    }
}

class MobilePayment implements Payment {
    void process() {
        // Оплата счетом мобильного устройства
    }
}

class PaypalPayment implements Payment {
    void process() {
        // Оплата через paypal
    }
}
```

### Liskov Substitution Principle

`(Принцип подстановки Барбары Лисков)` это принцип по которому классы наследники должны дополнять родительский класс без нарушения принципов работы, то есть все методы родительского класса при наследовании должны исполняться в классе наследнике без отмены их действий

Пример **нарушения** принципа:

```dart
// Например в классе присутствует метод
// Который невозможен в классе наследнике
class Payment () { 
    void sendDigitalCode() {
        print('1234');
    }
}

// Наследник, который поддерживает метод
class CreditCardPayment extends Payment { 
    @override
    void sendDigitalCode() {
        print('2345');
    }
}

// Наследник, который НЕ поддерживает метод
class PaypalPayment extends Payment {
    @override
    void sendDigitalCode() {
        throw Exception('Error');
    }
}
```

Правильное решение:

```dart
// Класс с набором методов подходящих для всех типов оплаты
class Payment {} 

// Дополнительный класс с поддержкой отправки цифрового кода подтверждения
class DigitalCodePayment extends Payment {
    void sendDigitalCode() {}
}

// Класс оплаты с необходимой отправкой цифрового кода
class CreditCardPayment extends DigitalCodePayment {}

// Класс оплаты БЕЗ необходимой отправки цифрового кода
class PaypalPayment extends Payment {}
```

### Interface Sergeration Principle

`(Принцип разделения интерфейса)` повторяет то же правило что и принцип Барбары Лисков, только для интерфейсов. Не следует заставлять класс реализовывать методы, которые ему не нужны.

Пример **нарушения** принципа:

```dart
abstract class Worker () {
    void work();
    void eat();
}

class Robot () implements Worker {
    @override 
    void work() {}

    // Реализация данного метода невозможна в данном классе
    @override 
    void eat() { throw Exception('Error') } 
}
```

Правильное решение:

```dart
abstract class Worker {
    void work();
}

abstract class Eater() {
    void eat();
}

class Robot implements Worker {
    @override
    void work() {}
}

class Human implements Worker, Eater {
    @override
    void work() {}

    @override
    void eat() {}
}
```

### Dependency Inversion Principle

`(Принцип инверсии зависимостей)` это принцип по которому одни классы не должны зависеть от других классов напрямую. Все классы должны зависеть от абстракций (интерфейсов), а не от конкретных реализаций.

Пример **нарушения** принципа:

```dart
class Ligth {
    void turnOn() {}
}

class Switch {
    final Light light;

    Swithc(this.light);

    void toggle() {
        light.turnOn();
    }
}
```

Правильное решение:

```dart
abstract class Switchable {
    void turnOn();
}

class Light implements Switchable {
    @override
    void turnOn() {}
}

class Switch {
    final Switchable device;

    Switch(this.device);

    void toggle() {
        device.turnOn();
    }
}
```

Суть в том, что в класс ``Switch`` должен приходить экземпляр не конкретного класса, а экземпляр, который удовлетворяет определенному контракту, то есть реализует все необходимые методы для правильной работы логики внутри класса ``Switch``

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
