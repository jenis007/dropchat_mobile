import 'package:dropchats/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
      style: GoogleFonts.plusJakartaSans(
          color: fontColor ?? AppColor.appTextColor,
          fontSize: fontSize ?? AppFontSize.font26,
          fontWeight: fontWeight ?? FontWeight.w700,
          decoration: textDecoration ?? TextDecoration.none,
          decorationColor: fontColor ?? AppColor.appTextColor),
    );
  }

  Widget greyPlusJakarta8W500Text({
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
          color: fontColor ?? AppColor.greyColor,
          fontSize: fontSize ?? AppFontSize.font8,
          fontWeight: fontWeight ?? FontWeight.w500,
          decoration: textDecoration ?? TextDecoration.none,
          fontFamily: "Plus Jakarta Sans",
          decorationColor: fontColor ?? AppColor.greyColor),
    );
  }

  Widget blackPlusJakarta14W400Text({
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
      style: GoogleFonts.plusJakartaSans(
          color: fontColor ?? AppColor.blackColor,
          fontSize: fontSize ?? AppFontSize.font14,
          fontWeight: fontWeight ?? FontWeight.w400,
          decoration: textDecoration ?? TextDecoration.none,
          decorationColor: fontColor ?? AppColor.appTextColor),
    );
  }
}

class TextStyleHelper {
  static TextStyle blackColor36 = GoogleFonts.plusJakartaSans(
    color: AppColor.blackColor,
    fontSize: AppFontSize.font36,
    fontWeight: FontWeight.w700,
  );
  static TextStyle primaryColor36 = GoogleFonts.plusJakartaSans(
    color: AppColor.appPrimaryColor,
    fontSize: AppFontSize.font36,
    fontWeight: FontWeight.w700,
  );
  static TextStyle primaryColor12 = GoogleFonts.plusJakartaSans(
    color: AppColor.appPrimaryColor,
    fontSize: AppFontSize.font12,
    fontWeight: FontWeight.w400,
  );
  static TextStyle greyColor15 = GoogleFonts.plusJakartaSans(
    color: AppColor.greyColor,
    fontSize: AppFontSize.font15,
    fontWeight: FontWeight.w400,
  );

  static TextStyle darkGreyColor14 = GoogleFonts.plusJakartaSans(
    color: AppColor.darkGreyColor,
    fontSize: AppFontSize.font14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle lightGreyColor15 = GoogleFonts.plusJakartaSans(
    color: AppColor.borderColor,
    fontSize: AppFontSize.font15,
    fontWeight: FontWeight.w400,
  );
  static TextStyle primaryLightColor16 = GoogleFonts.plusJakartaSans(
    color: AppColor.primaryLightColor,
    fontSize: AppFontSize.font16,
    fontWeight: FontWeight.bold,
  );
  static TextStyle blackColor20 = GoogleFonts.plusJakartaSans(
    color: AppColor.blackColor,
    fontSize: AppFontSize.font20,
    fontWeight: FontWeight.w600,
  );
  static TextStyle blackColor24 = GoogleFonts.plusJakartaSans(
    color: AppColor.blackColor,
    fontSize: AppFontSize.font24,
    fontWeight: FontWeight.w600,
  );
  static TextStyle blackColor15 = GoogleFonts.plusJakartaSans(
    color: AppColor.blackColor,
    fontSize: AppFontSize.font15,
    fontWeight: FontWeight.w400,
  );

  static TextStyle whiteColor16 = GoogleFonts.plusJakartaSans(
    color: AppColor.whiteColor,
    fontSize: AppFontSize.font15,
    fontWeight: FontWeight.w400,
  );
  static TextStyle black12 = GoogleFonts.plusJakartaSans(
    color: AppColor.blackColor,
    fontSize: AppFontSize.font12,
    fontWeight: FontWeight.w600,
  );
  static TextStyle primaryColor14 = TextStyle(
    color: AppColor.appPrimaryColor,
    fontSize: AppFontSize.font14,
    fontWeight: FontWeight.w500,
    fontFamily: "Roboto",
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
