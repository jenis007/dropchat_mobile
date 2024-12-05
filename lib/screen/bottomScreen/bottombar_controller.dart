import 'dart:ui';

import 'package:dropchats/constant/app_color.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class BottomBarController extends GetxController {
  // Variable to hold the bottom bar color
  var bottomBarColor = AppColor.primaryLightColor.obs; // Default color is blue
  RxBool finishTap = false.obs;
  RxBool isOverlayVisibleFinishHome = false.obs;
  RxBool isOverlayVisibleBottomBar = false.obs;
  RxInt selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  void toggleOverlayBottomBar() {
    isOverlayVisibleBottomBar.value = !isOverlayVisibleBottomBar.value;
  }

  void toggleOverlayBottomBarHome() {
    isOverlayVisibleFinishHome.value = !isOverlayVisibleFinishHome.value;
  }

  void changeBottomBarShowOverlay(bool newStatuse) {
    finishTap.value = newStatuse;
    isOverlayVisibleFinishHome.value = true;
  }

  void hideOverlay() {
    isOverlayVisibleFinishHome.value = !isOverlayVisibleFinishHome.value;
  }
}
