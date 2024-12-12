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
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

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
        resizeToAvoidBottomInset: false,
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
                              MyToasts.warningToast(
                                  toast:
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
                      Obx(
                        () {
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 6.h, bottom: 10.h),
                              child: InternationalPhoneNumberInput(
                                onInputChanged: (value) {
                                  // Update `dialCode` and `isoCode` when the country or input changes
                                  if (value.dialCode != null &&
                                      value.isoCode != null) {
                                    controller.dialCode = value.dialCode!
                                        .replaceAll("+", ""); // Remove "+"
                                    controller.isoCode.value =
                                        value.isoCode!; // Update ISO code
                                    debugPrint(
                                        "Updated Dial Code: $controller.dialCode, ISO Code: ${controller.isoCode.value}");
                                  }
                                },
                                textFieldController: controller.phoneController,
                                initialValue: PhoneNumber(
                                  dialCode: controller
                                      .dialCode, // Use the current dial code
                                  isoCode: controller
                                      .isoCode.value, // Reactive ISO code
                                ),
                                onFieldSubmitted: (inputValue) async {
                                  // if (controller
                                  //     .emailController.text.isNotEmpty) {
                                  if (Validator.isEmail(inputValue)) {
                                    await registerController.searchUserEmail();
                                    if (registerController
                                            .matchUserEmail.value ==
                                        true) {
                                      MyToasts.warningToast(
                                          toast:
                                              "Email is already registered. Please choose another one.");
                                    } else {
                                      print('Email is available');
                                    }
                                  } else {
                                    await registerController.searchUserPhone();

                                    if (registerController
                                            .matchUserPhone.value ==
                                        true) {
                                      MyToasts.warningToast(
                                          toast:
                                              "Phone is already taken. Please choose another one.");
                                    } else {
                                      // print('Username is available');
                                    }
                                  }
                                  // }
                                },

                                // autoValidateMode:
                                //     AutovalidateMode.onUserInteraction,

                                onInputValidated: (bool isValid) {
                                  // numberController.isValidPhone();
                                },
                                // initialValue: PhoneNumber(
                                //   isoCode: controller.isoCode.value,
                                // ),
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    controller.phoneValidateText?.value =
                                        'Please enter phone number.';
                                    controller.isPhoneErrorShow?.value = true;
                                    return null;
                                  } else if (value.length <= 6) {
                                    controller.phoneValidateText?.value =
                                        'Please enter valid phone number.';
                                    controller.isPhoneErrorShow?.value = true;
                                    return null;
                                  }
                                  controller.phoneValidateText?.value = "";
                                  controller.isPhoneErrorShow?.value = false;
                                },
                                // validator: Validator.emailOrPhoneValidator,

                                selectorConfig: const SelectorConfig(
                                  selectorType:
                                      PhoneInputSelectorType.BOTTOM_SHEET,
                                  trailingSpace: false,
                                  useBottomSheetSafeArea: true,
                                  setSelectorButtonAsPrefixIcon: true,
                                  leadingPadding: 15,
                                ),
                                inputDecoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                      borderSide: const BorderSide(
                                        color: AppColor.borderColor,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                      borderSide: const BorderSide(
                                          color: AppColor.borderColor),
                                    ),
                                    errorStyle:
                                        const TextStyle(color: Colors.red),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                      borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 1), // Focused error border
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                      borderSide: const BorderSide(
                                          color: Colors.red, width: 1),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                      borderSide: const BorderSide(
                                          color: AppColor.borderColor,
                                          width: 1),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0.w, vertical: 0),
                                    hintText: AppString.enterEmail,
                                    hintStyle: TextStyleHelper.lightGreyColor15
                                    // filled: true,
                                    // fillColor: grey900.withOpacity(0.7),
                                    ),

                                // cursorColor: grey300,
                              ),
                            ),
                          );
                        },
                      )
                      // Padding(
                      //   padding: EdgeInsets.only(top: 6.h, bottom: 10.h),
                      //   child: AppTextField(
                      //     suffixIcon:
                      //         registerController.isLoadingEmail.value == true
                      //             ? const CupertinoActivityIndicator()
                      //             : null,
                      //     onTapSubmited: (inputValue) async {
                      //       if (Validator.isEmail(inputValue)) {
                      //         await registerController.searchUserEmail();
                      //         if (registerController.matchUserEmail.value ==
                      //             true) {
                      //           MyToasts.warningToast(
                      //               toast:
                      //                   "Email is already registered. Please choose another one.");
                      //         } else {
                      //           print('Email is available');
                      //         }
                      //       } else {
                      //         await registerController.searchUserPhone();
                      //
                      //         if (registerController.matchUserPhone.value ==
                      //             true) {
                      //           MyToasts.warningToast(
                      //               toast:
                      //                   "Phone is already taken. Please choose another one.");
                      //         } else {
                      //           // print('Username is available');
                      //         }
                      //       }
                      //     },
                      //     autoValidate: true,
                      //     validator: Validator.emailOrPhoneValidator,
                      //     hintText: AppString.enterEmail,
                      //     controller: controller.emailController,
                      //   ),
                      // ),
                      ,
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
                              style: TextStyleHelper.lightGreyColor15,
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
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: AppColor
                                          .appPrimaryColor, // Header background color
                                      onPrimary:
                                          Colors.white, // Header text color
                                      onSurface:
                                          Colors.black, // Body text color
                                    ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        foregroundColor: AppColor
                                            .appPrimaryColor, // "OK"/"Cancel" button text color
                                      ),
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if (selectedDate != null) {
                              String formattedDate =
                                  "${selectedDate.day.toString().padLeft(2, '0')}/${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.year.toString().padLeft(2, '0')}";
                              controller.dateController.text = formattedDate;
                              controller.dateBirth =
                                  "${selectedDate.year.toString().padLeft(2, '0')}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
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
