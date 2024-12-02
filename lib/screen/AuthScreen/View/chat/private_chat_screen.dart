import 'package:dropchats/constant/app_assets.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/screen/AuthScreen/controller/chat_controller.dart';
import 'package:dropchats/widgets/common_tabbar.dart';
import 'package:dropchats/widgets/common_textfiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//
// class PrivateChatScreen extends StatefulWidget {
//   const PrivateChatScreen({super.key});
//
//   @override
//   State<PrivateChatScreen> createState() => _PrivateChatScreenState();
// }
//
// class _PrivateChatScreenState extends State<PrivateChatScreen>
//     with TickerProviderStateMixin {
//   ChatController chatController = Get.find();
//   @override
//   void initState() {
//     // TODO: implement initState
//     chatController.tabController = TabController(length: 2, vsync: this);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           appBar: AppBar(
//             automaticallyImplyLeading: false,
//             title: Text(AppString.chats,
//                 style: TextStyleHelper.black12
//                     .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w700)),
//           ),
//           body: GetBuilder<ChatController>(
//             builder: (controller) {
//               return CommonTabView(
//                 tabController: controller.tabController!,
//                 tabLabels: ['Privat Chat', 'Dropchats Circle'],
//                 tabViews: [
//                   // First tab - ListView
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 24.w),
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(top: 6.h, bottom: 10.h),
//                           child: AppTextField(
//                             hintText: AppString.searchChats,
//                             controller: controller.privateChatController,
//                             prefixSvg: SizedBox(
//                                 width: 14.w,
//                                 height: 14.h,
//                                 child: Align(
//                                   alignment: Alignment.centerRight,
//                                   child: Padding(
//                                     padding: EdgeInsets.only(right: 10.w),
//                                     child: svgAssetImage(
//                                       fit: BoxFit.cover,
//                                       AppAssets.searchIcon,
//                                     ),
//                                   ),
//                                 )),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: 80,
//                       physics: const BouncingScrollPhysics(),
//                       itemBuilder: (context, index) {
//                         return Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             ListTile(
//                               leading: Padding(
//                                 padding: EdgeInsets.only(left: 0.w),
//                                 child: Container(
//                                   height: 55.w,
//                                   width: 55.h,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(40),
//                                   ),
//                                   child: ClipOval(
//                                     child: Image.network(
//                                       fit: BoxFit.cover,
//                                       'https://s3-alpha-sig.figma.com/img/5033/63a4/020a4a49174ccc700c2568ef89ec68f6?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=imGrEF5QEE0vWBtiAht~Yd0AJMMvdjjymytVH6uemfpbOP6XwK7eJ-mZkBYmh9HNt9yEgu52TP8w6Gkd4rlJn4nrEN4h1nyH7Z93m-YwSwUtYuNwkeVweb1VlEXtvqOiOQUELRMebh2QKa023NSaYDIlxfXeYrl4oSMpwh5w7y2w3OpplzBnCMZhSz53bgiO76UbvHckbaY-2~n7MpboUJ7K1BScTsgPOOg~jJS9c0N3r-mjCmJP72rekU8XMOqwHTHgml44NY8Mbo3goAT48EwR1gnu6NUB2V1jxdwMkYNVEzBSmJuHhsAS-Lb5qJeCHRxbh6mrxCJBd6BjlVjj7A__',
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               subtitle: Text(
//                                 'Yes, they are necessary',
//                                 style: TextStyleHelper.greyColor15.copyWith(
//                                   fontSize: 16.sp,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                               title: Text(
//                                 'Pizza',
//                                 style: TextStyleHelper.black12.copyWith(
//                                   fontSize: 17.sp,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               trailing: Padding(
//                                 padding:
//                                     EdgeInsets.only(right: 10.w, bottom: 22.h),
//                                 child: Text(
//                                   '11:38 AM',
//                                   style: TextStyleHelper.greyColor15.copyWith(
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Divider(
//                               indent: 80.w,
//                               endIndent: 10.w,
//                               color: AppColor.greyColor.withOpacity(0.3),
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//                   ),
//                   // Second tab - Placeholder or content for 'Dropchats Circle'
//                   Center(
//                     child: Text(
//                       'Dropchats Circle Content',
//                       style: TextStyle(fontSize: 16.sp),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           )),
//     );
//   }
// }
class PrivateChatScreen extends StatefulWidget {
  const PrivateChatScreen({super.key});

  @override
  State<PrivateChatScreen> createState() => _PrivateChatScreenState();
}

class _PrivateChatScreenState extends State<PrivateChatScreen>
    with TickerProviderStateMixin {
  ChatController chatController = Get.find();

  @override
  void initState() {
    super.initState();
    chatController.tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Divider(
              color: AppColor.greyColor.withOpacity(0.3), // Divider color
              height: 1,
            ),
          ),
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              AppString.chats,
              style: TextStyleHelper.black12.copyWith(
                fontSize: 17.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        body: GetBuilder<ChatController>(
          builder: (controller) {
            return CommonTabView(
              tabController: controller.tabController!,
              tabLabels: [AppString.privatChat, 'Dropchats Circle'],
              tabViews: [
                // First tab view: Private Chat content
                Column(
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
                                          style: TextStyleHelper.black12
                                              .copyWith(
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w500,
                                                  overflow:
                                                      TextOverflow.ellipsis),
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
                                      style:
                                          TextStyleHelper.greyColor15.copyWith(
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
                ),
                // Second tab view: Dropchats Circle content
                Column(
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
                                  leading: Container(
                                    height: 55.w,
                                    width: 55.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: ClipOval(
                                      child: Image.asset(
                                        fit: BoxFit.cover,
                                        AppAssets.dropchatImage,
                                      ),
                                    ),
                                  ),
                                  subtitle: Text(
                                    'Yes, they are necessary',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyleHelper.greyColor15.copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  title: Row(
                                    children: [
                                      Flexible(
                                        flex: 3,
                                        child: Text(
                                          'Pizza',
                                          style: TextStyleHelper.black12
                                              .copyWith(
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w500,
                                                  overflow:
                                                      TextOverflow.ellipsis),
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
                                      style:
                                          TextStyleHelper.greyColor15.copyWith(
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
