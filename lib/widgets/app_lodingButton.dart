import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/utils/app_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_btn/loading_btn.dart';

class AppLoadingButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final TextStyle? buttonTextStyle;
  final String title;
  final double? buttonHeight;
  final Function(Function, Function, ButtonState) onTap;

  const AppLoadingButton(
      {super.key,
      required this.onTap,
      required this.buttonColor,
      required this.textColor,
      this.buttonTextStyle,
      required this.title,
      this.buttonHeight});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return LoadingBtn(
      height: 52.h,
      borderRadius: 8.r,
      minWidth: width,
      animate: true,
      color: buttonColor,
      width: width,
      loader: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: showLoader(color: AppColor.whiteColor),
        ),
      ),
      onTap: onTap,
      child: Center(
          child: Text(
        title,
        style: buttonTextStyle ??
            TextStyleHelper.primaryLightColor16
                .copyWith(color: textColor, decoration: TextDecoration.none),
      )),
    );
  }
}
