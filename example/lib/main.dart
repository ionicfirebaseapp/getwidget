import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/button/gf_button.dart';
import 'package:ui_kit/components/button/gf_icon_button.dart';
import 'package:ui_kit/components/badge/gf_button_badge.dart';
import 'package:ui_kit/components/badge/gf_icon_badge.dart';
import 'package:ui_kit/components/avatar/gf_avatar.dart';
import 'package:ui_kit/components/badge/gf_badge.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/components/list_tile/gf_list_tile.dart';
import 'package:ui_kit/components/image/gf_image_overlay.dart';
import 'package:ui_kit/components/button_bar/gf_button_bar.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/shape/gf_avatar_shape.dart';
import 'package:ui_kit/shape/gf_button_shape.dart';
import 'package:ui_kit/shape/gf_badge_shape.dart';
import 'package:ui_kit/components/slider/gf_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:ui_kit/position/gf_position.dart';
import 'package:ui_kit/components/tabs/gf_tabs.dart';
import 'package:ui_kit/components/slider/gf_items_slider.dart';
import 'package:ui_kit/components/drawer/gf_drawer.dart';
import 'package:ui_kit/components/drawer/gf_drawer_header.dart';

final List<String> imageList = [
  "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
  "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
  "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI_KIT_EXAMPLE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'UI_KIT_EXAMPLE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GFButtonBadge(
          color: GFColor.light,
          text: 'hi',
          onPressed: null,
          counterChild: GFBadge(
            text: '12',
            color: GFColor.warning,
          ),
          position: GFPosition.start,
        ),
      ),
    );
  }
}
