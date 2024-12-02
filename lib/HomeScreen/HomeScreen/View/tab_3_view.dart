import 'package:flutter/material.dart';

class Tab3View extends StatefulWidget {
  const Tab3View({super.key});

  @override
  State<Tab3View> createState() => _Tab3ViewState();
}

class _Tab3ViewState extends State<Tab3View> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("tab3")],
    );
  }
}
