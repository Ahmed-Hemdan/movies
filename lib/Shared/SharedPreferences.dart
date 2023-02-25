import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

   static Future<bool?> putDarkData(bool value) async {
    return await sharedPreferences?.setBool("isDark", value);
  }

  static bool? getDarkData()  {
    return  sharedPreferences?.getBool('isDark');
  }
}
