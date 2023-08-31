// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String token;
  String? refreshToken;
  User? user;

  UserModel({
    required this.token,
    this.refreshToken,
    this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json["token"],
        refreshToken: json["refreshToken"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refreshToken": refreshToken,
        "user": user!.toJson(),
      };
}

class User {
  String id;
  String type;
  dynamic status;
  String email;
  String username;
  String phone;
  String image;
  String fullName;
  String name;
  String userJwtIdentifier;

  User({
    required this.id,
    required this.type,
    required this.status,
    required this.email,
    required this.username,
    required this.phone,
    required this.image,
    required this.fullName,
    required this.name,
    required this.userJwtIdentifier,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        type: json["type"],
        status: int.parse(json["status"].toString()),
        email: json["email"],
        username: json["username"],
        phone: json["phone"],
        image: json["image"],
        fullName: json["fullName"],
        name: json["name"],
        userJwtIdentifier: json["userJwtIdentifier"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "type": type,
        "status": status,
        "email": email,
        "username": username,
        "phone": phone,
        "image": image,
        "fullName": fullName,
        "name": name,
        "userJwtIdentifier": userJwtIdentifier,
      };
}
