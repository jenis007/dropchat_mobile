import 'dart:ui';
import 'package:dropchats/constant/app_assets.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/screen/AuthScreen/controller/register_controller.dart';
import 'package:dropchats/utils/app_extention.dart';
import 'package:dropchats/utils/app_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Step2Screen extends StatefulWidget {
  const Step2Screen({super.key});

  @override
  State<Step2Screen> createState() => _Step2ScreenState();
}

class _Step2ScreenState extends State<Step2Screen> {
  RegisterController registerController = Get.find();
  @override
  void initState() {
    registerController.getInterestList();
    super.initState();
  }

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
                Text(AppString.whatInterest,
                    style: TextStyleHelper.blackColor24),
                Padding(
                  padding: EdgeInsets.only(right: 2.w),
                  child: Text(AppString.step2Desc,
                      style: TextStyleHelper.greyColor15),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Obx(
                  () {
                    return Wrap(
                      spacing: 8.0, // Horizontal space between chips
                      runSpacing: 4.0, // Vertical space between lines
                      children: List<Widget>.generate(
                        registerController
                                .getInterestModel.value?.entries.length ??
                            0,
                        (int index) {
                          bool isSelected =
                              registerController.selectedChips.contains(index);

                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: GestureDetector(
                              onTap: () async {
                                if (isSelected) {
                                  // Remove the chip from the selected list
                                  registerController.selectedChips
                                      .remove(index);
                                } else {
                                  // Optimistically select the interest
                                  registerController.selectedChips.add(index);

                                  // Call the API
                                  int selectedId = registerController
                                      .getInterestModel.value!.entries[index].id
                                      .toInt();
                                  bool apiSuccess = await registerController
                                      .getInterestSelect(selectedId);

                                  // If the API call fails, unselect the interest
                                  if (!apiSuccess) {
                                    registerController.selectedChips
                                        .remove(index);
                                    registerController
                                        .update(); // Notify the UI to rebuild
                                    showErrorSnackBar(
                                        "Failed to select interest. Please try again.");
                                  } else {
                                    registerController
                                        .update(); // Update UI if needed for success
                                  }
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColor.appPrimaryColor
                                      : Colors
                                          .transparent, // Change color based on selection
                                  border: Border.all(
                                    color: AppColor.greyColor.withOpacity(0.2),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        registerController
                                                .getInterestModel
                                                .value
                                                ?.entries[index]
                                                .hashtag ??
                                            '',
                                        style: isSelected
                                            ? TextStyleHelper
                                                .whiteColor16 // Selected text color
                                            : TextStyleHelper
                                                .blackColor15, // Unselected text color
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        registerController.getInterestModel
                                                .value?.entries[index].icon ??
                                            '',
                                      ), // Assuming you want 5px spacing
                                      // Image.asset(
                                      //   AppAssets.gamingImage,
                                      //   height: 18, // Adjust the size as needed
                                      // ),
                                      const SizedBox(width: 5),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.h, bottom: 26.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  decoration: BoxDecoration(
                      color: AppColor.primaryLightSecondColor,
                      borderRadius: BorderRadius.circular(11.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.whyChooseInterest,
                        style: TextStyleHelper.blackColor24
                            .copyWith(fontSize: AppFontSize.font16),
                      ),
                      (5.h).addHSpace(),
                      Row(
                        children: [
                          svgAssetImage(AppAssets.joinInterest),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: Text(
                              AppString.joinInterest,
                              style: TextStyleHelper.darkGreyColor14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          svgAssetImage(AppAssets.discoverEvent),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: Text(
                              AppString.discoverRelevant,
                              style: TextStyleHelper.darkGreyColor14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          svgAssetImage(AppAssets.earnReward),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: Text(
                              AppString.earnRewards,
                              style: TextStyleHelper.darkGreyColor14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // (18.h).addHSpace(),
                // Padding(
                //   padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 50.h),
                //   child: CommonButton(
                //     onTap: () {
                //       Get.toNamed(Routes.step3Screen);
                //     },
                //     title: AppString.createProfile,
                //     buttonColor: AppColor.appPrimaryColor,
                //     textColor: AppColor.primaryLightColor,
                //   ),
                // ),
                // // GestureDetector(
                // //   onTap: () {
                // //     Get.toNamed(Routes.singInScreen);
                // //   },
                // //   child: Padding(
                // //     padding: EdgeInsets.only(top: 9.h, left: 10.w),
                // //     child: RichText(
                // //       text: TextSpan(
                // //         text: AppString.alreadyHaveAccount,
                // //         style: TextStyleHelper.blackColor15
                // //             .copyWith(fontSize: AppFontSize.font12),
                // //         children: <TextSpan>[
                // //           TextSpan(
                // //               text: AppString.singIn,
                // //               style: TextStyleHelper.primaryColor12),
                // //         ],
                // //       ),
                // //     ),
                // //   ),
                // ),
              ],
            ),
          ),
        );
      },
    ));
  }
}

Widget getChild(String imagePath, String title) {
  return Container(
    width: 120.w,
    height: 30.h,
    child: Padding(
      padding: EdgeInsets.only(top: 5.h, bottom: 5.h, right: 5.w, left: 5.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyleHelper.whiteColor16,
          ),
          SizedBox(
            width: 5.w,
          ),
          Image.asset(
            imagePath,
            height: 18.h,
            // fit: BoxFit.contain,
          ),
        ],
      ),
    ),
  );
}
