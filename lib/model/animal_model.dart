// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AnimalModel {
  String name;
  String? image;
  AnimalModel({
    required this.name,
     this.image,
  });

  AnimalModel copyWith({
    String? name,
    String? image,
  }) {
    return AnimalModel(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
    };
  }

  factory AnimalModel.fromMap(Map<String, dynamic> map) {
    return AnimalModel(
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimalModel.fromJson(String source) => AnimalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AnimalModel(name: $name, image: $image)';

  @override
  bool operator ==(covariant AnimalModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode;
}
