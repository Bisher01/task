import 'dart:convert';
import 'dart:developer';

import '../model/login_model.dart';
import '../utilities/api_url.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  Future data({
    required String email,
    required String password,
  }) async {
    try {
      Uri uri = Uri.parse('${ApiUrl.mainUrl}${ApiUrl.login}');
      Map<String, String> headers= <String,String>{
        'Content-Type': 'application/json',
      };
      Map<String, String> body = <String,String>{
        'email':email,
        'password':password,
      };
      http.MultipartRequest request = http.MultipartRequest('POST', uri)
        ..headers.addAll(headers)
        ..fields.addAll(body);
      var response = await request.send();
      var responseData= await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      var jsonData = jsonDecode(responseString);
      if (response.statusCode == 200) {
        LoginModel loginModel = LoginModel.fromJson(jsonData);
        log("LoginStatusCode:: ${response.statusCode}  LoginBody:: $jsonData");
        return loginModel;
      }
      else if(response.statusCode==400||response.statusCode==401){
        LoginErrorModel loginErrorModel = LoginErrorModel.fromJson(jsonData);
        return loginErrorModel;
      }else {
        throw "Login Error";
      }
    } catch (e) {
      log("Login Error $e");
      return null;
    }
  }
}
