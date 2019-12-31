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
import 'package:ui_kit/components/image/gf_image_overlay.dart';
import 'package:ui_kit/shape/gf_shape.dart';
import 'package:ui_kit/components/slider/gf_slider.dart';
import 'package:ui_kit/shape/gf_shape.dart';
import 'package:ui_kit/components/toggle/gf_toggle.dart';
import 'package:ui_kit/types/gf_toggle_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui_kit/components/header/gf_header.dart';
import 'package:ui_kit/position/gf_position.dart';

import 'package:ui_kit/components/toast/gf_toast.dart';
import 'package:ui_kit/types/gf_heading_type.dart';
import 'package:ui_kit/components/toast/gf_floating_widget.dart';


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

//      home: MyHomePage(title: 'UI_KIT_EXAMPLE'),
      home: MyHomePage(
        title: 'UI KIT',
      ),
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
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body:
     GFFloatingWidget(
       horizontalPosition: screenHeight * 0.1,
//       verticalPosition: screenWidth* 0.2,
child: GFToast(
  backgroundColor: GFColor.warning,

  button:  GFButton(
    type: GFType.outline,
    text: 'OK',
    onPressed: null,
  ),
  text: 'Marked as Favorite ',
),
//       child: GFToggle(onChanged: null, value: null,
//       type: GFToggleType.ios,
//       ),
       body:  SingleChildScrollView(
         child:

         Column(
           children: <Widget>[


//      GFCard(
////      boxFit: BoxFit.cover,
////        colorFilter: new ColorFilter.mode(
////            Colors.black.withOpacity(0.67), BlendMode.darken),
//        image: Image.asset("lib/assets/food.jpeg"),
////              imageOverlay: AssetImage("lib/assets/food.jpeg"),
//        titlePosition: GFPosition.end,
//        title: GFListTile(
//          avatar: GFAvatar(
//            child: Text("tb"),
//          ),
//          title: Text(
//            'title',
//            style: TextStyle(color: Colors.grey),
//          ),
//          subTitle: Text(
//            'subtitle',
//            style: TextStyle(color: Colors.grey),
//          ),
//          icon: GFIconButton(
//            onPressed: null,
//            icon: Icon(Icons.favorite_border),
//            type: GFType.transparent,
//          ),
//        ),
//      ),


             GFFloatingWidget(
               horizontalPosition: 30,
             ),

             GFAvatar(),
             GFBadge(
                 child: Text('1')),
             GFButton(onPressed: null,
               type: GFType.solid,
               text: 'CLICK',
//  position: GFPosition.end,
               icon: Icon(Icons.face),
               textStyle: TextStyle(color: Colors.black),
             ),

             GFButtonBar(
               children: <Widget>[
                 Text('jk'),
                 Icon(Icons.face)
               ],
             ),



             GFListTile(
               avatar: Icon(Icons.format_align_center),
               icon:Icon(Icons.format_align_center),
               title: GFHeader(
                   type: GFHeadingType.typo3,
                   text: 'GFHeader in GFListTile',

                   backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2019/12/22/19/14/christmas-4713177_960_720.jpg')
               ),
               subTitle: Text('Sub Header'),
               description: Text('Lorem ipsum gf header used to show the header of the list tile'),
               showDivider: false,
             ),


             Container(
               margin: EdgeInsets.only(top:10),
               child:   GFToast(
                 backgroundColor: GFColor.primary,

                 button:  GFToggle(
                   onChanged: null,
                   value: null,
                   type: GFToggleType.ios,
                   duration: Duration(milliseconds: 400),
                 ),
//           text: 'hjkk',
                 text: 'who  hbdi  h nedj  bdj vcej vcbejb yhjycen bcekj bcen bdjn bcenk jhcnekj',
               ),
             ),

             Container(
               margin: EdgeInsets.only(top:10),
               child:   GFToast(
                 backgroundColor: GFColor.primary,

                 button:  GFButton(
                   type: GFType.outline,
                   text: 'CLICK',
                   onPressed: null,
//                position: GFPosition.end,
                 ),
                 text: 'Marked',
               ),
             ),
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

             GFImageOverlay(
                 height: 250,

                 child: Column(
                   children: <Widget>[
                     GFHeader(
                       text: 'GET FLUTTER HEADER',
                       type: GFHeadingType.typo3,
                       textColor: GFColor.white,
                       dividerColor: GFColor.white,
//                  dividerWidth: 20,
                     ),
                     GFListTile(
                       avatar: GFAvatar(
                         backgroundColor: Colors.white,
                       ),
                       icon:Icon(Icons.keyboard_arrow_right, color: Colors.white,),
                       title: GFHeader(
                           type: GFHeadingType.typo3,
                           text: 'GFHeader in GFListTile',

                           backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2019/12/22/19/14/christmas-4713177_960_720.jpg')
                       ),
                       subTitle: Text('Sub Header', style: TextStyle(color: Colors.white),),
                       description: Text('Lorem ipsum gf header used to show the header of the list tile', style: TextStyle(color: Colors.white),),
                       showDivider: false,
                     ),

                     GFToast(
                       backgroundColor: GFColor.primary,

                       button:  GFButton(
                         type: GFType.outline,
                         text: 'CLICK',
                         onPressed: null,
//                position: GFPosition.end,
                       ),
                       text: 'Marked as Favorite ',
                     ),
                   ],
                 ),
//            height: screenHeight,
//width: screenWidth,
//          image: NetworkImage('https://cdn.pixabay.com/photo/2019/12/22/19/14/christmas-4713177_960_720.jpg'),

                 image: AssetImage('lib/assets/food.jpeg')
             )


           ],
         ),
       ),
     )
    );
      // body: DefaultTabController(
      //   length: 3,
      //   child: Scaffold(
      //     appBar: AppBar(
      //       bottom: TabBar(
      //         tabs: [
      //           Tab(icon: Icon(Icons.directions_car)),
      //           Tab(icon: Icon(Icons.directions_transit)),
      //           Tab(icon: Icon(Icons.directions_bike)),
      //         ],
      //       ),
      //       title: Text('Tabs Demo'),
      //     ),
      //     body: TabBarView(
      //       children: [
      //         Icon(Icons.directions_car),
      //         Icon(Icons.directions_transit),
      //         Icon(Icons.directions_bike),
      //       ],
      //     ),
      //   ),
      // ),
//        SingleChildScrollView(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[

//            GFSlider(
////              pagerSize: 12.0,
////              activeIndicator: Colors.pink,
////              passiveIndicator: Colors.pink.withOpacity(0.4),
//            viewportFraction: 0.9,
//            aspectRatio: 2.0,
////            autoPlay: true,
//            enlargeMainPage: true,
//            pagination: true,
//            items: imageList.map(
//                  (url) {
//                return Container(
//                  margin: EdgeInsets.all(5.0),
//                  child: ClipRRect(
//                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                    child: Image.network(
//                      url,
//                      fit: BoxFit.cover,
//                      width: 1000.0,
//                    ),
//                  ),
//                );
//              },
//            ).toList(),
//            onPageChanged: (index) {
//              setState(() {
//                index;
//              });
//            },
//          ),

//              GFSlider(
//                autoPlay: true,
//                viewportFraction: 1.0,
//                aspectRatio: MediaQuery.of(context).size.aspectRatio,
//                items: imageList.map((url) {
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

//              GFCard(
//                boxFit: BoxFit.cover,
//                colorFilter: new ColorFilter.mode(
//                    Colors.black.withOpacity(0.67), BlendMode.darken),
//                image: Image.asset("lib/assets/food.jpeg"),
////              imageOverlay: AssetImage("lib/assets/food.jpeg"),
//                titlePosition: GFPosition.end,
//                title: GFTitleBar(
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
//                  "Flutter is Google's mobile UI framework for crafting"
//                  " high-quality native interfaces on iOS and Android in "
//                  "Flutter ",
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

//            GFButtonBar(
//              mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//                GFButton(onPressed: null, child: Text("like"), icon: Icon(Icons.favorite_border), type: GFType.transparent,),
//                GFButton(onPressed: null, child: Text("comment"),),
//                GFButton(onPressed: null, child: Text("share"), icon: Icon(Icons.share), type: GFType.outline,),
//              ],
//            ),
//
//            GFTitleBar(
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

//              GFImageOverlay(
//                width: MediaQuery.of(context).size.width,
//                margin: EdgeInsets.all(16.0),
//                padding: EdgeInsets.all(16.0),
//                child: Column(
//                  children: <Widget>[
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                  ],
//                ),
////              color: Colors.orange,
//                image: AssetImage("lib/assets/food.jpeg"),
//                boxFit: BoxFit.cover,
//                colorFilter: new ColorFilter.mode(
//                    Colors.black.withOpacity(0.6), BlendMode.darken),
//                borderRadius: new BorderRadius.circular(5.0),
////              border: Border.all(color: Colors.pink, width: 2.0),
//              ),

      // Card(
      //   child: Column(
      //     children: <Widget>[
      //       Text("czsd"),
      //       Row(
      //         children: <Widget>[
      //           OutlineButton(
      //             onPressed: null,
      //             child: Text("dscds"),
      //             color: Colors.orange,
      //           ),
      //           FlatButton(onPressed: null, child: Text("dchbvj"))
      //         ],
      //       )
      //     ],
      //   ),
      // ),

      // GFButtonBar(
      //   mainAxisSize: MainAxisSize.min,
      //   children: <Widget>[
      //     GFButton(
      //       onPressed: null,
      //       child: Text("like"),
      //       icon: Icon(Icons.favorite_border),
      //       type: GFType.transparent,
      //     ),
      //     GFButton(
      //       onPressed: null,
      //       child: Text("comment"),
      //     ),
      //     GFButton(
      //       onPressed: null,
      //       child: Text("share"),
      //       icon: Icon(Icons.share),
      //       type: GFType.outline,
      //     ),
      //   ],
      // ),

      // GFTitleBar(
      //   avatar: GFAvatar(
      //     child: Text("tb"),
      //   ),
      //   title: Text('title'),
      //   subTitle: Text('subtitle'),
      //   icon: GFIconButton(
      //     type: GFType.transparent,
      //     icon: Icon(Icons.favorite_border),
      //   ),
      // ),

//            GFCard(

//              headertype: GFAtb(),

//              po

//              image

//              overlaytext

//              content: Text("content"),

//      buttonbar: gfbb()

//            ),

//

//            gfbb(

//              children[

//

//              ]

//            )

//            GFimageoverlay()

//               GFAvatar(
// //              radius: 20.0,
//                 maxRadius: 50,

//                 child: Text("de"),

//                 backgroundColor: Colors.pink,

//              backgroundImage: ,

//              foregroundColor: Colors.deepOrangeAccent,

      // shape: GFShape.square,

//              size: GFSize.medium,

//              borderRadius: BorderRadius.circular(20.0),
      // ),

      // GFIconBadges(
      //   onPressed: null,
      //   child: GFIconButton(
      //     onPressed: null,
      //     icon: Icon(Icons.ac_unit),
      //   ),
      //   counterChild: GFBadge(
      //     text: '12',

//                color: GFColor.dark,

//                shape: GFShape.circle,

//                size: GFSize.small,

//                border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),

//                textColor: GFColor.white,

//                textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),

//                borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.orange, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
      //   ),
      // ),

      // GFIconButton(
      //   onPressed: null,

      //   icon: Icon(Icons.ac_unit),

//              iconSize: 12.0,

//              type: GFType.solid,

//              shape: GFShape.pills,

//              size: GFSize.large,

//              buttonBoxShadow: true,

//              color: GFColor.primary,

//              boxShadow: BoxShadow(

//                color: Colors.pink,

//                blurRadius: 2.0,

//                spreadRadius: 1.0,

//                offset: Offset.zero,

//              ),

//              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),

//              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
      // ),

//               GFButtonBadge(
//                 onPressed: null,

// //              position: GFIconPosition.start,

// //              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),

// //              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),

//                 text: 'goodies',

// //              color: GFColor.danger,

// //              shape: GFShape.pills,

// //              type: GFType.outline,

// //              size: GFSize.small,

//                 counterChild: GFBadge(
//                   child: Text("12"),

// //              color: GFColor.dark,

// //              shape: GFShape.circle,

// //              size: GFSize.small,

// //              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),

// //              textColor: GFColor.white,

// //              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
//                 ),
//               ),

//               GFBadge(
//                 text: '12',

// //              color: GFColor.dark,

// //              shape: GFShape.circle,

// //              size: GFSize.small,

// //              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),

// //              textColor: GFColor.white,

// //              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
//               ),

//               GFButton(
// //              type: GFType.solid,

// //              shape: GFShape.pills,

//                 text: 'goodies',

//                 onPressed: () {},

//              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),

//              size: GFSize.large,

//              buttonBoxShadow: true,

//              blockButton: true,

//              fullWidthButton: true,

//              color: GFColor.primary,

//              textColor: GFColor.secondary,

//              icon: Icon(Icons.error, color: Colors.white,),

//              position: GFIconPosition.start,

//              boxShadow: BoxShadow(

//                color: Colors.pink,

//                blurRadius: 2.0,

//                spreadRadius: 1.0,

//                offset: Offset.zero,

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
//            counterChild: GFBadge(
//              child: Text("12"),
////              color: GFColor.dark,
////              shape: GFShape.circle,
////              size: GFSize.small,
////              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
////              textColor: GFColor.white,
////              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
//            ),
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
//            ],
//          ),
//        )
      // )

  }
}
