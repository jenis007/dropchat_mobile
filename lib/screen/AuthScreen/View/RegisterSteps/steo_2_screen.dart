// import 'dart:ui';
// import 'package:dropchats/constant/app_assets.dart';
// import 'package:dropchats/constant/app_color.dart';
// import 'package:dropchats/constant/app_string.dart';
// import 'package:dropchats/constant/app_textstyle.dart';
// import 'package:dropchats/screen/AuthScreen/controller/register_controller.dart';
// import 'package:dropchats/utils/app_extention.dart';
// import 'package:dropchats/utils/app_snackbar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// class Step2Screen extends StatefulWidget {
//   const Step2Screen({super.key});
//
//   @override
//   State<Step2Screen> createState() => _Step2ScreenState();
// }
//
// class _Step2ScreenState extends State<Step2Screen> {
//   RegisterController registerController = Get.find();
//   @override
//   void initState() {
//     registerController.getInterestList();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: GetBuilder<RegisterController>(
//       builder: (controller) {
//         return Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(AppString.whatInterest,
//                     style: TextStyleHelper.blackColor24),
//                 Padding(
//                   padding: EdgeInsets.only(right: 2.w),
//                   child: Text(AppString.step2Desc,
//                       style: TextStyleHelper.greyColor15),
//                 ),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 Obx(() {
//                   if (registerController.isLoadingFirstStep.value) {
//                     return const Center(child: CupertinoActivityIndicator());
//                   }
//
//                   if (registerController
//                           .getInterestModel.value?.entries.isEmpty ??
//                       true) {
//                     return Center(
//                       child: Text(
//                         'No interests available',
//                         style: TextStyle(fontSize: 16.sp, color: Colors.grey),
//                       ),
//                     );
//                   }
//
//                   return Wrap(
//                     spacing: 8.0,
//                     runSpacing: 4.0,
//                     children: List<Widget>.generate(
//                       registerController
//                               .getInterestModel.value?.entries.length ??
//                           0,
//                       (int index) {
//                         bool isSelected =
//                             registerController.selectedChips.contains(index);
//                         bool isLoading =
//                             registerController.isChipLoading.contains(index);
//
//                         return Padding(
//                           padding: const EdgeInsets.all(5),
//                           child: GestureDetector(
//                             onTap: () async {
//                               if (isSelected) {
//                                 // If the chip is already selected, remove it from both lists
//                                 registerController.selectedChips.remove(index);
//                                 // registerController.selectedChipsa.remove(index);
//                                 registerController.selectedChipsa.add(index);
//                                 print(
//                                     'Selected Chips Lengthferffef: ${registerController.selectedChipsa.length}');
//                               } else {
//                                 // If not selected, add it to both lists
//                                 registerController.selectedChips.add(index);
//
//                                 int selectedId = registerController
//                                     .getInterestModel.value!.entries[index].id
//                                     .toInt();
//
//                                 // Show the loading state for this chip
//                                 registerController.isChipLoading.add(index);
//
//                                 bool apiSuccess = await registerController
//                                     .getInterestSelect(selectedId);
//
//                                 if (!apiSuccess) {
//                                   // If the API call fails, remove the chip and show an error
//                                   registerController.selectedChips
//                                       .remove(index);
//                                   registerController.selectedChipsa.remove(
//                                       index); // Remove from validation list
//                                   registerController.isChipLoading
//                                       .remove(index);
//                                   MyToasts.warningToast(
//                                     toast:
//                                         "You Are already Select This please select another interest.",
//                                   );
//                                 } else {
//                                   // If the API call is successful, remove the interest from the list
//                                   registerController
//                                       .getInterestModel.value!.entries
//                                       .removeAt(index);
//
//                                   registerController.selectedChips
//                                       .remove(index);
//
//                                   registerController.selectedChipsa.add(
//                                       registerController.getInterestModel.value!
//                                           .entries[index].id);
//
//                                   print(
//                                       'Selected Chips Length: ${registerController.selectedChipsa.length}');
//                                   registerController.isChipLoading
//                                       .remove(index);
//
//                                   registerController.update();
//                                   MyToasts.successToast(
//                                     toast: "Interest successfully selected!",
//                                   );
//                                 }
//                               }
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: isSelected
//                                     ? AppColor.appPrimaryColor
//                                     : Colors.transparent,
//                                 border: Border.all(
//                                   color: AppColor.greyColor.withOpacity(0.2),
//                                 ),
//                                 borderRadius:
//                                     const BorderRadius.all(Radius.circular(20)),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Text(
//                                       registerController.getInterestModel.value
//                                               ?.entries[index].hashtag ??
//                                           '',
//                                       style: isSelected
//                                           ? TextStyleHelper.whiteColor16
//                                           : TextStyleHelper.blackColor15,
//                                     ),
//                                     const SizedBox(width: 5),
//                                     Text(
//                                       registerController.getInterestModel.value
//                                               ?.entries[index].icon ??
//                                           '',
//                                     ),
//                                     isLoading
//                                         ? const CupertinoActivityIndicator(
//                                             radius: 10)
//                                         : Container(),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 }),
//
//                 Container(
//                   margin: EdgeInsets.only(top: 30.h, bottom: 26.h),
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
//                   decoration: BoxDecoration(
//                       color: AppColor.primaryLightSecondColor,
//                       borderRadius: BorderRadius.circular(11.r)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         AppString.whyChooseInterest,
//                         style: TextStyleHelper.blackColor24
//                             .copyWith(fontSize: AppFontSize.font16),
//                       ),
//                       (5.h).addHSpace(),
//                       Row(
//                         children: [
//                           svgAssetImage(AppAssets.joinInterest),
//                           Padding(
//                             padding: EdgeInsets.only(left: 4.w),
//                             child: Text(
//                               AppString.joinInterest,
//                               style: TextStyleHelper.darkGreyColor14,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           svgAssetImage(AppAssets.discoverEvent),
//                           Padding(
//                             padding: EdgeInsets.only(left: 4.w),
//                             child: Text(
//                               AppString.discoverRelevant,
//                               style: TextStyleHelper.darkGreyColor14,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           svgAssetImage(AppAssets.earnReward),
//                           Padding(
//                             padding: EdgeInsets.only(left: 4.w),
//                             child: Text(
//                               AppString.earnRewards,
//                               style: TextStyleHelper.darkGreyColor14,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 // (18.h).addHSpace(),
//                 // Padding(
//                 //   padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 50.h),
//                 //   child: CommonButton(
//                 //     onTap: () {
//                 //       Get.toNamed(Routes.step3Screen);
//                 //     },
//                 //     title: AppString.createProfile,
//                 //     buttonColor: AppColor.appPrimaryColor,
//                 //     textColor: AppColor.primaryLightColor,
//                 //   ),
//                 // ),
//                 // // GestureDetector(
//                 // //   onTap: () {
//                 // //     Get.toNamed(Routes.singInScreen);
//                 // //   },
//                 // //   child: Padding(
//                 // //     padding: EdgeInsets.only(top: 9.h, left: 10.w),
//                 // //     child: RichText(
//                 // //       text: TextSpan(
//                 // //         text: AppString.alreadyHaveAccount,
//                 // //         style: TextStyleHelper.blackColor15
//                 // //             .copyWith(fontSize: AppFontSize.font12),
//                 // //         children: <TextSpan>[
//                 // //           TextSpan(
//                 // //               text: AppString.singIn,
//                 // //               style: TextStyleHelper.primaryColor12),
//                 // //         ],
//                 // //       ),
//                 // //     ),
//                 // //   ),
//                 // ),
//               ],
//             ),
//           ),
//         );
//       },
//     ));
//   }
// }
//
// Widget getChild(String imagePath, String title) {
//   return Container(
//     width: 120.w,
//     height: 30.h,
//     child: Padding(
//       padding: EdgeInsets.only(top: 5.h, bottom: 5.h, right: 5.w, left: 5.w),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             title,
//             style: TextStyleHelper.whiteColor16,
//           ),
//           SizedBox(
//             width: 5.w,
//           ),
//           Image.asset(
//             imagePath,
//             height: 18.h,
//             // fit: BoxFit.contain,
//           ),
//         ],
//       ),
//     ),
//   );
// }
import 'dart:ffi';

import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/screen/AuthScreen/controller/register_controller.dart';
import 'package:dropchats/utils/app_extention.dart';
import 'package:dropchats/utils/app_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constant/app_assets.dart';
import '../../../../constant/app_color.dart';

class Step2Screen extends StatefulWidget {
  const Step2Screen({super.key});

  @override
  State<Step2Screen> createState() => _Step2ScreenState();
}

class _Step2ScreenState extends State<Step2Screen> {
  RegisterController registerController = Get.find();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    registerController.getInterestList(
        isNextPage: false); // Fetch the first page of data
    _scrollController.addListener(_scrollListener); // Adding scroll listener
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Trigger loading of next page when the user scrolls to the bottom
      if (!registerController.isLoadingFirstStep.value &&
          !registerController.isLoadingMoreData.value &&
          !registerController.isLastPage.value) {
        registerController.getInterestList(
            isNextPage: true); // Pass isNextPage flag
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RegisterController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Obx(
              () {
                return SingleChildScrollView(
                  controller:
                      _scrollController, // Ensure the controller is set for scroll
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

                      // Show loading state if data is being fetched
                      // Obx(() {
                      //   if (registerController.isLoadingFirstStep.value) {
                      //     return Center(child: CupertinoActivityIndicator());
                      //   }
                      //
                      //   if (registerController
                      //           .getInterestModel.value?.entries.isEmpty ??
                      //       true) {
                      //     return const Center(
                      //         child: Text("No interests available"));
                      //   }
                      //
                      //   return Wrap(
                      //     spacing: 8.0,
                      //     runSpacing: 8.0,
                      //     children: List.generate(
                      //       registerController
                      //               .getInterestModel.value?.entries.length ??
                      //           0,
                      //       (index) {
                      //         var interest = registerController
                      //             .getInterestModel.value?.entries[index];
                      //         bool isSelected = registerController.selectedChips
                      //             .contains(index);
                      //         bool isLoading = registerController.isChipLoading
                      //             .contains(index);
                      //
                      //         return Padding(
                      //           padding: const EdgeInsets.all(5),
                      //           child: GestureDetector(
                      //             onTap: () async {
                      //               if (isSelected) {
                      //                 registerController.selectedChips
                      //                     .remove(index);
                      //                 registerController.selectedChipsa
                      //                     .add(index);
                      //               } else {
                      //                 registerController.selectedChips
                      //                     .add(index);
                      //
                      //                 int selectedId = registerController
                      //                     .getInterestModel
                      //                     .value!
                      //                     .entries[index]
                      //                     .id
                      //                     .toInt();
                      //                 registerController.isChipLoading
                      //                     .add(index);
                      //
                      //                 bool apiSuccess = await registerController
                      //                     .getInterestSelect(selectedId);
                      //
                      //                 if (!apiSuccess) {
                      //                   registerController.selectedChips
                      //                       .remove(index);
                      //                   registerController.selectedChipsa
                      //                       .remove(index);
                      //                   registerController.isChipLoading
                      //                       .remove(index);
                      //                 } else {
                      //                   registerController.selectedChips
                      //                       .remove(index);
                      //                   registerController.selectedChipsa
                      //                       .add(selectedId);
                      //                   registerController.isChipLoading
                      //                       .remove(index);
                      //                   registerController.update();
                      //                 }
                      //               }
                      //             },
                      //             child: Container(
                      //               decoration: BoxDecoration(
                      //                 color: isSelected
                      //                     ? Colors.blue
                      //                     : Colors.transparent,
                      //                 border: Border.all(
                      //                     color: Colors.grey.withOpacity(0.2)),
                      //                 borderRadius:
                      //                     BorderRadius.all(Radius.circular(20)),
                      //               ),
                      //               child: Padding(
                      //                 padding: const EdgeInsets.all(8),
                      //                 child: Row(
                      //                   mainAxisSize: MainAxisSize.min,
                      //                   children: [
                      //                     Text(interest?.hashtag ?? '',
                      //                         style: TextStyle(
                      //                             color: isSelected
                      //                                 ? Colors.white
                      //                                 : Colors.black,
                      //                             fontSize: 16)),
                      //                     SizedBox(width: 5),
                      //                     Text(interest?.icon ?? '',
                      //                         style: TextStyle(fontSize: 16)),
                      //                     isLoading
                      //                         ? CircularProgressIndicator()
                      //                         : Container(),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         );
                      //       },
                      //     ),
                      //   );
                      // }),

                      Obx(() {
                        if (registerController.isLoadingFirstStep.value) {
                          return const Center(
                              child: CupertinoActivityIndicator());
                        }

                        if (registerController
                                .getInterestModel.value?.entries.isEmpty ??
                            true) {
                          return Center(
                            child: Text(
                              'No interests available',
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.grey),
                            ),
                          );
                        }

                        return Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          children: List<Widget>.generate(
                            registerController
                                    .getInterestModel.value?.entries.length ??
                                0,
                            (int index) {
                              bool isSelected = registerController.selectedChips
                                  .contains(index);
                              bool isLoading = registerController.isChipLoading
                                  .contains(index);

                              return Padding(
                                padding: const EdgeInsets.all(5),
                                child: GestureDetector(
                                  onTap: () async {
                                    if (isSelected) {
                                      // If the chip is already selected, remove it from both lists
                                      registerController.selectedChips
                                          .remove(index);
                                      // registerController.selectedChipsa.remove(index);
                                      registerController.selectedChipsa
                                          .add(index);
                                      print(
                                          'Selected Chips Lengthferffef: ${registerController.selectedChipsa.length}');
                                    } else {
                                      // If not selected, add it to both lists
                                      registerController.selectedChips
                                          .add(index);

                                      int selectedId = registerController
                                          .getInterestModel
                                          .value!
                                          .entries[index]
                                          .id
                                          .toInt();

                                      // Show the loading state for this chip
                                      registerController.isChipLoading
                                          .add(index);

                                      bool apiSuccess = await registerController
                                          .getInterestSelect(selectedId);

                                      if (!apiSuccess) {
                                        // If the API call fails, remove the chip and show an error
                                        registerController.selectedChips
                                            .remove(index);
                                        registerController.selectedChipsa.remove(
                                            index); // Remove from validation list
                                        registerController.isChipLoading
                                            .remove(index);
                                        MyToasts.warningToast(
                                          toast:
                                              "You Are already Select This please select another interest.",
                                        );
                                      } else {
                                        // If the API call is successful, remove the interest from the list
                                        registerController
                                            .getInterestModel.value!.entries
                                            .removeAt(index);

                                        registerController.selectedChips
                                            .remove(index);

                                        registerController.selectedChipsa.add(
                                            registerController.getInterestModel
                                                .value!.entries[index].id);

                                        print(
                                            'Selected Chips Length: ${registerController.selectedChipsa.length}');
                                        registerController.isChipLoading
                                            .remove(index);

                                        registerController.update();
                                        MyToasts.successToast(
                                          toast:
                                              "Interest successfully selected!",
                                        );
                                      }
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? AppColor.appPrimaryColor
                                          : Colors.transparent,
                                      border: Border.all(
                                        color:
                                            AppColor.greyColor.withOpacity(0.2),
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
                                                ? TextStyleHelper.whiteColor16
                                                : TextStyleHelper.blackColor15,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            registerController
                                                    .getInterestModel
                                                    .value
                                                    ?.entries[index]
                                                    .icon ??
                                                '',
                                          ),
                                          isLoading
                                              ? const CupertinoActivityIndicator(
                                                  radius: 10)
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                      // Show loading indicator for pagination if more data is being loaded
                      if (registerController.isLoadingMoreData.value &&
                          !registerController.isLastPage.value)
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Center(child: CupertinoActivityIndicator()),
                        ),

                      Container(
                        margin: EdgeInsets.only(top: 30.h, bottom: 26.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 16.h),
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
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose the scroll controller
    super.dispose();
  }
}
