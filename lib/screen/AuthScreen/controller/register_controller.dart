import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dropchats/api/repo/auth_repo.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/constant/request_constant.dart';
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
  TextEditingController phoneController = TextEditingController();

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
  String dialCode = "91";
  RxString isoCode = 'IN'.obs;
  RxString? phoneValidateText = "".obs;
  RxBool? isPhoneErrorShow = false.obs;

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
  // var selectedChips = <int>{}.obs;
  // RxList<int> selectedChips = <int>[].obs;
  RxList<int> isChipLoading = <int>[].obs;
  RxSet<int> selectedChips = RxSet<int>();
  RxSet<int> selectedChipsa = RxSet<int>();

  RxBool isLoadingSelectedInterest = false.obs;
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
    isLoadingFirstStep.value = true; // Start loading indicator

    try {
      ResponseItem result = await AuthRepo.getCollegeListRepo();
      debugPrint("GetCollege api response :::::: ${result.data}");

      if (result.status) {
        if (result.data != null) {
          GetCollegeListModel getCollegeListModels =
              GetCollegeListModel.fromJson(result.data);
          getCollegeListModel.value = getCollegeListModels;

          debugPrint(
              "getCollegeListModel.value :::::: ${getCollegeListModel.value}");
        } else {
          // Handle null data response
          MyToasts.errorToast(
              toast: result.message.toString().isNotEmpty
                  ? result.message.toString()
                  : AppString.somethingWentWrong);
        }
      } else {
        // Handle unsuccessful response
        MyToasts.errorToast(
            toast: result.message.toString().isNotEmpty
                ? result.message.toString()
                : AppString.somethingWentWrong);
      }
    } catch (e) {
      // Handle any unexpected exceptions
      debugPrint("Error in getCollegeList: $e");
      MyToasts.errorToast(toast: AppString.somethingWentWrong);
    } finally {
      // Stop the loading indicator in all cases
      isLoadingFirstStep.value = false;
    }
  }

  ///search user name match
  Future<void> searchUseName() async {
    isLoadingUserName.value = true;

    try {
      // Make API call
      ResponseItem result = await AuthRepo.searchUseNameRepo(requestData: {
        "username": usernameController.text,
      });

      debugPrint("GetAuth API Response :::::: ${result.data}");

      // Handle successful response
      if (result.status) {
        if (result.data != null) {
          // Parse the response data
          SearchUserNameModel searchUserNameModels =
              SearchUserNameModel.fromJson(result.data);
          searchUserNameModel.value = searchUserNameModels;

          // Update match status
          matchUserName.value = searchUserNameModel.value?.username ?? false;
          debugPrint("Matched Username: ${matchUserName.value}");
          update();
        } else {
          // Handle empty data case
          MyToasts.errorToast(
            toast: result.message.toString().isNotEmpty
                ? result.message
                : AppString.somethingWentWrong,
          );
        }
      } else {
        // Handle unsuccessful status
        MyToasts.errorToast(
          toast: result.message.toString().isNotEmpty
              ? result.message
              : AppString.somethingWentWrong,
        );
      }
    } catch (e) {
      // Handle exceptions
      debugPrint("Error occurred in searchUseName: $e");
      MyToasts.errorToast(
        toast: e.toString().isNotEmpty
            ? e.toString()
            : AppString.somethingWentWrong,
      );
    } finally {
      // Ensure loading is reset
      isLoadingUserName.value = false;
    }
  }

  ///search user email match
  Future<void> searchUserEmail() async {
    isLoadingEmail.value = true;

    try {
      // Make API call
      ResponseItem result = await AuthRepo.searchUseNameRepo(requestData: {
        "email": phoneController.text,
      });

      debugPrint("GetAuth API Response :::::: ${result.data}");

      // Handle successful response
      if (result.status) {
        if (result.data != null) {
          // Parse the response data
          SearchEmailNameModel searchUserEmailModels =
              SearchEmailNameModel.fromJson(result.data);
          searchEmailNameModel.value = searchUserEmailModels;

          // Update match status
          matchUserEmail.value = searchEmailNameModel.value?.email ?? false;
          debugPrint("Matched Email: ${matchUserEmail.value}");
          update();
        } else {
          // Handle empty data case
          MyToasts.errorToast(
            toast: result.message.toString().isNotEmpty
                ? result.message
                : AppString.somethingWentWrong,
          );
        }
      } else {
        // Handle unsuccessful status
        MyToasts.errorToast(
          toast: result.message.toString().isNotEmpty
              ? result.message
              : AppString.somethingWentWrong,
        );
      }
    } catch (e) {
      // Handle exceptions
      debugPrint("Error occurred in searchUserEmail: $e");
      MyToasts.errorToast(
        toast: e.toString().isNotEmpty
            ? e.toString()
            : AppString.somethingWentWrong,
      );
    } finally {
      // Ensure loading is reset
      isLoadingEmail.value = false;
    }
  }

  ///search user phone match
  Future<void> searchUserPhone() async {
    isLoadingEmail.value = true;

    try {
      // Make API call
      ResponseItem result = await AuthRepo.searchUseNameRepo(requestData: {
        "country_code": dialCode.toString(),
        "phone": phoneController.text,
      });

      debugPrint("GetAuth API Response :::::: ${result.data}");

      // Handle successful response
      if (result.status) {
        if (result.data != null) {
          // Parse the response data
          SearchUserPhoneModel searchUserPhoneModels =
              SearchUserPhoneModel.fromJson(result.data);
          searchUserPhoneModel.value = searchUserPhoneModels;

          // Update match status
          matchUserPhone.value = searchUserPhoneModel.value?.phone ?? false;
          debugPrint("Matched Phone: ${matchUserPhone.value}");
          update();
        } else {
          // Handle empty data case
          MyToasts.errorToast(
            toast: result.message.toString().isNotEmpty
                ? result.message
                : AppString.somethingWentWrong,
          );
        }
      } else {
        // Handle unsuccessful status
        MyToasts.errorToast(
          toast: result.message.toString().isNotEmpty
              ? result.message
              : AppString.somethingWentWrong,
        );
      }
    } catch (e) {
      // Handle exceptions
      debugPrint("Error occurred in searchUserPhone: $e");
      MyToasts.errorToast(
        toast: e.toString().isNotEmpty
            ? e.toString()
            : AppString.somethingWentWrong,
      );
    } finally {
      // Ensure loading is reset
      isLoadingEmail.value = false;
    }
  }

  var currentPage = 1.obs;
  var isLastPage = false.obs; // Whether the last page has been reached
  RxBool isLoadingMoreData = false.obs; // New flag to track pagination loading

  ///get interest list
  Future<void> getInterestList({bool isNextPage = false}) async {
    if (isNextPage && isLastPage.value) return; // No more pages to load

    if (!isNextPage) {
      isLoadingFirstStep.value = true;
      currentPage.value = 1; // Reset to the first page
      isLastPage.value = false;
    } else {
      isLoadingMoreData.value = true; // Start loading more data
    }

    try {
      String apiUrl =
          "${AppUrls.baseUrl}${MethodNames.getInterest}?page=${currentPage.value}";
      ResponseItem result = await AuthRepo.getInterestListRepo(apiUrl);

      debugPrint("GetInterestList API Response :::::: ${result.data}");

      if (result.status) {
        if (result.data != null && result.data.toString().isNotEmpty) {
          GetInterestModel newData = GetInterestModel.fromJson(result.data);

          if (!isNextPage) {
            getInterestModel.value = newData;
          } else {
            getInterestModel.value!.entries.addAll(newData.entries);
          }

          if (newData.entries.length < 10) {
            isLastPage.value = true;
          } else {
            currentPage.value++;
          }
        } else {
          if (!isNextPage) {
            MyToasts.errorToast(toast: "No data available");
          }
          isLastPage.value = true;
        }
      } else {
        MyToasts.errorToast(
            toast: result.message ?? AppString.somethingWentWrong);
      }
    } catch (e) {
      debugPrint("Error in getInterestList: $e");
      MyToasts.errorToast(
          toast: e.toString().isNotEmpty
              ? e.toString()
              : AppString.somethingWentWrong);
    } finally {
      if (isNextPage) {
        isLoadingMoreData.value = false; // Stop loading more data
      } else {
        isLoadingFirstStep.value = false; // Stop initial loading
      }
    }
  }

  // Future<void> getInterestList() async {
  //   isLoadingFirstStep.value = true;
  //
  //   try {
  //     // API call
  //     ResponseItem result = await AuthRepo.getInterestListRepo();
  //
  //     debugPrint("GetInterestList API Response :::::: ${result.data}");
  //
  //     if (result.status) {
  //       if (result.data != null && result.data.toString().isNotEmpty) {
  //         // Parse the response
  //         GetInterestModel getInterestListModels =
  //             GetInterestModel.fromJson(result.data);
  //         getInterestModel.value = getInterestListModels;
  //
  //         debugPrint("getInterestListModel.value :::::: ${result.data}");
  //       } else {
  //         MyToasts.errorToast(toast: "No data available");
  //       }
  //     } else {
  //       MyToasts.errorToast(
  //           toast: result.message ?? AppString.somethingWentWrong);
  //     }
  //   } catch (e) {
  //     debugPrint("Error in getInterestList: $e");
  //     MyToasts.errorToast(
  //         toast: e.toString().isNotEmpty
  //             ? e.toString()
  //             : AppString.somethingWentWrong);
  //   } finally {
  //     isLoadingFirstStep.value = false;
  //   }
  // }

  ///get interest list
  Future<bool> getInterestSelect(int id) async {
    isLoadingSelectedInterest.value = true;
    try {
      // API call
      ResponseItem result = await AuthRepo.userInterestSelect(
        requestData: {"interest": id.toString()},
      );

      debugPrint("GetInterest API response :::::: ${result.statusCode}");

      // Handle response
      if (result.status) {
        if (result.data != null && result.data.toString().isNotEmpty) {
          // Parse the response
          UserIntrestnSelectModel userIntrestnSelectModels =
              UserIntrestnSelectModel.fromJson(result.data);
          userIntrestnSelectModel.value = userIntrestnSelectModels;
          isLoadingSelectedInterest.value = false;
          debugPrint("UserIntrestnSelectModel.value :::::: ${result.data}");
          return true; // Success
        } else {
          // Handle empty data
          MyToasts.errorToast(toast: "No data available");
        }
      } else if (result.statusCode == 400) {
        isLoadingSelectedInterest.value = false;
        // Handle specific error for bad request
        debugPrint("Bad Request: ${result.message}");
        MyToasts.errorToast(toast: "User already has interest, assign another");
      } else {
        isLoadingSelectedInterest.value = false;
        // Handle generic error
        MyToasts.errorToast(
          toast: result.message.toString().isNotEmpty
              ? result.message
              : AppString.somethingWentWrong,
        );
      }
    } catch (e) {
      isLoadingSelectedInterest.value = false;
      // Handle exceptions
      debugPrint("Error in getInterestSelect: $e");
      MyToasts.errorToast(
        toast: e.toString().isNotEmpty
            ? e.toString()
            : AppString.somethingWentWrong,
      );
    }
    return false; // Return false in case of any failure
  }

  /// userRegister Api
  Future<void> userRegister() async {
    isAuthanitication.value = true;
    try {
      // API request
      ResponseItem result = await AuthRepo.loginRepo(requestData: {
        "username": usernameController.text.toString(),
        "password": passwordController.text.toString()
      });

      debugPrint("userRegister api response :::::: ${result.data}");

      // Handle response
      if (result.status) {
        if (result.data != null) {
          // Parse and store user login data
          AuthLoginModel authLoginModels = AuthLoginModel.fromJson(result.data);
          preferences.putBool(SharedPreference.isLogin, true);
          authLoginModel.value = authLoginModels;
          preferences.putString(
              SharedPreference.token, authLoginModel.value?.token ?? "NA");

          update();
          btnController.reset();
          isAuthanitication.value = false;
        } else {
          // Handle case where data is null
          btnErrorPhone();
          MyToasts.errorToast(
              toast: result.message.toString().isNotEmpty
                  ? result.message
                  : AppString.somethingWentWrong);
          isAuthanitication.value = false;
        }
      } else {
        // Handle unsuccessful response
        btnErrorPhone();
        MyToasts.errorToast(
            toast: result.message.toString().isNotEmpty
                ? result.message
                : AppString.somethingWentWrong);
        isAuthanitication.value = false;
      }
    } catch (e) {
      // Handle exceptions during API request
      btnErrorPhone();
      print('Error during user registration: $e');
      MyToasts.errorToast(
          toast: e.toString().isNotEmpty
              ? e.toString()
              : AppString.somethingWentWrong);
      isAuthanitication.value = false;
    } finally {
      // Reset button and loading state
      btnController.reset();
      isAuthanitication.value = false;
    }
  }

  Map<String, dynamic> data = {};

  Future<void> userRegisterData(VoidCallback? Success) async {
    isAuthanitication.value = true;
    //     {
    //   "birthdate": "1976-05-25",
    //   "country_code": "+91",
    //   "email": "test@gmail.com",
    //   "phone": "9054573360",
    //   "sex": "m",
    //   "username": "name",
    //   "password": "Test@123",
    //   "university_id": "1",
    // }

    ///when one key pass email or phone
    // if (isEmail(emailController.text.toString())) {
    //   data.addAll({
    //     "email": emailController.text.toString(),
    //   });
    // } else {
    //   data.addAll({
    //     "phone": emailController.text.toString(),
    //   });
    // }
    // Prepare request data
    data.addAll({
      "birthdate": dateBirth.toString(),
      "country_code": dialCode.toString(),
      "sex": selectedGender.value == 'Male'
          ? 'm'
          : (selectedGender.value == 'Female' ? 'f' : ''),
      "username": usernameController.text.toString(),
      "password": passwordController.text.toString(),
      "university_id": passData['univerCiti_id'] ?? '',
      "email": 'Test@gmail.com',
      "phone": phoneController.text.toString().trim(),
    });

    try {
      ResponseItem result = await AuthRepo.signUpRepo(requestData: data);
      debugPrint("userRegisterData API response :::::: ${result.toString()}");
      debugPrint("API Response: ${result.data}");

      // Handle API response
      // if (result.statusCode == 422) {
      //   MyToasts.errorToast(toast: AppString.somethingWentWrong);
      // } else if
      if (result.status == true) {
        if (result.data != null) {
          // Parse the response data
          AuthSignupModel authSignupModels =
              AuthSignupModel.fromJson(result.data);
          authSignupModel.value = authSignupModels;

          // Save user data and token
          preferences.putBool(SharedPreference.isLogin, true);
          preferences.putString(
              SharedPreference.password, passwordController.text.toString());
          preferences.saveUserData(authSignupModels.data!);

          if (Success != null) {
            Success();
          }

          btnController.reset();
          isAuthanitication.value = false;
          update();
        } else {
          // Handle null data in response
          btnErrorPhone();
          MyToasts.errorToast(
              toast: result.message?.isNotEmpty == true
                  ? result.message!
                  : AppString.somethingWentWrong);
          isAuthanitication.value = false;
        }
      } else {
        btnErrorPhone();
        MyToasts.errorToast(
            toast: result.message?.isNotEmpty == true
                ? result.message!
                : AppString.somethingWentWrong);
      }
    } catch (e) {
      // Error handling
      btnErrorPhone();
      MyToasts.errorToast(toast: e.toString());
      isAuthanitication.value = false;
    } finally {
      btnController.reset();
      isAuthanitication.value = false;
    }
  }

  /// userRegister Api

  Future<void> userOtpVerification(VoidCallback? Success) async {
    btnControlleverir.reset();
    try {
      ResponseItem result = await AuthRepo.otpVerification(requestData: {
        "otp": confirmationCode.text.toString(),
      });
      debugPrint("userRegister api response :::::: ${result.data}");

      if (result.status) {
        if (result.data != null) {
          AuthOtpVerificationModel authOtpVerification =
              AuthOtpVerificationModel.fromJson(result.data);
          authOtpVerificationModel.value = authOtpVerification;
          if (authOtpVerificationModel.value?.verified == true) {
            if (Success != null) {
              btnControlleverir.success();
              Success();
              MyToasts.successToast(toast: 'Otp Verified Successfully');
              confirmationCode.clear();
            }
          } else {
            // If verification fails
            MyToasts.errorToast(
                toast: result.message?.isNotEmpty == true
                    ? result.message.toString()
                    : AppString.somethingWentWrong);
            btnControlleverir.reset();
          }
        } else {
          MyToasts.errorToast(
              toast: result.message?.isNotEmpty == true
                  ? result.message.toString()
                  : AppString.somethingWentWrong);
          btnControlleverir.reset();
        }
      } else {
        MyToasts.errorToast(
            toast: result.message?.isNotEmpty == true
                ? result.message.toString()
                : AppString.somethingWentWrong);
        btnControlleverir.reset();
      }
    } catch (e) {
      btnControlleverir.reset();
      update();
      MyToasts.errorToast(toast: e.toString());
      // Reset the button in case of error
      debugPrint("Error: $e");
    } finally {
      btnControlleverir.reset();
      // In the finally block, button reset should be done only if OTP verification fails
      if (authOtpVerificationModel.value?.verified != true) {
        btnControlleverir.reset();
      }
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
            MyToasts.successToast(toast: 'Login Successfully');
          } else {
            btnControllLogIN.reset();
            MyToasts.errorToast(toast: AppString.somethingWentWrong);
          }
        } else if (result.statusCode == 404) {
          btnControllLogIN.reset();
          debugPrint("Bad Request: ${result.message}");
          MyToasts.errorToast(
              toast: "Can't login, invalid credentials or user doesn't exists");
        }
      } else if (result.statusCode == 404) {
        btnControllLogIN.reset();
        debugPrint("Bad Request: ${result.message}");
        MyToasts.errorToast(
            toast: "Can't login, invalid credentials or user doesn't exists");
      } else {
        btnControllLogIN.reset();
        MyToasts.errorToast(
            toast: result.message.toString().isNotEmpty
                ? result.message.toString()
                : AppString.somethingWentWrong);
      }
    } catch (e) {
      debugPrint('e==========>>>>>$e');
      MyToasts.errorToast(toast: e.toString());
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
