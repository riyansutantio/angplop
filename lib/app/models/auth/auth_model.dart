import 'dart:convert';

UserModel userModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

class UserModel {
  UserModel({
    this.status,
    this.message,
    this.data,
  });

  final String? status;
  final String? message;
  final Data? data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.user,
    this.token,
  });

  final User? user;
  final String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"] == null ? null : json["token"],
      );
}

class User {
  User({
    this.id,
    this.province_id,
    this.regency_id,
    this.district_id,
    this.name,
    this.photo_path,
    this.date_of_birth,
    this.gender,
    this.job,
    this.marriage_status,
    this.membership_status,
    this.budget_estimation,
    this.detail_address,
    this.email,
    this.blocked,
    this.blocked_at,
    this.email_verified_at,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? province_id;
  final int? regency_id;
  final int? district_id;
  final String? name;
  final String? photo_path;
  final DateTime? date_of_birth;
  final String? gender;
  final String? job;
  final String? marriage_status;
  final String? membership_status;
  final String? budget_estimation;
  final String? detail_address;
  final String? email;
  final String? blocked;
  final DateTime? blocked_at;
  final DateTime? email_verified_at;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        province_id: json["province_id"] == null ? null : json["province_id"],
        regency_id: json["regency_id"] == null ? null : json["regency_id"],
        district_id: json["district_id"] == null ? null : json["district_id"],
        name: json["name"] == null ? null : json["name"],
        photo_path: json["photo_path"] == null ? null : json["photo_path"],
        date_of_birth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        gender: json["gender"] == null ? null : json["gender"],
        job: json["job"] == null ? null : json["job"],
        marriage_status:
            json["marriage_status"] == null ? null : json["marriage_status"],
        membership_status: json["membership_status"] == null
            ? null
            : json["membership_status"],
        budget_estimation: json["budget_estimation"] == null
            ? null
            : json["budget_estimation"],
        detail_address:
            json["detail_address"] == null ? null : json["detail_address"],
        email: json["detail_address"] == null ? null : json["email"],
        blocked: json["blocked"] == null ? null : json["blocked"],
        blocked_at: json["blocked_at"] == null
            ? null
            : DateTime.parse(json["blocked_at"]),
        email_verified_at: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}
