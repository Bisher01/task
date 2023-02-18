import 'dart:convert';
import 'dart:developer';

import '../model/change_password_model.dart';
import '../utilities/shared_preferences.dart';
import '../utilities/api_url.dart';
import 'package:http/http.dart' as http;

class ChangePasswordApi {
  Future<ChangePasswordModel?> data({
    required String currentPassword,
    required String password,
    required String passwordConfirm,
  }) async {
    try {
      Uri uri = Uri.parse('${ApiUrl.mainUrl}${ApiUrl.changePassword}');
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      Map<String, String> body = <String, String>{
        'current_password': currentPassword,
        'password': password,
        'password_confirm': passwordConfirm,
      };
      http.MultipartRequest request = http.MultipartRequest('POST', uri)
        ..headers.addAll(headers)
        ..fields.addAll(body);
      log(uri.toString());
      log(headers.toString());
      log(body.toString());
      var response = await request.send();
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      var jsonData = jsonDecode(responseString);
      if (response.statusCode == 200) {
        ChangePasswordModel changePasswordModel =
            ChangePasswordModel.fromJson(jsonData);
        log("ChangePasswordStatusCode:: ${response.statusCode}  ChangePasswordBody:: $jsonData");
        return changePasswordModel;
      } else {
        throw "ChangePassword Error";
      }
    } catch (e) {
      log("ChangePassword Error $e");
      return null;
    }
  }
}
