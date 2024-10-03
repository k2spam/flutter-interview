class User {
  String _name;

  User(this._name);

  String get name => _name;

  set name(String newName) {
    _name = newName;
  }
}

void main() {
  User user = User('Mike');
  print(user.name);
  user.name = 'Jim';
  print(user.name);
}
