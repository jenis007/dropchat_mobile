import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/app_textstyle.dart';

class CommonButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final TextStyle? buttonTextStyle;
  final String title;
  final double? buttonHeight;
  final Function() onTap;
  const CommonButton(
      {super.key,
      required this.buttonColor,
      required this.textColor,
      required this.title,
      required this.onTap,
      this.buttonTextStyle,
      this.buttonHeight});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: buttonHeight ?? 48.h,
        width: width,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Text(
          title,
          style: buttonTextStyle ??
              TextStyleHelper.primaryLightColor16
                  .copyWith(color: textColor, decoration: TextDecoration.none),
        )),
      ),
    );
  }
}
