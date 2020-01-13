//import 'package:demo_app/screens/avatars.dart';
//import 'package:demo_app/screens/button/shadow-buttons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_kit/components/avatar/gf_avatar.dart';
import 'package:ui_kit/components/button/gf_icon_button.dart';
import 'package:ui_kit/size/gf_size.dart';

import 'standard-buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/components/list_tile/gf_list_tile.dart';
import 'pill-buttons.dart';
import 'square-buttons.dart';
import 'icon-buttons.dart';
import 'social-buttons.dart';
import 'shadow-buttons.dart';

class ButtonTypes extends StatefulWidget {
  @override
  _ButtonTypesState createState() => _ButtonTypesState();
}

class _ButtonTypesState extends State<ButtonTypes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getGFColor(GFColor.dark),
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
//          child: SvgPicture.asset('lib/assets/icons/back.svg',),
              child:Container(
               
                child:  Icon(CupertinoIcons.back, color: getGFColor(GFColor.success), ),
              )
//            child: Container(
//              height: 30,
//              width: 30,
//              constraints: BoxConstraints(minHeight: 20, minWidth: 30),
////              color: Colors.red,
//              child: GFIconButton(
//                size: GFSize.small,
//                color: GFColor.dark,
//                icon: SvgPicture.asset('lib/assets/icons/back-arrow.svg',),
//              )
//            )
        ),
        title: Text('Buttons',  style: TextStyle(fontSize: 17),),
        centerTitle: true,
      ),
      
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
         GestureDetector(
           onTap: (){
             Navigator.push(
               context,
               MaterialPageRoute(
                   builder: (BuildContext context) => StandardButtons()
               ),
             );
           },
           child:Container(
             margin: EdgeInsets.only(left: 15, right: 15, top: 20),
             padding: EdgeInsets.all(5),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.all(Radius.circular(7)),
               color: getGFColor(GFColor.dark),
               boxShadow: [
                 BoxShadow(
                   color: Colors.black.withOpacity(0.40),
                   blurRadius: 5.0
                 )
               ]
             ),
             child:  GFListTile(
                 color: getGFColor(GFColor.dark),
                 showDivider: false,
                 title: Text('Standard Buttons', style: TextStyle(color: getGFColor(GFColor.white)),),
                 icon: SvgPicture.asset('lib/assets/icons/next.svg'),

             ),
           )
         ),

          GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => PillsButtons()
                  ),
                );
              },
              child:Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    color: getGFColor(GFColor.dark),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.40),
                          blurRadius: 5.0
                      )
                    ]
                ),
                child:  GFListTile(
                    color: getGFColor(GFColor.dark),
                    showDivider: false,
                    title: Text('Pills Buttons', style: TextStyle(color: getGFColor(GFColor.white)),),
                    icon: SvgPicture.asset('lib/assets/icons/next.svg')
                ),
              )
          ),


          GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SquareButtons()
                  ),
                );
              },
              child:Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    color: getGFColor(GFColor.dark),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.40),
                          blurRadius: 5.0
                      )
                    ]
                ),
                child:  GFListTile(
                    color: getGFColor(GFColor.dark),
                    showDivider: false,
                    title: Text('Square Buttons', style: TextStyle(color: getGFColor(GFColor.white)),),
                    icon: SvgPicture.asset('lib/assets/icons/next.svg')
                ),
              )
          ),

          GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ShadowButtons()
                  ),
                );
              },
              child:Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    color: getGFColor(GFColor.dark),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.40),
                          blurRadius: 5.0
                      )
                    ]
                ),
                child:  GFListTile(
                    color: getGFColor(GFColor.dark),
                    showDivider: false,
                    title: Text('Shadow Buttons', style: TextStyle(color: getGFColor(GFColor.white)),),
                    icon: SvgPicture.asset('lib/assets/icons/next.svg')
                ),
              )
          ),

          GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => IconButtons()
                  ),
                );
              },
              child:Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    color: getGFColor(GFColor.dark),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.40),
                          blurRadius: 5.0
                      )
                    ]
                ),
                child:  GFListTile(
                    color: getGFColor(GFColor.dark),
                    showDivider: false,
                    title: Text('Icons Buttons', style: TextStyle(color: getGFColor(GFColor.white)),),
                    icon: SvgPicture.asset('lib/assets/icons/next.svg')
                ),
              )
          ),

          GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SocialButtons()
                  ),
                );
              },
              child:Container(

                margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    color: getGFColor(GFColor.dark),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.40),
                          blurRadius: 5.0
                      )
                    ]
                ),
                child:  GFListTile(
                    color: getGFColor(GFColor.dark),
                    showDivider: false,
                    title: Text('Social Buttons', style: TextStyle(color: getGFColor(GFColor.white)),),
                    icon: SvgPicture.asset('lib/assets/icons/next.svg')
                ),
              )
          ),


        ],
      )

    );
  }
}
