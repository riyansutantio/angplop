import 'dart:convert';

ForgotPasswordModel forgotPasswordModelFromJson(String str) =>
    ForgotPasswordModel.fromJson(json.decode(str));

class ForgotPasswordModel {
  ForgotPasswordModel({
    this.status,
    this.message,
    this.token,
  });

  final String? status;
  final String? message;
  final String? token;

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        token: json["token"] == null ? null : json['token'],
      );
}
