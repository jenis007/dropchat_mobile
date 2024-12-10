// // To parse this JSON data, do
// //
// //     final authSignupModel = authSignupModelFromJson(jsonString);
//
// import 'dart:convert';
//
// AuthSignupModel authSignupModelFromJson(String str) =>
//     AuthSignupModel.fromJson(json.decode(str));
//
// String authSignupModelToJson(AuthSignupModel data) =>
//     json.encode(data.toJson());
//
// class AuthSignupModel {
//   String area;
//   String avatar;
//   String avatarThumbnail;
//   List<dynamic> badges;
//   String bio;
//   DateTime birthdate;
//   String cityId;
//   String countryCode;
//   DateTime dateJoined;
//   String email;
//   bool enablePushNotifications;
//   String firstName;
//   int id;
//   String isFollower;
//   String isFollowing;
//   String isPodcaster;
//   String lastName;
//   String lastOnlineAt;
//   String phone;
//   num preferedRadius;
//   Reactions reactions;
//   String referralCode;
//   num referrals;
//   List<dynamic> referredPeople;
//   String sex;
//   String universityId;
//   UserPoints userPoints;
//   dynamic userRealLocation;
//   dynamic userSafeLocation;
//   List<dynamic> userTags;
//   String username;
//   String verifiedPhone;
//
//   AuthSignupModel({
//     required this.area,
//     required this.avatar,
//     required this.avatarThumbnail,
//     required this.badges,
//     required this.bio,
//     required this.birthdate,
//     required this.cityId,
//     required this.countryCode,
//     required this.dateJoined,
//     required this.email,
//     required this.enablePushNotifications,
//     required this.firstName,
//     required this.id,
//     required this.isFollower,
//     required this.isFollowing,
//     required this.isPodcaster,
//     required this.lastName,
//     required this.lastOnlineAt,
//     required this.phone,
//     required this.preferedRadius,
//     required this.reactions,
//     required this.referralCode,
//     required this.referrals,
//     required this.referredPeople,
//     required this.sex,
//     required this.universityId,
//     required this.userPoints,
//     required this.userRealLocation,
//     required this.userSafeLocation,
//     required this.userTags,
//     required this.username,
//     required this.verifiedPhone,
//   });
//
//   AuthSignupModel copyWith({
//     String? area,
//     String? avatar,
//     String? avatarThumbnail,
//     List<dynamic>? badges,
//     String? bio,
//     DateTime? birthdate,
//     String? cityId,
//     String? countryCode,
//     DateTime? dateJoined,
//     String? email,
//     bool? enablePushNotifications,
//     String? firstName,
//     int? id,
//     String? isFollower,
//     String? isFollowing,
//     String? isPodcaster,
//     String? lastName,
//     String? lastOnlineAt,
//     String? phone,
//     num? preferedRadius,
//     Reactions? reactions,
//     String? referralCode,
//     num? referrals,
//     List<dynamic>? referredPeople,
//     String? sex,
//     String? universityId,
//     UserPoints? userPoints,
//     dynamic userRealLocation,
//     dynamic userSafeLocation,
//     List<dynamic>? userTags,
//     String? username,
//     String? verifiedPhone,
//   }) =>
//       AuthSignupModel(
//         area: area ?? this.area,
//         avatar: avatar ?? this.avatar,
//         avatarThumbnail: avatarThumbnail ?? this.avatarThumbnail,
//         badges: badges ?? this.badges,
//         bio: bio ?? this.bio,
//         birthdate: birthdate ?? this.birthdate,
//         cityId: cityId ?? this.cityId,
//         countryCode: countryCode ?? this.countryCode,
//         dateJoined: dateJoined ?? this.dateJoined,
//         email: email ?? this.email,
//         enablePushNotifications:
//             enablePushNotifications ?? this.enablePushNotifications,
//         firstName: firstName ?? this.firstName,
//         id: id ?? this.id,
//         isFollower: isFollower ?? this.isFollower,
//         isFollowing: isFollowing ?? this.isFollowing,
//         isPodcaster: isPodcaster ?? this.isPodcaster,
//         lastName: lastName ?? this.lastName,
//         lastOnlineAt: lastOnlineAt ?? this.lastOnlineAt,
//         phone: phone ?? this.phone,
//         preferedRadius: preferedRadius ?? this.preferedRadius,
//         reactions: reactions ?? this.reactions,
//         referralCode: referralCode ?? this.referralCode,
//         referrals: referrals ?? this.referrals,
//         referredPeople: referredPeople ?? this.referredPeople,
//         sex: sex ?? this.sex,
//         universityId: universityId ?? this.universityId,
//         userPoints: userPoints ?? this.userPoints,
//         userRealLocation: userRealLocation ?? this.userRealLocation,
//         userSafeLocation: userSafeLocation ?? this.userSafeLocation,
//         userTags: userTags ?? this.userTags,
//         username: username ?? this.username,
//         verifiedPhone: verifiedPhone ?? this.verifiedPhone,
//       );
//
//   factory AuthSignupModel.fromJson(Map<String, dynamic> json) =>
//       AuthSignupModel(
//         area: json["area"],
//         avatar: json["avatar"],
//         avatarThumbnail: json["avatar_thumbnail"],
//         badges: List<dynamic>.from(json["badges"].map((x) => x)),
//         bio: json["bio"],
//         birthdate: DateTime.parse(json["birthdate"]),
//         cityId: json["city_id"],
//         countryCode: json["country_code"],
//         dateJoined: DateTime.parse(json["date_joined"]),
//         email: json["email"],
//         enablePushNotifications: json["enable_push_notifications"],
//         firstName: json["first_name"],
//         id: json["id"],
//         isFollower: json["is_follower"],
//         isFollowing: json["is_following"],
//         isPodcaster: json["is_podcaster"],
//         lastName: json["last_name"],
//         lastOnlineAt: json["last_online_at"],
//         phone: json["phone"],
//         preferedRadius: json["prefered_radius"],
//         reactions: Reactions.fromJson(json["reactions"]),
//         referralCode: json["referral_code"],
//         referrals: json["referrals"],
//         referredPeople:
//             List<dynamic>.from(json["referred_people"].map((x) => x)),
//         sex: json["sex"],
//         universityId: json["university_id"],
//         userPoints: UserPoints.fromJson(json["user_points"]),
//         userRealLocation: json["user_real_location"],
//         userSafeLocation: json["user_safe_location"],
//         userTags: List<dynamic>.from(json["user_tags"].map((x) => x)),
//         username: json["username"],
//         verifiedPhone: json["verified_phone"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "area": area,
//         "avatar": avatar,
//         "avatar_thumbnail": avatarThumbnail,
//         "badges": List<dynamic>.from(badges.map((x) => x)),
//         "bio": bio,
//         "birthdate":
//             "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
//         "city_id": cityId,
//         "country_code": countryCode,
//         "date_joined": dateJoined.toIso8601String(),
//         "email": email,
//         "enable_push_notifications": enablePushNotifications,
//         "first_name": firstName,
//         "id": id,
//         "is_follower": isFollower,
//         "is_following": isFollowing,
//         "is_podcaster": isPodcaster,
//         "last_name": lastName,
//         "last_online_at": lastOnlineAt,
//         "phone": phone,
//         "prefered_radius": preferedRadius,
//         "reactions": reactions.toJson(),
//         "referral_code": referralCode,
//         "referrals": referrals,
//         "referred_people": List<dynamic>.from(referredPeople.map((x) => x)),
//         "sex": sex,
//         "university_id": universityId,
//         "user_points": userPoints.toJson(),
//         "user_real_location": userRealLocation,
//         "user_safe_location": userSafeLocation,
//         "user_tags": List<dynamic>.from(userTags.map((x) => x)),
//         "username": username,
//         "verified_phone": verifiedPhone,
//       };
// }
//
// class Reactions {
//   num clapping;
//
//   Reactions({
//     required this.clapping,
//   });
//
//   Reactions copyWith({
//     num? clapping,
//   }) =>
//       Reactions(
//         clapping: clapping ?? this.clapping,
//       );
//
//   factory Reactions.fromJson(Map<String, dynamic> json) => Reactions(
//         clapping: json["clapping"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "clapping": clapping,
//       };
// }
//
// class UserPoints {
//   num generalPoints;
//   num streamPoints;
//
//   UserPoints({
//     required this.generalPoints,
//     required this.streamPoints,
//   });
//
//   UserPoints copyWith({
//     num? generalPoints,
//     num? streamPoints,
//   }) =>
//       UserPoints(
//         generalPoints: generalPoints ?? this.generalPoints,
//         streamPoints: streamPoints ?? this.streamPoints,
//       );
//
//   factory UserPoints.fromJson(Map<String, dynamic> json) => UserPoints(
//         generalPoints: json["general_points"],
//         streamPoints: json["stream_points"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "general_points": generalPoints,
//         "stream_points": streamPoints,
//       };
// }
import 'dart:convert';

import 'package:dropchats/model/user_data_response_model.dart';

class AuthSignupModel {
  bool? login;
  UserData? data;
  String? msg;
  bool? status;
  dynamic entries;

  AuthSignupModel({this.data, this.msg, this.status, this.entries,this.login});

  factory AuthSignupModel.fromJson(Map<String, dynamic> json) {
    return AuthSignupModel(
      login: json["login"] ?? false,
      data: json["data"] == null ? null : UserData.fromJson(json["data"]),
      msg: json['msg'],
      status: json['status'],
      entries: json['entries'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "login": login,
      "data": data?.toJson(),
      'msg': msg,
      'status': status,
      'entries': entries,
    };
  }
}

class Data {
  String? area;
  String? avatar;
  String? avatarThumbnail;
  List<dynamic>? badges;
  String? bio;
  String? birthdate;
  String? cityId;
  String? countryCode;
  String? dateJoined;
  String? email;
  bool? enablePushNotifications;
  String? firstName;
  int? id;
  dynamic isFollower;
  dynamic isFollowing;
  dynamic isPodcaster;
  String? lastName;
  dynamic lastOnlineAt;
  String? phone;
  num? preferedRadius;
  Reactions? reactions;
  String? referralCode;
  num? referrals;
  List<dynamic>? referredPeople;
  String? sex;
  String? universityId;
  UserPoints? userPoints;
  dynamic userRealLocation;
  dynamic userSafeLocation;
  List<dynamic>? userTags;
  String? username;
  bool? verifiedPhone;

  Data({
    this.area,
    this.avatar,
    this.avatarThumbnail,
    this.badges,
    this.bio,
    this.birthdate,
    this.cityId,
    this.countryCode,
    this.dateJoined,
    this.email,
    this.enablePushNotifications,
    this.firstName,
    this.id,
    this.isFollower,
    this.isFollowing,
    this.isPodcaster,
    this.lastName,
    this.lastOnlineAt,
    this.phone,
    this.preferedRadius,
    this.reactions,
    this.referralCode,
    this.referrals,
    this.referredPeople,
    this.sex,
    this.universityId,
    this.userPoints,
    this.userRealLocation,
    this.userSafeLocation,
    this.userTags,
    this.username,
    this.verifiedPhone,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      area: json['area'],
      avatar: json['avatar'],
      avatarThumbnail: json['avatar_thumbnail'],
      badges: json['badges'] ?? [],
      bio: json['bio'],
      birthdate: json['birthdate'],
      cityId: json['city_id'],
      countryCode: json['country_code'],
      dateJoined: json['date_joined'],
      email: json['email'],
      enablePushNotifications: json['enable_push_notifications'],
      firstName: json['first_name'],
      id: json['id'],
      isFollower: json['is_follower'],
      isFollowing: json['is_following'],
      isPodcaster: json['is_podcaster'],
      lastName: json['last_name'],
      lastOnlineAt: json['last_online_at'],
      phone: json['phone'],
      preferedRadius: json['prefered_radius'],
      reactions: json['reactions'] != null
          ? Reactions.fromJson(json['reactions'])
          : null,
      referralCode: json['referral_code'],
      referrals: json['referrals'],
      referredPeople: json['referred_people'] ?? [],
      sex: json['sex'],
      universityId: json['university_id'],
      userPoints: json['user_points'] != null
          ? UserPoints.fromJson(json['user_points'])
          : null,
      userRealLocation: json['user_real_location'],
      userSafeLocation: json['user_safe_location'],
      userTags: json['user_tags'] ?? [],
      username: json['username'],
      verifiedPhone: json['verified_phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'area': area,
      'avatar': avatar,
      'avatar_thumbnail': avatarThumbnail,
      'badges': badges,
      'bio': bio,
      'birthdate': birthdate,
      'city_id': cityId,
      'country_code': countryCode,
      'date_joined': dateJoined,
      'email': email,
      'enable_push_notifications': enablePushNotifications,
      'first_name': firstName,
      'id': id,
      'is_follower': isFollower,
      'is_following': isFollowing,
      'is_podcaster': isPodcaster,
      'last_name': lastName,
      'last_online_at': lastOnlineAt,
      'phone': phone,
      'prefered_radius': preferedRadius,
      'reactions': reactions?.toJson(),
      'referral_code': referralCode,
      'referrals': referrals,
      'referred_people': referredPeople,
      'sex': sex,
      'university_id': universityId,
      'user_points': userPoints?.toJson(),
      'user_real_location': userRealLocation,
      'user_safe_location': userSafeLocation,
      'user_tags': userTags,
      'username': username,
      'verified_phone': verifiedPhone,
    };
  }
}

class Reactions {
  num? clapping;

  Reactions({this.clapping});

  factory Reactions.fromJson(Map<String, dynamic> json) {
    return Reactions(
      clapping: json['clapping'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'clapping': clapping,
    };
  }
}

class UserPoints {
  num? generalPoints;
  num? streamPoints;

  UserPoints({this.generalPoints, this.streamPoints});

  factory UserPoints.fromJson(Map<String, dynamic> json) {
    return UserPoints(
      generalPoints: (json['general_points'] ?? 0.0),
      streamPoints: (json['stream_points'] ?? 0.0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'general_points': generalPoints,
      'stream_points': streamPoints,
    };
  }
}
