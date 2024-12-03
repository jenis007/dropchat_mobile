import 'package:dropchats/constant/app_assets.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/screen/chat/controller/chat_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InsideChatScreen extends StatefulWidget {
  const InsideChatScreen({super.key});

  @override
  State<InsideChatScreen> createState() => _InsideChatScreenState();
}

class _InsideChatScreenState extends State<InsideChatScreen> {
  ChatController chatController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        style: TextStyleHelper.Black700,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        AppString.subTitle,
                        style: TextStyleHelper.black12,
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
                        style: TextStyleHelper.black12.copyWith(fontSize: 9.sp),
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
                                    hintStyle:
                                        TextStyleHelper.greyColor15.copyWith(
                                      fontSize: 16.sp,
                                      color:
                                          AppColor.greyColor.withOpacity(0.6),
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
          )

          // Stack(
          //   children: [
          //     // Background Image
          //     Positioned.fill(
          //       child: Image.asset(
          //         AppAssets.chatBackgroundImage, // Replace with your image URL
          //         fit: BoxFit.cover, // Ensures the image covers the entire screen
          //       ),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 20.w),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             AppString.welcome,
          //             style: TextStyleHelper.Black700,
          //           ),
          //           SizedBox(
          //             height: 5.h,
          //           ),
          //           Text(
          //             AppString.subTitle,
          //             style: TextStyleHelper.black12,
          //           ),
          //
          //         ],
          //       ),
          //     ),
          //     // Foreground Content
          //     Center(
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.end,
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         children: [
          //           Container(
          //             height: 124.h, // Use scaling only if needed
          //             width: double.infinity,
          //             decoration: BoxDecoration(
          //               border: Border(
          //                 top: BorderSide(
          //                     color: AppColor.greyColor.withOpacity(0.15)),
          //                 left: BorderSide(
          //                     color: AppColor.greyColor.withOpacity(0.15)),
          //               ),
          //               color: AppColor.whiteColor,
          //               borderRadius: BorderRadius.only(
          //                 topLeft: Radius.circular(20),
          //                 topRight: Radius.circular(20),
          //               ),
          //             ),
          //             child: Column(
          //               children: [
          //                 Container(
          //                   height: 70.h,
          //                   color: Colors.transparent,
          //                   child: Padding(
          //                     padding: EdgeInsets.only(
          //                       right: 8.w,
          //                     ),
          //                     child: Row(
          //                       children: [
          //                         Expanded(
          //                           child: TextField(
          //                             maxLines: 3,
          //                             keyboardType: TextInputType.multiline,
          //                             decoration: InputDecoration(
          //                               hintText: AppString.chatHint,
          //                               hintStyle: TextStyleHelper.greyColor15
          //                                   .copyWith(
          //                                       fontSize: 16.sp,
          //                                       color: AppColor.greyColor
          //                                           .withOpacity(0.6)),
          //                               border: InputBorder.none, // No border
          //                               contentPadding: EdgeInsets.symmetric(
          //                                 horizontal: 20.w,
          //                                 vertical: 12,
          //                               ),
          //                             ),
          //                             style: TextStyle(fontSize: 16),
          //                           ),
          //                         ),
          //                         Padding(
          //                           padding: EdgeInsets.only(bottom: 50.h),
          //                           child: IconButton(
          //                             icon: const Icon(
          //                               Icons.send,
          //                               color: Colors.grey,
          //                               size: 27,
          //                             ),
          //                             onPressed: () {
          //                               // Add send message logic
          //                             },
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 5.h,
          //                 ),
          //                 Padding(
          //                   padding: EdgeInsets.only(left: 22.w),
          //                   child: Row(
          //                     children: [
          //                       Image.asset(
          //                         AppAssets.attach,
          //                         height: 30.h,
          //                       ),
          //                       SizedBox(
          //                         width: 10.w,
          //                       ),
          //                       Image.asset(
          //                         AppAssets.animalsAndNature,
          //                         height: 30.h,
          //                       ),
          //                       SizedBox(
          //                         width: 10.w,
          //                       ),
          //                       Image.asset(
          //                         AppAssets.camera,
          //                         height: 25.h,
          //                       ),
          //                       SizedBox(
          //                         width: 10.w,
          //                       ),
          //                       Image.asset(
          //                         AppAssets.photos,
          //                         height: 22.h,
          //                       ),
          //                       SizedBox(
          //                         width: 10.w,
          //                       ),
          //                       Image.asset(
          //                         AppAssets.gif,
          //                         height: 22.h,
          //                       ),
          //                       SizedBox(
          //                         width: 10.w,
          //                       ),
          //                       Image.asset(
          //                         AppAssets.sound,
          //                         height: 22.h,
          //                       ),
          //                       SizedBox(
          //                         width: 10.w,
          //                       ),
          //                       Image.asset(
          //                         AppAssets.record,
          //                         height: 27.h,
          //                       ),
          //                       SizedBox(
          //                         width: 10.w,
          //                       ),
          //                       Image.asset(
          //                         AppAssets.multiImage,
          //                         height: 23.h,
          //                       ),
          //                     ],
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
