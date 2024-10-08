abstract class Button {
  void render();
}

class IOSButton extends Button {
  @override
  void render() {
    print('ios button');
  }
}

class AndroidButton extends Button {
  @override
  void render() {
    print('android button');
  }
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
  print(ButtonFactory.createButton('IOS'));
  print(ButtonFactory.createButton('Android'));
  // print(ButtonFactory.createButton('ios'));
}