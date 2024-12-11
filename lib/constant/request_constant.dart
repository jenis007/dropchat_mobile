class AppUrls {
  static const baseUrl = "https://dev.dropchats.one/api/";
  static const baseSocketUrl = "https://dev.dropchats.one";

  static const socketPath = "/socket/websocket";
}

class MethodNames {
  /// AUTH
  static const login = "token";
  static const socialLogin = "sociallogin";
  static const authToken = "token";
  static const otpVerification = "phone-verification/";
  static const user = "user";
  static const userInterestsSelect = "user_interests";
  static const resetPasswordMail = "forgot/send";
  static const deleteAccount = "delete-account";
  static const profileUpdate = "profile-update";
  static const getProfile = "get-profile/";
  static const getCollegeList = "university";
  static const getInterest = "interests";
  static const searchUseName = "search-user";
}
