// To parse this JSON data, do
//
//     final searchUserPhoneModel = searchUserPhoneModelFromJson(jsonString);

import 'dart:convert';

SearchUserPhoneModel searchUserPhoneModelFromJson(String str) => SearchUserPhoneModel.fromJson(json.decode(str));

String searchUserPhoneModelToJson(SearchUserPhoneModel data) => json.encode(data.toJson());

class SearchUserPhoneModel {
  bool phone;

  SearchUserPhoneModel({
    required this.phone,
  });

  SearchUserPhoneModel copyWith({
    bool? phone,
  }) =>
      SearchUserPhoneModel(
        phone: phone ?? this.phone,
      );

  factory SearchUserPhoneModel.fromJson(Map<String, dynamic> json) => SearchUserPhoneModel(
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
  };
}
