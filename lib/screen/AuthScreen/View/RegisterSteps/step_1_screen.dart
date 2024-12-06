import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropchats/constant/app_assets.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/screen/AuthScreen/controller/register_controller.dart';
import 'package:dropchats/widgets/common_textfiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Step1Screen extends StatefulWidget {
  const Step1Screen({super.key});

  @override
  State<Step1Screen> createState() => _Step1ScreenState();
}

class _Step1ScreenState extends State<Step1Screen> {
  RegisterController registerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<RegisterController>(
        builder: (controller) {
          return Obx(
            () {
              if (registerController.isLoadingFirstStep.value) {
                return const Center(child: CupertinoActivityIndicator());
              } else {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                  child: SingleChildScrollView(
                    // Wrap the entire Column inside SingleChildScrollView
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppString.searchCollege,
                            style: TextStyleHelper.blackColor24),
                        Padding(
                          padding: EdgeInsets.only(right: 2.w),
                          child: Text(AppString.step1Desc,
                              style: TextStyleHelper.greyColor15),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: AppTextField(
                            hintText: AppString.searchCollege,
                            controller: controller.searchController,
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
                            onChanged: (query) {
                              registerController.filterCollegeList(query);
                              registerController
                                  .currentIndexSelectedJoinCampus.value = -1;
                              controller.update();
                            },
                          ),
                        ),
                        Obx(() {
                          var collegeList =
                              registerController.filteredCollegeList.isEmpty
                                  ? (registerController
                                          .getCollegeListModel.value?.data ??
                                      [])
                                  : registerController.filteredCollegeList;
                          if (registerController.filteredCollegeList.isEmpty &&
                              controller.searchController.text.isNotEmpty) {
                            return Padding(
                              padding: EdgeInsets.only(top: 200.h),
                              child: Center(
                                child: Text(
                                  "No data Found",
                                  textAlign: TextAlign.center,
                                  style: TextStyleHelper.greyColor15,
                                ),
                              ),
                            );
                          }
                          return Padding(
                            padding: EdgeInsets.only(top: 53.h),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap:
                                  true, // Allow the ListView to take up only the necessary space
                              itemCount: collegeList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    registerController
                                        .currentIndexSelectedJoinCampus
                                        .value = index;
                                  },
                                  child: Obx(() {
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 15.h),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.h, vertical: 10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                          color: registerController
                                                      .currentIndexSelectedJoinCampus
                                                      .value ==
                                                  index
                                              ? AppColor.appPrimaryColor
                                              : AppColor.lightGreyColor,
                                          width: 1.w,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          // College Avatar
                                          Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              CachedNetworkImage(
                                                height: 53.h,
                                                width: 53.w,
                                                imageUrl: collegeList[index]
                                                        ?.avatar ??
                                                    '',
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  height: 53.h,
                                                  width: 53.w,
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                                placeholder: (context, url) =>
                                                    const CupertinoActivityIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Container(
                                                  height: 53.h,
                                                  width: 53.w,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.transparent,
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          AppAssets.dummy2),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                right: 0,
                                                bottom: 1.h,
                                                child: Image.asset(
                                                  AppAssets.verifiedIcon,
                                                  height: 18.h,
                                                  width: 18.w,
                                                ),
                                              ),
                                            ],
                                          ),
                                          // College Name
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15.w),
                                              child: Text(
                                                collegeList[index]?.name ?? '',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyleHelper
                                                    .blackColor15,
                                              ),
                                            ),
                                          ),
                                          // Spacer to push the icon and count to the far right
                                          Row(
                                            children: [
                                              svgAssetImage(
                                                AppAssets.trophyIcon,
                                                fit: BoxFit.fill,
                                                height: 16.h,
                                                width: 16.w,
                                              ),
                                              SizedBox(width: 8.w),
                                              Text(
                                                '12.3K',
                                                style: TextStyleHelper
                                                    .blackColor15
                                                    .copyWith(
                                                  fontSize: AppFontSize.font12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
