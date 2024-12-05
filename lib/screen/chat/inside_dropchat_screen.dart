import 'package:dropchats/constant/app_assets.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/screen/chat/controller/chat_controller.dart';
import 'package:dropchats/widgets/common_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InsideDropChatScreen extends StatefulWidget {
  const InsideDropChatScreen({super.key});

  @override
  State<InsideDropChatScreen> createState() => _InsideDropChatScreenState();
}

class _InsideDropChatScreenState extends State<InsideDropChatScreen> {
  @override
  void initState() {
    isOverlayVisibleFirstTimeOpenChat = true;
    // TODO: implement initState
    super.initState();
  }

  ChatController chatController = Get.find();
  bool isOverlayVisibleFirstTimeOpenChat = false;
  void toggleOverlayBottomBar() {
    setState(() {
      isOverlayVisibleFirstTimeOpenChat = !isOverlayVisibleFirstTimeOpenChat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
              appBar: AppBar(
                toolbarHeight: 90.h,
                automaticallyImplyLeading: false,
                actions: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.giLive,
                        height: 65.h,
                      ),
                      Text(
                        "Go live",
                        style: TextStyle(
                          fontSize: 8.sp,
                          color: AppColor.greyColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                ],
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    AppAssets.back,
                    height: 20.h,
                  ),
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "UCLA - 2028 Class >",
                      style: TextStyleHelper.blackColor20,
                    ),
                    Text(
                      'Daniil, Maria, Nik, Ksenia, Eugene...',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppColor.greyColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.chatBackgroundImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppString.welcome,
                            style: TextStyleHelper.Black700.copyWith(
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            AppString.subTitle,
                            style: TextStyleHelper.black12
                                .copyWith(decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                    ),
                    //     // For
                    // Center the image and text together
                    Expanded(
                      // flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Image centered
                          Image.asset(
                            AppAssets.chatGroup,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 5.h),
                          // Text centered
                          Text(
                            'No messages here yet',
                            style: TextStyleHelper.black12,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Send a message or Sticker to break the ice',
                            style: TextStyleHelper.black12
                                .copyWith(fontSize: 9.sp),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 47.h,
                      width: 377.w,
                      decoration: BoxDecoration(
                          color: AppColor.greyColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 17.w, right: 17.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppAssets.chatSuggation,
                                  height: 27.sp,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Flexible(
                                  flex: 3,
                                  child: Text(
                                    'You have been chosen to be the discussion catalyst Say “Hi” to break the ice and introduce yourself',
                                    maxLines: 2,
                                    style: TextStyleHelper.blackColor15
                                        .copyWith(fontSize: 11.sp),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Image.asset(
                                  AppAssets.cross,
                                  height: 20.sp,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Image.asset(
                                  AppAssets.right,
                                  height: 20.sp,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Container(
                      height: 124.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: AppColor.greyColor.withOpacity(0.15),
                          ),
                          left: BorderSide(
                            color: AppColor.greyColor.withOpacity(0.15),
                          ),
                        ),
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 70.h,
                            color: Colors.transparent,
                            child: Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      maxLines: 3,
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        hintText: AppString.chatHint,
                                        hintStyle: TextStyleHelper.greyColor15
                                            .copyWith(
                                          fontSize: 16.sp,
                                          color: AppColor.greyColor
                                              .withOpacity(0.6),
                                        ),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20.w,
                                          vertical: 12,
                                        ),
                                      ),
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 50.h),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.send,
                                        color: Colors.grey,
                                        size: 27,
                                      ),
                                      onPressed: () {
                                        // Add send message logic
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Padding(
                            padding: EdgeInsets.only(left: 22.w),
                            child: Row(
                              children: [
                                Image.asset(AppAssets.attach, height: 30.h),
                                SizedBox(width: 10.w),
                                Image.asset(AppAssets.animalsAndNature,
                                    height: 30.h),
                                SizedBox(width: 10.w),
                                Image.asset(AppAssets.camera, height: 25.h),
                                SizedBox(width: 10.w),
                                Image.asset(AppAssets.photos, height: 22.h),
                                SizedBox(width: 10.w),
                                Image.asset(AppAssets.gif, height: 22.h),
                                SizedBox(width: 10.w),
                                Image.asset(AppAssets.sound, height: 22.h),
                                SizedBox(width: 10.w),
                                Image.asset(AppAssets.record, height: 27.h),
                                SizedBox(width: 10.w),
                                Image.asset(AppAssets.multiImage, height: 23.h),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          if (isOverlayVisibleFirstTimeOpenChat)
            Visibility(
              visible: isOverlayVisibleFirstTimeOpenChat,
              child: GestureDetector(
                onTap:
                    toggleOverlayBottomBar, // Close overlay when tapping anywhere outside
                child: Container(
                  color: Colors.black.withOpacity(0.8),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 20.h,
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            AppAssets.chatCrystal,
                            height: 100.sp,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 30.w, left: 30.w),
                            child: Text(
                              AppString.chatSub,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyleHelper.whiteColor16.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Container(
                                  width: 105.w,
                                  height: 48.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: AppColor.appPrimaryColor)),
                                  child: Center(
                                    child: Text(
                                      AppString.backHome,
                                      style: TextStyleHelper.primaryColor14
                                          .copyWith(
                                              decoration: TextDecoration.none),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Flexible(
                                  child: CommonButton(
                                    buttonColor: AppColor.appPrimaryColor,
                                    textColor: AppColor.whiteColor,
                                    title: AppString.checkRewards,
                                    buttonTextStyle:
                                        TextStyleHelper.whiteColor16.copyWith(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            decoration: TextDecoration.none),
                                    onTap: () {
                                      setState(() {
                                        isOverlayVisibleFirstTimeOpenChat =
                                            false; // Dismiss the overlay

                                        toggleOverlayBottomBar();
                                      });

                                      // Get.back();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
