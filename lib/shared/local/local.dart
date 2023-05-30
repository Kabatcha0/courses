import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static Future<SharedPreferences> init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({
    required String key,
    required String value,
  }) {
    log("set");
    return sharedPreferences.setString(key, value);
  }

  static String? getData({
    required String key,
  }) {
    log("get");
    return sharedPreferences.getString(key);
  }
}
