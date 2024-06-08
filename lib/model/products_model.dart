// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:clean_service_layter/model/handling.dart';

class ProductsModel extends ResultModel{
  String name;
  ProductsModel({
    required this.name,
  });

  ProductsModel copyWith({
    String? name,
  }) {
    return ProductsModel(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsModel.fromJson(String source) => ProductsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductsModel(name: $name)';

  @override
  bool operator ==(covariant ProductsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
