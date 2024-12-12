import 'package:contacts_service/contacts_service.dart';
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

extension SearchContacts on List<Contact> {
  List<Contact> getContacts(String value) {
    if (value.isEmpty) return this;

    return where((element) {
      final phoneValue = element.phones?.isNotEmpty == true
          ? element.phones?.first.value?.toLowerCase() ?? ''
          : '';
      final displayName = element.displayName?.toLowerCase() ?? '';

      return (element.phones?.isNotEmpty == true) &&
          (phoneValue.contains(value.toLowerCase()) ||
              displayName.contains(value.toLowerCase()) ||
              phoneValue.startsWith(value.toLowerCase()) ||
              displayName.startsWith(value.toLowerCase()));
    }).toList();
  }
}
