import 'package:dropchats/constant/app_assets.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/screen/AuthScreen/View/RegisterSteps/steo_2_screen.dart';
import 'package:dropchats/screen/AuthScreen/View/chat/private_chat_screen.dart';
import 'package:dropchats/screen/AuthScreen/View/community/Community_screen.dart';
import 'package:dropchats/screen/AuthScreen/View/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../HomeScreen/HomeScreen/View/home_screen.dart';
import '../constant/app_textstyle.dart';

/// Flutter code sample for [NavigationBar].

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // For responsive sizing

class CommonBottomBar extends StatefulWidget {
  @override
  _CommonBottomBarState createState() => _CommonBottomBarState();
}

class _CommonBottomBarState extends State<CommonBottomBar> {
  int _selectedIndex = 0;
  bool _isOverlayVisible = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleOverlay() {
    setState(() {
      _isOverlayVisible = !_isOverlayVisible;
    });
  }

  final List<Widget> screens = [
    HomeScreen(),
    CommunityScreen(),
    PrivateChatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          screens[_selectedIndex],
          // Overlay container, only visible when _isOverlayVisible is true

          if (_isOverlayVisible)
            Positioned.fill(
              child: GestureDetector(
                onTap:
                    _toggleOverlay, // Close overlay when tapping anywhere outside
                child: Container(
                  color: Colors.black.withOpacity(0.8),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.h, top: 720.h),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
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
            ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80.h,
        decoration: const BoxDecoration(
            // color: Colors.white,
            ),
        child: Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _onItemTapped(0);
                      _isOverlayVisible = false;
                    },
                    child: Container(
                      width: 65.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _selectedIndex == 0
                              ? Colors.grey.withOpacity(0.2)
                              : Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Image.asset(
                          AppAssets.home, // Example asset
                          height: 15.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    AppString.home,
                    style: TextStyleHelper.black12,
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _onItemTapped(1);
                      _isOverlayVisible = false;
                    },
                    child: Container(
                      width: 65.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _selectedIndex == 1
                              ? Colors.grey.withOpacity(0.2)
                              : Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Image.asset(
                          AppAssets.community, // Example asset
                          height: 15.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    AppString.community,
                    style: TextStyleHelper.black12,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: GestureDetector(
                  onTap: _toggleOverlay, // Show overlay on tap
                  child: !_isOverlayVisible
                      ? Image.asset(
                          AppAssets.addIcon,
                          height: 40.h, // Example asset
                        )
                      : Image.asset(
                          AppAssets.bottomCross,
                          height: 40.h, // Example asset
                        ),
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _onItemTapped(2);
                      _isOverlayVisible = false;
                    },
                    child: Container(
                      width: 65.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _selectedIndex == 2
                              ? Colors.grey.withOpacity(0.2)
                              : Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Image.asset(
                          AppAssets.message, // Example asset
                          height: 15.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    AppString.message,
                    style: TextStyleHelper.black12,
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _onItemTapped(3);
                      _isOverlayVisible = false;
                    },
                    child: Container(
                      width: 65.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _selectedIndex == 3
                              ? Colors.grey.withOpacity(0.2)
                              : Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Image.asset(
                          AppAssets.profile, // Example asset
                          height: 15.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    AppString.profile,
                    style: TextStyleHelper.black12,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
