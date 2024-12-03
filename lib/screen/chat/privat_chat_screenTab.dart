import 'package:dropchats/constant/app_assets.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/screen/chat/controller/chat_controller.dart';
import 'package:dropchats/utils/app_extention.dart';
import 'package:dropchats/utils/app_routes.dart';
import 'package:dropchats/widgets/common_button.dart';
import 'package:dropchats/widgets/common_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrivateChatTab extends StatefulWidget {
  const PrivateChatTab({super.key});

  @override
  State<PrivateChatTab> createState() => _PrivateChatTabState();
}

class _PrivateChatTabState extends State<PrivateChatTab> {
  ChatController chatController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      builder: (controller) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12.h, bottom: 10.h),
              child: AppTextField(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                hintText: AppString.searchChats,
                controller: controller.privateChatController,
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
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 80,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          onTap: () {
                            Get.toNamed(Routes.insideChatScreen);
                          },
                          leading: Container(
                            height: 55.w,
                            width: 55.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                fit: BoxFit.fill,
                                AppAssets.dummyProfile,
                              ),
                            ),
                          ),
                          subtitle: Text(
                            'Yes, they are necessary',
                            style: TextStyleHelper.greyColor15.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.ellipsis),
                          ),
                          title: Row(
                            children: [
                              Flexible(
                                flex: 3,
                                child: Text(
                                  'Pizza',
                                  style: TextStyleHelper.black12.copyWith(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Image.asset(AppAssets.audioImage),
                            ],
                          ),
                          trailing: Padding(
                            padding: EdgeInsets.only(bottom: 22.h),
                            child: Text(
                              '11:38 AM',
                              style: TextStyleHelper.greyColor15.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          indent: 80.w,
                          endIndent: 10.w,
                          color: AppColor.greyColor.withOpacity(0.3),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
