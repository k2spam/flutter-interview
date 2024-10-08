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
    print("$_name updated");
  }
}

void main() {
  Subject subject = Subject();

  Listener listener1 = Listener('Listener 1');
  Listener listener2 = Listener('Listener 2');

  subject.attach(listener1);
  subject.attach(listener2);

  subject.notifyAll();
}