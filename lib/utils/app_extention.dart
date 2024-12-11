import 'package:dropchats/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

extension SizedExtension on double {
  addHSpace() {
    return SizedBox(height: this);
  }

  addWSpace() {
    return SizedBox(width: this);
  }
}

showLoader({Color? color}) {
  return SpinKitFadingCircle(
    color: color ?? AppColor.primaryLightColor,
  );
}

hideKeyBoard(BuildContext context) {
  return FocusScope.of(context).unfocus();
}
