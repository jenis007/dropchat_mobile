import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/screen/AuthScreen/controller/auth_controller.dart';
import 'package:dropchats/screen/OnBoarding/controller/onboarding_controller.dart';
import 'package:dropchats/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constant/app_assets.dart';
import '../../widgets/common_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  OnBoardingController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(body: GetBuilder<OnBoardingController>(
      builder: (controller) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 671.h,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        height: controller.selected == 0 ? 386.h : 472.h,
                        child: PageView.builder(
                          controller: controller.pageController,
                          itemCount: controller.onBoardingImage.length,
                          onPageChanged: (value) {
                            controller.onPageViewChange(value);
                          },
                          itemBuilder: (context, index) {
                            return assetImage(
                              controller.onBoardingImage[index],
                              height: index == 0 ? 386.h : 472.h,
                              width: width,
                            );
                          },
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => Container(
                            height: controller.selected == index ? 5.h : 8.h,
                            width: controller.selected == index ? 14.w : 8.w,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.r),
                                color: controller.selected == index
                                    ? AppColor.appPrimaryColor
                                    : AppColor.lightGreyColor),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: controller.selected == 0
                            ? RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: AppString.onBoard1,
                                  style: TextStyleHelper.blackColor36,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: AppString.dropChats,
                                        style: TextStyleHelper.primaryColor36),
                                  ],
                                ),
                                maxLines: 2,
                              )
                            : controller.selected == 1
                                ? RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: AppString.onBoard2,
                                      style: TextStyleHelper.blackColor36,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: AppString.circle,
                                            style:
                                                TextStyleHelper.primaryColor36),
                                      ],
                                    ),
                                    maxLines: 2,
                                  )
                                : RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: AppString.onBoard3,
                                      style: TextStyleHelper.blackColor36,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: AppString.leaderboard,
                                            style:
                                                TextStyleHelper.primaryColor36),
                                      ],
                                    ),
                                    maxLines: 2,
                                  ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            textAlign: TextAlign.center,
                            controller.selected == 0
                                ? AppString.onBoardDes1
                                : controller.selected == 1
                                    ? AppString.onBoardDes2
                                    : AppString.onBoardDes3,
                            style: TextStyleHelper.greyColor15,
                          )),
                      controller.selected == 1
                          ? assetImage(AppAssets.avtarGroup,
                              height: 17.h, width: 64.w)
                          : controller.selected == 0
                              ? SizedBox(
                                  height: 17.h,
                                )
                              : SizedBox()
                    ]),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: CommonButton(
                  onTap: () {
                    Get.toNamed(Routes.registerStepsScreen);
                  },
                  title: "Get Started",
                  buttonColor: AppColor.appPrimaryColor,
                  textColor: AppColor.primaryLightColor,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: CommonButton(
                  onTap: () {
                    Get.toNamed(Routes.singInScreen);
                  },
                  title: "I already have an account",
                  buttonColor: AppColor.primaryLightSecondColor,
                  textColor: AppColor.appPrimaryColor,
                ),
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        );
      },
    ));
  }
}
