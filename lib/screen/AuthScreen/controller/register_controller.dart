import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dropchats/api/repo/auth_repo.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/model/GetIntrestModel.dart';
import 'package:dropchats/model/SingUp_model.dart';
import 'package:dropchats/model/authLogin_model.dart';
import 'package:dropchats/model/get_college_list_model.dart';
import 'package:dropchats/model/otp_verification_model.dart';
import 'package:dropchats/model/response_item.dart';
import 'package:dropchats/model/serach_username_model.dart';
import 'package:dropchats/model/serachusernaem_model.dart';
import 'package:dropchats/model/serch_phone_model.dart';
import 'package:dropchats/model/userInterstSelect_Model.dart';
import 'package:dropchats/utils/app_routes.dart';
import 'package:dropchats/utils/app_snackbar.dart';
import 'package:dropchats/widgets/rounded_loading_button.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/shared_prefs.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> formKeyStep3 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyOtp = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController userNameLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  var selectedGender = ''.obs; // Observable for selected gender
  String dateBirth = '';

  void setGender(String gender) {
    selectedGender.value = gender;
  }

  Map<dynamic, String> passData = {};

  ///verify otp Screen
  TextEditingController confirmationCode = TextEditingController();
  Rx<GetCollegeListModel?> getCollegeListModel = Rx<GetCollegeListModel?>(null);
  Rx<GetInterestModel?> getInterestModel = Rx<GetInterestModel?>(null);
  Rx<UserIntrestnSelectModel?> userIntrestnSelectModel =
      Rx<UserIntrestnSelectModel?>(null);

  ///search user name match api
  Rx<SearchUserNameModel?> searchUserNameModel = Rx<SearchUserNameModel?>(null);
  Rx<SearchUserPhoneModel?> searchUserPhoneModel =
      Rx<SearchUserPhoneModel?>(null);
  Rx<SearchEmailNameModel?> searchEmailNameModel =
      Rx<SearchEmailNameModel?>(null);
  RxBool matchUserName = false.obs;
  RxBool matchUserEmail = false.obs;
  RxBool matchUserPhone = false.obs;

  ///register user
  Rx<AuthLoginModel?> authLoginModel = Rx<AuthLoginModel?>(null);
  Rx<AuthSignupModel?> authSignupModel = Rx<AuthSignupModel?>(null);
  RxBool isAuthanitication = false.obs; // Loading state

  ///OtpVerification user
  Rx<AuthOtpVerificationModel?> authOtpVerificationModel =
      Rx<AuthOtpVerificationModel?>(null);

  RxList<DatumCollegeList> filteredCollegeList = RxList<DatumCollegeList>([]);

  void filterCollegeList(String query) {
    if (query.isEmpty) {
      filteredCollegeList.value = getCollegeListModel.value?.data ?? [];
    } else {
      filteredCollegeList.value = getCollegeListModel.value?.data
              .where((college) =>
                  college.name.toLowerCase().contains(query.toLowerCase()))
              .toList() ??
          [];
    }
    update();
  }

  ///selected univercity id
  RxString univerCityId = ''.obs;
  var selectedChips = <int>{}.obs;

  RxInt currentIndex = 0.obs;
  RxInt currentIndexSelectedJoinCampus = (-1).obs;
  RxBool verifyOnSinInTap = false.obs;

  void onVerifyOnSinInTap(bool newStatuse) {
    verifyOnSinInTap.value = newStatuse;
    update();
  }

  bool isVisible = false;
  bool isConfirmVisible = false;

  void isVisibility() {
    isVisible = !isVisible;
    update();
  }

  RxBool isLoadingFirstStep = false.obs; // Loading state
  RxBool isLoadingUserName = false.obs; // Loading state
  RxBool isLoadingEmail = false.obs; // Loading state
  void isConfirmVisibility() {
    isConfirmVisible = !isConfirmVisible;
    update();
  }

  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController btnControlleverir =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController btnControllLogIN =
      RoundedLoadingButtonController();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> btnErrorPhone() async {
    btnController.error();
    await Future.delayed(const Duration(seconds: 1));
    btnController.reset();
  }

  Future<void> btnSussPhone() async {
    btnController.start();
    await Future.delayed(const Duration(seconds: 1));
    btnController.reset();
  }

  Future<void> getData() async {
    await getCollegeList();
    // await getInterestList();
    // await getInterestList();
    // FirebaseMessaging _firebaseMessaging =
    //     FirebaseMessaging.instance; // Change here
    // _firebaseMessaging.getToken().then((token) {
    //   print("token is $token");
    // });
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? deviceToken = await messaging.getToken();
    print('deviceToken ${deviceToken}');
  }

  ///get Collage list
  Future<void> getCollegeList() async {
    // FirebaseMessaging messaging = FirebaseMessaging.instance;
    // String? deviceToken = await messaging.getToken();
    // print('deviceTokendeviceTokendeviceToken${deviceToken}');
    isLoadingFirstStep.value = true;
    ResponseItem result = await AuthRepo.getCollegeListRepo();

    debugPrint("GetCollege  api response :::::: ${result.data}");
    try {
      if (result.status) {
        if (result.data != null) {
          GetCollegeListModel getCollegeListModels =
              GetCollegeListModel.fromJson(result.data);
          getCollegeListModel.value = getCollegeListModels;
          isLoadingFirstStep.value = false;
          debugPrint(
              "getCollegeListModel.value :::::: ${getCollegeListModel.value}");
        } else {
          showErrorSnackBar(result.message.toString().isNotEmpty
              ? result.message.toString()
              : AppString.somethingWentWrong);
          isLoadingFirstStep.value = false;
        }
      } else {
        showErrorSnackBar(result.message.toString().isNotEmpty
            ? result.message.toString()
            : AppString.somethingWentWrong);
      }
    } catch (e) {
      print('${e}');
      isLoadingFirstStep.value = false;
    } finally {
      isLoadingFirstStep.value = false;
    }
  }

  ///search user name match
  Future<void> searchUseName() async {
    isLoadingUserName.value = true;
    ResponseItem result = await AuthRepo.searchUseNameRepo(requestData: {
      "username": usernameController.text,
    });

    debugPrint("GetAuth  api response :::::: ${result.data}");
    try {
      if (result.status) {
        if (result.data != null) {
          SearchUserNameModel searchUserNameModels =
              SearchUserNameModel.fromJson(result.data);
          searchUserNameModel.value = searchUserNameModels;
          matchUserName.value = searchUserNameModel.value?.username ?? false;
          update();
          isLoadingUserName.value = false;
          debugPrint(
              "getCollegeListModel.value :::::: ${getCollegeListModel.value}");
        } else {
          showErrorSnackBar(result.message.toString().isNotEmpty
              ? result.message.toString()
              : AppString.somethingWentWrong);
          isLoadingUserName.value = false;
        }
      } else {
        showErrorSnackBar(result.message.toString().isNotEmpty
            ? result.message.toString()
            : AppString.somethingWentWrong);
      }
    } catch (e) {
      print('${e}');
      isLoadingUserName.value = false;
    } finally {
      isLoadingUserName.value = false;
    }
  }

  ///search user email match
  Future<void> searchUserEmail() async {
    isLoadingEmail.value = true;
    ResponseItem result = await AuthRepo.searchUseNameRepo(requestData: {
      "email": emailController.text,
    });

    debugPrint("GetAuth  api response :::::: ${result.data}");
    try {
      if (result.status) {
        if (result.data != null) {
          SearchEmailNameModel searchUserEmailModels =
              SearchEmailNameModel.fromJson(result.data);
          searchEmailNameModel.value = searchUserEmailModels;
          matchUserEmail.value = searchEmailNameModel.value?.email ?? false;
          update();
          isLoadingEmail.value = false;
        } else {
          showErrorSnackBar(result.message.toString().isNotEmpty
              ? result.message.toString()
              : AppString.somethingWentWrong);
          isLoadingEmail.value = false;
        }
      } else {
        showErrorSnackBar(result.message.toString().isNotEmpty
            ? result.message.toString()
            : AppString.somethingWentWrong);
      }
    } catch (e) {
      print('${e}');
      isLoadingEmail.value = false;
    } finally {
      isLoadingEmail.value = false;
    }
  }

  ///search user phone match
  Future<void> searchUserPhone() async {
    isLoadingEmail.value = true;
    ResponseItem result = await AuthRepo.searchUseNameRepo(requestData: {
      "country_code": "+91",
      "phone": emailController.text,
    });

    debugPrint("GetAuth  api response :::::: ${result.data}");
    try {
      if (result.status) {
        if (result.data != null) {
          SearchUserPhoneModel searchUserPhoneModels =
              SearchUserPhoneModel.fromJson(result.data);
          searchUserPhoneModel.value = searchUserPhoneModels;
          matchUserPhone.value = searchUserPhoneModel.value?.phone ?? false;
          update();
          isLoadingEmail.value = false;
        } else {
          showErrorSnackBar(result.message.toString().isNotEmpty
              ? result.message.toString()
              : AppString.somethingWentWrong);
          isLoadingEmail.value = false;
        }
      } else {
        showErrorSnackBar(result.message.toString().isNotEmpty
            ? result.message.toString()
            : AppString.somethingWentWrong);
      }
    } catch (e) {
      print('${e}');
      isLoadingEmail.value = false;
    } finally {
      isLoadingEmail.value = false;
    }
  }

  ///get interest list
  Future<void> getInterestList() async {
    isLoadingFirstStep.value = true;
    ResponseItem result = await AuthRepo.getInterestListRepo();

    debugPrint("GetCollege  api response :::::: ${result.data}");
    try {
      if (result.status) {
        if (result.data != null && result.data.toString().isNotEmpty) {
          GetInterestModel getInterestListModels =
              GetInterestModel.fromJson(result.data);
          getInterestModel.value = getInterestListModels;
          isLoadingFirstStep.value = false;
          debugPrint("getCollegeListModel.value :::::: ${result.data}");
        } else {
          showErrorSnackBar("No data available.");
        }
        //
      } else {
        showErrorSnackBar(result.message.toString().isNotEmpty
            ? result.message.toString()
            : AppString.somethingWentWrong);
        isLoadingFirstStep.value = false;
      }

      // }
    } catch (e) {
      print('${e}');
      isLoadingFirstStep.value = false;
    } finally {
      isLoadingFirstStep.value = false;
    }
  }

  ///get interest list
  Future<bool> getInterestSelect(int id) async {
    ResponseItem result = await AuthRepo.userInterestSelect(
        requestData: {"interest": id.toString()});

    debugPrint("GetInterest API response :::::: ${result.statusCode}");
    try {
      if (result.status) {
        if (result.data != null && result.data.toString().isNotEmpty) {
          UserIntrestnSelectModel userIntrestnSelectModels =
              UserIntrestnSelectModel.fromJson(result.data);
          userIntrestnSelectModel.value = userIntrestnSelectModels;

          debugPrint("UserIntrestnSelectModel.value :::::: ${result.data}");
          return true; // API call successful
        } else {
          showErrorSnackBar("No data available.");
        }
      } else if (result.statusCode == 400) {
        debugPrint("Bad Request: ${result.message}");
        showErrorSnackBar("User already has interest, assign another");
      } else {
        showErrorSnackBar(result.message.toString().isNotEmpty
            ? result.message.toString()
            : AppString.somethingWentWrong);
      }
    } catch (e) {
      debugPrint("Error in getInterestSelect: $e");
    }
    return false; // API call failed
  }

  // Future<void> getInterestSelect(int id) async {
  //   ResponseItem result =
  //       await AuthRepo.userInterestSelect(requestData: {"interest": id});
  //
  //   debugPrint("GetCollege  api response :::::: ${result.data}");
  //   try {
  //     if (result.status) {
  //       if (result.data != null && result.data.toString().isNotEmpty) {
  //         UserIntrestnSelectModel userIntrestnSelectModels =
  //             UserIntrestnSelectModel.fromJson(result.data);
  //         userIntrestnSelectModel.value = userIntrestnSelectModels;
  //
  //         debugPrint("UserIntrestnSelectModel.value :::::: ${result.data}");
  //       } else {
  //         showErrorSnackBar("No data available.");
  //       }
  //       //
  //     } else {
  //       showErrorSnackBar(result.message.toString().isNotEmpty
  //           ? result.message.toString()
  //           : AppString.somethingWentWrong);
  //     }
  //
  //     // }
  //   } catch (e) {
  //     print('${e}');
  //   } finally {}
  // }

  /// userRegister Api
  Future<void> userRegister() async {
    isAuthanitication.value = true;
    ResponseItem result = await AuthRepo.loginRepo(requestData: {
      "username": "name",
      "password": "Test@123",
      // "username": usernameController.text.toString(),
      // "password": passwordController.text.toString()
    });

    debugPrint("userRegister api response :::::: ${result.data}");

    try {
      if (result.status) {
        if (result.data != null) {
          AuthLoginModel authLoginModels = AuthLoginModel.fromJson(result.data);
          preferences.putBool(SharedPreference.isLogin, true);
          authLoginModel.value = authLoginModels;
          preferences.putString(
              SharedPreference.token, authLoginModel.value?.token ?? "NA");
          update();
          btnController.reset();
          isAuthanitication.value = false;
        } else {
          btnErrorPhone();
          showErrorSnackBar(result.message.toString().isNotEmpty
              ? result.message.toString()
              : AppString.somethingWentWrong);
          isAuthanitication.value = false;
        }
      } else {
        btnErrorPhone();
        showErrorSnackBar(result.message.toString().isNotEmpty
            ? result.message.toString()
            : AppString.somethingWentWrong);
      }
    } catch (e) {
      btnErrorPhone();
      print('${e}');
      isAuthanitication.value = false;
    } finally {
      btnController.reset();
      isAuthanitication.value = false;
    }
  }

  Map<String, dynamic> data = {};

  Future<void> userRegisterData(VoidCallback? Success) async {
    isAuthanitication.value = true;
    data.addAll({
      "birthdate": dateBirth.toString(),
      "country_code": "+91",
      "sex": selectedGender.value == 'Male'
          ? 'm'
          : (selectedGender.value == 'Female')
              ? 'f'
              : '',
      "username": usernameController.text.toString(),
      "password": passwordController.text.toString(),
      "university_id": passData['univerCiti_id'] ?? '',
      "email": 'Test@gmail.com',

      ///chang this
      "phone": emailController.text.toString(),
    });
    // if (isEmail(emailController.text.toString())) {
    //   data.addAll({
    //     "email": emailController.text.toString(),
    //   });
    // } else {
    //   data.addAll({
    //     "phone": emailController.text.toString(),
    //   });
    // }
    ResponseItem result = await AuthRepo.signUpRepo(requestData:
        // data
        {
      "birthdate": "1976-05-25",
      "country_code": "+91",
      "email": "test@gmail.com",
      "phone": "7428730894",
      "sex": "m",
      "username": "name",
      "password": "Test@123",
      "university_id": "1",
    });
    debugPrint("userRegisterData  api response :::::: ${result.toString()}");
    debugPrint("API Response: ${result.data}");
    try {
      if (result.status == true) {
        if (result.data != null) {
          AuthSignupModel authSignupModels =
              AuthSignupModel.fromJson(result.data);
          authSignupModel.value = authSignupModels;
          preferences.putBool(SharedPreference.isLogin, true);
          print('authLoginModel.value${authSignupModel.value?.toJson()}');
          preferences.putString(
              SharedPreference.password, passwordController.text.toString());
          preferences.saveUserData(authSignupModels.data!);

          if (Success != null) {
            Success();
          }
          update();
          btnController.reset();
          isAuthanitication.value = false;
        } else {
          btnErrorPhone();
          showErrorSnackBar(result.message.toString().isNotEmpty
              ? result.message.toString()
              : AppString.somethingWentWrong);
          isAuthanitication.value = false;
        }
      } else {
        btnErrorPhone();
        showErrorSnackBar(result.message.toString().isNotEmpty
            ? result.message.toString()
            : AppString.somethingWentWrong);
      }
    } catch (e) {
      btnErrorPhone();
      if (e is DioError) {
        debugPrint('API Error: ${e.response?.data}'); // Server response
        debugPrint(
            'Status Code: ${e.response?.statusCode}'); // HTTP status code
        debugPrint(
            'Request Data: ${e.requestOptions.data}'); // Sent request data
        debugPrint('Headers: ${e.response?.headers}'); // Response headers
      } else {
        // General error
        debugPrint('Unexpected Error: $e');
      }
      print('eeeeeeeeeeeeeeeeeeeeeeee${e}');
      btnErrorPhone();
      isAuthanitication.value = false;
    } finally {
      btnController.reset();
      isAuthanitication.value = false;
    }
  }

  /// userRegister Api
  Future<void> userOtpVerification() async {
    isAuthanitication.value = true;
    ResponseItem result = await AuthRepo.otpVerification(requestData: {
      "otp": confirmationCode.text.toString(),
    });

    debugPrint("userRegister api response :::::: ${result.data}");

    try {
      if (result.status) {
        btnSussPhone();
        if (result.data != null) {
          AuthOtpVerificationModel authOtpVerification =
              AuthOtpVerificationModel.fromJson(result.data);
          authOtpVerificationModel.value = authOtpVerification;
          btnControlleverir.reset();
          update();
        } else {
          btnControlleverir.reset();
          showErrorSnackBar(result.message.toString().isNotEmpty
              ? result.message.toString()
              : AppString.somethingWentWrong);
        }
      } else {
        btnControlleverir.error();
        btnControlleverir.reset();
        showErrorSnackBar(result.message.toString().isNotEmpty
            ? result.message.toString()
            : AppString.somethingWentWrong);
      }
    } catch (e) {
      btnControlleverir.error();
      btnControlleverir.reset();
      print('${e}');
    } finally {
      btnControlleverir.reset();
    }
  }

  Future<void> login() async {
    btnControllLogIN.reset();
    ResponseItem result = await AuthRepo.loginRepo(
      requestData: {
        "username": userNameLoginController.text.toString().trim(),
        "password": passwordLoginController.text.toString().trim(),
      },
    );
    debugPrint("Login api response :::::: ${result.data}");

    try {
      if (result.status) {
        if (result.data != null) {
          AuthLoginModel authLoginModel = AuthLoginModel.fromJson(result.data);
          if (authLoginModel.registrationStatus == 'complete') {
            preferences.putBool(SharedPreference.isLogin, true);
            preferences.putString(
                SharedPreference.token, authLoginModel.token ?? "NA");
            preferences.putString(SharedPreference.password,
                passwordLoginController.text.toString());
            Get.toNamed(Routes.homeScreen);
            btnControllLogIN.reset();
            showSuccessSnackBar('Login Success');
          } else {
            btnControllLogIN.reset();
            showErrorSnackBar(AppString.somethingWentWrong);
          }
        } else if (result.statusCode == 404) {
          btnControllLogIN.reset();
          debugPrint("Bad Request: ${result.message}");
          showErrorSnackBar(
              "Can't login, invalid credentials or user doesn't exists");
        }
      } else if (result.statusCode == 404) {
        btnControllLogIN.reset();
        debugPrint("Bad Request: ${result.message}");
        showErrorSnackBar(
            "Can't login, invalid credentials or user doesn't exists");
      } else {
        btnControllLogIN.reset();
        showErrorSnackBar(result.message.toString().isNotEmpty
            ? result.message.toString()
            : AppString.somethingWentWrong);
      }
    } catch (e) {
      debugPrint('e==========>>>>>$e');
      btnControllLogIN.reset();
    }
    update();
    btnControllLogIN.reset();
  }
}

bool isEmail(String input) {
  final emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  return emailRegex.hasMatch(input);
}
