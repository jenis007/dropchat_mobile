import 'package:dropchats/HomeScreen/View/home_screen.dart';
import 'package:dropchats/screen/chat/chat_screen.dart';
import 'package:dropchats/screen/community/Community_screen.dart';
import 'package:dropchats/screen/profile/profile_screen.dart';
import 'package:dropchats/widgets/common_button.dart';
import 'package:dropchats/constant/app_assets.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/screen/bottomScreen/bottombar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonBottomBar extends GetView<BottomBarController> {
  final List<Widget> screens = [
    const HomeScreen(),
    const CommunityScreen(),
    const PrivateChatScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.selectedIndex.value == 0) {
          SystemNavigator.pop();
          return false;
        } else {
          controller.onItemTapped(0);
          return false; // Prevent default back button behavior
        }
      },
      child: Stack(
        children: [
          Scaffold(
            body: Stack(
              children: [
                // This shows the screens based on selected index
                Obx(() => screens[controller.selectedIndex.value]),

                // Overlay that should not cover the bottom bar
                Obx(() {
                  return Visibility(
                    visible: controller.isOverlayVisibleBottomBar.value,
                    child: GestureDetector(
                      onTap: controller
                          .toggleOverlayBottomBar, // Close overlay when tapping anywhere outside
                      child: Container(
                        color: Colors.black.withOpacity(0.8),
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: 20.h,
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      AppAssets.bottomSpain,
                                      height: 70.h,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      AppString.spain,
                                      style: TextStyle(
                                          color: AppColor.whiteColor,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      AppAssets.bottomDropchat,
                                      height: 70.h,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      AppString.dropchatsBottom,
                                      style: TextStyle(
                                          color: AppColor.whiteColor,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      AppAssets.bottomHowtodropchat,
                                      height: 70.h,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      AppString.howToDropchats,
                                      style: TextStyle(
                                          color: AppColor.whiteColor,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
            bottomNavigationBar: SizedBox(
              height: 80.h,
              child: Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _buildBottomNavigationItem(
                        index: 0, icon: AppAssets.home, label: AppString.home),
                    _buildBottomNavigationItem(
                        index: 1,
                        icon: AppAssets.community,
                        label: AppString.community),
                    GestureDetector(
                      onTap: controller.toggleOverlayBottomBar,
                      child: Obx(
                        () => Image.asset(
                          controller.isOverlayVisibleBottomBar.value
                              ? AppAssets.bottomCross
                              : AppAssets.addIcon,
                          height: 40.h,
                        ),
                      ),
                    ),
                    _buildBottomNavigationItem(
                        index: 2,
                        icon: AppAssets.message,
                        label: AppString.message),
                    _buildBottomNavigationItem(
                        index: 3,
                        icon: AppAssets.profile,
                        label: AppString.profile),
                  ],
                ),
              ),
            ),
          ),
          // Overlay for finishing screen (separate from the bottom bar)
          Obx(() {
            if (controller.isOverlayVisibleFinishHome.value) {
              return Visibility(
                visible: controller.isOverlayVisibleFinishHome.value,
                child: Container(
                  color: Colors.black.withOpacity(0.6),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            AppString.welcomeDropChat,
                            style: TextStyle(
                                color: AppColor.whiteColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            AppString.sub,
                            style: TextStyle(
                                color: AppColor.whiteColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 104.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: CommonButton(
                              buttonColor: AppColor.appPrimaryColor,
                              textColor: AppColor.whiteColor,
                              title: AppString.joinNow,
                              onTap: () {
                                controller.hideOverlay();
                                // Get.back();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          }),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationItem({
    required int index,
    required String icon,
    required String label,
  }) {
    return Obx(
      () => Column(
        children: [
          GestureDetector(
            onTap: () => controller.onItemTapped(index),
            child: Container(
              width: 65.w,
              height: 35.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: controller.selectedIndex.value == index
                    ? Colors.grey.withOpacity(0.2)
                    : Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Image.asset(
                  icon,
                  height: 15.h,
                ),
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            label,
            style: TextStyleHelper.black12,
          ),
        ],
      ),
    );
  }
}
