import 'dart:convert';
import 'package:dropchats/model/user_data_response_model.dart';
import 'package:dropchats/screen/AuthScreen/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

final preferences = SharedPreference();
AuthController authController = Get.find();

class SharedPreference {
  static SharedPreferences? _preferences;

  init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  static const isLogin = "isLogin";
  static const userEmail = "userEmail";

  static const googleId = "googleId";
  static const appleId = "appleId";
  static const fb_id = "fb_id";
  static const firstName = "firstName";
  static const lastName = "lastName";
  static const userImage = "userImage";
  static const userData = "userData";
  static const userState = "userState";
  static const userCity = "userCity";

  // static const password = "password";
  static const ACCESS_TOKEN = "ACCESS_TOKEN";

  /// dropchat data
  static const competedRegister = "registration_status";
  static const token = "token";
  static const birthdate = "birthdate";
  static const countryCode = "country_code";
  static const email = "email";
  static const phone = "phone";
  static const sex = "sex";
  static const username = "username";
  static const password = "password";
  static const userId = "id";
  static const deviceToken = "deviceToken";

  void saveUserData(UserData userData) {
    preferences.putString(SharedPreference.email, userData.email ?? "NA");
    preferences.putString(SharedPreference.userId, userData.id.toString());
    preferences.putString(
        SharedPreference.competedRegister, userData.competedRegister ?? "NA");
    preferences.putString(SharedPreference.token, userData.token ?? "NA");
    preferences.putString(
        SharedPreference.birthdate, userData.birthdate ?? "NA");
    preferences.putString(
        SharedPreference.countryCode, userData.countryCode ?? "NA");
    preferences.putString(SharedPreference.phone, userData.phone ?? "NA");
    preferences.putString(SharedPreference.sex, userData.sex ?? "NA");
    preferences.putString(SharedPreference.username, userData.username ?? "NA");
    preferences.putString(SharedPreference.password, userData.password ?? "NA");
    preferences.putString(
        SharedPreference.deviceToken, userData.device_token ?? "NA");
  }

  logOut() async {
    await _preferences?.clear();
    // authController.googleSignIn.signOut();
    // authController.auth.signOut();
    //
    // Get.offAllNamed(Routes.loginScreen);
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
