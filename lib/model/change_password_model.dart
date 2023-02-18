import 'dart:convert';

class ChangePasswordModel {
  ChangePasswordModel({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<dynamic>? data;

  factory ChangePasswordModel.fromRawJson(String str) => ChangePasswordModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) => ChangePasswordModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
  };
}
