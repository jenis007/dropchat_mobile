import 'package:dropchats/constant/app_assets.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/screen/AuthScreen/controller/register_controller.dart';
import 'package:dropchats/utils/app_extention.dart';
import 'package:dropchats/utils/app_routes.dart';
import 'package:dropchats/widgets/common_button.dart';
import 'package:dropchats/widgets/common_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Step1Screen extends StatefulWidget {
  const Step1Screen({super.key});

  @override
  State<Step1Screen> createState() => _Step1ScreenState();
}

class _Step1ScreenState extends State<Step1Screen> {
  RegisterController registerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<RegisterController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppString.searchCollege,
                    style: TextStyleHelper.blackColor24),
                Padding(
                  padding: EdgeInsets.only(right: 2.w),
                  child: Text(AppString.step1Desc,
                      style: TextStyleHelper.greyColor15),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: AppTextField(
                    hintText: AppString.searchCollege,
                    controller: controller.searchController,
                    prefixSvg: SizedBox(
                        width: 14.w,
                        height: 14.h,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: svgAssetImage(
                              fit: BoxFit.cover,
                              AppAssets.searchIcon,
                            ),
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 53.h),
                  child: Column(
                    children: List.generate(
                      4,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            registerController.currentIndexSelectedJoinCampus
                                .value = index; // Update selected index
                          },
                          child: Obx(
                            () {
                              return Container(
                                margin: EdgeInsets.only(bottom: 15.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.h, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(
                                    color: registerController
                                                .currentIndexSelectedJoinCampus
                                                .value ==
                                            index
                                        ? AppColor
                                            .appPrimaryColor // Selected border color
                                        : AppColor
                                            .lightGreyColor, // Default border color
                                    width: 1.w,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Center(
                                        child: assetImage(AppAssets.userImage,
                                            fit: BoxFit.fill,
                                            height: 53.h,
                                            width: 53.w)),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Text(
                                        controller.cityText[index],
                                        style: TextStyleHelper.blackColor15,
                                      ),
                                    ),
                                    const Spacer(),
                                    Center(
                                        child: svgAssetImage(
                                            AppAssets.trophyIcon,
                                            fit: BoxFit.fill,
                                            height: 16.h,
                                            width: 16.w)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '12.3K',
                                        style: TextStyleHelper.blackColor15
                                            .copyWith(
                                                fontSize: AppFontSize.font12),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // (100.h).addHSpace(),
                // Padding(
                //   padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 33.h),
                //   child: CommonButton(
                //     onTap: () {
                //       Get.toNamed(Routes.step2Screen);
                //     },
                //     title: AppString.next,
                //     buttonColor: AppColor.appPrimaryColor,
                //     textColor: AppColor.primaryLightColor,
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
