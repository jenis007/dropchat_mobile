import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_string.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/screen/AuthScreen/controller/register_controller.dart';
import 'package:dropchats/utils/app_extention.dart';
import 'package:dropchats/utils/app_routes.dart';
import 'package:dropchats/widgets/common_button.dart';
import 'package:dropchats/widgets/common_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  RegisterController registerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text('Hello.....', style: TextStyleHelper.blackColor24)),
    );
  }
}
