import 'dart:convert';

AddRegisterModel addRegisterModelFromJson(String str) =>
    AddRegisterModel.fromJson(json.decode(str));

class AddRegisterModel {
  AddRegisterModel({
    this.status,
    this.message,
    this.data,
  });

  final String? status;
  final String? message;
  final Data? data;

  factory AddRegisterModel.fromJson(Map<String, dynamic> json) =>
      AddRegisterModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.user,
  });

  final User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );
}

class User {
  User({
    this.name,
    this.email,
    this.password,
    this.password_confirmation,
  });

  final String? name;
  final String? email;
  final String? password;
  final String? password_confirmation;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
      );
}
