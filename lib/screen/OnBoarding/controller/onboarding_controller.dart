import 'dart:developer';

import 'package:dropchats/constant/app_assets.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/utils/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/shared_prefs.dart';

class OnBoardingController extends GetxController {
  PageController pageController = PageController();
  int selected = 0;
  List<String> onBoardingImage = [
    AppAssets.onBoarding1,
    AppAssets.onBoarding2,
    AppAssets.onBoarding3,
  ];

  List<Map<String, dynamic>> onBoardingText = [
    {"onBored": AppString.onBoard1, "onBoredDes": AppString.onBoardDes1},
    {"onBored": AppString.onBoard2, "onBoredDes": AppString.onBoardDes2},
    {"onBored": AppString.onBoard3, "onBoredDes": AppString.onBoardDes3},
  ];

  void onPageViewChange(value) {
    selected = value;
    update();
  }

  _onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        bool isLogin =
            preferences.getBoolValue(SharedPreference.isLogin) ?? false;
        if (isLogin) {
          Get.offAllNamed(Routes.homeScreen);
        } else {
          Get.offAllNamed(Routes.onBoarding);
        }
      } catch (e) {
        log('VIDEO EXCEPTION================$e');
      }
    });
  }

  @override
  void onInit() {
    // _onInit();
    super.onInit();
  }
}
