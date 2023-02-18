import 'dart:convert';

class LoginModel {
  LoginModel({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  Data? data;

  factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
    this.token,
    this.tokenExpiry,
  });

  String? id;
  String? name;
  String? countryCode;
  String? phone;
  String? email;
  String? token;
  DateTime? tokenExpiry;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    countryCode: json["country_code"],
    phone: json["phone"],
    email: json["email"],
    token: json["token"],
    tokenExpiry: json["token_expiry"] == null ? null : DateTime.parse(json["token_expiry"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_code": countryCode,
    "phone": phone,
    "email": email,
    "token": token,
    "token_expiry": "${tokenExpiry!.year.toString().padLeft(4, '0')}-${tokenExpiry!.month.toString().padLeft(2, '0')}-${tokenExpiry!.day.toString().padLeft(2, '0')}",
  };
}

class LoginErrorModel {
  LoginErrorModel({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<Map<String,dynamic>>? data;

  factory LoginErrorModel.fromRawJson(String str) => LoginErrorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginErrorModel.fromJson(Map<String, dynamic> json) => LoginErrorModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Map<String,dynamic>>.from(json["data"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<Map<String,dynamic>>.from(data!.map((x) => x)),
  };
}
