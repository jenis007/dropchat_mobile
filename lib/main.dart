import 'package:device_preview/device_preview.dart';

import 'package:dropchats/HomeScreen/controller/home_controller.dart';
import 'package:dropchats/screen/AuthScreen/controller/contact_controller.dart';
import 'package:dropchats/screen/AuthScreen/controller/register_controller.dart';
import 'package:dropchats/screen/OnBoarding/controller/onboarding_controller.dart';
import 'package:dropchats/screen/bottomScreen/bottombar_controller.dart';
import 'package:dropchats/screen/community/controller/communtity_controller.dart';
import 'package:dropchats/screen/profile/controller/profile_controller.dart';
import 'package:dropchats/services/Firebase/firebase_options.dart';
import 'package:dropchats/utils/screen_size.dart';
import 'package:dropchats/utils/shared_prefs.dart';
import 'package:dropchats/utils/socket_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:showcaseview/showcaseview.dart';
import 'screen/AuthScreen/controller/auth_controller.dart';
import 'screen/chat/controller/chat_controller.dart';
import 'utils/app_routes.dart';
import 'package:flutter/services.dart';

LatLng? currentLatLng;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preferences.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      animationCurve: Curves.easeIn,
      animationDuration: const Duration(milliseconds: 200),
      duration: const Duration(seconds: 3),
      child: ScreenUtilInit(
        designSize: const Size(412, 917),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        rebuildFactor: (old, data) => true,
        builder: (context, child) {
          Get.put(SocketService());
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
      ),
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
    Get.lazyPut(() => ContactController(), fenix: true);
  }
}
