import 'package:dropchats/screen/AuthScreen/View/RegisterSteps/steo_2_screen.dart';
import 'package:dropchats/screen/AuthScreen/View/RegisterSteps/step_3_screen.dart';
import 'package:dropchats/screen/AuthScreen/View/RegisterSteps/verify_otp_screen.dart';
import 'package:dropchats/screen/AuthScreen/View/singInScreen/singin_screen.dart';

import 'package:dropchats/screen/OnBoarding/onboarding_screen.dart';
import 'package:dropchats/screen/bottomScreen/home_screen.dart';
import 'package:dropchats/screen/chat/inside_dropchat_screen.dart';
import 'package:dropchats/screen/chat/insidechat_screen.dart';
import 'package:dropchats/screen/chat/chat_screen.dart';
import 'package:dropchats/screen/community/Community_screen.dart';
import 'package:dropchats/screen/profile/profile_screen.dart';

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
  static String insideChatScreen = "/insideChatScreen";
  static String insideDropChatScreen = "/insideDropChatScreen";
  static String singInScreen = "/singInScreen";
  static String step2Screen = "/Step2Screen";
  static String step3Screen = "/step3Screen";

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
      page: () => const MainBottomScreen(),
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
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: insideChatScreen,
      page: () => InsideChatScreen(),
    ),
    GetPage(
      name: insideDropChatScreen,
      page: () => InsideDropChatScreen(),
    ),
    GetPage(
      name: singInScreen,
      page: () => const SingInScreen(),
    ),
    GetPage(
      name: step2Screen,
      page: () => const Step2Screen(),
    ),
    GetPage(
      name: step3Screen,
      page: () => const Step3Screen(),
    ),
  ];
}
