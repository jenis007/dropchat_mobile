import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class RegisterController extends GetxController {
  TextEditingController searchController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  ///verify otp Screen
  TextEditingController confirmationCode = TextEditingController();

  List<String> cityText = ["ULCA", "USC", "NYU", "Columbia"];
  var selectedChips = <int>{}.obs;
  final List<String> dogeNames = [
    'Gaming',
    'Music festivals',
    'Exploring food trends',
    'Live sports events',
    'Escape rooms',
    'volunteer activities',
    'Dance classes',
    'Tech Events',
    'DIY workshops',
    'Exploring thrift stores',
    'Hiking and outdoor adventures',
  ];

  RxInt currentIndex = 0.obs;

  bool isVisible = false;
  bool isConfirmVisible = false;

  void isVisibility() {
    isVisible = !isVisible;
    update();
  }

  void isConfirmVisibility() {
    isConfirmVisible = !isConfirmVisible;
    update();
  }
}
