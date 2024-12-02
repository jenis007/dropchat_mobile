import 'package:dropchats/screen/AuthScreen/View/RegisterSteps/verify_otp_screen.dart';
import 'package:dropchats/screen/AuthScreen/View/chat/private_chat_screen.dart';
import 'package:dropchats/screen/AuthScreen/View/community/Community_screen.dart';
import 'package:dropchats/screen/AuthScreen/View/profile/profile_screen.dart';
import 'package:dropchats/screen/OnBoarding/onboarding_screen.dart';
import 'package:dropchats/screen/bottomScreen/home_screen.dart';

import 'package:get/get.dart';

import '../screen/AuthScreen/View/RegisterSteps/register_steps_screen.dart';

class Routes {
  static String onBoarding = "/onBoarding";
  static String registerStepsScreen = "/registerStepsScreen";
  static String homeScreen = "/homeScreen";
  static String verifyScreen = "/verifyScreen";
  static String privateChatScreen = "/privateChatScreen";
  static String communityScreen = "/CommunityScreen";
  static String profileScreen = "/ProfileScreen";

  static List<GetPage> routes = [
    GetPage(
      name: onBoarding,
      page: () => const OnBoardingScreen(),
    ),
    GetPage(
      name: registerStepsScreen,
      page: () => const RegisterStepsScreen(),
    ),
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: verifyScreen,
      page: () => const VerifyOtpScreen(),
    ),
    GetPage(
      name: privateChatScreen,
      page: () => const PrivateChatScreen(),
    ),
    GetPage(
      name: communityScreen,
      page: () => const CommunityScreen(),
    ),
    GetPage(
      name: profileScreen,
      page: () => const ProfileScreen(),
    ),
  ];
}
