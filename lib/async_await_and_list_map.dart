// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Todos {
  int userId;
  int id;
  String title;
  bool completed;
  Todos({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory Todos.fromMap(Map<String, dynamic> map) {
    return Todos(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      completed: map['completed'] as bool,
    );
  }
}

class Address {
  String street;
  String city;
  String suite;
  Address({
    required this.street,
    required this.city,
    required this.suite,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'city': city,
      'suite': suite,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street: map['street'] as String,
      city: map['city'] as String,
      suite: map['suite'] as String,
    );
  }
}

class User {
  int id;
  String name;
  Address address;
  User({
    required this.id,
    required this.name,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      address: Address.fromMap(map['address'] as Map<String, dynamic>),
    );
  }
}
