import 'package:dropchats/constant/app_assets.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/screen/community/controller/communtity_controller.dart';
import 'package:dropchats/utils/app_extention.dart';
import 'package:dropchats/widgets/common_button.dart';
import 'package:dropchats/widgets/common_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  CommunityController communityController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<CommunityController>(
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              forceMaterialTransparency: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1.0),
                child: Divider(
                  color: AppColor.greyColor.withOpacity(0.3), // Divider color
                  height: 1,
                ),
              ),
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  AppString.communities,
                  style: TextStyleHelper.black12.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                // Search Field
                AppTextField(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  hintText: AppString.searchChats,
                  controller: controller.communityController,
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
                    ),
                  ),
                ),
                // Scrollable List
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          // Welcome Card
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18.w, vertical: 20.h),
                              decoration: BoxDecoration(
                                color: AppColor.primaryLightSecondColor,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '🔥Trending now',
                                        style: TextStyleHelper.black12.copyWith(
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '15m left',
                                        style: TextStyleHelper.black12.copyWith(
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  AppString.communityDropChat
                                      .blackPlusJakarta14W400Text(
                                          fontSize: AppFontSize.font20,
                                          fontWeight: FontWeight.w600),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 7.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 9.h,
                                          width: 9.w,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColor.greenColor),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 3.w),
                                          child: "23 Online"
                                              .blackPlusJakarta14W400Text(
                                                  fontSize: AppFontSize.font8,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 7.w),
                                          child: Container(
                                            height: 9.h,
                                            width: 9.w,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColor.borderColor),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 3.w),
                                          child: "233 Members"
                                              .blackPlusJakarta14W400Text(
                                                  fontSize: AppFontSize.font8,
                                                  fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 270.w,
                                    child: CommonButton(
                                      buttonHeight: 40.h,
                                      buttonColor: AppColor.appPrimaryColor,
                                      buttonTextStyle: TextStyleHelper
                                          .primaryLightColor16
                                          .copyWith(
                                              fontSize: AppFontSize.font16,
                                              fontWeight: FontWeight.w500),
                                      title: AppString.joinNow,
                                      onTap: () {},
                                      textColor: AppColor.whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // List of Communities
                          ListView.builder(
                            itemCount: 8,
                            shrinkWrap: true,
                            physics:
                                NeverScrollableScrollPhysics(), // Prevent nested scrolling
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 5.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                  color: AppColor.cardColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        "This dropchat is hosted by @dropchatofficial  | yesterday @2:13am"
                                            .greyPlusJakarta8W500Text(),
                                        "+50pts".greyPlusJakarta8W500Text(
                                            fontColor:
                                                AppColor.appPrimaryColor),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.h),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(6),
                                            height: 47.h,
                                            width: 47.w,
                                            decoration: BoxDecoration(
                                                color: AppColor.yellowColor,
                                                borderRadius:
                                                    BorderRadius.circular(8.r)),
                                            child: svgAssetImage(
                                                AppAssets.congrats,
                                                fit: BoxFit.cover),
                                          ),
                                          (7.w).addWSpace(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              "The Binge Brigade🚃🚃"
                                                  .blackPlusJakarta14W400Text(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize:
                                                          AppFontSize.font16),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 7.h),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 9.h,
                                                      width: 9.w,
                                                      decoration:
                                                          const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: AppColor
                                                                  .greenColor),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 3.w),
                                                      child: "23 Online"
                                                          .blackPlusJakarta14W400Text(
                                                              fontSize:
                                                                  AppFontSize
                                                                      .font8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 7.w),
                                                      child: Container(
                                                        height: 9.h,
                                                        width: 9.w,
                                                        decoration:
                                                            const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: AppColor
                                                                    .borderColor),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 3.w),
                                                      child: "233 Members"
                                                          .blackPlusJakarta14W400Text(
                                                              fontSize:
                                                                  AppFontSize
                                                                      .font8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    CommonButton(
                                      buttonHeight: 35.h,
                                      buttonColor: AppColor.appPrimaryColor,
                                      textColor: AppColor.whiteColor,
                                      buttonTextStyle: TextStyleHelper
                                          .primaryLightColor16
                                          .copyWith(
                                              fontSize: AppFontSize.font10,
                                              fontWeight: FontWeight.w500),
                                      title: AppString.joinNow,
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
