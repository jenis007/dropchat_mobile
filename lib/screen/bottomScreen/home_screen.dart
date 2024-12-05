import 'package:dropchats/widgets/common_bottombar.dart';
import 'package:flutter/material.dart';

class MainBottomScreen extends StatefulWidget {
  const MainBottomScreen({super.key});

  @override
  State<MainBottomScreen> createState() => _MainBottomScreenState();
}

class _MainBottomScreenState extends State<MainBottomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonBottomBar(),
    );
  }
}
