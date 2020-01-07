//import 'package:demo_app/screens/cards.dart';
//import 'package:demo_app/screens/icon-button.dart';
//import 'package:demo_app/screens/list-tiles.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'avatars.dart';
import 'buttons.dart';
import 'toggles.dart';
import 'headers.dart';
import 'toasts.dart';
import 'badges.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getGFColor(GFColor.dark),
        title: Text(
          'GET FLUTTER',
          style: TextStyle(fontSize: 14),
        ),
        centerTitle: true,
      ),
//      body: Container(
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[
//            Expanded(child: GestureDetector(
//              onTap: (){
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (BuildContext context) => Buttons()),
//                );
//              },
//              child:  GFCard(
//                color: getGFColor(GFColor.success),
//                content: Column(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    Icon(Icons.bubble_chart),
//                    Text('Buttons')
//                  ],
//                ),
//              ),
//            )),
//          Expanded(child: GestureDetector(
//            onTap: (){
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (BuildContext context) => Avatars()),
//              );
//            },
//            child: GFCard(
//              color: getGFColor(GFColor.warning),
//              content: Column(
//                children: <Widget>[
//                  Icon(Icons.face),
//                  Text('Avatar')
//                ],
//              ),
//            ),
//          ),)
//          ],
//        ),
//      )

      body:Text("Dcfs")

//      Column(
//        children: <Widget>[
//          Row(
//            children: <Widget>[
//              Expanded(
//                  child: Container(
//                      height: 100,
//                      child: GestureDetector(
//                        onTap: () {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (BuildContext context) => Buttons()),
//                          );
//                        },
//                        child: GFCard(
//                          color: getGFColor(GFColor.success),
//                          content: Column(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: <Widget>[
//                              Icon(Icons.bubble_chart,
//                                  color: getGFColor(GFColor.white)),
//                              Text(
//                                'Buttons',
//                                style: TextStyle(color: getGFColor(GFColor.white)),
//                              )
//                            ],
//                          ),
//                        ),
//                      ))),
//              Expanded(
//                child: Container(
//                    height: 100,
//                    child: GestureDetector(
//                      onTap: () {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (BuildContext context) => Avatars()),
//                        );
//                      },
//                      child: GFCard(
//                        color: getGFColor(GFColor.success),
//                        content: Column(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            Icon(Icons.face, color: getGFColor(GFColor.white)),
//                            Text(
//                              'Avatar',
//                              style: TextStyle(color: getGFColor(GFColor.white)),
//                            )
//                          ],
//                        ),
//                      ),
//                    )),
//              ),
//              Expanded(
//                  child: Container(
//                      height: 100,
//                      child: GestureDetector(
//                        onTap: () {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (BuildContext context) => Toggles()),
//                          );
//                        },
//                        child: GFCard(
//                          color: getGFColor(GFColor.success),
//                          content: Column(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: <Widget>[
//                              Icon(Icons.all_inclusive,
//                                  color: getGFColor(GFColor.white)),
//                              Text(
//                                'Toggle',
//                                style: TextStyle(color: getGFColor(GFColor.white)),
//                              )
//                            ],
//                          ),
//                        ),
//                      )))
//            ],
//          ),

//          Row(
//            children: <Widget>[
//              Expanded(child:Container(
//                  height: 100,
//                  child: GestureDetector(
//                    onTap: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (BuildContext context) => Headers()),
//                      );
//                    },
//                    child: GFCard(
//                      color: getGFColor(GFColor.success),
//                      content: Column(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Icon(Icons.menu,
//                              color: getGFColor(GFColor.white)),
//                          Text(
//                            'Header',
//                            style: TextStyle(color: getGFColor(GFColor.white)),
//                          )
//                        ],
//                      ),
//                    ),
//                  )) ),
//              Expanded(child:Container(
//                  height: 100,
//                  child: GestureDetector(
//                    onTap: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (BuildContext context) => Toasts()),
//                      );
//                    },
//                    child: GFCard(
//                      color: getGFColor(GFColor.success),
//                      content: Column(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Icon(Icons.call_to_action,
//                              color: getGFColor(GFColor.white)),
//                          Text(
//                            'Toast',
//                            style: TextStyle(color: getGFColor(GFColor.white)),
//                          )
//                        ],
//                      ),
//                    ),
//                  )) ),
//              Expanded(child:Container(
//                  height: 100,
//                  child: GestureDetector(
//                    onTap: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (BuildContext context) => Cards()),
//                      );
//                    },
//                    child: GFCard(
//                      color: getGFColor(GFColor.success),
//                      content: Column(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Icon(Icons.credit_card,
//                              color: getGFColor(GFColor.white)),
//                          Text(
//                            'Card',
//                            style: TextStyle(color: getGFColor(GFColor.white)),
//                          )
//                        ],
//                      ),
//                    ),
//                  )) )
//            ],
//          ),
//
//          Row(
//            children: <Widget>[
//              Expanded(child:Container(
//                  height: 100,
//                  child: GestureDetector(
//                    onTap: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (BuildContext context) => IconButtons()),
//                      );
//                    },
//                    child: GFCard(
//                      color: getGFColor(GFColor.success),
//                      content: Column(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Icon(Icons.insert_emoticon,
//                              color: getGFColor(GFColor.white)),
//                          Text(
//                            'Icon Button',
//                            style: TextStyle(color: getGFColor(GFColor.white), fontSize: 12),
//                          )
//                        ],
//                      ),
//                    ),
//                  )) ),
//              Expanded(child:Container(
//                  height: 100,
//                  child: GestureDetector(
//                    onTap: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (BuildContext context) => ListTiles()),
//                      );
//                    },
//                    child: GFCard(
//                      color: getGFColor(GFColor.success),
//                      content: Column(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Icon(Icons.list,
//                              color: getGFColor(GFColor.white)),
//                          Text(
//                            'ListTile',
//                            style: TextStyle(color: getGFColor(GFColor.white)),
//                          )
//                        ],
//                      ),
//                    ),
//                  )) ),
//              Expanded(child:Container(
//                  height: 100,
//                  child: GestureDetector(
//                    onTap: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (BuildContext context) => Badges()),
//                      );
//                    },
//                    child: GFCard(
//                      color: getGFColor(GFColor.success),
//                      content: Column(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Icon(Icons.apps,
//                              color: getGFColor(GFColor.white)),
//                          Text(
//                            'Badges',
//                            style: TextStyle(color: getGFColor(GFColor.white)),
//                          )
//                        ],
//                      ),
//                    ),
//                  ))
//              )
//            ],
//          )
//        ],
//      ),
    );
  }
}
