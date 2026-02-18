import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  Future<SharedPreferences> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  }

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  /// this method only saves bool, string, int, double or list of string.
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else if (value is List<String>) {
      return await sharedPreferences.setStringList(key, value);
    } else {
      throw Exception('Unsupported data type');
    }
  }

  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }
}
