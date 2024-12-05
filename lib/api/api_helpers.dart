import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dropchats/api/api_extension.dart';
import 'package:dropchats/constant/request_constant.dart';
import 'package:dropchats/model/response_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_exception.dart';

class BaseApiHelper {
  /// POST
  static Future<ResponseItem> postRequest(
      String requestUrl, Map<String, dynamic> requestData,
      {bool? passAuthToken = false}) async {
    return await http
        .post(Uri.parse(requestUrl),
            body: json.encode(requestData),
            headers: requestHeader(passAuthToken))
        .then((response) {
      return onValue(response);
    }).onError((error, stackTrace) => onError(error));
  }

  /// UPLOAD IMAGES
  static Future<ResponseItem> uploadImageRequest(
      String requestUrl, Map<String, String> requestData, String imagePath,
      {bool? passAuthToken = false}) async {
    var request = http.MultipartRequest("POST", Uri.parse(requestUrl));

    request.fields.addAll(requestData);

    if (imagePath.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath('image', imagePath));
    }

    return await request.send().then((streamedResponse) {
      return http.Response.fromStream(streamedResponse)
          .then((value) => onValue(value));
    }).onError((error, stackTrace) => onError(error));
  }

  /// PUT
  static Future<ResponseItem> putRequest(
    String requestUrl,
    Map<String, dynamic> requestData, {
    bool? passAuthToken = false,
  }) async {
    return await http
        .put(
          Uri.parse(requestUrl),
          body: json.encode(requestData),
          headers: requestHeader(passAuthToken),
        )
        .then((response) => onValue(response))
        .onError((error, stackTrace) => onError(error));
  }

  /// GET
  static Future<dynamic> getRequest(String requestUrl,
      {Map<String, dynamic>? params, bool? passAuthToken = false}) async {
    return await http
        .get(Uri.parse(requestUrl), headers: requestHeader(passAuthToken))
        .then((response) => onValue(response))
        .onError((error, stackTrace) => onError(error));
  }

  /// DELETE
  static Future<ResponseItem> deleteRequest(
    String requestUrl,
    Map<String, dynamic> requestData, {
    bool? passAuthToken = false,
  }) async {
    return await http
        .delete(Uri.parse(requestUrl),
            body: json.encode(requestData),
            headers: requestHeader(passAuthToken))
        .then((response) => onValue(response))
        .onError((error, stackTrace) => onError(error));
  }

  /// PATCH
  static Future<ResponseItem> patchRequest(
      String requestUrl, Map<String, dynamic> requestData,
      {bool? passAuthToken = false}) async {
    return await http
        .patch(Uri.parse(requestUrl),
            body: json.encode(requestData),
            headers: requestHeader(passAuthToken))
        .then((response) => onValue(response))
        .onError((error, stackTrace) => onError(error));
  }

  /// ON VALUE

  static Future onValue(http.Response response) async {
    debugPrint('statusCode===>>>${response.statusCode}');
    // debugPrint('response===>>>${response.body}');

    final ResponseItem result = ResponseItem(status: false, message: "");

    dynamic data = json.decode(response.body);

    if (response.request?.url.toString() == "${AppUrls.baseUrl}login") {
      result.status = true;
      result.data = data;
      // result.message = data["message"] ?? "";
      result.statusCode = response.statusCode;
      debugPrint("Success");
    } else if (response.statusCode == 200 || response.statusCode == 201) {
      result.status = true;
      result.data = data;
      // result.message = data["message"] ?? "";
      result.statusCode = response.statusCode;
      debugPrint("Success");
    } else if (response.statusCode == 400) {
      // result.message = data["message"] ?? "";
      result.statusCode = response.statusCode;
    } else {
      // result.message = data["message"] ?? "";
      result.statusCode = response.statusCode;
    }

    return result;
  }

  /// ON ERROR

  static onError(error) {
    debugPrint("Error caused: $error");
    String message = "Unsuccessful request";
    if (error is SocketException) {
      message = ResponseException("No internet connection").toString();
      if (message == "Error in response: No internet connection") {
        message = "No internet connection";
      }
    } else if (error is FormatException) {
      message = ResponseException("Something wrong in response.").toString() +
          error.toString();
    }

    return ResponseItem(data: null, message: message, status: false);
  }
}
