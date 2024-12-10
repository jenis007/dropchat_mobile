import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obscure;
  final bool readonlyShow; // Make readonlyShow non-nullable
  final String? hintText;
  final Widget? prefixSvg;
  final Widget? suffixIcon;
  final TextInputType? keyBoardType;
  final int? inputText;
  final Color? fillColor;
  final EdgeInsets padding;
  final String? Function(String?)? validator; // Validator callback
  final bool? autoValidate; // Auto validation
  final Function(String)? onChanged; // onChanged callback
  final VoidCallback? onTap;
  final void Function(String)? onTapSubmited; // Change to Function(String)?

  const AppTextField({
    super.key,
    this.controller,
    this.obscure,
    this.hintText,
    this.prefixSvg,
    this.suffixIcon,
    this.keyBoardType,
    this.inputText,
    this.fillColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 0),
    this.validator,
    this.autoValidate = false,
    this.onChanged,
    this.readonlyShow = false,
    this.onTap, // Initialize onTap// Default to false
    this.onTapSubmited, // Initialize onTap// Default to false
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        onFieldSubmitted: onTapSubmited,
        readOnly: readonlyShow, // Ensures no keyboard appears if true
        onTap: readonlyShow
            ? onTap
            : null, // Trigger onTap when readonlyShow is true

        obscureText: obscure ?? false,
        controller: controller,
        keyboardType: keyBoardType,
        inputFormatters: [LengthLimitingTextInputFormatter(inputText)],
        cursorColor: AppColor.lightGreyColor,
        style: TextStyleHelper.greyColor15,
        validator: validator, // Add validator here
        autovalidateMode: autoValidate == true
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled, // Auto validation mode
        onChanged: onChanged, // Add onChanged callback here
        decoration: InputDecoration(
          fillColor: fillColor ?? Colors.transparent,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyleHelper.lightGreyColor15,
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
          suffixIcon: suffixIcon,
          prefixIcon: prefixSvg,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(
              color: AppColor.borderColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: AppColor.borderColor),
          ),
          errorStyle: const TextStyle(color: Colors.red),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(
                color: Colors.red, width: 1), // Focused error border
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: AppColor.borderColor, width: 1),
          ),
        ),
      ),
    );
  }
}
