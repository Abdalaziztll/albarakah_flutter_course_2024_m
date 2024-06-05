// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserInfoModel {
  String username;
  String email;
  String firstName;
  String gender;
  String image;
  UserInfoModel({
    required this.username,
    required this.email,
    required this.firstName,
    required this.gender,
    required this.image,
  });

  UserInfoModel copyWith({
    String? username,
    String? email,
    String? firstName,
    String? gender,
    String? image,
  }) {
    return UserInfoModel(
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      gender: gender ?? this.gender,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'firstName': firstName,
      'gender': gender,
      'image': image,
    };
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      username: map['username'] as String,
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      gender: map['gender'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfoModel.fromJson(String source) => UserInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserInfoModel(username: $username, email: $email, firstName: $firstName, gender: $gender, image: $image)';
  }

  @override
  bool operator ==(covariant UserInfoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.email == email &&
      other.firstName == firstName &&
      other.gender == gender &&
      other.image == image;
  }

  @override
  int get hashCode {
    return username.hashCode ^
      email.hashCode ^
      firstName.hashCode ^
      gender.hashCode ^
      image.hashCode;
  }
}
