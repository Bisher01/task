import 'dart:convert';

class UpdateInformationModel {
  UpdateInformationModel({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  Data? data;

  factory UpdateInformationModel.fromRawJson(String str) => UpdateInformationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UpdateInformationModel.fromJson(Map<String, dynamic> json) => UpdateInformationModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.countryCode,
    this.phone,
    this.email,
  });

  String? id;
  String? name;
  String? countryCode;
  String? phone;
  String? email;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    countryCode: json["country_code"],
    phone: json["phone"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_code": countryCode,
    "phone": phone,
    "email": email,
  };
}
