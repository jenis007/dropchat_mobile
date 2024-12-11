// To parse this JSON data, do
//
//     final userIntrestnSelectModel = userIntrestnSelectModelFromJson(jsonString);

import 'dart:convert';

UserIntrestnSelectModel userIntrestnSelectModelFromJson(String str) => UserIntrestnSelectModel.fromJson(json.decode(str));

String userIntrestnSelectModelToJson(UserIntrestnSelectModel data) => json.encode(data.toJson());

class UserIntrestnSelectModel {
  Result result;
  bool success;

  UserIntrestnSelectModel({
    required this.result,
    required this.success,
  });

  UserIntrestnSelectModel copyWith({
    Result? result,
    bool? success,
  }) =>
      UserIntrestnSelectModel(
        result: result ?? this.result,
        success: success ?? this.success,
      );

  factory UserIntrestnSelectModel.fromJson(Map<String, dynamic> json) => UserIntrestnSelectModel(
    result: Result.fromJson(json["result"]),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "result": result.toJson(),
    "success": success,
  };
}

class Result {
  int id;
  List<Interest> interests;
  String username;

  Result({
    required this.id,
    required this.interests,
    required this.username,
  });

  Result copyWith({
    int? id,
    List<Interest>? interests,
    String? username,
  }) =>
      Result(
        id: id ?? this.id,
        interests: interests ?? this.interests,
        username: username ?? this.username,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    interests: List<Interest>.from(json["interests"].map((x) => Interest.fromJson(x))),
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "interests": List<dynamic>.from(interests.map((x) => x.toJson())),
    "username": username,
  };
}

class Interest {
  String hashtag;
  String icon;

  Interest({
    required this.hashtag,
    required this.icon,
  });

  Interest copyWith({
    String? hashtag,
    String? icon,
  }) =>
      Interest(
        hashtag: hashtag ?? this.hashtag,
        icon: icon ?? this.icon,
      );

  factory Interest.fromJson(Map<String, dynamic> json) => Interest(
    hashtag: json["hashtag"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "hashtag": hashtag,
    "icon": icon,
  };
}
