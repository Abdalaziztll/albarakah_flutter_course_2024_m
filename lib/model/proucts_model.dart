import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProductModel {
  String title;
  String description;
  String thumbnail;
  ProductModel({
    required this.title,
    required this.description,
    required this.thumbnail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'thumbnail': thumbnail,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      title: map['title'] as String,
      description: map['description'] as String,
      thumbnail: map['thumbnail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
