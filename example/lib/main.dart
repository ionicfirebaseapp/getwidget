import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/button/gf_button.dart';
import 'package:ui_kit/components/badge/gf_button_badge.dart';
import 'package:ui_kit/components/avatar/gf_avatar.dart';
import 'package:ui_kit/components/badge/gf_badge.dart';
import 'package:ui_kit/components/tabs/gf_segment_tabs.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/shape/gf_button_shape.dart';
import 'package:ui_kit/shape/gf_badge_shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui_kit/components/tabs/gf_tabs.dart';
import 'package:ui_kit/components/drawer/gf_drawer.dart';
import 'package:ui_kit/components/drawer/gf_drawer_header.dart';
import 'package:ui_kit/components/toast/gf_toast.dart';
import 'package:ui_kit/components/appbar/gf_appbar.dart';
import 'package:ui_kit/components/tabs/gf_tabBarView.dart';
import 'package:ui_kit/components/button/gf_icon_button.dart';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      drawer: GFDrawer(
//        colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
//        backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
//        gradient: LinearGradient(
//          begin: Alignment.topRight,
//          end: Alignment.bottomLeft,
//          stops: [0.1, 0.5, 0.7, 0.9],
//          colors: [
//            Colors.teal[800],
//            Colors.teal[600],
//            Colors.teal[400],
//            Colors.teal[200],
//          ],
//        ),
//        child: ListView(
//          padding: EdgeInsets.zero,
//          children: <Widget>[
//            GFDrawerHeader(
//              currentAccountPicture: GFAvatar(
//                radius: 80.0,
//                backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
//              ),
//
//              decoration: BoxDecoration(
//                color: Colors.teal.withOpacity(0.45),
//              ),
//              otherAccountsPictures: <Widget>[
//                Image(
//                  image: NetworkImage("https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg"),
//                  fit: BoxFit.cover,
//                ),
//                GFAvatar(
//                  child: Text("dcf"),
//                )
//              ],
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.start,
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Text('user'),
//                  Text('user@asdf.com'),
//                ],
//              ),
//            ),
//            ListTile(
//              title: Text('Item 1'),
//              onTap: () {
//                Navigator.pop(context);
//              },
//            ),
//            ListTile(
//              title: Text('Item 2'),
//              onTap: () {
//              },
//            ),
//          ],
//        ),
//      ),
      appBar: GFAppBar(
        backgroundColor: Colors.tealAccent,
        centerTitle: true,
        title:
        Text("UI KIT"),
//        GFSegmentTabs(
//          tabController: tabController,
//          initialIndex: 0,
//          length: 3,
//          tabs: <Widget>[
//            Tab(
//              child: Text(
//                "cream",
//              ),
//            ),
//            Tab(
//              child: Text(
//                "serum",
//              ),
//            ),
//            Tab(
//              child: Text(
//                "toner",
//              ),
//            ),
//          ],
////          borderRadius: BorderRadius.circular(50.0),
//        ),
//        trailing: <Widget>[
//          GFIconButton(icon: Icon(Icons.directions_bus), onPressed: null)
//        ],
      ),
//      backgroundColor: Colors.teal,
      body:
//        GFTabBarView(controller: tabController, children: <Widget>[
//          Container(color: Colors.red),
//          Container(color: Colors.green),
//          Container(color: Colors.blue)
//      ]),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        GFButton(
          text: 'goodies',
          onPressed: (){},
//          textColor: GFColor.danger,
//          icon: Icon(Icons.access_alarms),
//          hoverColor: GFColor.dark,
          color: GFColor.secondary,
//          focusColor: GFColor.danger,
          type: GFType.outline2x,
          shape: GFButtonShape.pills,
//          splashColor: GFColor.warning,
//          highlightColor: GFColor.alt,
//          size: GFSize.large,
//          disabledColor: GFColor.dark,
//          disabledTextColor: GFColor.light,
          blockButton: true,
//          fullWidthButton: true,
//          borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//          borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
        ),

        GFIconButton(
          onPressed: null,
          icon: Icon(Icons.ac_unit,),
//              iconSize: 12.0,
          type: GFType.outline2x,
//          shape: GFButtonShape.pills,
//          size: GFSize.large,
//              buttonBoxShadow: true,
              color: GFColor.secondary,
//              boxShadow: BoxShadow(
//                color: Colors.pink,
//                blurRadius: 2.0,
//                spreadRadius: 1.0,
//                offset: Offset.zero,
//              ),
//              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
        ),

        RaisedButton(
          child: Text('goodiesMaterialButton button '),
          onPressed: (){},
//          color: Colors.blueGrey,
//          hoverColor: Colors.blueGrey,
//          focusColor: Colors.teal,
//          splashColor: Colors.amber,
//          highlightColor: Colors.cyan,
        ),
      ],
    )
//      SingleChildScrollView(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            GFAvatar(
//              radius: 80.0,
//              backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
//            ),
//
//            GFSegmentTabs(
//              tabController: tabController,
////              height: 38.0,
////              width: 180.0,
//              initialIndex: 0,
//              length: 3,
//              tabs: <Widget>[
//                Tab(
//                  child: Text(
//                    "Gelatin",
//                  ),
//                ),
//                Tab(
//                  child: Text(
//                    "Donuts",
//                  ),
//                ),
//                Tab(
//                  child: Text(
//                    "Pastry",
//                  ),
//                ),
//              ],
////              tabBarColor: Colors.pink.withOpacity(0.6),
////              indicatorSize: TabBarIndicatorSize.tab,
////              indicatorColor: Colors.tealAccent,
////              indicator: BoxDecoration(
////                color: Colors.pink,
////                border: Border.all(color: Colors.green, width: 1.0),
////                borderRadius: BorderRadius.circular(50.0)
////              ),
////              indicatorPadding: EdgeInsets.all(8.0),
////              indicatorWeight: 2.0,
////              border: Border.all(color: Colors.orange, width: 2.0),
////                borderRadius: BorderRadius.circular(50.0)
//            ),

//            GFTabBarView(
//                controller: tabController,
//                height: 400.0,
//                children: <Widget>[
//                  Container(color: Colors.red),
//                  Container(color: Colors.green),
//                  Container(color: Colors.blue)
//                ]
//            ),

//            GFItemsSlider(
//                rowCount: 3,
//                children: imageList.map(
//                      (url) {
//                    return Container(
//                      margin: EdgeInsets.all(5.0),
//                      child: ClipRRect(
//                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                        child: Image.network(
//                            url,
//                            fit: BoxFit.cover,
//                            width: 1000.0
//                        ),
//                      ),
//                    );
//                  },
//                ).toList(),
//            ),

//            GFSlider(
//              rowCount: 3,
//              pagerSize: 12.0,
//              activeIndicator: Colors.pink,
//              passiveIndicator: Colors.pink.withOpacity(0.4),
//              viewportFraction: 1.0,
//              aspectRatio: 2.0,
//            autoPlay: true,
//              enlargeMainPage: true,
//              pagination: true,
//              items: imageList.map(
//                (url) {
//                  return Container(
//                    margin: EdgeInsets.all(5.0),
//                    child: ClipRRect(
//                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                      child: Image.network(
//                        url,
//                        fit: BoxFit.cover,
//                        width: 1000.0
//                      ),
//                    ),
//                  );
//                },
//              ).toList(),
//              onPageChanged: (index) {
//                setState(() {
//                  index;
//                });
//              },
//            ),


//          GFTabs(
//            initialIndex: 0,
//            length: 3,
//            tabs: <Widget>[
//              GFButton(
//                onPressed: null,
//                child: Text("share"),
//                icon: Icon(Icons.share),
//                buttonBoxShadow: true,
//              ),
//              Tab(
//                icon: Icon(Icons.error),
//                child: Text(
//                  "Orders",
//                ),
//              ),
//              Tab(
//                child: Text(
//                  "Pastry",
//                ),
//              ),
//            ],
//            tabBarView: GFTabBarView(
//              children: <Widget>[
//                Container(
//                  color: Colors.red,
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: <Widget>[
//
//                      GFToast(
//                        child: Text("sdc"),
//                        backgroundColor: Colors.pink,
//                        button: GFButton(
//                          text: 'dsx',
//                          onPressed: (){
//                            print("fdsc");
//                          },
//                        ),
//                      ),
//                      RawMaterialButton(
//                        onPressed: null,
//                        child: Text("fv"),
//                      ),
//                      FlatButton(onPressed: null, child: Text("cds")),
//                      Icon(Icons.directions_railway),
//                      GFButton(
//                        onPressed: null,
//                        child: Text("share"),
//                        icon: Icon(Icons.share),
//                        shape: GFButtonShape.pills,
//                        type: GFType.transparent,
//                      ),
//                    ],
//                  ),
//                ),
//                Icon(Icons.directions_car),
//                Icon(Icons.directions_transit),
//              ],
//            ),
//            indicatorColor: Colors.teal,
////            indicatorSize: TabBarIndicatorSize.label,
////            labelColor: Colors.lightGreen,
////            unselectedLabelColor: Colors.black,
////            labelStyle: TextStyle(
////              fontWeight: FontWeight.w500,
////              fontSize: 13.0,
////              color: Colors.deepOrange,
////              fontFamily: 'OpenSansBold',
////            ),
////            unselectedLabelStyle: TextStyle(
////              fontWeight: FontWeight.w500,
////              fontSize: 13.0,
////              color: Colors.black,
////              fontFamily: 'OpenSansBold',
////            ),
//          ),
//
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
//                GFButton(
//                  color: Colors.teal,
//                  onPressed: (){},
//                  child: Text("share"),
//                  icon: Icon(Icons.share),
//                  type: GFType.outline,
//                ),
//              ],
//            ),
//
//
//        GFListTile(
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
//       shape: GFAvatarShape.standard,
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
////                color: GFColor.dark
//////,
////                shape: GFBadgeShape.circle,
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
//              type: GFType.solid,
//              shape: GFButtonShape.pills,
//              size: GFSize.large,
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
////              shape: GFButtonShape.pills,
//              type: GFType.outline,
////              size: GFSize.small,
//              counterChild: GFBadge(
//                child: Text("12"),
////              color: GFColor.dark,
//              shape: GFBadgeShape.circle,
////              size: GFSize.small,
////              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
////              textColor: GFColor.white,
////              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
//              ),
//            ),
//            GFBadge(
//              text: '12',
////              color: GFColor.dark,
//              shape: GFBadgeShape.circle,
////              size: GFSize.small,
////              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
////              textColor: GFColor.white,
////              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
//            ),

//            GFButton(
//              type: GFType.solid,
//              shape: GFButtonShape.pills,
//              text: 'goodies',
//              onPressed: () {
//                print('dddddddddd');
//              },
//              hoverColor: Colors.orange,
//              focusColor: Colors.teal,
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
//          ],
//        ),
//      ),
    );
  }
}
