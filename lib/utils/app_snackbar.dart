import 'package:dropchats/constant/app_assets.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSuccessSnackBar(String title, {int? duration}) {
  return Get.showSnackbar(GetSnackBar(
    messageText: title.whitePoppinsW500Text(fontColor: AppColor.whiteColor),
    borderRadius: 15,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    shouldIconPulse: false,
    icon: appIcon(
      icon: Icons.verified,
      color: AppColor.whiteColor,
    ),
    backgroundColor: AppColor.greenColor.withOpacity(0.3),
    duration: Duration(seconds: duration ?? 3),
  ));
}

showErrorSnackBar(String title, {int? duration}) {
  return Get.showSnackbar(
    GetSnackBar(
      messageText: title.whitePoppinsW500Text(fontColor: AppColor.whiteColor),
      borderRadius: 15,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shouldIconPulse: false,
      icon: appIcon(
        icon: Icons.error_outline,
        color: AppColor.whiteColor,
      ),
      backgroundColor: Colors.red.withOpacity(0.8),
      duration: Duration(seconds: duration ?? 3),
    ),
  );
}

class WarningMessage extends StatelessWidget {
  final String message;
  final double? height;
  const WarningMessage({super.key, required this.message, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? ScreenSize.height,
      child: Center(
        child: message.whitePoppinsW500Text(),
      ),
    );
  }
}
