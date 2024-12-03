import 'package:dropchats/constant/app_assets.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/screen/AuthScreen/controller/register_controller.dart';
import 'package:dropchats/screen/profile/controller/profile_controller.dart';
import 'package:dropchats/utils/app_extention.dart';
import 'package:dropchats/utils/app_routes.dart';
import 'package:dropchats/widgets/common_button.dart';
import 'package:dropchats/widgets/common_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController profileController = Get.find();
  final List<Map<String, String>> achievements = [
    {
      'image': 'assets/images/mentor.png',
      'title': 'Mentor',
      'description': 'Current Badge',
    },
    {
      'image': 'assets/images/leval.png',
      'title': '5',
      'description': 'Level',
    },
    {
      'image': 'assets/images/claps.png',
      'title': '55',
      'description': 'Claps',
    },
    {
      'image': 'assets/images/crystal.png',
      'title': '12',
      'description': 'Crystal Points',
    },
    {
      'image': 'assets/images/refrrals.png',
      'title': '55',
      'description': 'Refferals',
    },
    {
      'image': 'assets/images/stremmer.png',
      'title': '12',
      'description': 'Streamer Points',
    },
    // Add more achievements as needed
  ];
  final List<Map<String, String>> interests = [
    {
      'image': 'assets/images/funny_imogi.png',
      'title': 'Comedy shows',
    },
    {
      'image': 'assets/images/drawing.png',
      'title': 'DIY workshops',
    },
    {
      'image': 'assets/images/funny_imogi.png',
      'title': 'DIY',
    },
    {
      'image': 'assets/images/funny_imogi.png',
      'title': 'Live sports events',
    },
    {
      'image': 'assets/images/funny_imogi.png',
      'title': 'Live sports events',
    },

    // Add more achievements as needed
  ];
  final List<Map<String, String>> leaderboard = [
    {
      'image': 'assets/images/winner1.png',
      'imageProfile': 'assets/images/profile.jpeg',
      'title': 'PaulC_Ramos92',
      'Subtitle': '5075',
    },
    {
      'image': 'assets/images/winner2.png',
      'imageProfile': 'assets/images/dummy2.jpeg',
      'title': 'DerrickThoman_21',
      'Subtitle': '5075',
    },
    {
      'image': 'assets/images/winner3.png',
      'imageProfile': 'assets/images/profile.jpeg',
      'title': 'PaulC_Ramos92',
      'Subtitle': '5075',
    },
    {
      'image': 'assets/images/winner3.png',
      'imageProfile': 'assets/images/dummy2.jpeg',
      'title': 'KelseyDonovan_23',
      'Subtitle': '5075',
    },
    {
      'image': 'assets/images/winner3.png',
      'imageProfile': 'assets/images/profile.jpeg',
      'title': 'PaulC_Ramos92',
      'Subtitle': '5075',
    },
    {
      'image': 'assets/images/winner3.png',
      'imageProfile': 'assets/images/dummy2.jpeg',
      'title': 'PaulC_Ramos92',
      'Subtitle': '5075',
    },
    {
      'image': 'assets/images/winner3.png',
      'imageProfile': 'assets/images/profile.jpeg',
      'title': 'PaulC_Ramos92',
      'Subtitle': '5075',
    },
  ];

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  bool visible = true;
  late final ScrollController controller = ScrollController()
    ..addListener(() {
      // Check if the scroll direction is reversed (down)
      if (controller.position.userScrollDirection == ScrollDirection.reverse &&
          visible) {
        visible = false;
        setState(() {});
      }
      // Check if the scroll direction is forward (up)
      if (controller.position.userScrollDirection == ScrollDirection.forward &&
          !visible &&
          controller.offset <= 50) {
        visible = true;
        setState(() {});
      }
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(visible ? 120.h : 60.h),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AppBar(
              toolbarHeight: 115.h,
              backgroundColor: AppColor.appPrimaryColor,
              automaticallyImplyLeading: false,
              leading: Padding(
                padding: EdgeInsets.only(bottom: visible ? 35.h : 0.h),
                child: Image.asset(AppAssets.shareIcon),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                      right: 18.w, bottom: visible ? 35.h : 0.h),
                  child: Image.asset(AppAssets.settings, height: 27.h),
                ),
              ],
              title: Padding(
                padding:
                    EdgeInsets.only(bottom: visible ? 38.h : 0.h, top: 10.h),
                child: Text(
                  'Columbia University',
                  style: TextStyleHelper.primaryColor14
                      .copyWith(color: AppColor.whiteColor, fontSize: 15.sp),
                ),
              ),
              centerTitle: true,
            ),
            // Profile section visible only when the scroll is at the top
            if (visible)
              Positioned(
                top: 110.h,
                left: 0.w,
                right: 0.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        // Profile Image
                        Container(
                          width: 94.h,
                          height: 94.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(AppAssets.dummy2),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 20.h,
                            height: 20.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColor.whiteColor,
                                width: 2,
                              ),
                              image: const DecorationImage(
                                image: AssetImage(AppAssets.status),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Column(
                      children: [
                        Text(
                          'Thyne Man',
                          style: TextStyleHelper.blackColor20
                              .copyWith(fontSize: 16.sp),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          '@username',
                          style: TextStyleHelper.blackColor15
                              .copyWith(fontSize: 10.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 110.h, left: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Achievements Section
                  Text(
                    AppString.achievements,
                    style: TextStyleHelper.darkGreyColor14.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColor.greyColor.withOpacity(0.6)),
                  ),
                  // Add additional widgets for achievements here
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(right: 22.w, left: 22.w),
              shrinkWrap: true,
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  mainAxisExtent: 60.h),
              itemBuilder: (context, index) {
                return Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: AppColor.greyColor.withOpacity(0.2))),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 16.w),
                              child: Image.asset(
                                '${achievements[index]['image']}',
                                width: 18.h,
                                height: 20.h,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Flexible(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${achievements[index]['title']}',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyleHelper.blackColor20.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '${achievements[index]['description']}',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyleHelper.greyColor15.copyWith(
                                    color: AppColor.greyColor.withOpacity(0.5),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 13.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 22.w),
              child: Text(
                AppString.friends,
                style: TextStyleHelper.darkGreyColor14.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.greyColor.withOpacity(0.6)),
              ),
            ),
            SizedBox(
              height: 70.h,
              // color: Colors.red,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 40,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Container(
                      width: 60.h,
                      height: 60.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(AppAssets.profileImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 13.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 22.w),
              child: Text(
                AppString.interests,
                style: TextStyleHelper.darkGreyColor14.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.greyColor.withOpacity(0.6)),
              ),
            ),
            SizedBox(
              height: 13.h,
            ),
            SizedBox(
              height: 40.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Container(
                      // width: 160.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: AppColor.greyColor.withOpacity(0.2))),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 8.w, right: 8.w, top: 3.h, bottom: 3.h),
                        child: Row(
                          children: [
                            Text(
                              '${interests[index]['title']}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyleHelper.black12.copyWith(
                                  fontSize: 14.sp, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Image.asset(
                              width: 18.h,
                              height: 20.h,
                              '${interests[index]['image']}',
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 13.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 22.w),
              child: Row(children: [
                Text(
                  AppString.leaderboard1,
                  style: TextStyleHelper.darkGreyColor14.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.greyColor.withOpacity(0.6)),
                ),
                const Spacer(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Obx(
                      () => Container(
                        height: 35.h,
                        width: 45.w,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius:
                              BorderRadius.circular(25), // Fully rounded border
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: profileController.selectedValue.value.isEmpty
                                ? null
                                : profileController.selectedValue.value,
                            icon: const Icon(Icons.arrow_drop_down,
                                color: Colors.grey), // Arrow icon
                            hint: Text(
                              "My Points",
                              style: TextStyleHelper.greyColor15.copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 12.sp),
                            ),
                            items: [
                              DropdownMenuItem(
                                  value: "Option 1",
                                  child: Text(
                                    "Option 1",
                                    style: TextStyleHelper.greyColor15.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp),
                                  )),
                              DropdownMenuItem(
                                  value: "Option 2",
                                  child: Text(
                                    "Option 2",
                                    style: TextStyleHelper.greyColor15.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp),
                                  )),
                              DropdownMenuItem(
                                  value: "Option 3",
                                  child: Text(
                                    "Option 3",
                                    style: TextStyleHelper.greyColor15.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp),
                                  )),
                            ],
                            onChanged: (value) {
                              profileController.updateValue(value!);
                            },
                            dropdownColor:
                                Colors.white, // Background of dropdown list
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(
              // height: 40.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(left: 15.w, top: 10.h, right: 15.w),
                    child: Container(
                      width: 160.h,
                      height: 70.h,
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor.withOpacity(0.3),
                        border: Border.all(
                            width: 2,
                            color: AppColor.greyColor.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(15),
                        // color: AppColor.whiteColor
                        // color: Colors.red
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 12.w,
                          right: 12.w,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              width: 27.h,
                              height: 27.h,
                              '${leaderboard[index]['image']}',
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            VerticalDivider(
                                color: AppColor.greyColor.withOpacity(0.1),
                                thickness: 1,
                                width: 20),
                            // SizedBox(
                            //   width: 15.w,
                            // ),
                            Stack(
                              children: [
                                Container(
                                  width: 55.h,
                                  height: 55.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        '${leaderboard[index]['imageProfile']}',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    right: 0,
                                    child: Image.asset(
                                      AppAssets.countshowImage,
                                      height: 17.h,
                                    )),
                              ],
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              '${leaderboard[index]['title']}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyleHelper.black12.copyWith(
                                  fontSize: 13.sp, fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            VerticalDivider(
                                color: AppColor.greyColor.withOpacity(0.1),
                                thickness: 1,
                                width: 20),
                            Image.asset(
                              width: 27.h,
                              height: 27.h,
                              AppAssets.crystal,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              '${leaderboard[index]['Subtitle']}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyleHelper.black12.copyWith(
                                  fontSize: 13.sp, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
