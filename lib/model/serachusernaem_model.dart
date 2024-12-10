// To parse this JSON data, do
//
//     final searchEmailNameModel = searchEmailNameModelFromJson(jsonString);

import 'dart:convert';

SearchEmailNameModel searchEmailNameModelFromJson(String str) =>
    SearchEmailNameModel.fromJson(json.decode(str));

String searchEmailNameModelToJson(SearchEmailNameModel data) =>
    json.encode(data.toJson());

class SearchEmailNameModel {
  bool email;

  SearchEmailNameModel({
    required this.email,
  });

  SearchEmailNameModel copyWith({
    bool? email,
  }) =>
      SearchEmailNameModel(
        email: email ?? this.email,
      );

  factory SearchEmailNameModel.fromJson(Map<String, dynamic> json) =>
      SearchEmailNameModel(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
