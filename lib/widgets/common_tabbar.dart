import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/app_color.dart';
import '../constant/app_textstyle.dart';

class CommonTabView extends StatelessWidget {
  final TabController tabController;
  final List<String> tabLabels;
  final List<Widget> tabViews;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final Color? indicatorColor;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;

  const CommonTabView({
    Key? key,
    required this.tabController,
    required this.tabLabels,
    required this.tabViews,
    this.labelColor = Colors.orange,
    this.unselectedLabelColor = Colors.black,
    this.indicatorColor = Colors.orange,
    this.labelStyle,
    this.unselectedLabelStyle,
  })  : assert(tabLabels.length == tabViews.length,
            "Tabs and views must have the same length"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tab Bar Section
        TabBar(
          padding: EdgeInsets.only(
            right: 40.w,
          ),
          // padding: EdgeInsets.only(right: 10.w, left: 10.w),
          dividerColor: Colors.transparent,
          controller: tabController,
          isScrollable:
              true, // Makes the TabBar scrollable if there are many tabs
          labelColor: labelColor,
          unselectedLabelColor: unselectedLabelColor,
          indicatorColor: indicatorColor,
          indicatorWeight: 3.0,
          unselectedLabelStyle: TextStyleHelper.primaryColor14
              .copyWith(color: AppColor.lightBlackColor),
          labelStyle: TextStyleHelper.primaryColor14
              .copyWith(color: AppColor.lightBlackColor),
          tabs: tabLabels
              .map((label) => Tab(
                    text: label,
                  ))
              .toList(),
        ),
        // Tab Views Section
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: tabViews,
          ),
        ),
      ],
    );
  }
}
// import 'package:dropchats/constant/app_color.dart';
// import 'package:dropchats/constant/app_textstyle.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CommonTabView extends StatelessWidget {
//   final TabController tabController;
//   final List<String> tabLabels;
//   final List<Widget> tabViews;
//
//   const CommonTabView({
//     super.key,
//     required this.tabController,
//     required this.tabLabels,
//     required this.tabViews,
//   }) : assert(tabLabels.length == tabViews.length,
//             "Tabs and views must have the same length");
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Align(
//           alignment: Alignment.center,
//           child: TabBar(
//             controller: tabController,
//             labelColor: Colors.orange,
//             unselectedLabelColor: Colors.black,
//             indicatorWeight: 3.0,
//             indicatorColor: Colors.orange, // Change as per your app theme
//             splashBorderRadius: BorderRadius.zero,
//             dividerColor: Colors.transparent,
//             labelPadding: EdgeInsets.zero,
//             padding: EdgeInsets.zero,
//             unselectedLabelStyle: TextStyleHelper.primaryColor14
//                 .copyWith(color: AppColor.lightBlackColor),
//             // automaticIndicatorColorAdjustment: true,
//             indicatorPadding: EdgeInsets.zero,
//             labelStyle: TextStyleHelper.primaryColor14,
//             tabs: tabLabels.map((label) => Tab(text: label)).toList(),
//           ),
//         ),
//         Expanded(
//           child: TabBarView(
//             controller: tabController,
//             children: tabViews,
//           ),
//         ),
//       ],
//     );
//   }
// }
