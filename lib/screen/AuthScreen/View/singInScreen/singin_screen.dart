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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  RegisterController registerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: GestureDetector(
              onTap: () {
                if (registerController.verifyOnSinInTap.value == true) {
                  Get.offAllNamed(Routes.onBoarding);
                } else {
                  Get.back();
                }
              },
              child: SvgPicture.asset(
                AppAssets.backArrow,
                height: 28.h,
                width: 28.h,
              ),
            ),
          ),
          // toolbarHeight: 35.h,
          forceMaterialTransparency: true,
          automaticallyImplyLeading: true,
        ),
        body: GetBuilder<RegisterController>(
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 75.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        AppAssets.isolationMode,
                        height: 100.h,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(AppString.singInTitle,
                        textAlign: TextAlign.center,
                        style: TextStyleHelper.blackColor24.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(AppString.singInTitle2,
                        style: TextStyleHelper.blackColor24.copyWith(
                            fontSize: 19.sp, fontWeight: FontWeight.w600)),
                    (30.h).addHSpace(),
                    AppString.username.blackPlusJakarta14W400Text(),
                    Padding(
                      padding: EdgeInsets.only(top: 6.h, bottom: 10.h),
                      child: AppTextField(
                        hintText: AppString.chooseUsername,
                        controller: controller.usernameController,
                      ),
                    ),
                    AppString.password.blackPlusJakarta14W400Text(),
                    Padding(
                      padding: EdgeInsets.only(top: 6.h, bottom: 10.h),
                      child: AppTextField(
                        hintText: AppString.password,
                        obscure: controller.isVisible ? false : true,
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.isVisibility();
                          },
                          child: Icon(
                            controller.isVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColor.greyColor.withOpacity(0.8),
                            size: 20.sp,
                          ),
                        ),
                        controller: controller.passwordController,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        AppString.forgotPassword,
                        style: TextStyleHelper.black12
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(right: 5.w, left: 5.w, top: 50.h),
                      child: CommonButton(
                        onTap: () {
                          Get.toNamed(Routes.verifyScreen);
                        },
                        title: AppString.singIn,
                        buttonColor: AppColor.appPrimaryColor,
                        textColor: AppColor.primaryLightColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.registerStepsScreen);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.h, left: 10.w),
                        child: RichText(
                          text: TextSpan(
                            text: AppString.alreadyHaveAccount,
                            style: TextStyleHelper.blackColor15
                                .copyWith(fontSize: AppFontSize.font12),
                            children: <TextSpan>[
                              TextSpan(
                                  text: AppString.signUp,
                                  style: TextStyleHelper.primaryColor12),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
