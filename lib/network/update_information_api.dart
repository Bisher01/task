import 'dart:convert';
import 'dart:developer';

import '../utilities/shared_preferences.dart';
import '../model/update_information_model.dart';
import '../utilities/api_url.dart';
import 'package:http/http.dart' as http;

class UpdateInformationApi {
  Future<UpdateInformationModel?> data({
    required String name,
    required String email,
    required String phone,
    required String countryCode,
  }) async {
    try {
      Uri uri = Uri.parse('${ApiUrl.mainUrl}${ApiUrl.updateInformation}');
      var headers={
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization':'Bearer ${MySharedPreferences.accessToken}',
      };
      Map<String, String> body = <String,String>{
        'name':name,
        'email':email,
        'phone':phone,
        'country_code':countryCode,
      };
      http.MultipartRequest request = http.MultipartRequest('POST', uri)
        ..headers.addAll(headers)
        ..fields.addAll(body);
      log(uri.toString());
      log(headers.toString());
      log(body.toString());
      var response = await request.send();
      var responseData= await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      var jsonData = jsonDecode(responseString);
      if (response.statusCode == 200) {
        UpdateInformationModel updateInformationModel = UpdateInformationModel.fromJson(jsonData);
        log("UpdateInformationStatusCode:: ${response.statusCode}  UpdateInformationBody:: $jsonData");
        return updateInformationModel;
      }else {
        throw "UpdateInformation Error";
      }
    } catch (e) {
      log("UpdateInformation Error $e");
      return null;
    }
  }
}
