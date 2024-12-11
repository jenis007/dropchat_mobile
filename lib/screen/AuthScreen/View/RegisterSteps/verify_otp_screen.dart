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

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  RegisterController registerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<RegisterController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: SingleChildScrollView(
            child: Form(
              key: registerController.formKeyOtp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppString.otpTitle, style: TextStyleHelper.blackColor24),
                  Padding(
                    padding: EdgeInsets.only(right: 2.w),
                    child: Text(AppString.otpTitle2,
                        style: TextStyleHelper.greyColor15),
                  ),
                  (40.h).addHSpace(),
                  AppString.confirmationCode.blackPlusJakarta14W400Text(),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                    child: AppTextField(
                      hintText: AppString.enterCode,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter otp";
                        }
                        return null;
                      },
                      controller: controller.confirmationCode,
                    ),
                  ),
                  // (28.h).addHSpace(),
                  // CommonButton(
                  //   onTap: () {
                  //     Get.toNamed(Routes.homeScreen);
                  //   },
                  //   title: AppString.verify,
                  //   buttonColor: AppColor.appPrimaryColor,
                  //   textColor: AppColor.primaryLightColor,
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     controller.onVerifyOnSinInTap(true);
                  //     Get.toNamed(Routes.singInScreen);
                  //   },
                  //   child: Padding(
                  //     padding: EdgeInsets.only(top: 9.h, left: 10.w),
                  //     child: RichText(
                  //       text: TextSpan(
                  //         text: AppString.alreadyHaveAccount,
                  //         style: TextStyleHelper.blackColor15
                  //             .copyWith(fontSize: AppFontSize.font12),
                  //         children: <TextSpan>[
                  //           TextSpan(
                  //               text: AppString.singIn,
                  //               style: TextStyleHelper.primaryColor12),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
