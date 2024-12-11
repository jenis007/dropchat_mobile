import 'dart:developer';

import 'package:dropchats/api/api_helpers.dart';
import 'package:dropchats/constant/request_constant.dart';
import 'package:dropchats/model/GetIntrestModel.dart';
import 'package:dropchats/model/response_item.dart';
import 'package:dropchats/utils/shared_prefs.dart';
import 'package:flutter/material.dart';

class AuthRepo {
  /// SIGNUP API

  static Future<ResponseItem> signUpRepo(
      {required Map<String, dynamic> requestData}) async {
    String requestUrl = "${AppUrls.baseUrl}${MethodNames.user}";

    ResponseItem result =
        await BaseApiHelper.postRequest(requestUrl, requestData);

    debugPrint("SIGNUP - URL===>>>$requestUrl");
    debugPrint("SIGNUP - RESULT===>>>${result}");

    return result;
  }

  /// LOGIN API

  static Future<ResponseItem> loginRepo(
      {required Map<String, dynamic> requestData}) async {
    String requestUrl = "${AppUrls.baseUrl}${MethodNames.authToken}";

    ResponseItem result =
        await BaseApiHelper.postRequest(requestUrl, requestData);

    debugPrint("LOGIN - URL===>>>$requestUrl");
    debugPrint("LOGIN - RESULT===>>>$result");

    return result;
  }

  ///otp verification
  static Future<ResponseItem> otpVerification(
      {required Map<String, dynamic> requestData}) async {
    String requestUrl = "${AppUrls.baseUrl}${MethodNames.otpVerification}";

    ResponseItem result =
        await BaseApiHelper.postRequest(requestUrl, requestData);

    debugPrint("LOGIN - URL===>>>$requestUrl");
    debugPrint("LOGIN - RESULT===>>>$result");

    return result;
  }

  ///SOCIAL LOGIN API

  static Future<ResponseItem> socialLoginRepo(
      {required Map<String, dynamic> requestData}) async {
    String requestUrl = "${AppUrls.baseUrl}${MethodNames.socialLogin}";

    ResponseItem result =
        await BaseApiHelper.postRequest(requestUrl, requestData);

    log('requestData=================$requestData');
    debugPrint("LOGIN - URL===>>>$requestUrl");
    debugPrint("LOGIN - RESULT===>>>$result");

    return result;
  }

  /// FORGOT PASSWORD API

  static Future<ResponseItem> forgotPasswordRepo(
      {required Map<String, dynamic> requestData}) async {
    String requestUrl = "${AppUrls.baseUrl}${MethodNames.resetPasswordMail}";

    ResponseItem result =
        await BaseApiHelper.postRequest(requestUrl, requestData);

    debugPrint("FORGOT PASSWORD - URL===>>>$requestUrl");
    debugPrint("FORGOT PASSWORD - RESULT===>>>$result");

    return result;
  }

  /// DELETE ACCOUNT API

  static Future<ResponseItem> deleteAccountRepo(
      {required Map<String, dynamic> requestData}) async {
    String requestUrl = "${AppUrls.baseUrl}${MethodNames.deleteAccount}";

    ResponseItem result =
        await BaseApiHelper.postRequest(requestUrl, requestData);

    debugPrint("DELETE ACCOUNT - URL===>>>$requestUrl");
    debugPrint("DELETE ACCOUNT - RESULT===>>>$result");

    return result;
  }

  /// UPDATE PROFILE API

  static Future<ResponseItem> updateProfileRepo(
      {required Map<String, String> requestData,
      required String imagePath}) async {
    String requestUrl = "${AppUrls.baseUrl}${MethodNames.profileUpdate}";
    ResponseItem result = await BaseApiHelper.uploadImageRequest(
        requestUrl, requestData, imagePath);

    debugPrint("PROFILE UPDATE - URL===>>>$requestUrl");
    debugPrint("PROFILE UPDATE - RESULT===>>>$result");

    return result;
  }

  /// GET PROFILE API

  static Future<ResponseItem> getProfileRepo(String userId) async {
    String requestUrl = "${AppUrls.baseUrl}${MethodNames.getProfile}$userId";
    ResponseItem result = await BaseApiHelper.getRequest(requestUrl);

    debugPrint("GET PROFILE - URL===>>>$requestUrl");
    debugPrint("GET PROFILE - RESULT===>>>$result");

    return result;
  }

  static Future<ResponseItem> getCollegeListRepo() async {
    String requestUrl = "${AppUrls.baseUrl}${MethodNames.getCollegeList}";

    ResponseItem result = await BaseApiHelper.getRequest(requestUrl);

    debugPrint("SIGNUP - URL===>>>$requestUrl");
    debugPrint("SIGNUP - RESULT===>>>$result");

    return result;
  }

  static Future<ResponseItem> getInterestListRepo() async {
    String requestUrl = "${AppUrls.baseUrl}${MethodNames.getInterest}";
    String dad = preferences.getString(SharedPreference.token) ?? '';
    print('daddaddaddad${dad}');
    ResponseItem result =
        await BaseApiHelper.getRequest(requestUrl, passAuthToken: true);

    debugPrint("SIGNUP - URL===>>>$requestUrl");
    debugPrint("SIGNUP - RESULT===>>>$result");

    return result;
  }

  static Future<ResponseItem> userInterestSelect(
      {required Map<String, dynamic> requestData}) async {
    String requestUrl = "${AppUrls.baseUrl}${MethodNames.userInterestsSelect}";

    ResponseItem result = await BaseApiHelper.postRequest(
        requestUrl, requestData,
        passAuthToken: true);

    debugPrint("SIGNUP - URL===>>>$requestUrl");
    debugPrint("SIGNUP - RESULT===>>>$result");

    return result;
  }

  static Future<ResponseItem> searchUseNameRepo(
      {required Map<String, dynamic> requestData}) async {
    String requestUrl = "${AppUrls.baseUrl}${MethodNames.searchUseName}";

    ResponseItem result =
        await BaseApiHelper.postRequest(requestUrl, requestData);

    debugPrint("SIGNUP - URL===>>>$requestUrl");
    debugPrint("SIGNUP - RESULT===>>>$result");

    return result;
  }
}
