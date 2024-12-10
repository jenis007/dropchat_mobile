import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  int currentPage = 0;
  int totalPages = 4;
  setCurrentPage(int value) {
    currentPage = value;
    update();
  }

  PageController pageController = PageController();

  updateCurrentPage(int value) {
    setCurrentPage(value);
  }
}
