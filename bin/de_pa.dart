// ignore_for_file: public_member_api_docs, sort_constructors_first
void main() {
  Meal meal = Meal('beans', 'protin', 'Milk').withSuger('Loctoz');

  print(meal.suger);
  // Cat cat = Cat(name: "Ketty");
  // Cat cat2 = Cat(name: "Ketty");

  Cat cat = Cat.getInstance();
  Cat cat2 = Cat.getInstance();

  if (cat2 == cat) {
    print("Matched");
  } else {
    print("Not Matched");
  }
}

class Cat {
  String name;
  Cat({
    required this.name,
  });

  static Cat cat = Cat(name: "Singleton Cat");

  static getInstance() {
    return cat;
  }

  // ! denfination for ==

  // @override
  // bool operator ==(covariant Cat other) {
  //   if (identical(this, other)) return true;

  //   return
  //     other.name == name;
  // }

}

// ? builder pattern

class Meal {
  String? beans;
  String? protin;
  String? suger;
  Meal(
    this.beans,
    this.protin,
    this.suger,
  );

  withbeans(String typeOfBeans) {
    this.beans = typeOfBeans;
    return this;
  }

  withSuger(String typeOfSuger) {
    this.suger = typeOfSuger;
    return this;
  }
}
