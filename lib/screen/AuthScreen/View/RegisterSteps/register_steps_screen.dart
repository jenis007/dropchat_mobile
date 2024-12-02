import 'package:dropchats/constant/app_assets.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/constant/app_textstyle.dart';
import 'package:dropchats/screen/AuthScreen/View/RegisterSteps/steo_2_screen.dart';
import 'package:dropchats/screen/AuthScreen/View/RegisterSteps/step_1_screen.dart';
import 'package:dropchats/screen/AuthScreen/View/RegisterSteps/step_3_screen.dart';
import 'package:dropchats/screen/AuthScreen/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RegisterStepsScreen extends StatefulWidget {
  const RegisterStepsScreen({super.key});

  @override
  State<RegisterStepsScreen> createState() => _RegisterStepsScreenState();
}

class _RegisterStepsScreenState extends State<RegisterStepsScreen> {

  List pages=[
    Step1Screen(),
    Step2Screen(),
    Step3Screen(),
  ];
  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<AuthController>(
      builder: (controller) {
        return SafeArea(
          child: Column(
            children: [SizedBox(height: 15.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(AppAssets.backArrow,height: 28.h,width: 28.h,),
                    SizedBox(width: 196.w,
                      child: LinearProgressIndicator(
                        value: (controller.currentPage + 1) / controller.totalPages,
                        backgroundColor: AppColor.greyLightColor,
                        valueColor: const AlwaysStoppedAnimation<Color>(AppColor.appPrimaryColor),
                        minHeight: 12.h,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Text("${controller.currentPage+1}/${controller.totalPages}",style: TextStyleHelper.blackColor20,)
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: (int page) {
                    controller.updateCurrentPage(page);
                  },
                  itemCount: controller.totalPages,
                  itemBuilder: (context, index) {
                    return pages[index];
                  },
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
