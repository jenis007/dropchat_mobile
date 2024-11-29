import 'package:dropchats/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension PlusJakartaSansText on String {
  Widget whitePlusJakartaW700Text({
    Color? fontColor,
    double? fontSize,
    TextDecoration? textDecoration,
    TextOverflow? textOverflow,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLine,
  }) {
    return Text(
      this,
      overflow: textOverflow,
      maxLines: maxLine,
      textAlign: textAlign,
      style: TextStyle(
          color: fontColor ?? AppColor.appTextColor,
          fontSize: fontSize ?? AppFontSize.font26,
          fontWeight: fontWeight ?? FontWeight.w700,
          decoration: textDecoration ?? TextDecoration.none,
          fontFamily: "Plus Jakarta Sans",
          decorationColor: fontColor ?? AppColor.appTextColor),
    );
  }
}

class TextStyleHelper {
  static TextStyle blackColor36 = TextStyle(
    color: AppColor.blackColor,
    fontSize: AppFontSize.font36,
    fontWeight: FontWeight.w700,
    fontFamily: "Plus Jakarta Sans",
  );
  static TextStyle primaryColor36 = TextStyle(
    color: AppColor.appPrimaryColor,
    fontSize: AppFontSize.font36,
    fontWeight: FontWeight.w700,
    fontFamily: "Plus Jakarta Sans",
  );
  static TextStyle greyColor15 = TextStyle(
    color: AppColor.greyColor,
    fontSize: AppFontSize.font15,
    fontWeight: FontWeight.w400,
    fontFamily: "Plus Jakarta Sans",
  );
}

class AppFontSize {
  static double font7 = 7.sp;
  static double font8 = 8.sp;
  static double font9 = 9.sp;
  static double font10 = 10.sp;
  static double font11 = 11.sp;
  static double font12 = 12.sp;
  static double font13 = 13.sp;
  static double font14 = 14.sp;
  static double font15 = 15.sp;
  static double font16 = 16.sp;
  static double font17 = 17.sp;
  static double font18 = 18.sp;
  static double font19 = 19.sp;
  static double font20 = 20.sp;
  static double font21 = 21.sp;
  static double font22 = 22.sp;
  static double font23 = 23.sp;
  static double font24 = 24.sp;
  static double font25 = 25.sp;
  static double font26 = 26.sp;
  static double font36 = 36.sp;
}
