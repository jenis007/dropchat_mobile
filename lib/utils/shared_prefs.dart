import 'dart:convert';
import 'dart:developer';

import 'package:dropchats/model/SingUp_model.dart';
import 'package:dropchats/screen/AuthScreen/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

final preferences = SharedPreference();

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
  static const competedRegister = "isLogin";
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
    // preferences.putString(
    //     SharedPreference.competedRegister, userData.isLogin ?? "NA");
    // preferences.putString(SharedPreference.token, userData.token ?? "NA");
    preferences.putString(
        SharedPreference.birthdate, userData.birthdate ?? "NA");
    preferences.putString(
        SharedPreference.countryCode, userData.countryCode ?? "NA");
    preferences.putString(SharedPreference.phone, userData.phone ?? "NA");
    preferences.putString(SharedPreference.sex, userData.sex ?? "NA");
    preferences.putString(SharedPreference.username, userData.username ?? "NA");
    preferences.putString(SharedPreference.userData, jsonEncode(userData));
    // preferences.putString(SharedPreference.password, userData.password ?? "NA");
    // preferences.putString(
    //     SharedPreference.deviceToken, userData.device_token ?? "NA");
  }

  // UserData? userDatas;
  // Future<void> saveTokenAndStatus(String newToken, String newStatus) async {
  //   await preferences.init();
  //   // preferences.getString(SharedPreference.password).toString();
  //   // Fetch the existing user data from SharedPreferences
  //   String rawData =
  //       preferences.getString(SharedPreference.userData).toString();
  //   // String? existingUserDataJson =
  //   //     preferences.getString(SharedPreference.userData);
  //
  //   // UserData? rawData;
  //
  //   if (rawData.isNotEmpty) {
  //     userDatas = UserData.fromJson(jsonDecode(rawData));
  //     log('userData?.address===>>>${userDatas?.countryCode ?? ''}');
  //     // Parse the existing data into a UserData object
  //   }
  //
  //   // Create a new UserData object with updated token and status
  //   UserData updatedUserData = UserData(
  //     email: userDatas?.email ?? "NA",
  //     id: userDatas?.id ?? 0,
  //     isLogin: newStatus.isNotEmpty ? newStatus : userDatas?.isLogin ?? "NA",
  //     token: newToken.isNotEmpty ? newToken : userDatas?.token ?? "NA",
  //     birthdate: userDatas?.birthdate ?? "NA",
  //     countryCode: userDatas?.countryCode ?? "NA",
  //     phone: userDatas?.phone ?? "NA",
  //     sex: userDatas?.sex ?? "NA",
  //     username: userDatas?.username ?? "NA",
  //     // Add any other fields as needed...
  //   );
  //
  //   // Save the updated user data back to SharedPreferences
  //   preferences.putString(
  //     SharedPreference.userData,
  //     jsonEncode(updatedUserData.toJson()),
  //   );
  //
  //   // Print the updated data for debugging
  //   print("Updated User Data: ${updatedUserData.toJson()}");
  // }

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

  String? getData(String key) {
    reload();
    return _preferences?.getString(key);
  }

  Future<bool> saveData(String key, String value) {
    reload();
    return _preferences!.setString(key, value);
  }

  Future<bool> saveBool(String key, bool value) {
    reload();
    return _preferences!.setBool(key, value);
  }

  bool? getBoolValue(String key) {
    reload();
    return _preferences!.getBool(key);
  }

  Future<bool> eraseData(String key) {
    reload();
    return _preferences!.remove(key);
  }

  Future<bool> saveFaceBookData(String key, String value) {
    reload();
    return _preferences!.setString(key, value);
  }

  Future<bool> eraseFaceBookData(String key) {
    reload();
    return _preferences!.remove(key);
  }

  Future<void> reload() {
    return _preferences!.reload();
  }

  Future<void> clear() {
    return _preferences!.clear();
  }
}
