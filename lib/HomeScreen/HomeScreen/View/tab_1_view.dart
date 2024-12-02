import 'package:dropchats/constant/app_assets.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/utils/app_extention.dart';
import 'package:dropchats/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tab1View extends StatefulWidget {
  const Tab1View({super.key});

  @override
  State<Tab1View> createState() => _Tab1ViewState();
}

class _Tab1ViewState extends State<Tab1View> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 15.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColor.blueColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "This dropchat is hosted by @dropchatofficial  | yesterday @2:13am".greyPlusJakarta8W500Text(),
                      "+50pts".greyPlusJakarta8W500Text(fontColor: AppColor.appPrimaryColor),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          height: 47.h,
                          width: 47.w,
                          decoration:
                              BoxDecoration(color: AppColor.yellowColor, borderRadius: BorderRadius.circular(8.r)),
                          child: svgAssetImage(AppAssets.congrats, fit: BoxFit.cover),
                        ),
                        (7.w).addWSpace(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "UCLA - CLASS of 2028"
                                .blackPlusJakarta14W400Text(fontWeight: FontWeight.w500, fontSize: AppFontSize.font16),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 7.h),
                              child: Row(
                                children: [
                                  Container(
                                    height: 9.h,
                                    width: 9.w,
                                    decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColor.greenColor),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 3.w),
                                    child: "23 Online".blackPlusJakarta14W400Text(
                                        fontSize: AppFontSize.font8, fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 7.w),
                                    child: Container(
                                      height: 9.h,
                                      width: 9.w,
                                      decoration:
                                          const BoxDecoration(shape: BoxShape.circle, color: AppColor.borderColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 3.w),
                                    child: "233 Members".blackPlusJakarta14W400Text(
                                        fontSize: AppFontSize.font8, fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  CommonButton(
                    buttonHeight: 35.h,
                    buttonColor: AppColor.appPrimaryColor,
                    textColor: AppColor.whiteColor,
                    buttonTextStyle: TextStyleHelper.primaryLightColor16
                        .copyWith(fontSize: AppFontSize.font10, fontWeight: FontWeight.w500),
                    title: AppString.joinNow,
                    onTap: () {},
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
                decoration: BoxDecoration(
                  color: AppColor.primaryLightSecondColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppString.welcomeDropChat
                        .blackPlusJakarta14W400Text(fontSize: AppFontSize.font20, fontWeight: FontWeight.w600),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      child: AppString.yourFirstCircleStart.blackPlusJakarta14W400Text(),
                    ),
                    CommonButton(
                      buttonHeight: 40.h,
                      buttonColor: AppColor.appPrimaryColor,
                      buttonTextStyle: TextStyleHelper.primaryLightColor16
                          .copyWith(fontSize: AppFontSize.font16, fontWeight: FontWeight.w500),
                      title: AppString.joinNow,
                      onTap: () {},
                      textColor: AppColor.whiteColor,
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: List.generate(
                5,
                (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: AppColor.cardColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "This dropchat is hosted by @dropchatofficial  | yesterday @2:13am"
                                .greyPlusJakarta8W500Text(),
                            "+50pts".greyPlusJakarta8W500Text(fontColor: AppColor.appPrimaryColor),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                height: 47.h,
                                width: 47.w,
                                decoration: BoxDecoration(
                                    color: AppColor.yellowColor, borderRadius: BorderRadius.circular(8.r)),
                                child: svgAssetImage(AppAssets.congrats, fit: BoxFit.cover),
                              ),
                              (7.w).addWSpace(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "The Binge Brigade🚃🚃".blackPlusJakarta14W400Text(
                                      fontWeight: FontWeight.w500, fontSize: AppFontSize.font16),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 7.h),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 9.h,
                                          width: 9.w,
                                          decoration:
                                              const BoxDecoration(shape: BoxShape.circle, color: AppColor.greenColor),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 3.w),
                                          child: "23 Online".blackPlusJakarta14W400Text(
                                              fontSize: AppFontSize.font8, fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 7.w),
                                          child: Container(
                                            height: 9.h,
                                            width: 9.w,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle, color: AppColor.borderColor),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 3.w),
                                          child: "233 Members".blackPlusJakarta14W400Text(
                                              fontSize: AppFontSize.font8, fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        CommonButton(
                          buttonHeight: 35.h,
                          buttonColor: AppColor.appPrimaryColor,
                          textColor: AppColor.whiteColor,
                          buttonTextStyle: TextStyleHelper.primaryLightColor16
                              .copyWith(fontSize: AppFontSize.font10, fontWeight: FontWeight.w500),
                          title: AppString.joinNow,
                          onTap: () {},
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
