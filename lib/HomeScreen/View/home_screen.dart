import 'package:dropchats/HomeScreen/View/tab_1_view.dart';
import 'package:dropchats/HomeScreen/View/tab_2_view.dart';
import 'package:dropchats/HomeScreen/View/tab_3_view.dart';
import 'package:dropchats/HomeScreen/controller/home_controller.dart';
import 'package:dropchats/constant/app_assets.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/screen/bottomScreen/bottombar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../utils/shared_prefs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  HomeController homeController = Get.find();
  final bottomBarController =
      Get.put(BottomBarController()); // Initialize the controller
  final GlobalKey _tabBarShowcaseKey = GlobalKey();
  final GlobalKey second = GlobalKey();
  final GlobalKey third = GlobalKey();
  @override
  void initState() {
    super.initState();
    checkFirstTime();
    bool sss = preferences.getBool(SharedPreference.isLogin) ?? false;
    print('sssssssssssssssssssssssssssssssss${sss}');
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (_) => ShowCaseWidget.of(context)
    //       .startShowCase([_tabBarShowcaseKey, second, third]),
    // );
    homeController.tabController = TabController(length: 3, vsync: this);
  }

  bool completedSuggesions = false;
  int currentStep = 1;
  final int totalSteps = 3;
  bool isTutorialCompleted = false;

  @override
  void dispose() {
    homeController.tabController?.dispose();
    homeController.tabController = null; // Ensure no further usage
    super.dispose();
  }

  Future<void> checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenShowcase = prefs.getBool('hasSeenShowcase') ?? false;
    if (!hasSeenShowcase) {
      await prefs.setBool('hasSeenShowcase', true);
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => ShowCaseWidget.of(context)
            .startShowCase([_tabBarShowcaseKey, second, third]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            floatingActionButton: Padding(
              padding: EdgeInsets.only(bottom: 50.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomShowcaseWidget(
                    onFinish: () {},
                    currentStep: 2,
                    totalSteps: 3,
                    description: AppString.secondTip,
                    globalKey: second,
                    height1: 115.h,
                    width1: 210.w,
                    height: 0.h,
                    width: 250.w,
                    onNext: () {
                      setState(() {});
                      ShowCaseWidget.of(context).startShowCase([third]);
                    },
                    isTutorialCompleted: false,
                    child: GestureDetector(
                      onTap: () => debugPrint('Floating button clicked'),
                      child: FloatingActionButton(
                        heroTag: 'mapButton',
                        onPressed: () {},
                        shape: const CircleBorder(),
                        elevation: 10,
                        backgroundColor: AppColor.appPrimaryColor,
                        child: svgAssetImage(AppAssets.pinMap),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  CustomShowcaseWidget(
                    // height1: 82.h,
                    // width1: 190.w,
                    // height: 80.h,
                    // width: 265.w,
                    height1: 115.h,
                    width1: 210.w,
                    height: 0.h,
                    width: 250.w,
                    onFinish: () {
                      setState(() {
                        ShowCaseWidget.of(context).dismiss();
                        bottomBarController.changeBottomBarShowOverlay(
                            true); // New color (red in this case)
                        isTutorialCompleted =
                            true; // Mark tutorial as completed
                      });
                    },
                    currentStep: 3,
                    totalSteps: 3,
                    description: AppString.thirdTip,
                    globalKey: third,
                    onNext: () {},
                    isTutorialCompleted: true,
                    child: GestureDetector(
                      onTap: () => debugPrint('Scan button clicked'),
                      child: FloatingActionButton(
                        heroTag: 'scanButton',
                        onPressed: () {},
                        elevation: 10,
                        shape: const CircleBorder(),
                        backgroundColor: AppColor.whiteColor,
                        child: svgAssetImage(AppAssets.scanIcon),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
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
                          tabs: [
                            Tab(text: AppString.dropLive),
                            CustomShowcaseWidgetTab(
                              height1: 120.h,
                              width1: 180.w,
                              height: 90.h,
                              width: 160.w,
                              onFinish: () {},
                              currentStep: 1,
                              globalKey: _tabBarShowcaseKey,
                              totalSteps: 3,
                              description: AppString.firstTip,
                              onNext: () {
                                setState(() {});
                                ShowCaseWidget.of(context)
                                    .startShowCase([second]);
                              },
                              child: Tab(text: AppString.event),
                            ),
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
            ),
          ),
        ],
      ),
    );
  }
}

class CustomShowcaseWidget extends StatefulWidget {
  final Widget child;
  final String description;
  final GlobalKey globalKey;
  final int currentStep;
  final int totalSteps;
  final VoidCallback onFinish;
  final VoidCallback onNext;
  final double height;
  final double width;
  final double height1;
  final double width1;
  final bool isTutorialCompleted;

  const CustomShowcaseWidget({
    required this.description, // Description passed as string
    required this.child,
    required this.globalKey,
    required this.currentStep,
    required this.totalSteps,
    required this.onFinish,
    Key? key,
    required this.height,
    required this.width,
    required this.height1,
    required this.width1,
    required this.onNext,
    required this.isTutorialCompleted,
  }) : super(key: key);

  @override
  State<CustomShowcaseWidget> createState() => _CustomShowcaseWidgetState();
}

class _CustomShowcaseWidgetState extends State<CustomShowcaseWidget> {
  @override
  Widget build(BuildContext context) {
    return Showcase.withWidget(
      key: widget.globalKey,
      height: widget.height,
      width: widget.width,
      tooltipPosition: TooltipPosition.bottom,
      container: Container(
        width: widget.width1,
        height: widget.height1,
        decoration: BoxDecoration(
            // color: AppColor.appPrimaryColor,
            image: DecorationImage(image: AssetImage(AppAssets.note2)),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, right: 20.w, left: 15.w),
          child: Column(
            children: [
              Text(
                widget.description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyleHelper.whiteColor16.copyWith(fontSize: 10.sp),
              ),
              SizedBox(
                height: 6.h,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (widget.currentStep < widget.totalSteps) {
                        widget.onNext();
                      } else {
                        setState(() {
                          widget.onFinish();
                          ShowCaseWidget.of(context)
                              .dismiss(); // Close the showcase
                        });
                      }
                    },
                    child: Container(
                      height: 30.h,
                      width: 55.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.whiteColor),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text(
                              style: TextStyleHelper.whiteColor16
                                  .copyWith(fontSize: 10.sp),
                              widget.currentStep < widget.totalSteps
                                  ? 'Next'
                                  : 'Finish')),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${widget.currentStep}/${widget.totalSteps}',
                    style:
                        TextStyleHelper.whiteColor16.copyWith(fontSize: 10.sp),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      child: widget.child,
    );
  }
}

///using show on tap showcase because image arrow show up
class CustomShowcaseWidgetTab extends StatefulWidget {
  final Widget child;
  final String description; // Pass description as a string
  final GlobalKey globalKey;
  final int currentStep;
  final int totalSteps;
  final VoidCallback onFinish;
  final double height;
  final double width;
  final double height1;
  final double width1;
  final VoidCallback onNext;

  const CustomShowcaseWidgetTab({
    required this.description, // Description passed as string
    required this.child,
    required this.globalKey,
    required this.currentStep,
    required this.totalSteps,
    required this.onFinish,
    Key? key,
    required this.height,
    required this.width,
    required this.height1,
    required this.width1,
    required this.onNext,
  }) : super(key: key);

  @override
  State<CustomShowcaseWidgetTab> createState() =>
      _CustomShowcaseWidgetTabState();
}

class _CustomShowcaseWidgetTabState extends State<CustomShowcaseWidgetTab> {
  @override
  Widget build(BuildContext context) {
    return Showcase.withWidget(
      toolTipSlideEndDistance: 5,
      key: widget.globalKey,
      height: widget.height,
      width: widget.width,
      tooltipPosition: TooltipPosition.bottom,
      container: Padding(
        padding: const EdgeInsets.only(
          right: 20,
        ),
        child: Container(
          width: widget.width1,
          height: widget.height1,
          decoration: BoxDecoration(
              // color: AppColor.appPrimaryColor,
              image: DecorationImage(image: AssetImage(AppAssets.note1)),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.only(top: 15.h, right: 10.w, left: 10.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    widget.description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyleHelper.whiteColor16.copyWith(fontSize: 10.sp),
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (widget.currentStep < widget.totalSteps) {
                          setState(() {
                            widget.onNext();
                          });
                        } else {
                          widget.onFinish();
                        }
                      },
                      child: Container(
                        height: 30.h,
                        width: 55.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.whiteColor),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(
                                style: TextStyleHelper.whiteColor16
                                    .copyWith(fontSize: 10.sp),
                                widget.currentStep < widget.totalSteps
                                    ? 'Next'
                                    : 'Finish')),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${widget.currentStep}/${widget.totalSteps}',
                      style: TextStyleHelper.whiteColor16
                          .copyWith(fontSize: 10.sp),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      child: widget.child,
    );
  }
}
