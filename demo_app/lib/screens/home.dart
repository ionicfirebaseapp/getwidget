import 'package:demo_app/screens/button/button-types.dart';
import 'package:demo_app/screens/cards.dart';
import 'package:demo_app/screens/icon-button.dart';
import 'package:demo_app/screens/list-tiles.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'avatars.dart';
import 'toggles.dart';
import 'headers.dart';
import 'toasts.dart';
import 'badges.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/button/standard-buttons.dart';

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
          title: Image.asset('lib/assets/logo/logo.png'),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ButtonTypes()),
                        );
                      },
                      child: Container(
                        height: 160,
                        margin: EdgeInsets.only(top: 23),
                        decoration: BoxDecoration(
//                     color:getGFColor( GFColor.dark,),
                            color: Color(0xFF333333),
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.black.withOpacity(0.61),
                                  blurRadius: 8.0,
                                  spreadRadius: 0.0),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset('lib/assets/icons/buttons.png'),
                            Text(
                              'Buttons',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: getGFColor(
                                    GFColor.white,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 23,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Cards()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 23),
                      decoration: BoxDecoration(
//                     color:getGFColor( GFColor.dark,),
                          color: Color(0xFF333333),
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.black.withOpacity(0.61),
                                blurRadius: 8.0,
                                spreadRadius: 0.0),
                          ]),
                      height: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Image.asset('lib/assets/icons/card.png'),
//                      SvgPicture.asset('lib/assets/icons/buttons.svg', color: getGFColor(GFColor.success),),
                          Text(
                            'Cards',
                            style: TextStyle(
                                fontSize: 20,
                                color: getGFColor(
                                  GFColor.white,
                                )),
                          )
                        ],
                      ),
                    ),
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
//                         builder: (BuildContext context) => Buttons()
                              ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 23),
                        decoration: BoxDecoration(
//                     color:getGFColor( GFColor.dark,),
                            color: Color(0xFF333333),
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.black.withOpacity(0.61),
                                  blurRadius: 8.0,
                                  spreadRadius: 0.0),
                            ]),
                        height: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset('lib/assets/icons/chips.png'),
                            Text(
                              'Chips',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: getGFColor(
                                    GFColor.white,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 23,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
//                         builder: (BuildContext context) => Buttons()
                            ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 23),
                      decoration: BoxDecoration(
//                     color:getGFColor( GFColor.dark,),
                          color: Color(0xFF333333),
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.black.withOpacity(0.61),
                                blurRadius: 8.0,
                                spreadRadius: 0.0),
                          ]),
                      height: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Image.asset('lib/assets/icons/items.png'),
//                      SvgPicture.asset('lib/assets/icons/buttons.svg', color: getGFColor(GFColor.success),),
                          Text(
                            'Items',
                            style: TextStyle(
                                fontSize: 20,
                                color: getGFColor(
                                  GFColor.white,
                                )),
                          )
                        ],
                      ),
                    ),
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
//                         builder: (BuildContext context) => Buttons()
                              ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 23),
                        decoration: BoxDecoration(
//                     color:getGFColor( GFColor.dark,),
                            color: Color(0xFF333333),
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.black.withOpacity(0.61),
                                  blurRadius: 8.0,
                                  spreadRadius: 0.0),
                            ]),
                        height: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset('lib/assets/icons/lists.png'),
                            Text(
                              'Lists',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: getGFColor(
                                    GFColor.white,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 23,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
//                         builder: (BuildContext context) => Buttons()
                            ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 23),
                      decoration: BoxDecoration(
//                     color:getGFColor( GFColor.dark,),
                          color: Color(0xFF333333),
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.black.withOpacity(0.61),
                                blurRadius: 8.0,
                                spreadRadius: 0.0),
                          ]),
                      height: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Image.asset('lib/assets/icons/menu.png'),
//                      SvgPicture.asset('lib/assets/icons/buttons.svg', color: getGFColor(GFColor.success),),
                          Text(
                            'Menu',
                            style: TextStyle(
                                fontSize: 20,
                                color: getGFColor(
                                  GFColor.white,
                                )),
                          )
                        ],
                      ),
                    ),
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
//                         builder: (BuildContext context) => Buttons()
                              ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 23),
                        decoration: BoxDecoration(
//                     color:getGFColor( GFColor.dark,),
                            color: Color(0xFF333333),
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.black.withOpacity(0.61),
                                  blurRadius: 8.0,
                                  spreadRadius: 0.0),
                            ]),
                        height: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset('lib/assets/icons/slider.png'),
                            Text(
                              'Sliders',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: getGFColor(
                                    GFColor.white,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 23,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
//                         builder: (BuildContext context) => Buttons()
                            ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 23),
                      decoration: BoxDecoration(
//                     color:getGFColor( GFColor.dark,),
                          color: Color(0xFF333333),
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.black.withOpacity(0.61),
                                blurRadius: 8.0,
                                spreadRadius: 0.0),
                          ]),
                      height: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset('lib/assets/icons/tabs.png'),
//                      SvgPicture.asset('lib/assets/icons/buttons.svg', color: getGFColor(GFColor.success),),
                          Text(
                            'Tabs',
                            style: TextStyle(
                                fontSize: 20,
                                color: getGFColor(
                                  GFColor.white,
                                )),
                          )
                        ],
                      ),
                    ),
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
//                         builder: (BuildContext context) => Buttons()
                              ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 23),
                        decoration: BoxDecoration(
//                     color:getGFColor( GFColor.dark,),
                            color: Color(0xFF333333),
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.black.withOpacity(0.61),
                                  blurRadius: 8.0,
                                  spreadRadius: 0.0),
                            ]),
                        height: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset('lib/assets/icons/toast.png'),
                            Text(
                              'Toasts',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: getGFColor(
                                    GFColor.white,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 23,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
//                         builder: (BuildContext context) => Buttons()
                            ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 23),
                      decoration: BoxDecoration(
//                     color:getGFColor( GFColor.dark,),
                          color: Color(0xFF333333),
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.black.withOpacity(0.61),
                                blurRadius: 8.0,
                                spreadRadius: 0.0),
                          ]),
                      height: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset('lib/assets/icons/toggle.png'),
//                      SvgPicture.asset('lib/assets/icons/buttons.svg', color: getGFColor(GFColor.success),),
                          Text(
                            'Toggle',
                            style: TextStyle(
                                fontSize: 20,
                                color: getGFColor(
                                  GFColor.white,
                                )),
                          )
                        ],
                      ),
                    ),
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
//                         builder: (BuildContext context) => Buttons()
                              ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 23),
                        decoration: BoxDecoration(
//                     color:getGFColor( GFColor.dark,),
                            color: Color(0xFF333333),
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.black.withOpacity(0.61),
                                  blurRadius: 8.0,
                                  spreadRadius: 0.0),
                            ]),
                        height: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset('lib/assets/icons/badge.png'),
                            Text(
                              'Badges',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: getGFColor(
                                    GFColor.white,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 23,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
//                         builder: (BuildContext context) => Buttons()
                            ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 23),
                      decoration: BoxDecoration(
//                     color:getGFColor( GFColor.dark,),
                          color: Color(0xFF333333),
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.black.withOpacity(0.61),
                                blurRadius: 8.0,
                                spreadRadius: 0.0),
                          ]),
                      height: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset('lib/assets/icons/avatar.png'),
//                      SvgPicture.asset('lib/assets/icons/buttons.svg', color: getGFColor(GFColor.success),),
                          Text(
                            'Avatars',
                            style: TextStyle(
                                fontSize: 20,
                                color: getGFColor(
                                  GFColor.white,
                                )),
                          )
                        ],
                      ),
                    ),
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Headers()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 23),
                        decoration: BoxDecoration(
//                     color:getGFColor( GFColor.dark,),
                            color: Color(0xFF333333),
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.black.withOpacity(0.61),
                                  blurRadius: 8.0,
                                  spreadRadius: 0.0),
                            ]),
                        height: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset('lib/assets/icons/typo.png'),
                            Text(
                              'Typography',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: getGFColor(
                                    GFColor.white,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
