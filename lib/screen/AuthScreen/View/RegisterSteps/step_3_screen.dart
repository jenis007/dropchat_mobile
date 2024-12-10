import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/screen/AuthScreen/controller/register_controller.dart';
import 'package:dropchats/utils/app_extention.dart';
import 'package:dropchats/utils/app_routes.dart';
import 'package:dropchats/utils/app_snackbar.dart';
import 'package:dropchats/utils/app_validation.dart';
import 'package:dropchats/widgets/common_button.dart';
import 'package:dropchats/widgets/common_textfiled.dart';
import 'package:flutter/cupertino.dart';
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
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: GetBuilder<RegisterController>(
          builder: (controller) {
            return Form(
              key: controller.formKeyStep3,
              child: Padding(
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
                          suffixIcon:
                              registerController.isLoadingUserName.value == true
                                  ? const CupertinoActivityIndicator()
                                  : null,
                          onTapSubmited: (p0) async {
                            await registerController.searchUseName();
                            if (registerController.matchUserName.value ==
                                true) {
                              showErrorSnackBar(
                                  "Username is already taken. Please choose another one.");
                            } else {
                              print('done');
                            }
                          },
                          validator: Validator.usernameValidator,
                          autoValidate: true,
                          hintText: AppString.chooseUsername,
                          controller: controller.usernameController,
                        ),
                      ),
                      AppString.emailPhone.blackPlusJakarta14W400Text(),
                      Padding(
                        padding: EdgeInsets.only(top: 6.h, bottom: 10.h),
                        child: AppTextField(
                          suffixIcon:
                              registerController.isLoadingEmail.value == true
                                  ? const CupertinoActivityIndicator()
                                  : null,
                          onTapSubmited: (inputValue) async {
                            if (Validator.isEmail(inputValue)) {
                              await registerController.searchUserEmail();
                              if (registerController.matchUserEmail.value ==
                                  true) {
                                showErrorSnackBar(
                                    "Email is already registered. Please choose another one.");
                              } else {
                                print('Email is available');
                              }
                            } else {
                              // If it's a username, call the username search API
                              await registerController.searchUserPhone();

                              // Check if the username is already taken
                              if (registerController.matchUserPhone.value ==
                                  true) {
                                showErrorSnackBar(
                                    "Phone is already taken. Please choose another one.");
                              } else {
                                print('Username is available');
                              }
                            }
                          },
                          autoValidate: true,
                          validator: Validator.emailOrPhoneValidator,
                          hintText: AppString.enterEmail,
                          controller: controller.emailController,
                        ),
                      ),
                      AppString.gender.blackPlusJakarta14W400Text(),
                      Padding(
                        padding: EdgeInsets.only(top: 6.h, bottom: 10.h),
                        child: Obx(
                          () => DropdownButtonFormField<String>(
                            value: controller.selectedGender.value.isNotEmpty
                                ? controller.selectedGender.value
                                : null,
                            hint: Text(
                              'Select Gender',
                              style: TextStyleHelper.greyColor15,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: const BorderSide(
                                    color: AppColor.borderColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: const BorderSide(
                                    color: AppColor.borderColor, width: 1),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                            ),
                            items: ['Male', 'Female'].map((String gender) {
                              return DropdownMenuItem<String>(
                                value: gender,
                                child: Text(
                                  gender,
                                  style: TextStyleHelper.greyColor15,
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                controller.setGender(
                                    newValue); // Update the selected gender
                              }
                            },
                          ),
                        ),
                      ),

                      AppString.dateBirth.blackPlusJakarta14W400Text(),
                      Padding(
                        padding: EdgeInsets.only(top: 6.h, bottom: 10.h),
                        child: AppTextField(
                          controller: controller.dateController,
                          onTap: () async {
                            DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2101),
                            );
                            if (selectedDate != null) {
                              String formattedDate =
                                  "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                              controller.dateController.text = formattedDate;
                              controller.dateBirth =
                                  "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
                              print(
                                  'controller.dateBirth${controller.dateBirth}');
                            }
                          },
                          // validator: Validator.birthDateValidator,
                          autoValidate: true,
                          hintText: "25 Oct 2010",
                          readonlyShow: true,
                        ),
                      ),
                      AppString.createPassword.blackPlusJakarta14W400Text(),
                      Padding(
                        padding: EdgeInsets.only(top: 6.h, bottom: 10.h),
                        child: AppTextField(
                          autoValidate: true,
                          validator: Validator.passwordValidator,
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
                          autoValidate: true,
                          validator: (value) =>
                              Validator.confirmPasswordValidator(
                                  value, controller.passwordController.text),
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
                      // Padding(
                      //   padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 50.h),
                      //   child: CommonButton(
                      //     onTap: () {
                      //       Get.toNamed(Routes.verifyScreen);
                      //     },
                      //     title: AppString.createProfile,
                      //     buttonColor: AppColor.appPrimaryColor,
                      //     textColor: AppColor.primaryLightColor,
                      //   ),
                      // ),
                      // GestureDetector(
                      //   onTap: () {
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
                      //               text: AppString.password,
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
