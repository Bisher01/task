import 'dart:convert';
import 'dart:developer';

import '../model/delete_account_model.dart';
import '../utilities/api_url.dart';
import '../utilities/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DeleteAccountApi {
  Future<DeleteAccountModel?> data() async {
    try {
      Uri uri = Uri.parse('${ApiUrl.mainUrl}${ApiUrl.deleteAccount}');
      var headers = {
        'Content-Type': 'application/json',
        'Authorization':'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: DeleteAccountResponse\nUrl:: ${uri}\nheaders:: $headers");
      http.Response response = await http.delete(uri, headers: headers);
      log("DeleteAccountStatusCode:: ${response.statusCode}  DeleteAccountBody:: ${response.body}");
      DeleteAccountModel deleteAccountModel = DeleteAccountModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return deleteAccountModel;
      } else {
        throw "DeleteAccount Error";
      }
    } catch (e) {
      log("DeleteAccount Error $e");
      return null;
    }
  }
}
