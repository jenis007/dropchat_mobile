// To parse this JSON data, do
//
//     final searchUserNameModel = searchUserNameModelFromJson(jsonString);

import 'dart:convert';

SearchUserNameModel searchUserNameModelFromJson(String str) =>
    SearchUserNameModel.fromJson(json.decode(str));

String searchUserNameModelToJson(SearchUserNameModel data) =>
    json.encode(data.toJson());

class SearchUserNameModel {
  bool username;

  SearchUserNameModel({
    required this.username,
  });

  SearchUserNameModel copyWith({
    bool? username,
  }) =>
      SearchUserNameModel(
        username: username ?? this.username,
      );

  factory SearchUserNameModel.fromJson(Map<String, dynamic> json) =>
      SearchUserNameModel(
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
      };
}
