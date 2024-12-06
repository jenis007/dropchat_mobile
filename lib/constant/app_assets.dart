import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class AppAssets {
  static const imagePath = "assets/images/";
  static const iconPath = "assets/icons/";

  ///onBoarding
  static const onBoarding1 = "${imagePath}onBoarding1.png";
  static const onBoarding2 = "${imagePath}onBoarding2.png";
  static const onBoarding3 = "${imagePath}onBoarding3.png";
  static const avtarGroup = "${imagePath}avtarGroup.png";
  static const userImage = "${imagePath}user.png";
  static const search = "${imagePath}Search.png";
  static const gamingImage = "${imagePath}gaming_image.png";
  static const isolationMode = "${imagePath}Isolation_Mode.png";

  ///bottomBar
  static const home = "${imagePath}home_icon.png";
  static const community = "${imagePath}community_icon.png";
  static const addIcon = "${imagePath}add_icon.png";
  static const message = "${imagePath}message_icon.png";
  static const profile = "${imagePath}profile_icon.png";
  static const bottomCross = "${imagePath}bottom_cross.png";
  static const bottomSpain = "${imagePath}bottom_spain.png";
  static const bottomHowtodropchat = "${imagePath}bottom_howtodropchat.png";
  static const bottomDropchat = "${imagePath}bottom_dropchat.png";
  static const dummyProfile = "${imagePath}dummy_profile.jpeg";
  static const dropChat = "${imagePath}dropchat_logo.png";

  ///private chat
  static const dropchatImage = "${imagePath}dropchat_image.png";
  static const audioImage = "${imagePath}audio_image.png";
  static const back = "${imagePath}back.png";
  static const giLive = "${imagePath}golive.png";
  static const chatBackgroundImage = "${imagePath}chat_background_image.png";
  static const attach = "${imagePath}Attach.png";
  static const animalsAndNature = "${imagePath}Animals_and_nature.png";
  static const camera = "${imagePath}Camera.png";
  static const photos = "${imagePath}photps.png";
  static const gif = "${imagePath}gif.png";
  static const sound = "${imagePath}sound.png";
  static const record = "${imagePath}record.png";
  static const multiImage = "${imagePath}multi_image.png";
  static const send = "${imagePath}Send.png";
  static const chatGroup = "${imagePath}chat_group.png";
  static const chatSuggation = "${imagePath}chat_suggation.png";
  static const cross = "${imagePath}cross.png";
  static const settings = "${imagePath}Settings.png";
  static const verifiedIcon = "${imagePath}_AvatarVerifiedIcon.png";

  ///profile screen
  static const shareIcon = "${imagePath}shar_icon.png";
  static const right = "${imagePath}right.png";
  static const mentor = "${imagePath}mentor.png";
  static const leval = "${imagePath}leval.png";
  static const stremmer = "${imagePath}stremmer.png";
  static const claps = "${imagePath}claps.png";
  static const crystal = "${imagePath}crystal.png";
  static const refrrals = "${imagePath}refrrals.png";
  static const profileImage = "${imagePath}profile.jpeg";
  static const dummy2 = "${imagePath}dummy2.jpeg";
  static const status = "${imagePath}Status.png";
  static const countshowImage = "${imagePath}countshow_image.png";
  static const div = "${imagePath}div.png";
  static const divIcon = "${imagePath}div_icon.png";

  ///chat
  static const chatCrystal = "${imagePath}chat_crystal.png";

  ///svg
  static const backArrow = "${iconPath}backArrow.svg";

  static const searchIcon = "${iconPath}Search.svg";
  static const trophyIcon = "${iconPath}trophy_icon.svg";
  static const discoverEvent = "${iconPath}discover_event.svg";
  static const earnReward = "${iconPath}earn_reward.svg";
  static const joinInterest = "${iconPath}join_interest.svg";
  static const notificationIcon = "${iconPath}notification_icon.svg";
  static const share = "${iconPath}share.svg";
  static const congrats = "${iconPath}congrats.svg";
  static const pinMap = "${iconPath}pin_map.svg";
  static const scanIcon = "${iconPath}scaner_icon.svg";
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

Widget cachedNetworkImage(
    {required String url,
    double? radius,
    double? height,
    double? width,
    BoxFit? boxFit,
    Widget? errorWidget,
    Color? color}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius ?? 0),
    child: CachedNetworkImage(
      height: height,
      width: width,
      errorWidget: (context, url, error) {
        return errorWidget ??
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primaryLightColor,
              ),
              child: Center(
                child: assetImage(
                  AppAssets.userImage,
                  fit: BoxFit.fill,
                ),
              ),
            );
      },
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: AppColor.whiteColor.withOpacity(0.3),
          highlightColor: AppColor.whiteColor.withOpacity(0.2),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColor.appPrimaryColor,
            ),
          ),
        );
      },
      fit: boxFit ?? BoxFit.fitHeight,
      imageUrl: url,
      color: color,
    ),
  );
}
