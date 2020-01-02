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

import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/shape/gf_shape.dart';
import 'package:ui_kit/components/slider/gf_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:ui_kit/position/gf_position.dart';
import 'package:ui_kit/components/tabs/gf_tabs.dart';
import 'package:ui_kit/components/slider/gf_items_slider.dart';
import 'package:ui_kit/components/drawer/gf_drawer.dart';

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
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GFDrawer(
        colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
        backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.teal[800],
            Colors.teal[600],
            Colors.teal[400],
            Colors.teal[200],
          ],
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(),
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  Text('Drawer Header'),
                  Text('Drawer Header'),
                  Text('Drawer Header'),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Text(widget.title),

      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            GFItemsSlider(
                rowCount: 3,
                children: imageList.map(
                      (url) {
                    return Container(
                      margin: EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Image.network(
                            url,
                            fit: BoxFit.cover,
                            width: 1000.0
                        ),
                      ),
                    );
                  },
                ).toList(),
            ),

            GFSlider(
              rowCount: 3,
              pagerSize: 12.0,
              activeIndicator: Colors.pink,
              passiveIndicator: Colors.pink.withOpacity(0.4),
              viewportFraction: 1.0,
              aspectRatio: 2.0,
            autoPlay: true,
              enlargeMainPage: true,
              pagination: true,
              items: imageList.map(
                (url) {
                  return Container(
                    margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                        width: 1000.0
                      ),
                    ),
                  );
                },
              ).toList(),
              onPageChanged: (index) {
                setState(() {
                  index;
                });
              },
            ),

//            GFButton(
//              color: Colors.orange,
//              onPressed: null,
//              child: Text("share"),
//              type: GFType.outline,
//              shape: GFShape.pills,
////              buttonBoxShadow: true,
////              boxShadow: BoxShadow(
////                color: Colors.pink,
////                blurRadius: 1.5,
////                spreadRadius: 2.0,
////                offset: Offset.zero,
////              ),
//            ),

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
              indicatorColor: Colors.teal,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.lightGreen,
              unselectedLabelColor: Colors.black,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13.0,
                color: Colors.deepOrange,
                fontFamily: 'OpenSansBold',
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13.0,
                color: Colors.black,
                fontFamily: 'OpenSansBold',
              ),
            ),

//              GFSlider(
//                autoPlay: true,
//                viewportFraction: 1.0,
//                aspectRatio: MediaQuery.of(context).size.aspectRatio,
//                items: imageList.map(
//                  (url) {
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
//            GFCard(
//              boxFit: BoxFit.cover,
//              colorFilter: new ColorFilter.mode(
//                  Colors.black.withOpacity(0.67), BlendMode.darken),
//              image: Image.asset("lib/assets/food.jpeg"),
////              imageOverlay: AssetImage("lib/assets/food.jpeg"),
//              titlePosition: GFPosition.end,
//              title: GFListTile(
//                avatar: GFAvatar(
//                  child: Text("tb"),
//                ),
//                title: Text(
//                  'title',
//                  style: TextStyle(color: Colors.grey),
//                ),
//                subTitle: Text(
//                  'subtitle',
//                  style: TextStyle(color: Colors.grey),
//                ),
//                icon: GFIconButton(
//                  onPressed: null,
//                  icon: Icon(Icons.favorite_border),
//                  type: GFType.transparent,
//                ),
//              ),
//              content: Text(
//                "Flutter "
//                "Flutter is Google's mobile UI framework for crafting"
//                " high-quality native interfaces on iOS and Android in "
//                "Flutter ",
//                style: TextStyle(color: Colors.grey),
//              ),
//              buttonBar: GFButtonBar(
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  GFButton(
//                    onPressed: null,
//                    child: Text("favorite"),
//                    icon: Icon(Icons.favorite_border),
//                    type: GFType.transparent,
//                  ),
//                  GFButton(
//                    onPressed: null,
//                    child: Text("share"),
//                    icon: Icon(Icons.share),
//                    type: GFType.outline,
//                  ),
//                ],
//              ),
//            ),
//            GFButtonBar(
//              mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//                GFButton(
//                  onPressed: null,
//                  child: Text("like"),
//                  icon: Icon(Icons.favorite_border),
//                  type: GFType.transparent,
//                ),
//                GFButton(
//                  onPressed: null,
//                  child: Text("comment"),
//                ),
                GFButton(
                  color: Colors.teal,
                  onPressed: (){},
                  child: Text("share"),
                  icon: Icon(Icons.share),
                  type: GFType.outline,
                ),
//              ],
//            ),


//            GFListItem(
//              avatar: GFAvatar(
//                child: Text("tb"),
//              ),
//              title: Text('title'),
//              subTitle: Text('subtitle'),
//              icon: GFIconButton(
//                onPressed: null,
//                type: GFType.transparent,
//                icon: Icon(Icons.favorite_border),
//              ),
//            ),
//            GFImageOverlay(
//              width: MediaQuery.of(context).size.width,
//              margin: EdgeInsets.all(16.0),
//              padding: EdgeInsets.all(16.0),
//              child: Column(
//                children: <Widget>[
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                ],
//              ),
////              color: Colors.orange,
//              image: AssetImage("lib/assets/food.jpeg"),
//              boxFit: BoxFit.cover,
//              colorFilter: new ColorFilter.mode(
//                  Colors.black.withOpacity(0.6), BlendMode.darken),
//              borderRadius: new BorderRadius.circular(5.0),
////              border: Border.all(color: Colors.pink, width: 2.0),
//            ),
//            GFAvatar(
//              //              radius: 20.0,
////                 maxRadius: 50,
//
//              child: Text("de"),
//
////                 backgroundColor: Colors.pink,
////
//////              backgroundImage: ,
////
////              foregroundColor: Colors.deepOrangeAccent,
////
////       shape: GFShape.square,
////
////              size: GFSize.medium,
////
////              borderRadius: BorderRadius.circular(20.0),
//            ),
//            GFIconBadges(
//              onPressed: null,
//              child: GFIconButton(
//                onPressed: null,
//                icon: Icon(Icons.ac_unit),
//              ),
//              counterChild: GFBadge(
//                text: '12',
//
////                color: GFColor.dark,
////
////                shape: GFShape.circle,
////
////                size: GFSize.small,
////
////                border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
////
////                textColor: GFColor.white,
////
////                textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
////
////                borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.orange, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
//              ),
//            ),
//            GFIconButton(
//              onPressed: null,
//              icon: Icon(Icons.ac_unit),
////              iconSize: 12.0,
////              type: GFType.solid,
////              shape: GFShape.pills,
////              size: GFSize.large,
////              buttonBoxShadow: true,
////              color: GFColor.primary,
////              boxShadow: BoxShadow(
////                color: Colors.pink,
////                blurRadius: 2.0,
////                spreadRadius: 1.0,
////                offset: Offset.zero,
////              ),
////              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
////              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
//            ),
//            GFButtonBadge(
//              onPressed: null,
////              position: GFIconPosition.start,
////              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
////              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
//              text: 'goodies',
////              color: GFColor.danger,
////              shape: GFShape.pills,
////              type: GFType.outline,
////              size: GFSize.small,
//              counterChild: GFBadge(
//                child: Text("12"),
////              color: GFColor.dark,
////              shape: GFShape.circle,
////              size: GFSize.small,
////              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
////              textColor: GFColor.white,
////              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
//              ),
//            ),
//            GFBadge(
//              text: '12',
////              color: GFColor.dark,
////              shape: GFShape.circle,
////              size: GFSize.small,
////              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
////              textColor: GFColor.white,
////              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
//            ),
//            GFButton(
////              type: GFType.solid,
////              shape: GFShape.pills,
//              text: 'goodies',
//              onPressed: () {},
////              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
////              size: GFSize.large,
////              buttonBoxShadow: true,
////              blockButton: true,
////              fullWidthButton: true,
////              color: GFColor.primary,
////              textColor: GFColor.secondary,
////              icon: Icon(Icons.error, color: Colors.white,),
////              position: GFIconPosition.start,
////              boxShadow: BoxShadow(
////                color: Colors.pink,
////                blurRadius: 2.0,
////                spreadRadius: 1.0,
////                offset: Offset.zero,
////              ),
////              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
////              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
//            ),
          ],
        ),
      ),
    );
  }
}
