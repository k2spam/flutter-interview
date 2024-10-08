abstract class Coffee {
  String desctiption();
  double cost();
}

class SimpleCoffe implements Coffee {
  @override 
  String desctiption() => "Simple coffee";

  @override
  double cost() => 3;
}

class CoffeeWithMilkDecorator implements Coffee {
  Coffee coffee;

  CoffeeWithMilkDecorator(this.coffee);

  @override
  String desctiption() => coffee.desctiption() + " with milk";

  @override
  double cost() => coffee.cost() + 2;
}

void main() {
  Coffee simpleCoffe = SimpleCoffe();
  Coffee coffeeWithMilk = CoffeeWithMilkDecorator(simpleCoffe);

  print(simpleCoffe.desctiption());
  print(simpleCoffe.cost());

  print(coffeeWithMilk.desctiption());
  print(coffeeWithMilk.cost());
}