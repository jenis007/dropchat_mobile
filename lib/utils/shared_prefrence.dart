import 'package:shared_preferences/shared_preferences.dart';

final preferences = SharedPreference();

class SharedPreference {
  static SharedPreferences? _preferences;

  init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  static const isLogin = "isLogin";
  static const userId = "userId";

  logOut() async {
    await _preferences?.clear();
  }

  Future<bool?> putString(String key, String value) async {
    return _preferences?.setString(key, value);
  }

  String? getString(String key, {String defValue = ""}) {
    return _preferences == null
        ? defValue
        : _preferences?.getString(key) ?? defValue;
  }

  Future<bool?> putInt(String key, int value) async {
    return _preferences?.setInt(key, value);
  }

  int? getInt(String key, {int defValue = 0}) {
    return _preferences == null
        ? defValue
        : _preferences?.getInt(key) ?? defValue;
  }

  Future<bool?> putDouble(String key, double value) async {
    return _preferences?.setDouble(key, value);
  }

  double getDouble(String key, {double defValue = 0.0}) {
    return _preferences == null
        ? defValue
        : _preferences?.getDouble(key) ?? defValue;
  }

  Future<bool?> putBool(String key, bool value) async {
    return _preferences?.setBool(key, value);
  }

  bool? getBool(String key, {bool defValue = false}) {
    return _preferences == null
        ? defValue
        : _preferences?.getBool(key) ?? defValue;
  }
}
