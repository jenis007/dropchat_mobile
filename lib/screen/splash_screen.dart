import 'dart:developer';

import 'package:dropchats/utils/app_routes.dart';
import 'package:dropchats/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    // await Future.delayed(
    //     const Duration(seconds: 2)); // Optional: Simulate loading
    try {
      // Fetch the login status from SharedPreferences or your logic
      bool isLogin =
          await preferences.getBoolValue(SharedPreference.isLogin) ?? false;

      if (isLogin) {
        Get.offAllNamed(Routes.homeScreen);
      } else {
        Get.offAllNamed(Routes.onBoarding);
      }
    } catch (e) {
      log('Error checking login status: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "spalsh",
          style: TextStyle(color: Colors.black),
        ), // Show a loading spinner
      ),
    );
  }
}
