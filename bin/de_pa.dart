// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

void main() {
  Cat cat = Cat.getInstance();
  Cat cat1 = Cat.getInstance();

  if (cat == cat1) {
    print("Matched");
  } else {
    print("Not Matched");
  }

  Home home = HomeBuilder().build();

  print(home.home.allView);
}



// ?  SingleTone Pattern
// ?  reduce resources

class Cat {
  String name;
  Cat._({
    required this.name,
  });

  static Cat cat = Cat._(name: "Single Cat");

  static getInstance() {
    return cat;
  }
}


// ?  Builder Pattern 
// ?  Customize Code

class Home {
  HomeBuilder home;
  Home({required this.home});
}

class HomeBuilder {
  int? roomCount;
  String? location;
  bool? allView;

  HomeBuilder withRoom(int count) {
    this.roomCount = count;
    return this;
  }

  HomeBuilder withLocation(String location) {
    this.location = location;
    return this;
  }

  HomeBuilder withallView(bool allViewd) {
    this.allView = allViewd;
    return this;
  }

  Home build() {
    return Home(home: this);
  }
}
