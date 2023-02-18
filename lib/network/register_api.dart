import 'dart:convert';
import 'dart:developer';

import '../utilities/api_url.dart';
import '../model/register_model.dart';
import 'package:http/http.dart' as http;

class RegisterApi {
  Future data({
    required String name,
    required String email,
    required String phone,
    required String countryCode,
    required String password,
    required String passwordConfirm,
  }) async {
    try {
      Uri uri = Uri.parse('${ApiUrl.mainUrl}${ApiUrl.register}');
      Map<String, String> headers= <String,String>{
        'Content-Type': 'application/json',
      };
      Map<String, String> body = <String,String>{
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "country_code": countryCode,
        "password_confirm": passwordConfirm
      };
      http.MultipartRequest request = http.MultipartRequest('POST', uri)
        ..headers.addAll(headers)
        ..fields.addAll(body);
      var response = await request.send();
      var responseData= await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      var jsonData = jsonDecode(responseString);
      if (response.statusCode == 201) {
        RegisterModel registerModel = RegisterModel.fromJson(jsonData);
        return registerModel;
      } else if (response.statusCode == 400) {
        RegisterErrorModel registerErrorModel = RegisterErrorModel.fromJson(jsonData);
        return registerErrorModel;
      } else {
        throw "Register Error";
      }
    } catch (e) {
      log("Register Error $e");
      return null;
    }
  }
}
