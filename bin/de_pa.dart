import 'package:de_pa/de_pa.dart';

main() {
  // Future temp;
  // Stream temp2;
  // ! async 
  // ! await
  // ? async*
  // ? yield


  // Point newPoint = Point(x: 20, y: 30);

  // Animal dog = Animal(name: 'Dogy');
  // print(dog.name);
  // // dog.changeName();

  // Cat cat = Cat(name: 'ketty', color: 'red');
  // cat.changeName();
  // cat.meow();
  // print(cat.name);

  void newPrinter(String echo) {
    print(echo);
  }

  Function temp = newPrinter;
  print(temp.toString());
  temp("hello");

  Function action = (String name) {
    print(name);
  };
  action("New World");

  calculate({required Function add, required Function sub}) {
    add(3, 6);
    sub(5, 5);
  }

  calculate(add: (int x, int y) {
    print(x + y);
  }, sub: (int x, int y) {
    print(x - y);
  });

  Animal ketty = Cat(name: 'name', color: "color");

  // print(ketty.name);

  Cat cat = Cat(name: "Ketty", color: 'white');
  print(cat.toString());

  cat.changeName();
  print(cat.name);

  matcher(Dog(name: "name"));

  cat.walk();

  // Cat newCat = Animal(name: 'csjkadklsa');

  // newPoint.x = 7;
  // print(newPoint.x);
  // print(newPoint.y);
  // newPoint.moveDown(30);
  // print(newPoint.y);
  // newPoint.moveRight(20);
  // print(newPoint.x);

  // Point center = Point(x: 0, y: 0);
  // center.moveRight(1);
  // print(center.x);

  // addTwoNumberAndMultiplyWithThird(30, second: 20, third: 30);
  // // print(name);
  // // addTwoNumberAndMultiplyWithThird(30, third: 10, second: 20);

  // // addTwoNumberAndMultiplyWithThird(20, third: 10);

  // int result = addTwoNumberAndMultiplyWithThirdWithReturnType(20, 30, 30);

  // print(result);

  Line l1 = Line(
    end: Point(
      x: 2,
      y: 3,
    ),
    start: Point(
      x: 0,
      y: 0,
    ),
  );

  print(l1.end.x);
  print(l1.start.x);
}

matcher(Animal animal) {
  if (animal is Dog) {
    print("this is a dog");
  } else {
    print("this is a cat");
  }
}

void addTwoNumberAndMultiplyWithThird(int first,
    {int second = 0, required int third}) {
  String name = "Hello";
  print(name);

  print(first + second * third);
}

int addTwoNumberAndMultiplyWithThirdWithReturnType(
    int first, int second, int third) {
  return first + second * third;
}

class Point {
  int x;
  int y;

  Point({required this.x, required this.y});

  _sub(int offset, int y) {
    return offset - y;
  }

  moveDown(int offset) {
    y = _sub(offset, y);
  }

  moveRight(int offset) {
    x = x + offset;
  }
}

class Line {
  Point start;
  Point end;
  Line({required this.end, required this.start});
}

abstract class Animal {
  String name;

  Animal({required this.name});

  changeName() {
    name = "Mr." + name;
  }

  walk();
}

class Cat extends Animal {
  String color;
  Cat({required super.name, required this.color});

  meow() {
    print("I am Meowing");
  }

  @override
  String toString() {
    return "color : ${color} , name : ${super.name}";
  }

  @override
  changeName() {
    super.name = "Miss." + super.name;
  }

  @override
  walk() {
    print("I am a walking ${this.runtimeType}");
  }
}

class Dog extends Animal {
  Dog({required super.name});

  @override
  walk() {
    print("I am a walking ${this.runtimeType}");
  }
}
