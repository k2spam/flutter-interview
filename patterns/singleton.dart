class Singleton {
  static final Singleton _instance = Singleton._internal();

  Singleton._internal();

  static Singleton get instance => _instance;

  void process () {
    print('Singleton');
  }
}

void main() {
  final config = Singleton.instance;
  config.process();
}