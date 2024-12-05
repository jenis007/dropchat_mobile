class UserData {
  int? id;
  String? firstname;
  String? lastname;
  String? name;
  dynamic username;
  String? email;
  dynamic mobile;
  dynamic emailVerifiedAt;
  String? tfver;
  String? emailv;
  String? vercode;
  String? balance;
  dynamic gender;
  dynamic address;
  dynamic zipCode;
  dynamic city;
  dynamic countryCode;
  dynamic country;
  dynamic vsent;
  String? secretcode;
  String? tauth;
  dynamic refId;
  String? referralToken;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic image;
  dynamic about;
  int? ev;
  int? sv;
  int? profileComplete;
  dynamic verCode;
  dynamic verCodeSendAt;
  dynamic banReason;
  String? fb_id;
  String? google_id;
  String? apple_id;
  String? device_token;
  String? imageUrl;

  UserData({
    this.id,
    this.firstname,
    this.lastname,
    this.name,
    this.username,
    this.email,
    this.mobile,
    this.emailVerifiedAt,
    this.tfver,
    this.emailv,
    this.vercode,
    this.balance,
    this.gender,
    this.address,
    this.zipCode,
    this.city,
    this.countryCode,
    this.country,
    this.vsent,
    this.secretcode,
    this.tauth,
    this.refId,
    this.referralToken,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.about,
    this.ev,
    this.sv,
    this.profileComplete,
    this.verCode,
    this.verCodeSendAt,
    this.banReason,
    this.imageUrl,
    this.fb_id,
    this.google_id,
    this.apple_id,
    this.device_token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        name: json["name"] ?? "",
        username: json["username"],
        email: json["email"] ?? "",
        mobile: json["mobile"],
        emailVerifiedAt: json["email_verified_at"],
        tfver: json["tfver"] ?? "",
        emailv: json["emailv"] ?? "",
        vercode: json["vercode"] ?? "",
        balance: json["balance"] ?? "",
        gender: json["gender"],
        address: json["address"] ?? "",
        zipCode: json["zip_code"],
        city: json["city"],
        countryCode: json["country_code"],
        country: json["country"],
        vsent: json["vsent"],
        secretcode: json["secretcode"] ?? "",
        tauth: json["tauth"] ?? "",
        refId: json["ref_id"],
        referralToken: json["referral_token"] ?? "",
        status: json["status"] ?? "",
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        image: json["image"],
        about: json["about"],
        ev: json["ev"] ?? 0,
        sv: json["sv"] ?? 0,
        profileComplete: json["profile_complete"] ?? 0,
        verCode: json["ver_code"],
        verCodeSendAt: json["ver_code_send_at"],
        banReason: json["ban_reason"],
        fb_id: json["fb_id"],
        google_id: json["google_id"],
        apple_id: json["apple_id"],
        device_token: json["device_token"],
        imageUrl: json["image_url"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "name": name,
        "username": username,
        "email": email,
        "mobile": mobile,
        "email_verified_at": emailVerifiedAt,
        "tfver": tfver,
        "emailv": emailv,
        "vercode": vercode,
        "balance": balance,
        "gender": gender,
        "address": address,
        "zip_code": zipCode,
        "city": city,
        "country_code": countryCode,
        "country": country,
        "vsent": vsent,
        "secretcode": secretcode,
        "tauth": tauth,
        "ref_id": refId,
        "referral_token": referralToken,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image": image,
        "about": about,
        "ev": ev,
        "sv": sv,
        "profile_complete": profileComplete,
        "ver_code": verCode,
        "ver_code_send_at": verCodeSendAt,
        "ban_reason": banReason,
        "google_id": google_id,
        "apple_id": apple_id,
        "fb_id": fb_id,
        "device_token": device_token,
        "image_url": imageUrl,
      };
}
