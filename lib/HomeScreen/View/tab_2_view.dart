import 'package:flutter/material.dart';

class Tab2View extends StatefulWidget {
  final Key? keyname;
  Tab2View({super.key, this.keyname});

  @override
  State<Tab2View> createState() => _Tab2ViewState();
}

class _Tab2ViewState extends State<Tab2View> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("tab2")],
    );
  }
}
