import 'package:shared_preferences/shared_preferences.dart';

class Cachhelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> putDarkData(
      {required String key, required bool value}) async {
    return await sharedPreferences?.setBool(key, value);
  }

  static bool? getDarkData({required String key}) {
    return sharedPreferences?.getBool(key);
  }
}
