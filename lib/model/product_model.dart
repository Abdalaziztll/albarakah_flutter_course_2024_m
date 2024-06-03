// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  num id;
  String name;
  String thumbnail;
  num price;
  num rating;
  ProductModel({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.price,
    required this.rating,
  });

  ProductModel copyWith({
    String? name,
    String? thumbnail,
    num? price,
    num? rating,
  }) {
    return ProductModel(
      id: id,
      name: name ?? this.name,
      thumbnail: thumbnail ?? this.thumbnail,
      price: price ?? this.price,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': name,
      'thumbnail': thumbnail,
      'price': price,
      'rating': rating,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? 1,
      name: map['title'] as String,
      thumbnail: map['thumbnail'] as String,
      price: map['price'] as num,
      rating: map['rating'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(name: $name, thumbnail: $thumbnail, price: $price, rating: $rating)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.thumbnail == thumbnail &&
        other.price == price &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        thumbnail.hashCode ^
        price.hashCode ^
        rating.hashCode;
  }
}
