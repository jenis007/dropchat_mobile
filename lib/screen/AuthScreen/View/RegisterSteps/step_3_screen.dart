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

class Step3Screen extends StatefulWidget {
  const Step3Screen({super.key});

  @override
  State<Step3Screen> createState() => _Step3ScreenState();
}

class _Step3ScreenState extends State<Step3Screen> {
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
                Text(AppString.completeYourProfile,
                    style: TextStyleHelper.blackColor24),
                Padding(
                  padding: EdgeInsets.only(right: 2.w),
                  child: Text(AppString.step3Desc,
                      style: TextStyleHelper.greyColor15),
                ),
                (30.h).addHSpace(),
                AppString.username.blackPlusJakarta14W400Text(),
                Padding(
                  padding: EdgeInsets.only(top: 6.h, bottom: 10.h),
                  child: AppTextField(
                    hintText: AppString.chooseUsername,
                    controller: controller.usernameController,
                  ),
                ),
                AppString.emailPhone.blackPlusJakarta14W400Text(),
                Padding(
                  padding: EdgeInsets.only(top: 6.h, bottom: 10.h),
                  child: AppTextField(
                    hintText: AppString.enterEmail,
                    controller: controller.emailController,
                  ),
                ),
                AppString.gender.blackPlusJakarta14W400Text(),
                Padding(
                  padding: EdgeInsets.only(top: 6.h, bottom: 10.h),
                  child: AppTextField(
                    hintText: AppString.selectGender,
                    controller: controller.genderController,
                  ),
                ),
                AppString.dateBirth.blackPlusJakarta14W400Text(),
                Padding(
                  padding: EdgeInsets.only(top: 6.h, bottom: 10.h),
                  child: const AppTextField(
                    hintText: "25 Oct 2010",
                  ),
                ),
                AppString.createPassword.blackPlusJakarta14W400Text(),
                Padding(
                  padding: EdgeInsets.only(top: 6.h, bottom: 10.h),
                  child: AppTextField(
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
                AppString.confirmPass.blackPlusJakarta14W400Text(),
                Padding(
                  padding: EdgeInsets.only(top: 6.h, bottom: 10.h),
                  child: AppTextField(
                    obscure: controller.isConfirmVisible ? false : true,
                    controller: controller.confirmPassController,
                    suffixIcon: InkWell(
                      onTap: () {
                        controller.isConfirmVisibility();
                      },
                      child: Icon(
                        controller.isConfirmVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColor.greyColor.withOpacity(0.8),
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 50.h),
                  child: CommonButton(
                    onTap: () {
                      Get.toNamed(Routes.verifyScreen);
                    },
                    title: AppString.createProfile,
                    buttonColor: AppColor.appPrimaryColor,
                    textColor: AppColor.primaryLightColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 9.h, left: 10.w),
                  child: RichText(
                    text: TextSpan(
                      text: AppString.alreadyHaveAccount,
                      style: TextStyleHelper.blackColor15
                          .copyWith(fontSize: AppFontSize.font12),
                      children: <TextSpan>[
                        TextSpan(
                            text: AppString.signIn,
                            style: TextStyleHelper.primaryColor12),
                      ],
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