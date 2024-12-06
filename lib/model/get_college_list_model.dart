// To parse this JSON data, do
//
//     final getCollegeListModel = getCollegeListModelFromJson(jsonString);

import 'dart:convert';

GetCollegeListModel getCollegeListModelFromJson(String str) =>
    GetCollegeListModel.fromJson(json.decode(str));

String getCollegeListModelToJson(GetCollegeListModel data) =>
    json.encode(data.toJson());

class GetCollegeListModel {
  List<DatumCollegeList> data;

  GetCollegeListModel({
    required this.data,
  });

  GetCollegeListModel copyWith({
    List<DatumCollegeList>? data,
  }) =>
      GetCollegeListModel(
        data: data ?? this.data,
      );

  factory GetCollegeListModel.fromJson(Map<String, dynamic> json) =>
      GetCollegeListModel(
        data: List<DatumCollegeList>.from(
            json["data"].map((x) => DatumCollegeList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DatumCollegeList {
  bool allowed;
  String avatar;
  String avatarThumbnail;
  String country;
  dynamic icon;
  int id;
  String name;

  DatumCollegeList({
    required this.allowed,
    required this.avatar,
    required this.avatarThumbnail,
    required this.country,
    required this.icon,
    required this.id,
    required this.name,
  });

  DatumCollegeList copyWith({
    bool? allowed,
    String? avatar,
    String? avatarThumbnail,
    String? country,
    dynamic icon,
    int? id,
    String? name,
  }) =>
      DatumCollegeList(
        allowed: allowed ?? this.allowed,
        avatar: avatar ?? this.avatar,
        avatarThumbnail: avatarThumbnail ?? this.avatarThumbnail,
        country: country ?? this.country,
        icon: icon ?? this.icon,
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory DatumCollegeList.fromJson(Map<String, dynamic> json) =>
      DatumCollegeList(
        allowed: json["allowed"],
        avatar: json["avatar"],
        avatarThumbnail: json["avatar_thumbnail"],
        country: json["country"],
        icon: json["icon"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "allowed": allowed,
        "avatar": avatar,
        "avatar_thumbnail": avatarThumbnail,
        "country": country,
        "icon": icon,
        "id": id,
        "name": name,
      };
}
