import 'package:dropchats/constant/app_assets.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

// showSuccessSnackBar(String title, {int? duration}) {
//   return Get.showSnackbar(GetSnackBar(
//     messageText: title.whitePoppinsW500Text(fontColor: AppColor.whiteColor),
//     borderRadius: 15,
//     snackPosition: SnackPosition.BOTTOM,
//     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//     shouldIconPulse: false,
//     icon: appIcon(
//       icon: Icons.verified,
//       color: AppColor.whiteColor,
//     ),
//     backgroundColor: AppColor.greenColor.withOpacity(0.3),
//     duration: Duration(seconds: duration ?? 3),
//   ));
// }
//
// showErrorSnackBar(String title, {int? duration}) {
//   return Get.showSnackbar(
//     GetSnackBar(
//       messageText: title.whitePoppinsW500Text(fontColor: AppColor.whiteColor),
//       borderRadius: 15,
//       snackPosition: SnackPosition.BOTTOM,
//       margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       shouldIconPulse: false,
//       icon: appIcon(
//         icon: Icons.error_outline,
//         color: AppColor.whiteColor,
//       ),
//       backgroundColor: Colors.red.withOpacity(0.8),
//       duration: Duration(seconds: duration ?? 3),
//     ),
//   );
// }

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

class MyToasts {
  ///Toast Localization

  static successToast({Color? color, String? toast}) async {
    final Widget widget = Container(
      decoration: BoxDecoration(
        color: AppColor.successBgClr,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const SizedBox(width: 10),
            SvgPicture.asset(AppAssets.successToastIcon),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                toast ?? "",
                style: TextStyle(
                    color: AppColor.toastTextClr,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp),
              ),
            ),
          ],
        ),
      ),
    );

    final ToastFuture toastFuture = showToastWidget(
      widget,
      duration: const Duration(seconds: 3),
      position: ToastPosition.bottom,
      onDismiss: () {
        debugPrint('Toast has been dismissed.');
      },
    );
  }

  static errorToast({Color? color, String? toast}) async {
    final Widget widget = Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: AppColor.errorBgClr,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const SizedBox(width: 10),
            SvgPicture.asset(AppAssets.errorToastIcon),
            const SizedBox(width: 10),
            Flexible(
              flex: 1,
              child: Text(
                toast ?? "",
                style: TextStyle(
                    color: AppColor.toastTextClr,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp),
              ),
            ),
          ],
        ),
      ),
    );

    final ToastFuture toastFuture = showToastWidget(
      widget,
      duration: const Duration(seconds: 3),
      position: ToastPosition.bottom,
      onDismiss: () {
        debugPrint('Toast has been dismissed.');
      },
    );
  }

  static warningToast({Color? color, String? toast}) async {
    ;

    final Widget widget = Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: AppColor.warningBgClr,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const SizedBox(width: 10),
            SvgPicture.asset(AppAssets.warningIcon),
            const SizedBox(width: 10),
            Flexible(
              flex: 1,
              child: Text(
                toast ?? "",
                style: TextStyle(
                    color: AppColor.toastTextClr,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp),
              ),
            ),
          ],
        ),
      ),
    );

    final ToastFuture toastFuture = showToastWidget(
      widget,
      duration: const Duration(seconds: 3),
      position: ToastPosition.bottom,
      onDismiss: () {
        debugPrint('Toast has been dismissed.');
      },
    );
  }
}
