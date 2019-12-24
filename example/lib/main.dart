

import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';

import 'package:ui_kit/components/button/gf_button.dart';

import 'package:ui_kit/components/button/gf_icon_button.dart';

import 'package:ui_kit/components/badge/gf_button_badge.dart';

import 'package:ui_kit/components/badge/gf_icon_badge.dart';

import 'package:ui_kit/components/avatar/gf_avatar.dart';

import 'package:ui_kit/components/badge/gf_badge.dart';

import 'package:ui_kit/components/card/gf_card.dart';

import 'package:ui_kit/components/header_bar/gf_title_bar.dart';

import 'package:ui_kit/components/image/gf_image_overlay.dart';

import 'package:ui_kit/components/button_bar/gf_button_bar.dart';

import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/components/image/gf_image_overlay.dart';
import 'package:ui_kit/shape/gf_shape.dart';

import 'package:ui_kit/shape/gf_shape.dart';
import 'package:ui_kit/components/toggle/gf_toggle.dart';
import 'package:ui_kit/types/gf_toggle_type.dart';
import 'package:flutter/cupertino.dart';

import 'package:ui_kit/components/toast/gf_toast.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'UI_KIT_EXAMPLE',

      theme: ThemeData(

        primarySwatch: Colors.blue,

      ),

//      home: MyHomePage(title: 'UI_KIT_EXAMPLE'),
      home: Home(),

    );

  }

}



class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;

  bool isOn = false;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(1.0, 0.0))
        .animate(controller);
//    offset = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

    Column(
      children: <Widget>[
//        LabeledToggle(
//          thumbSize: 20,
//        ),
        Container(
//          height: 100,
//          height: 200,
          width: 200,
          color: Colors.red,
          margin: EdgeInsets.only(bottom:40, top: 40),
          child:   GFToast(
            bgColor: GFColor.primary,
//        button: GFButton(onPressed: null, type: GFType.outline,
//        text: 'Accept',),
//        text: 'Marked as Favorite.',

//            child: Column(
//              children: <Widget>[
//                Text('hygu', style: TextStyle(color:Colors.black87),),
//                Text('hygu', style: TextStyle(color:Colors.black87),),
//
//                Text('hygu', style: TextStyle(color:Colors.black87),),
//                Text('hygu', style: TextStyle(color:Colors.black87),),
//
//                Text('hygu', style: TextStyle(color:Colors.black87),),
//                Text('hygu', style: TextStyle(color:Colors.black87),),
//
//
//              ],
//            )
          ),
        ),
        LabeledToggle(


        ),

      GFToast(
        bgColor: GFColor.transparent,
//        button: GFButton(onPressed: null, type: GFType.outline,
//        text: 'Accept',),
//        text: 'Marked as Favorite.',

        child: Text('hygu', style: TextStyle(color:Colors.black87),),
      ),
//      Card(
//        child: Column(
//          children: <Widget>[
//            Text('fghj'),
//            Container(
//              height: 200,
//              width: 200,
//              color: Colors.red,
//              margin: EdgeInsets.only(bottom:40),
//            ),
//            GestureDetector(
//              onTap: (){
//                setState(() {
//                  isOn = !isOn;
//                });
//                print(controller.status);
//                switch (controller.status) {
//                  case AnimationStatus.dismissed:
//                    controller.forward();
//                    break;
//                  case AnimationStatus.completed:
//                    controller.reverse();
//                    break;
//                  default:
//                }
//
//              },
//              child:   Stack(
//                children: <Widget>[
//                  Container(
//                    height: 25,
//                    width:40,
////                    color:Colors.blue
//                  ),
//                  Positioned(
//                    top:5,
//                    child: Container(
//                      width: 36,
//                      height: 15,
//                      decoration: BoxDecoration(
//                          color: isOn ? Colors.green: Colors.grey,
//                          borderRadius: BorderRadius.all(Radius.circular(20))
//
//                      ),
//                      child:
//                      Padding(padding: EdgeInsets.only(left: 3, right: 3, top: 3.4), child:
//                      isOn?
//
//                           Text('ON', style: TextStyle(color: Colors.white, fontSize: 8),):
//                      Text('OFF', textAlign: TextAlign.end, style: TextStyle(color: Colors.white, fontSize: 8),))
//
//                    ),
//                  ),
//                  Positioned(
//                      top: 3,
//                      child: GestureDetector(
//                          onTap: (){
//                            setState(() {
//                              isOn = !isOn;
//                            });
//                            switch (controller.status) {
//                              case AnimationStatus.dismissed:
//                                controller.forward();
//                                break;
//                              case AnimationStatus.completed:
//                                controller.reverse();
//                                break;
//                              default:
//                            }
//                          },
//                          child:  SlideTransition(
//                            position: offset,
//                            child: Container(
//                              height: 20,
//                              width: 20,
//                              decoration: BoxDecoration(
//                                  shape: BoxShape.circle,
//                                  color: Colors.white,
//                                  boxShadow: [
//                                    new BoxShadow(
//                                        color: Colors.black.withOpacity(0.16),
//                                        blurRadius: 6.0,
//                                        spreadRadius: 0.0),
//                                  ]
//                              ),
//                            ),
//                          )
//                      )
//                  ),
//
//                ],
//              ),
//            )
//          ],
//        ),
//      ),

      ],
    )
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

        body: SingleChildScrollView(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[

              Card(

                child: Column(

                  children: <Widget>[

                    Text("czsd"),

                    Row(

                      children: <Widget>[

                        OutlineButton(onPressed: null, child: Text("dscds"), color: Colors.orange, ),

                        FlatButton(onPressed: null, child: Text("dchbvj"))

                      ],

                    )

                  ],

                ),

              ),

              GFButtonBar(

                mainAxisSize: MainAxisSize.min,

                children: <Widget>[

                  GFButton(onPressed: null, child: Text("like"), icon: Icon(Icons.favorite_border), type: GFType.transparent,),

                  GFButton(onPressed: null, child: Text("comment"),),

                  GFButton(onPressed: null, child: Text("share"), icon: Icon(Icons.share), type: GFType.outline,),

                ],

              ),

              GFTitleBar(

                avatar: GFAvatar(

                  child: Text("tb"),

                ),

                title: Text('title'),

                subTitle: Text('subtitle'),

                icon: GFIconButton(

                  type: GFType.transparent,

                  icon: Icon(Icons.favorite_border),

                ),

              ),



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

              GFAvatar(

//              radius: 20.0,
                maxRadius:50 ,

                child: Text("de"),

                backgroundColor: Colors.pink,

//              backgroundImage: ,

//              foregroundColor: Colors.deepOrangeAccent,

                shape: GFShape.square,

//              size: GFSize.medium,

//              borderRadius: BorderRadius.circular(20.0),

              ),
              Switch(
                onChanged: (v){},
                value: true,
//                activeColor: Colors.red,
                activeColor: Colors.white,
                activeTrackColor: Colors.green,
                inactiveTrackColor: Colors.grey,
                inactiveThumbColor: Colors.black,
//                activeThumbImage: NetworkImage("https://cdn.pixabay.com/photo/2016/11/10/17/00/forest-1814723_960_720.jpg",),

              ),

              CupertinoSwitch(
                onChanged: (v){},
                value: true,

              ),


              GFToggle(
                type: GFToggleType.iosSwitch,
                activeColor: Colors.red,
                activeThumbColor: Colors.blue,

                onChanged: (val){
                },
                value: true,
                minWidth: false,
              ),

            LabeledToggle(
              rounded: true,
              enabledText: 'OFF',
              disabledText: 'ON',
            ),
//
//              LabeledToggle(
//                transitionType: TextTransitionTypes.FADE,
//                rounded: true,
////                borderSize: 2.0,
////                duration: Duration(milliseconds: 500),
//                forceWidth: true,
//                value: switchValue,
//                onChanged: (v) {
//                  setState(() {
//                    switchValue = v;
//                  });
//                },
//                offBkColor: Colors.grey,
//                onBkColor: Colors.lightGreen,
//                offText: "FALSE",
//                onText: "TRUE",
//                offThumbColor: Colors.black,
//                onThumbColor: Colors.white,
//                thumbSize: 60.0,
//              ),


              Stack(
                children: <Widget>[
                  Container(
                    height: 30,
                    width:60,
//                    color:Colors.blue
                  ),

                  Positioned(
                    top:2,
                    child: Container(
                      width: 36,
                      height: 15,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(20))

                      ),

                    ),
                  ),
                  Positioned(
//                      right:20,

                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.black.withOpacity(0.16),
                                  blurRadius: 6.0,
                                  spreadRadius: 0.0),
                            ]
                        ),
                      )),


                ],
              ),


              GFIconBadges(

                onPressed: null,

                child: GFIconButton(

                  onPressed: null,

                  icon: Icon(Icons.ac_unit),

                ),

                counterChild: GFBadge(

                  text: '12',

//                color: GFColor.dark,

//                shape: GFShape.circle,

//                size: GFSize.small,

//                border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),

//                textColor: GFColor.white,

//                textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),

//                borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.orange, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),

                ),

              ),

              GFIconButton(

                onPressed: null,

                icon: Icon(Icons.ac_unit),

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

              ),



              GFButtonBadge(

                onPressed: null,

//              position: GFIconPosition.start,

//              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),

//              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),

                text: 'goodies',

//              color: GFColor.danger,

//              shape: GFShape.pills,

//              type: GFType.outline,

//              size: GFSize.small,

                counterChild: GFBadge(

                  child: Text("12"),

//              color: GFColor.dark,

//              shape: GFShape.circle,

//              size: GFSize.small,

//              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),

//              textColor: GFColor.white,

//              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),

                ),

              ),

              GFBadge(

                text: '12',

//              color: GFColor.dark,

//              shape: GFShape.circle,

//              size: GFSize.small,

//              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),

//              textColor: GFColor.white,

//              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),

              ),

              GFButton(

//              type: GFType.solid,

//              shape: GFShape.pills,

                text: 'goodies',

                onPressed: () {},

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

//              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),

//              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),

              ),

            ],

          ),

        )

    );

  }

}

