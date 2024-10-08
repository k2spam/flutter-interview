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

`Абстракция` позволяет скрывать детали реализации и предоставлять только фажную функциональность. В Dart можно реализовать через абстрактные классы или интерфейсы. Абстрактные классы нельзя инстанциировать напрямую, они могут содержать как абстрактные методы (без реализации), так и конкретные методы с реализацией.

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

Паттерны проектирования бывают:

- Порождающие (создание объекта)
- Структурные (построение сложных структур объектов)
- Поведенческие (взаимодействие между объектами)

### 1. Singleton

`Порождающий паттерн`

Гарантирует, что у класса будет только один экземпляр т предоставляет глобальную точку доступа к этому экземпляру.

```dart
class Singleton {
    static final Singleton _instance = Singleton._internal();

    // Приватный конструктор класса
    Singleton._internal();

    // Единственный экземпляр класса
    static Singleton get instance => _instance;

    // Пример метода в синглоне
    void process() {
        print('singleton');
    }
}

void main() {
    final config = Singleton.instance;
    config.process();
}
```

### 2. Factory

`Порождающий паттерн`

Паттерн фабрики позволяет создавать экземпляр нужного подкласса из нескольких в зависимости от условий. Например есть несколько разных типов кнопок или методов оплаты и в зависимости от текущей платформы необходимо создать подходящий экземпляр.

```dart
abstract class Button {
    void render();
}

class IOSButton extends Button {
    @override
    void render() {}
}

class AndroidButton extends Button {
    @override
    void render() {}
}

class ButtonFactory {
    static Button createButton(String platform) {
        if(platform == 'IOS') {
            return IOSButton();
        } 
        else if (platform == 'Android') {
            return AndroidButton();
        }
        else {
            throw Exception('Unknown platform');
        }
    }
}

void main() {
    print(ButtonFactory.createButton('IOS')); // Instance of 'IOSButton'
    print(ButtonFactory.createButton('Android')); // Instance of 'AndroidButton'
    print(ButtonFactory.createButton('ios')); // Exception
}
```

### 3. Builder

`Порождающий паттерн`

Позволяет создавать сложные обхекты пошагово, скрывая внутренние детали создания, это полезно, когда объект имеет большое количество настроек.

```dart
class House {
    final String foundation;
    final String structure;
    final String roof;

    House._builder(HouseBuilder builder) :
        foundation = builder.foundation,
        structure = builder.structure,
        roof = builder.roof;

    @override
    String toString() {
        return "House: $foundation, $structure, $roof";
    }
}

class HouseBuilder {
    String foundation = "Base foundation";
    String structure = "Base structure";
    Strign roof = "Base roof";

    HouseBuilder setFoundation(String foundation) {
        this.foundation = foundation;
        return this;
    }

    HouseBuilder setStructure(String structure) {
        this.structure = structure;
        return this;
    }

    HouseBuilder setRoof(String roof) {
        this.roof = roof;
        return this;
    }

    House build() {
        return House._builder(this);
    }
}

void main() {
    House house1 = HouseBuilder().build();
    House house2 = HouseBuilder()
        .setFoundation('1')
        .setFoundation('2')
        .setFoundation('3')
        .build();

    print(house1); // House: Base foundation, Base structure, Base roof
    print(house2); // House: 1, 2, 3
}
```

### 4. Observer

`Поведенческий паттерн`

Определяет зависимость `один ко многим`, при которой изменение состояния одного объекта приводит к уведомлению и обновлению всех зависимых объектов

```dart
abstract class Observer {
    void update();
}

class Subject {
    List<Observer> _observers = [];

    void attach(Observer observer) {
        this._observers.add(observer);
    }

    void notifyAll() {
        for(Observer observer in _observers) {
            observer.update();
        }
    }
}

class Listener implements Observer {
    final String _name;

    Listener(this._name);

    @override
    void update() {
        print('$_name updated');
    }
}

void main() {
    Subject subject = Subject();

    Listener listener1 = Listener('Listener 1');
    Listener listener2 = Listener('Listener 2');

    subject.attach(listener1);
    subject.attach(listener2);

    subject.notifyAll(); // Listener 1 updated
                         // Listener 2 updated
}
```

### 5. Strategy

`Поведенческий паттерн`

Определяет семейство алгоритмов, инкапсулирует каждый из них и делает их взаимозаменяемыми, что позволяет переключаться между алгоритмами на лету.

```dart
abstract class PaymentStrategy {
    void pay(double amount);
}

class CreditCardPayment implements PaymentStrategy {
    @override
    void pay(double amount) {
        print('Paid $amount using credit card');
    }
}

class PayPalPayment implements PaymentStrategy {
    @override
    void pay(double amount) {
        print('Paid $amount using PayPal')
    }
}

class PaymentContext {
    PaymentStrategy? _strategy;

    void setStrategy(PaymentStrategy strategy) {
        _strategy = strategy;
    }

    void process(double amount) {
        _strategy?.pay(amount);
    }
}

void main() {
    PaymentContext payment = PaymentContext();

    payment.setStrategy(CreditCardPayment());
    payment.process(100); // Paid 100 using credit card

    payment.setStrategy(PayPalPayment());
    payment.process(122); // Paid 122 using PayPal
}
```

### 6. Decorator

`Структурный паттерн`

Позволяет динамически добавлять поведение объектам, оборачивая их в другие объекты

```dart
abstract class Coffee {
    String description();
    double cost();
}

class SimpleCoffee implements Coffee {
    @override
    String decoration() => "Simple coffee";

    @override
    double cost() => 3;
}

class CoffeeWithMilkDecorator implements Coffee {
    Coffee coffee;

    CoffeeWithMildDecorator(this.coffee);

    @override
    String description() => coffee.description() + " with milk";

    @override
    double cost() => coffee.cost() + 2;
}

void main() {
    Coffee simpleCoffee = SimpleCoffee();
    Coffee coffeeWithMilk = CoffeeWithMilkDecorator(simpleCoffee);

    print(simpleCoffee.description()); // Simple coffee
    print(simpleCoffee.cost()); // 3

    print(coffeeWithMilk.description()); // Simple coffee with milk
    print(coffeeWithMilk.cost()); // 5
}
```

---

### Виды архитектур MVP, MVC MVVM

Архитектурные паттерны используются для того чтобы разделить логику, представление и работу с данными.

### MVC (Model-View-Controller)

### MVP (Model-View-Presenter)

### MVVM (Model-View-ViewModel)

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

### Stateful и Stateless widgets

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
