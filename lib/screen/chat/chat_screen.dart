import 'package:dropchats/constant/app_assets.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/screen/chat/controller/chat_controller.dart';
import 'package:dropchats/screen/chat/dropchat_circle_screenTab.dart';
import 'package:dropchats/screen/chat/insidechat_screen.dart';
import 'package:dropchats/screen/chat/privat_chat_screenTab.dart';
import 'package:dropchats/utils/app_routes.dart';
import 'package:dropchats/widgets/common_tabbar.dart';
import 'package:dropchats/widgets/common_textfiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
              tabViews: const [
                // First tab view: Private Chat content
                PrivateChatTab(),
                // Second tab view: Dropchats Circle content
                DropChatCircalChatTab(),
              ],
            );
          },
        ),
      ),
    );
  }
}
