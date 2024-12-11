import 'package:dropchats/constant/app_assets.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/screen/AuthScreen/View/RegisterSteps/steo_2_screen.dart';
import 'package:dropchats/screen/AuthScreen/View/RegisterSteps/step_1_screen.dart';
import 'package:dropchats/screen/AuthScreen/View/RegisterSteps/step_3_screen.dart';
import 'package:dropchats/screen/AuthScreen/View/RegisterSteps/verify_otp_screen.dart';
import 'package:dropchats/screen/AuthScreen/controller/auth_controller.dart';
import 'package:dropchats/screen/AuthScreen/controller/register_controller.dart';
import 'package:dropchats/utils/app_extention.dart';
import 'package:dropchats/utils/app_routes.dart';
import 'package:dropchats/utils/app_snackbar.dart';
import 'package:dropchats/widgets/app_lodingButton.dart';
import 'package:dropchats/widgets/common_button.dart';
import 'package:dropchats/widgets/rounded_loading_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_btn/loading_btn.dart';

class RegisterStepsScreen extends StatefulWidget {
  const RegisterStepsScreen({super.key});

  @override
  State<RegisterStepsScreen> createState() => _RegisterStepsScreenState();
}

class _RegisterStepsScreenState extends State<RegisterStepsScreen> {
  List pages = [
    const Step1Screen(),
    const Step3Screen(),
    const VerifyOtpScreen(),
    const Step2Screen(),
  ];
  AuthController authController = Get.find();
  RegisterController registerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (controller) {
          return SafeArea(
            child: Column(
              children: [
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (controller.currentPage > 0) {
                            controller.pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
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
                      SizedBox(
                        width: 196.w,
                        child: LinearProgressIndicator(
                          value: (controller.currentPage + 1) /
                              controller.totalPages,
                          backgroundColor: AppColor.greyLightColor,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColor.appPrimaryColor),
                          minHeight: 12.h,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      Text(
                        "${controller.currentPage + 1}/${controller.totalPages}",
                        style: TextStyleHelper.blackColor20,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (int page) {
                      controller.updateCurrentPage(page);
                    },
                    itemCount: controller.totalPages,
                    itemBuilder: (context, index) {
                      return pages[index];
                    },
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 24.w,
                        left: 14.w,
                      ),
                      child: (controller.currentPage == 0)
                          ? CommonButton(
                              onTap: () {
                                if (registerController
                                    .univerCityId.isNotEmpty) {
                                  controller.pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                  registerController.passData.addAll({
                                    'univerCiti_id': registerController
                                            .univerCityId
                                            .toString() ??
                                        ''
                                  });
                                  print(
                                      'registerController.passData${registerController.passData}');
                                } else {
                                  showErrorSnackBar('please Select university');
                                }
                              },
                              title: AppString.next,
                              buttonColor: AppColor.appPrimaryColor,
                              textColor: AppColor.primaryLightColor,
                            )
                          : controller.currentPage == 1
                              ? RoundedLoadingButton(
                                  elevation: 0,
                                  shadowsColor: Colors.transparent,
                                  width: MediaQuery.of(context).size.width,
                                  height: 48.h,
                                  borderRadius: 8.r,
                                  color: AppColor.appPrimaryColor,
                                  controller: registerController.btnController,
                                  onPressed: () async {
                                    // if (registerController
                                    //     .formKeyStep3.currentState!
                                    //     .validate()) {
                                    //   if (registerController
                                    //       .selectedGender.value.isEmpty) {
                                    //     showErrorSnackBar(
                                    //         'please select your gender');
                                    //     registerController.btnErrorPhone();
                                    //   } else if (registerController
                                    //       .dateController.text.isEmpty) {
                                    //     showErrorSnackBar(
                                    //         'please select your BirthDate');
                                    //     registerController.btnErrorPhone();
                                    //   } else {
                                    //     if (registerController
                                    //                 .matchUserName.value ==
                                    //             false &&
                                    //         (registerController
                                    //                     .matchUserEmail.value ==
                                    //                 false ||
                                    //             registerController
                                    //                     .matchUserPhone.value ==
                                    //                 false)) {
                                    //       await registerController
                                    //           .userRegisterData(() async {
                                    //         await registerController
                                    //             .userRegister();
                                    //         controller.pageController.nextPage(
                                    //           duration: const Duration(
                                    //               milliseconds: 300),
                                    //           curve: Curves.ease,
                                    //         );
                                    //       });
                                    //     }
                                    //   }
                                    // } else {
                                    //   showErrorSnackBar(
                                    //       'please select another name ');
                                    // }
                                    // registerController.btnErrorPhone();
                                    registerController.btnErrorPhone();
                                    controller.pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease,
                                    );
                                  },
                                  child: Text(
                                    AppString.createProfile,
                                    style: TextStyleHelper.primaryLightColor16
                                        .copyWith(
                                            color: AppColor.whiteColor,
                                            decoration: TextDecoration.none),
                                  ),
                                )
                              : controller.currentPage == 2
                                  ? RoundedLoadingButton(
                                      elevation: 0,
                                      shadowsColor: Colors.transparent,
                                      width: MediaQuery.of(context).size.width,
                                      height: 48.h,
                                      borderRadius: 8.r,
                                      color: AppColor.appPrimaryColor,
                                      controller:
                                          registerController.btnControlleverir,
                                      onPressed: () async {
                                        registerController.btnControlleverir
                                            .reset();
                                        controller.pageController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );

                                        // if (registerController
                                        //     .formKeyOtp.currentState!
                                        //     .validate()) {
                                        //   registerController
                                        //       .userOtpVerification();
                                        //   // controller.pageController.nextPage(
                                        //   //   duration: const Duration(
                                        //   //       milliseconds: 300),
                                        //   //   curve: Curves.ease,
                                        //   // );
                                        // }
                                        registerController.btnControlleverir
                                            .error();
                                        registerController.btnControlleverir
                                            .reset();
                                      },
                                      child: Text(
                                        AppString.verify,
                                        style: TextStyleHelper
                                            .primaryLightColor16
                                            .copyWith(
                                                color: AppColor.whiteColor,
                                                decoration:
                                                    TextDecoration.none),
                                      ),
                                    )
                                  : CommonButton(
                                      onTap: () {
                                        if (registerController
                                                .selectedChips.length !=
                                            6) {
                                          showErrorSnackBar(AppString.stp3);
                                        } else {
                                          print('jsdnkjsdn');
                                          Get.toNamed(
                                            Routes.homeScreen,
                                          );
                                          // controller.pageController.nextPage(
                                          //   duration: const Duration(milliseconds: 300),
                                          //   curve: Curves.ease,
                                          // );
                                        }

                                        // Handle last step, final submit, etc.
                                      },
                                      title: AppString
                                          .createProfile, // Change text for last page
                                      buttonColor: AppColor.appPrimaryColor,
                                      textColor: AppColor.primaryLightColor,
                                    ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.singInScreen);
                      },
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 9.h, left: 15.w, bottom: 70.h),
                          child: RichText(
                            text: TextSpan(
                              text: AppString.alreadyHaveAccount,
                              style: TextStyleHelper.blackColor15
                                  .copyWith(fontSize: AppFontSize.font12),
                              children: <TextSpan>[
                                TextSpan(
                                    text: AppString.singIn,
                                    style: TextStyleHelper.primaryColor12),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

Future<void> _callApiAndNavigate(
    AuthController controller, BuildContext context) async {
  // Call API or perform necessary actions
  // Example:
  // var response = await ApiService().submitData(controller.data);

  // Once API call is successful, navigate to the next screen
  if (controller.currentPage < controller.totalPages - 1) {
    controller.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  } else {
    // Final submit or perform other actions
    // For example, navigate to a final confirmation screen
    // Get.to(ConfirmationScreen()); // Replace with your screen
  }
}
