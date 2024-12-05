import 'package:device_preview/device_preview.dart';

import 'package:dropchats/HomeScreen/controller/home_controller.dart';
import 'package:dropchats/screen/AuthScreen/controller/register_controller.dart';
import 'package:dropchats/screen/OnBoarding/controller/onboarding_controller.dart';
import 'package:dropchats/screen/bottomScreen/bottombar_controller.dart';
import 'package:dropchats/screen/community/controller/communtity_controller.dart';
import 'package:dropchats/screen/profile/controller/profile_controller.dart';
import 'package:dropchats/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';

import 'screen/AuthScreen/controller/auth_controller.dart';
import 'screen/chat/controller/chat_controller.dart';
import 'utils/app_routes.dart';
import 'utils/shared_prefrence.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preferences.init();
  // runApp(
  //   DevicePreview(
  //     enabled: false,
  //     tools: const [
  //       ...DevicePreview.defaultTools,
  //     ],
  //     builder: (context) => const MyApp(),
  //   ),
  // );
  runApp(
    DevicePreview(
      enabled: false,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => ShowCaseWidget(
        builder: (context) => const MyApp(),
      ),
    ),
  );
  // runApp(const MyApp());
}

/// Global key for the first showcase widget
final GlobalKey firstShowcaseWidget = GlobalKey();

/// Global key for the last showcase widget
final GlobalKey lastShowcaseWidget = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 917),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: (old, data) => true,
      builder: (context, child) {
        ScreenSize.init(context);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: GetMaterialApp(
            useInheritedMediaQuery: true,
            debugShowCheckedModeBanner: false,
            title: 'dropChats',
            theme: ThemeData(fontFamily: "Plus Jakarta Sans"),
            initialBinding: BaseBinding(),
            initialRoute: Routes.onBoarding,
            getPages: Routes.routes,
          ),
        );
      },
    );
  }
}

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => RegisterController(), fenix: true);
    Get.lazyPut(() => ChatController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => CommunityController(), fenix: true);
    Get.lazyPut(() => BottomBarController(), fenix: true);
  }
}
