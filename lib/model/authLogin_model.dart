// To parse this JSON data, do
//
//     final authLoginModel = authLoginModelFromJson(jsonString);

import 'dart:convert';

AuthLoginModel authLoginModelFromJson(String str) =>
    AuthLoginModel.fromJson(json.decode(str));

String authLoginModelToJson(AuthLoginModel data) => json.encode(data.toJson());

class AuthLoginModel {
  String registrationStatus;
  String token;
  String access;

  AuthLoginModel({
    required this.registrationStatus,
    required this.token,
    required this.access,
  });

  AuthLoginModel copyWith({
    String? registrationStatus,
    String? token,
    String? access,
  }) =>
      AuthLoginModel(
        registrationStatus: registrationStatus ?? this.registrationStatus,
        token: token ?? this.token,
        access: access ?? this.access,
      );

  factory AuthLoginModel.fromJson(Map<String, dynamic> json) => AuthLoginModel(
        registrationStatus: json["registration_status"],
        token: json["token"],
        access: json["access"],
      );

  Map<String, dynamic> toJson() => {
        "registration_status": registrationStatus,
        "token": token,
        "access": access,
      };
}
