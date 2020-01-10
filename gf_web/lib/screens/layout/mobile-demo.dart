import 'package:flutter/material.dart';

class MobileDemo extends StatefulWidget {
  @override
  _MobileDemoState createState() => _MobileDemoState();
}

class _MobileDemoState extends State<MobileDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Image.asset('lib/assets/screen.png'),
    );
  }
}
