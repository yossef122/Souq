import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper {
  static late SharedPreferences sharedprefrence;

  static Init() async {
    sharedprefrence = await SharedPreferences.getInstance();
  }

  static Future<bool> Savedata(
      {required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedprefrence.setBool(key, value);
    }
    if (value is String) {
      return await sharedprefrence.setString(key, value);
    }
    if (value is int) {
      return await sharedprefrence.setInt(key, value);
    }
    return await sharedprefrence.setDouble(key, value);
  }

  static dynamic Getdata({required String key}) /*async*/{
    return /*await*/ sharedprefrence.get(key);
  }

}
