// // To parse this JSON data, do
// //
// //     final authOtpVerificationModel = authOtpVerificationModelFromJson(jsonString);
//
// import 'dart:convert';
//
// AuthOtpVerificationModel authOtpVerificationModelFromJson(String str) =>
//     AuthOtpVerificationModel.fromJson(json.decode(str));
//
// String authOtpVerificationModelToJson(AuthOtpVerificationModel data) =>
//     json.encode(data.toJson());
//
// class AuthOtpVerificationModel {
//   String message;
//   bool verified;
//
//   AuthOtpVerificationModel({
//     required this.message,
//     required this.verified,
//   });
//
//   AuthOtpVerificationModel copyWith({
//     String? message,
//     bool? verified,
//   }) =>
//       AuthOtpVerificationModel(
//         message: message ?? this.message,
//         verified: verified ?? this.verified,
//       );
//
//   factory AuthOtpVerificationModel.fromJson(Map<String, dynamic> json) =>
//       AuthOtpVerificationModel(
//         message: json["message"],
//         verified: json["verified"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "verified": verified,
//       };
// }
class AuthOtpVerificationModel {
  String? message; // Change to nullable String
  bool verified;

  AuthOtpVerificationModel({
    required this.message,
    required this.verified,
  });

  AuthOtpVerificationModel copyWith({
    String? message,
    bool? verified,
  }) =>
      AuthOtpVerificationModel(
        message: message ?? this.message,
        verified: verified ?? this.verified,
      );

  factory AuthOtpVerificationModel.fromJson(Map<String, dynamic> json) =>
      AuthOtpVerificationModel(
        message: json["message"], // Can be null now
        verified: json["verified"],
      );

  Map<String, dynamic> toJson() => {
        "message": message, // Can be null now
        "verified": verified,
      };
}
