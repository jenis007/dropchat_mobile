import 'package:dropchats/screen/OnBoarding/onboarding_screen.dart';
import 'package:dropchats/screen/HomeScreen/home_screen.dart';
import 'package:get/get.dart';

class Routes {
  static String splashScreen = "/splash";
  static String homeScreen = "/homeScreen";

  static List<GetPage> routes = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
    ), GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
    ),
  ];
}
