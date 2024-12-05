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
  static const userId = "userId";
  static const googleId = "googleId";
  static const appleId = "appleId";
  static const fb_id = "fb_id";
  static const firstName = "firstName";
  static const lastName = "lastName";
  static const userImage = "userImage";
  static const userData = "userData";
  static const userState = "userState";
  static const userCity = "userCity";
  static const token = "token";
  static const password = "password";
  static const ACCESS_TOKEN = "ACCESS_TOKEN";
  static const deviceToken = "deviceToken";

  void saveUserData(UserData userData) {
    preferences.putString(SharedPreference.userEmail, userData.email ?? "NA");
    preferences.putString(SharedPreference.userId, userData.id.toString());
    preferences.putString(
        SharedPreference.userImage, userData.imageUrl ?? "NA");
    preferences.putString(SharedPreference.lastName, userData.lastname ?? "NA");
    preferences.putString(
        SharedPreference.firstName, userData.firstname ?? "NA");
    preferences.putString(SharedPreference.userState, userData.country ?? "NA");
    preferences.putString(SharedPreference.userCity, userData.city ?? "NA");
    preferences.putString(
        SharedPreference.googleId, userData.google_id ?? "NA");
    preferences.putString(SharedPreference.appleId, userData.apple_id ?? "NA");
    preferences.putString(SharedPreference.fb_id, userData.fb_id ?? "NA");
    preferences.putString(
        SharedPreference.deviceToken, userData.device_token ?? "NA");
    preferences.putString(SharedPreference.userData, jsonEncode(userData));
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
