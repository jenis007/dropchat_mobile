import 'package:dropchats/HomeScreen/View/tab_1_view.dart';
import 'package:dropchats/HomeScreen/View/tab_2_view.dart';
import 'package:dropchats/HomeScreen/View/tab_3_view.dart';
import 'package:dropchats/HomeScreen/controller/home_controller.dart';
import 'package:dropchats/constant/app_assets.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/constant/app_textstyle.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  HomeController homeController = Get.find();

  @override
  void initState() {
    super.initState();
    homeController.tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    homeController.tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: 50.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: 'mapButton',
                  onPressed: () {},
                  shape: const CircleBorder(),
                  elevation: 10,
                  backgroundColor: AppColor.appPrimaryColor,
                  child: svgAssetImage(AppAssets.pinMap),
                ),
                SizedBox(height: 12.h),
                FloatingActionButton(
                  heroTag: 'scanButton',
                  onPressed: () {},
                  elevation: 10,
                  shape: const CircleBorder(),
                  backgroundColor: AppColor.whiteColor,
                  child: svgAssetImage(AppAssets.scanIcon),
                ),
              ],
            ),
          ),
          // appBar: PreferredSize(
          //   preferredSize: Size.fromHeight(80.0), // Set height as needed
          //   child: Container(
          //     color: Colors.white, // Background color for the AppBar
          //     child: Padding(
          //       padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 15.h, bottom: 10.h),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         children: [
          //           Row(
          //             children: [
          //               assetImage(
          //                 AppAssets.dropChat,
          //                 fit: BoxFit.cover,
          //                 width: 25.w,
          //                 height: 25.h,
          //               ),
          //               Padding(
          //                 padding: EdgeInsets.symmetric(horizontal: 5.w),
          //                 child: AppString.dropChatText
          //                     .blackPlusJakarta14W400Text(fontSize: AppFontSize.font12, fontWeight: FontWeight.w600),
          //               ),
          //               Container(
          //                 margin: EdgeInsets.symmetric(horizontal: 5.w),
          //                 decoration: BoxDecoration(
          //                   color: AppColor.primaryLightSecondColor,
          //                   borderRadius: BorderRadius.circular(20.r),
          //                 ),
          //                 child: Center(
          //                   child: Padding(
          //                     padding: const EdgeInsets.all(10),
          //                     child: "ULCA".blackPlusJakarta14W400Text(
          //                         fontSize: AppFontSize.font10, fontWeight: FontWeight.w600),
          //                   ),
          //                 ),
          //               ),
          //               Container(
          //                 decoration: BoxDecoration(
          //                   color: AppColor.lightPinkColor,
          //                   borderRadius: BorderRadius.circular(20.r),
          //                 ),
          //                 child: Center(
          //                   child: Padding(
          //                     padding: const EdgeInsets.all(10),
          //                     child: "Level 5".blackPlusJakarta14W400Text(
          //                         fontSize: AppFontSize.font10, fontWeight: FontWeight.w600),
          //                   ),
          //                 ),
          //               ),
          //               const Spacer(),
          //               svgAssetImageColor(
          //                 color: AppColor.greyColor,
          //                 AppAssets.searchIcon,
          //                 fit: BoxFit.cover,
          //                 width: 23.5.w,
          //                 height: 23.5.h,
          //               ),
          //               Padding(
          //                 padding: EdgeInsets.only(left: 14.w),
          //                 child: svgAssetImage(
          //                   AppAssets.share,
          //                   fit: BoxFit.cover,
          //                   width: 24.w,
          //                   height: 24.h,
          //                 ),
          //               ),
          //               Padding(
          //                 padding: EdgeInsets.only(left: 14.w),
          //                 child: svgAssetImage(
          //                   AppAssets.notificationIcon,
          //                   fit: BoxFit.cover,
          //                   width: 24.w,
          //                   height: 24.h,
          //                 ),
          //               ),
          //             ],
          //           ),
          //           const Divider(
          //             color: AppColor.lightGreyColor,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          body: GetBuilder<HomeController>(
            builder: (controller) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: 20.w, left: 20.w, top: 15.h, bottom: 10.h),
                    child: Row(
                      children: [
                        assetImage(
                          AppAssets.dropChat,
                          fit: BoxFit.cover,
                          width: 25.w,
                          height: 25.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: AppString.dropChatText
                              .blackPlusJakarta14W400Text(
                                  fontSize: AppFontSize.font12,
                                  fontWeight: FontWeight.w600),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                              color: AppColor.primaryLightSecondColor,
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: "ULCA".blackPlusJakarta14W400Text(
                                fontSize: AppFontSize.font10,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColor.lightPinkColor,
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: "Level 5".blackPlusJakarta14W400Text(
                                fontSize: AppFontSize.font10,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                        const Spacer(),
                        svgAssetImageColor(
                          color: AppColor.greyColor,
                          AppAssets.searchIcon,
                          fit: BoxFit.cover,
                          width: 23.5.w,
                          height: 23.5.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14.w),
                          child: svgAssetImage(
                            AppAssets.share,
                            fit: BoxFit.cover,
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14.w),
                          child: svgAssetImage(
                            AppAssets.notificationIcon,
                            fit: BoxFit.cover,
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: AppColor.lightGreyColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 100.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        controller: controller.tabController,
                        labelColor: Colors.orange,
                        unselectedLabelColor: Colors.black,
                        indicatorWeight: 3.0,
                        indicatorColor: AppColor.appPrimaryColor,
                        splashBorderRadius: BorderRadius.zero,
                        labelPadding: EdgeInsets.zero,
                        dividerColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                        unselectedLabelStyle: TextStyleHelper.primaryColor14
                            .copyWith(color: AppColor.lightBlackColor),
                        automaticIndicatorColorAdjustment: true,
                        indicatorPadding: EdgeInsets.zero,
                        labelStyle: TextStyleHelper.primaryColor14,
                        tabs: const [
                          Tab(text: AppString.dropLive),
                          Tab(text: AppString.event),
                          Tab(text: AppString.peopleNearby),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: controller.tabController,
                      children: [Tab1View(), Tab2View(), Tab3View()],
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}
