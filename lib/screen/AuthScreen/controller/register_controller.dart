import 'package:dropchats/api/repo/auth_repo.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/model/GetIntrestModel.dart';
import 'package:dropchats/model/get_college_list_model.dart';
import 'package:dropchats/model/response_item.dart';
import 'package:dropchats/utils/app_snackbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> formKeyStep3 = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  var selectedGender = ''.obs; // Observable for selected gender

  void setGender(String gender) {
    selectedGender.value = gender;
  }

  ///verify otp Screen
  TextEditingController confirmationCode = TextEditingController();
  Rx<GetCollegeListModel?> getCollegeListModel = Rx<GetCollegeListModel?>(null);
  Rx<GetInterestModel?> getInterestModel = Rx<GetInterestModel?>(null);
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
    update(); // To refresh the UI after filtering
  }

  List<String> cityText = ["ULCA", "USC", "NYU", "Columbia"];
  var selectedChips = <int>{}.obs;
  final List<String> dogeNames = [
    'Gaming',
    'Music festivals',
    'Exploring food trends',
    'Live sports events',
    'Escape rooms',
    'volunteer activities',
    'Dance classes',
    'Tech Events',
    'DIY workshops',
    'Exploring thrift stores',
    'Hiking and outdoor adventures',
  ];

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

  RxBool isLoadingFirstStep = true.obs; // Loading state
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
}
