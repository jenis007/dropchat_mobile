import 'package:dio/dio.dart';
import 'package:dropchats/api/repo/auth_repo.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/model/GetIntrestModel.dart';
import 'package:dropchats/model/SingUp_model.dart';
import 'package:dropchats/model/authLogin_model.dart';
import 'package:dropchats/model/get_college_list_model.dart';
import 'package:dropchats/model/response_item.dart';
import 'package:dropchats/model/serach_username_model.dart';
import 'package:dropchats/model/serachusernaem_model.dart';
import 'package:dropchats/model/serch_phone_model.dart';
import 'package:dropchats/utils/app_snackbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../utils/shared_prefs.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> formKeyStep3 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyOtp = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dateController = TextEditingController();
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

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    await getCollegeList();
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
        // if (result.data != null) {
        if (result.data != null && result.data.toString().isNotEmpty) {
          GetInterestModel getInterestListModels =
              GetInterestModel.fromJson(result.data);
          getInterestModel.value = getInterestListModels;
          isLoadingFirstStep.value = false;
          debugPrint("getCollegeListModel.value :::::: ${result.data}");
        } else {
          showErrorSnackBar("No data available.");
        }
        // GetInterestModel getInterestListModels =
        //     GetInterestModel.fromJson(result.data);
        // getInterestModel.value = getInterestListModels;
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

  /// userRegister Api
  Future<void> userRegister() async {
    isAuthanitication.value = true;
    ResponseItem result = await AuthRepo.loginRepo(requestData: {
      "username": usernameController.text.toString(),
      "password": passwordController.text.toString()
    });

    debugPrint("userRegister  api response :::::: ${result.data}");
    try {
      if (result.status) {
        if (result.data != null) {
          AuthLoginModel authLoginModels = AuthLoginModel.fromJson(result.data);
          authLoginModel.value = authLoginModels;
          preferences.putString(
              SharedPreference.token, authLoginModel.value?.token ?? "NA");
          preferences.putString(SharedPreference.competedRegister,
              authLoginModel.value?.registrationStatus ?? '');
          print('authLoginModel.value${authLoginModel.value?.toJson()}');
          update();
          isAuthanitication.value = false;
        } else {
          showErrorSnackBar(result.message.toString().isNotEmpty
              ? result.message.toString()
              : AppString.somethingWentWrong);
          isAuthanitication.value = false;
        }
      }
    } catch (e) {
      print('${e}');
      isAuthanitication.value = false;
    } finally {
      isAuthanitication.value = false;
    }
  }

  Future<void> userRegisterData() async {
    isAuthanitication.value = true;
    ResponseItem result = await AuthRepo.signUpRepo(requestData: {
      "birthdate": dateBirth.toString(),
      "country_code": "+91",
      "email": isEmail(emailController.text.toString())
          ? emailController.text.toString()
          : '',
      "phone": isEmail(emailController.text.toString())
          ? ''
          : emailController.text.toString(),
      "sex": selectedGender.value == 'Male'
          ? 'm'
          : (selectedGender.value == 'Female')
              ? 'f'
              : '',
      "username": usernameController.text.toString(),
      "password": passwordController.text.toString(),
      "university_id": passData['univerCiti_id'] ?? '',
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
          preferences.saveUserData(authSignupModels.data!);
          update();
          isAuthanitication.value = false;
        } else {
          showErrorSnackBar(result.message.toString().isNotEmpty
              ? result.message.toString()
              : AppString.somethingWentWrong);
          isAuthanitication.value = false;
        }
      }
    } catch (e) {
      if (e is DioError) {
        // Capture detailed information for API errors
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
      isAuthanitication.value = false;
    } finally {
      isAuthanitication.value = false;
    }
  }
}

bool isEmail(String input) {
  final emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  return emailRegex.hasMatch(input);
}
