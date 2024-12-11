// class UserData {
//   int? id;
//   String? token;
//   String? birthdate;
//   String? competedRegister;
//   dynamic username;
//   String? email;
//   String? password;
//   String? sex;
//   dynamic phone;
//   String? firstname;
//   String? lastname;
//   String? name;
//   dynamic emailVerifiedAt;
//   String? tfver;
//   String? emailv;
//   String? vercode;
//   String? balance;
//   dynamic gender;
//   dynamic address;
//   dynamic zipCode;
//   dynamic city;
//   dynamic countryCode;
//   dynamic country;
//   dynamic vsent;
//   String? secretcode;
//   String? tauth;
//   dynamic refId;
//   String? referralToken;
//   String? status;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic image;
//   dynamic about;
//   int? ev;
//   int? sv;
//   int? profileComplete;
//   dynamic verCode;
//   dynamic verCodeSendAt;
//   dynamic banReason;
//   String? fb_id;
//   String? google_id;
//   String? apple_id;
//   String? device_token;
//   String? imageUrl;
//
//   UserData({
//     this.id,
//     this.firstname,
//     this.lastname,
//     this.sex,
//     this.name,
//     this.password,
//     this.username,
//     this.email,
//     this.phone,
//     this.emailVerifiedAt,
//     this.tfver,
//     this.emailv,
//     this.vercode,
//     this.balance,
//     this.gender,
//     this.address,
//     this.zipCode,
//     this.city,
//     this.countryCode,
//     this.country,
//     this.vsent,
//     this.secretcode,
//     this.tauth,
//     this.refId,
//     this.referralToken,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.image,
//     this.about,
//     this.ev,
//     this.sv,
//     this.profileComplete,
//     this.verCode,
//     this.verCodeSendAt,
//     this.banReason,
//     this.imageUrl,
//     this.fb_id,
//     this.google_id,
//     this.apple_id,
//     this.device_token,
//     this.competedRegister,
//     this.token,
//     this.birthdate,
//   });
//
//   factory UserData.fromJson(Map<String, dynamic> json) => UserData(
//         id: json["id"],
//         competedRegister: json["registration_status"],
//         token: json["token"],
//         sex: json["sex"],
//         firstname: json["firstname"],
//         birthdate: json["birthdate"],
//         lastname: json["lastname"],
//         name: json["name"] ?? "",
//         password: json["password"] ?? "",
//         username: json["username"],
//         email: json["email"] ?? "",
//         phone: json["phone"],
//         emailVerifiedAt: json["email_verified_at"],
//         tfver: json["tfver"] ?? "",
//         emailv: json["emailv"] ?? "",
//         vercode: json["vercode"] ?? "",
//         balance: json["balance"] ?? "",
//         gender: json["gender"],
//         address: json["address"] ?? "",
//         zipCode: json["zip_code"],
//         city: json["city"],
//         countryCode: json["countryCode"],
//         country: json["country"],
//         vsent: json["vsent"],
//         secretcode: json["secretcode"] ?? "",
//         tauth: json["tauth"] ?? "",
//         refId: json["ref_id"],
//         referralToken: json["referral_token"] ?? "",
//         status: json["status"] ?? "",
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         image: json["image"],
//         about: json["about"],
//         ev: json["ev"] ?? 0,
//         sv: json["sv"] ?? 0,
//         profileComplete: json["profile_complete"] ?? 0,
//         verCode: json["ver_code"],
//         verCodeSendAt: json["ver_code_send_at"],
//         banReason: json["ban_reason"],
//         fb_id: json["fb_id"],
//         google_id: json["google_id"],
//         apple_id: json["apple_id"],
//         device_token: json["device_token"],
//         imageUrl: json["image_url"] ?? "",
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "token": token,
//         "birthdate": birthdate,
//         "password": password,
//         "sex": sex,
//         "registration_status": competedRegister,
//         "firstname": firstname,
//         "lastname": lastname,
//         "name": name,
//         "username": username,
//         "email": email,
//         "phone": phone,
//         "email_verified_at": emailVerifiedAt,
//         "tfver": tfver,
//         "emailv": emailv,
//         "vercode": vercode,
//         "balance": balance,
//         "gender": gender,
//         "address": address,
//         "zip_code": zipCode,
//         "city": city,
//         "countryCode": countryCode,
//         "country": country,
//         "vsent": vsent,
//         "secretcode": secretcode,
//         "tauth": tauth,
//         "ref_id": refId,
//         "referral_token": referralToken,
//         "status": status,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "image": image,
//         "about": about,
//         "ev": ev,
//         "sv": sv,
//         "profile_complete": profileComplete,
//         "ver_code": verCode,
//         "ver_code_send_at": verCodeSendAt,
//         "ban_reason": banReason,
//         "google_id": google_id,
//         "apple_id": apple_id,
//         "fb_id": fb_id,
//         "device_token": device_token,
//         "image_url": imageUrl,
//       };
// }
class UserData {
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

  UserData({
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

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
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
