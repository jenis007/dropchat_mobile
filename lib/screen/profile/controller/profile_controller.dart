import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var selectedValue = ''.obs;

  void updateValue(String newValue) {
    selectedValue.value = newValue;
  }
}
