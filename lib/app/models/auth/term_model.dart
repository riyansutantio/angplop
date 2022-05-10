import 'dart:convert';

TermModel termModelFromJson(String str) => TermModel.fromJson(json.decode(str));

class TermModel {
  TermModel({
    this.status,
    this.data,
  });

  final String? status;
  final Data? data;

  factory TermModel.fromJson(Map<String, dynamic> json) => TermModel(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.id,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? content;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        content: json["content"] == null ? null : json["content"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}
