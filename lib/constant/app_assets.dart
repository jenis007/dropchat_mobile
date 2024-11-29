import 'package:dropchats/constant/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAssets {
  static const imagePath = "assets/images/";
  static const iconPath = "assets/icons/";

  ///onBoarding
  static const onBoarding1 = "${imagePath}onBoarding1.png";
  static const onBoarding2 = "${imagePath}onBoarding2.png";
  static const onBoarding3 = "${imagePath}onBoarding3.png";
  static const avtarGroup = "${imagePath}avtarGroup.png";
}

Widget appIcon({required IconData icon, double? size, Color? color}) {
  return Icon(
    icon,
    size: size,
    color: color ?? AppColor.appTextColor,
  );
}

Widget assetImage(
  String image, {
  double? height,
  double? width,
  Color? color,
  BoxFit? fit,
}) {
  return Image.asset(
    image,
    height: height,
    width: width,
    color: color,
    fit: fit,
  );
}

Widget svgAssetImage(
  String image, {
  double? height,
  double? width,
  BoxFit? fit,
}) {
  return SvgPicture.asset(
    image,
    height: height,
    width: width,
    fit: fit ?? BoxFit.fill,
  );
}

Widget svgAssetImageColor(
  String image, {
  double? height,
  double? width,
  BoxFit? fit,
  Color? color,
}) {
  return SvgPicture.asset(
    image,
    height: height,
    width: width,
    fit: fit ?? BoxFit.fill,
    colorFilter:
        ColorFilter.mode(color ?? AppColor.whiteColor, BlendMode.srcIn),
  );
}

AssetImage decorationImage(
  String image, {
  double? height,
  double? width,
  Color? color,
  BoxFit? fit,
  double? scale,
}) {
  return AssetImage(image);
}
