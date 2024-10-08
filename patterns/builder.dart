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
  String roof = "Base roof";

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
    .setStructure('2')
    .setRoof('3')
    .build();

  print(house1);
  print(house2);
}