import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static late SharedPreferences _sharedPreferences;

  static const String keyIsLogIn = "key_isLogIn";
  static const String keyAccessToken = "key_access_token";
  static const String keyEmail = "key_email";
  static const String keyName = "key_name";
  static const String keyUserId = "key_user_id";
  static const String keyCountryCode = "key_country_code";
  static const String keyPhone = "key_phone";

  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static void clearProfile() {
    accessToken = "";
    isLogIn = false;
    email = "";
    name = "";
    userId = "0";
    phone = "";
    countryCode= "";
  }

  static String get accessToken => _sharedPreferences.getString(keyAccessToken) ?? "";
  static set accessToken(String value) => _sharedPreferences.setString(keyAccessToken, value);

  static bool get isLogIn => _sharedPreferences.getBool(keyIsLogIn) ?? false;
  static set isLogIn(bool value) => _sharedPreferences.setBool(keyIsLogIn, value);

  static String get email => _sharedPreferences.getString(keyEmail) ?? "";
  static set email(String value) => _sharedPreferences.setString(keyEmail, value);

  static String get name => _sharedPreferences.getString(keyName) ?? "";
  static set name(String value) => _sharedPreferences.setString(keyName, value);

  static String get userId => _sharedPreferences.getString(keyUserId) ?? "";
  static set userId(String value) => _sharedPreferences.setString(keyUserId, value);

  static String get phone => _sharedPreferences.getString(keyPhone) ?? "";
  static set phone(String value) => _sharedPreferences.setString(keyPhone, value);

  static String get countryCode => _sharedPreferences.getString(keyCountryCode) ?? "";
  static set countryCode(String value) => _sharedPreferences.setString(keyCountryCode, value);

}
