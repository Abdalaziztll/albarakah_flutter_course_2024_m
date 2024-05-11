import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:dymmujson_api/dymmujson_api.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
void main() async {
  // Dio req = Dio();

  // // ? The First Solutaion

  // Response result = await req.get("https://dummyjson.com/products");

  // ProductModel productModel = ProductModel.fromMap(result.data);

  // print(productModel);

  // // ? The Second Solutaion

  // result = await req.get("https://dummyjson.com/products");

  // List<Products> products = [];

  // for (var i = 0; i < result.data['products'].length; i++) {
  //   Products product = Products.fromMap(result.data['products'][i]);
  //   products.add(product);
  // }

  // print(products);

// ! change email in every request
  String token = await SignUp(
    UserModel(
      firstName: 'firstName',
      lastName: 'lastName',
      email: 'abdss@gmail.com',
      password: 'password',
      role: 'USER',
    ),
  );

  await getPorject(token);
}

SignUp(UserModel user) async {
  Dio req = Dio();

  Response resutl = await req.post(
      'https://projects-management-system.onrender.com/api/v1/auth/register',
      data: user.toMap());
  print(resutl);
  return resutl.data['token'];
}

getPorject(String token) async {
  Dio req = Dio();

  Response response = await req.get(
      "https://projects-management-system.onrender.com/api/v1/projects",
      options: Options(headers: {"Authorization": "Bearer ${token}"}));

  print(response);
}

class ProductModel {
  List<Products> products;
  num total;
  num skip;
  num limit;
  ProductModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  ProductModel copyWith({
    List<Products>? products,
    num? total,
    num? skip,
    num? limit,
  }) {
    return ProductModel(
      products: products ?? this.products,
      total: total ?? this.total,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((x) => x.toMap()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      products: List<Products>.from(
        (map['products'] as List<dynamic>).map<Products>(
          (x) => Products.fromMap(x as Map<String, dynamic>),
        ),
      ),
      total: map['total'] as num,
      skip: map['skip'] as num,
      limit: map['limit'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(products: $products, total: $total, skip: $skip, limit: $limit)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return listEquals(other.products, products) &&
        other.total == total &&
        other.skip == skip &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    return products.hashCode ^ total.hashCode ^ skip.hashCode ^ limit.hashCode;
  }
}

class Products {
  num id;
  String title;
  String description;
  num price;
  num stock;
  String brand;
  Products({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.stock,
    required this.brand,
  });

  Products copyWith({
    num? id,
    String? title,
    String? description,
    num? price,
    num? stock,
    String? brand,
  }) {
    return Products(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      brand: brand ?? this.brand,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'stock': stock,
      'brand': brand,
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      id: map['id'] as num,
      title: map['title'] as String,
      description: map['description'] as String,
      price: map['price'] as num,
      stock: map['stock'] as num,
      brand: map['brand'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Products(id: $id, title: $title, description: $description, price: $price, stock: $stock, brand: $brand)';
  }

  @override
  bool operator ==(covariant Products other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.price == price &&
        other.stock == stock &&
        other.brand == brand;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        price.hashCode ^
        stock.hashCode ^
        brand.hashCode;
  }
}
