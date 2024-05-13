// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';

import 'design_pattern.dart';

void main() async {
  
  Person person = Person.getInstance();

  Person person2 = Person.getInstance();

  if (person2 == person) {
    print("Matched");
  } else {
    print("Not Matched");
  }

  // Response result =
  //     await Dio().get("https://56fa-5-134-200-72.ngrok-free.app/user");

  // ResutlModel temp = ResutlModel.fromMap(result.data);
  // print(temp);

  // List<String> names = ["Hello", "World"];
  // names.shuffle();
  // names.forEach((element) {
  //   print(element);

  // });
}

class ResutlModel {
  int status_code;
  User data;
  ResutlModel({
    required this.status_code,
    required this.data,
  });

  ResutlModel copyWith({
    int? status_code,
    User? data,
  }) {
    return ResutlModel(
      status_code: status_code ?? this.status_code,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status_code': status_code,
      'data': data.toMap(),
    };
  }

  factory ResutlModel.fromMap(Map<String, dynamic> map) {
    return ResutlModel(
      status_code: map['status code'] as int,
      data: User.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResutlModel.fromJson(String source) =>
      ResutlModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ResutlModel(status_code: $status_code, data: $data)';

  @override
  bool operator ==(covariant ResutlModel other) {
    if (identical(this, other)) return true;

    return other.status_code == status_code && other.data == data;
  }

  @override
  int get hashCode => status_code.hashCode ^ data.hashCode;
}

class User {
  String Hello;
  User({
    required this.Hello,
  });

  User copyWith({
    String? Hello,
  }) {
    return User(
      Hello: Hello ?? this.Hello,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Hello': Hello,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      Hello: map['Hello'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(Hello: $Hello)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.Hello == Hello;
  }

  @override
  int get hashCode => Hello.hashCode;
}
