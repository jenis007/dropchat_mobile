import 'package:dropchats/screen/OnBoarding/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'screen/AuthScreen/controller/auth_controller.dart';
import 'utils/app_routes.dart';
import 'utils/shared_prefrence.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preferences.init();
  runApp(const MyApp());
}

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
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: GetMaterialApp(
            useInheritedMediaQuery: true,
            debugShowCheckedModeBanner: false,
            title: 'dropChats',
            theme: ThemeData(),
            initialBinding: BaseBinding(),
            initialRoute: Routes.splashScreen,
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
  }
}
