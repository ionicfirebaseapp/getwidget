

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

import 'package:ui_kit/components/list_tile/gf_list_tile.dart';
import 'package:ui_kit/components/toast/gf_floating_widget.dart';
import 'package:ui_kit/components/toast/gf_toast.dart';

import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/shape/gf_shape.dart';
import 'package:ui_kit/components/slider/gf_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:ui_kit/position/gf_position.dart';
import 'package:ui_kit/components/tabs/gf_tabs.dart';
import 'package:ui_kit/components/toggle/gf_toggle.dart';
import 'package:ui_kit/components/header/gf_header.dart';
import 'package:ui_kit/types/gf_heading_type.dart';
import 'package:ui_kit/types/gf_toggle_type.dart';

final List<String> imageList = [
  "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
  "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg"
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
  bool switchValue = true;
  bool showToast = false ;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
//      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GFFloatingWidget(
//        horizontalPosition: screenHeight* 0.8,
        child: showToast? GFToast(
          text: 'xfcgvhjk',


        ): Container(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              



//
//              Container(
//                margin: EdgeInsets.only(top:10),
//                child:   GFToast(
//                  backgroundColor: GFColor.warning,
//
//                  button:  GFButton(
//                    type: GFType.outline,
//                    text: 'CLICK',
//                    onPressed: null,
////                position: GFPosition.end,
//                  ),
//                  text: 'Marked as favorites',
//                ),
//              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GFToggle(
                      onChanged: null,
                      value: null,
                      type: GFToggleType.android,
                      duration: Duration(milliseconds: 400),
                    ),
                    GFToggle(
                      onChanged: null,
                      value: null,
                      type: GFToggleType.ios,
                      duration: Duration(milliseconds: 400),
                    ),
                    GFToggle(
                      onChanged: null,
                      value: null,
                      type: GFToggleType.custom,
                      duration: Duration(milliseconds: 400),
                    ),
                    GFToggle(
                      onChanged: (val) {
                        print(val);
                      },
                      value: null,
                      type: GFToggleType.square,
                      duration: Duration(milliseconds: 400),
                    ),
                  ],
                ),
              ),



              Container(
//            padding: EdgeInsets.only(left: 20, right: 20),
                  child:  Column(
                    children: <Widget>[
                      GFHeader(
                        text: 'GET FLUTTER HEADER',
                        type: GFHeadingType.typo1,

                      ),
                      GFHeader(
                        text: 'GET FLUTTER HEADER',
                        type: GFHeadingType.typo2,

                      ),
                      GFHeader(
                        text: 'GET FLUTTER HEADER',
                        type: GFHeadingType.typo3,
//                  dividerWidth: 20,
                      ),
                      GFHeader(
                        text: 'GET FLUTTER HEADER',
                        type: GFHeadingType.typo4,

                      ),
                      GFHeader(
                        text: 'GET FLUTTER HEADER',
                        type: GFHeadingType.typo5,

                      ),
                      GFHeader(
                        text: 'GET FLUTTER HEADER',
                        type: GFHeadingType.typo6,

                      ),
                    ],
                  )
              ),

//              GFSlider(
////              pagerSize: 12.0,
////              activeIndicator: Colors.pink,
////              passiveIndicator: Colors.pink.withOpacity(0.4),
//                viewportFraction: 0.9,
//                aspectRatio: 2.0,
////            autoPlay: true,
//                enlargeMainPage: true,
//                pagination: true,
//                items: imageList.map(
//                      (url) {
//                    return Container(
//                      margin: EdgeInsets.all(5.0),
//                      child: ClipRRect(
//                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                        child: Image.network(
//                          url,
//                          fit: BoxFit.cover,
//                          width: 1000.0,
//                        ),
//                      ),
//                    );
//                  },
//                ).toList(),
//                onPageChanged: (index) {
//                  setState(() {
//                    index;
//                  });
//                },
//              ),

              GFButton(onPressed: (){
                setState(() {
                  print(showToast);
                  showToast = !showToast;
                });
              },
                type: GFType.outline,
                child: Text('Show toast'),
              ),

              GFButton(
                color: Colors.orange,
                onPressed: null,
                child: Text("share"),
                type: GFType.outline,
                shape: GFShape.pills,
//              buttonBoxShadow: true,
//              boxShadow: BoxShadow(
//                color: Colors.pink,
//                blurRadius: 1.5,
//                spreadRadius: 2.0,
//                offset: Offset.zero,
//              ),
              ),

              GFButton(
                color: Colors.orange,
                onPressed: null,
                child: Text("share"),
                type: GFType.outline,
                shape: GFShape.pills,
//              buttonBoxShadow: true,
//              boxShadow: BoxShadow(
//                color: Colors.pink,
//                blurRadius: 1.5,
//                spreadRadius: 2.0,
//                offset: Offset.zero,
//              ),
              ),

              GFTabs(
                initialIndex: 0,
                length: 3,
                tabs: <Widget>[
                  GFButton(
                    onPressed: null,
                    child: Text("share"),
                    icon: Icon(Icons.share),
                    buttonBoxShadow: true,
                  ),
                  Tab(
                    icon: Icon(Icons.error),
                    child: Text(
                      "Orders",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Pastry",
                    ),
                  ),
                ],
                tabBarView: TabBarView(
                  children: <Widget>[
                    Container(
                      color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          RawMaterialButton(
                            onPressed: null,
                            child: Text("fv"),
                          ),
                          FlatButton(onPressed: null, child: Text("cds")),
                          Icon(Icons.directions_railway),
                          GFButton(
                            onPressed: null,
                            child: Text("share"),
                            icon: Icon(Icons.share),
                            shape: GFShape.pills,
                            type: GFType.transparent,
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.directions_car),
                    Icon(Icons.directions_transit),
                  ],
                ),
              ),
//              GFCard(
//                boxFit: BoxFit.cover,
//                colorFilter: new ColorFilter.mode(
//                    Colors.black.withOpacity(0.67), BlendMode.darken),
//                image: Image.asset("lib/assets/food.jpeg"),
////              imageOverlay: AssetImage("lib/assets/food.jpeg"),
//                titlePosition: GFPosition.end,
//                title: GFListTile(
//                  avatar: GFAvatar(
//                    child: Text("tb"),
//                  ),
//                  title: Text(
//                    'title',
//                    style: TextStyle(color: Colors.grey),
//                  ),
//                  subTitle: Text(
//                    'subtitle',
//                    style: TextStyle(color: Colors.grey),
//                  ),
//                  icon: GFIconButton(
//                    onPressed: null,
//                    icon: Icon(Icons.favorite_border),
//                    type: GFType.transparent,
//                  ),
//                ),
//                content: Text(
//                  "Flutter "
//                      "Flutter is Google's mobile UI framework for crafting"
//                      " high-quality native interfaces on iOS and Android in "
//                      "Flutter ",
//                  style: TextStyle(color: Colors.grey),
//                ),
//                buttonBar: GFButtonBar(
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    GFButton(
//                      onPressed: null,
//                      child: Text("favorite"),
//                      icon: Icon(Icons.favorite_border),
//                      type: GFType.transparent,
//                    ),
//                    GFButton(
//                      onPressed: null,
//                      child: Text("share"),
//                      icon: Icon(Icons.share),
//                      type: GFType.outline,
//                    ),
//                  ],
//                ),
//              ),
//              GFButtonBar(
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  GFButton(
//                    onPressed: null,
//                    child: Text("like"),
//                    icon: Icon(Icons.favorite_border),
//                    type: GFType.transparent,
//                  ),
//                  GFButton(
//                    onPressed: null,
//                    child: Text("comment"),
//                  ),
//                  GFButton(
//                    onPressed: null,
//                    child: Text("share"),
//                    icon: Icon(Icons.share),
//                    type: GFType.outline,
//                  ),
//                ],
//              ),
            ],
          ),
        ),
      )
    );
  }
}
