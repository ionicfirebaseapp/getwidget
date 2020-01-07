import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/header/gf_header.dart';
import 'package:ui_kit/types/gf_heading_type.dart';
import 'package:ui_kit/components/button/gf_button.dart';
import 'package:ui_kit/components/button/gf_icon_button.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/components/header/gf_header.dart';
import 'package:ui_kit/types/gf_heading_type.dart';
import 'package:ui_kit/shape/gf_button_shape.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButtons extends StatefulWidget {
  @override
  _SocialButtonsState createState() => _SocialButtonsState();
}

class _SocialButtonsState extends State<SocialButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getGFColor(GFColor.dark),
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child:Image.asset('lib/assets/icons/back.png')
        ),
        title: Text(
          'Social Buttons',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),

      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left:15, top:20),
            child:   GFHeader(
              text: 'Social Buttons Full',
              type: GFHeadingType.typo5,
              dividerWidth: 25,
              dividerColor: Color(0xFF19CA4B),

            ),
          ),

          GFCard(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(child:  GFButton(
                        onPressed: null,
                        child: Text(
                          "FB",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/fb.svg')
                    ),),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(child:  GFButton(
                      onPressed: null,
                      child: Text("Twitter"),
                      icon: SvgPicture.asset('lib/assets/icons/twitter.svg'),
                      color: GFColor.secondary,
                    ),),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(child:  GFButton(
                      onPressed: null,
                      child: Text(
                        "Whtsap",
                      ),
                      icon: SvgPicture.asset('lib/assets/icons/whatsapp.svg'),
                      color: GFColor.success,
                    ),)
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GFButton(
                      onPressed: null,
                      child: Text(
                        "Google +",
                      ),
                      icon: SvgPicture.asset('lib/assets/icons/google.svg'),
                      color: GFColor.warning,
                    ),
                    GFButton(
                      onPressed: null,
                      child: Text(
                        "Dribble",
                      ),
                      icon: SvgPicture.asset('lib/assets/icons/dribble.svg'),
                      color: GFColor.danger,
                    ),
                    GFButton(
                      onPressed: null,
                      child: Text(
                        "LinkedIn",
                      ),
                      icon: SvgPicture.asset('lib/assets/icons/linkedin.svg'),
                      color: GFColor.info,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GFButton(
                      onPressed: null,
                      child: Text(
                        "Youtube",
                      ),
                      icon: SvgPicture.asset('lib/assets/icons/youtube.svg'),
                      type: GFType.solid,
                      color: GFColor.light,
                    ),

                    GFButton(
                      onPressed: null,
                      child: Text(
                        "Slack",
                        style: TextStyle(color: getGFColor(GFColor.white)),
                      ),
                      icon: SvgPicture.asset('lib/assets/icons/slack.svg'),
                      color: GFColor.dark,
                    ),
                    GFButton(
                      onPressed: null,
                      child: Text(
                        "Pinterest",
                      ),
                      icon: SvgPicture.asset('lib/assets/icons/pinterest.svg'),
                      color: GFColor.alt,
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(padding: EdgeInsets.only(left:15, top:20),
            child:   GFHeader(
              text: 'Social Buttons Icons',
              type: GFHeadingType.typo5,
              dividerWidth: 25,
              dividerColor: Color(0xFF19CA4B),

            ),
          ),

          GFCard(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GFIconButton(
                        type: GFType.solid,
                        icon: SvgPicture.asset('lib/assets/icons/fb.svg'), onPressed: null),
                    GFIconButton(
                        type: GFType.solid,
                        color: GFColor.secondary,
                        icon: SvgPicture.asset('lib/assets/icons/twitter.svg'), onPressed: null),
                    GFIconButton(
                        type: GFType.solid,
                        color: GFColor.success,
                        icon: SvgPicture.asset('lib/assets/icons/whatsapp.svg'), onPressed: null),
                    GFIconButton(
                        type: GFType.solid,
                        color: GFColor.warning,
                        icon: SvgPicture.asset('lib/assets/icons/google.svg'), onPressed: null),
                    GFIconButton(
                        type: GFType.solid,
                        color: GFColor.danger,
                        icon: SvgPicture.asset('lib/assets/icons/dribble.svg'), onPressed: null),

                  ],
                ),


                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    GFIconButton(
                        type: GFType.solid,
                        color: GFColor.info,
                        icon: SvgPicture.asset('lib/assets/icons/linkedin.svg'), onPressed: null),
                    GFIconButton(
                        type: GFType.solid,
                        color: GFColor.light,
                        icon: SvgPicture.asset('lib/assets/icons/youtube.svg'), onPressed: null),
                    GFIconButton(
                        type: GFType.solid,
                        color: GFColor.dark,
                        icon: SvgPicture.asset('lib/assets/icons/slack.svg'), onPressed: null),
                    GFIconButton(
                        type: GFType.solid,
                        color: GFColor.danger,

                        icon: SvgPicture.asset('lib/assets/icons/pinterest.svg'), onPressed: null),

                  ],
                ),
                SizedBox(
                  height: 10,
                ),


              ],
            ),
          ),



          Padding(padding: EdgeInsets.only(left:15, top:20),
            child:   GFHeader(
              text: 'Floating Social Buttons',
              type: GFHeadingType.typo5,
              dividerWidth: 25,
              dividerColor: Color(0xFF19CA4B),

            ),
          ),

          GFCard(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GFIconButton(
                        type: GFType.solid,
                        shape: GFButtonShape.pills,
                        icon: SvgPicture.asset('lib/assets/icons/fb.svg'), onPressed: null),
                    GFIconButton(
                        type: GFType.solid,
                        color: GFColor.secondary,
                        shape: GFButtonShape.pills,
                        icon: SvgPicture.asset('lib/assets/icons/twitter.svg'), onPressed: null),
                    GFIconButton(
                        type: GFType.solid,
                        color: GFColor.success,
                        shape: GFButtonShape.pills,
                        icon: SvgPicture.asset('lib/assets/icons/whatsapp.svg'), onPressed: null),
                    GFIconButton(
                        type: GFType.solid,
                        color: GFColor.warning,
                        shape: GFButtonShape.pills,
                        icon: SvgPicture.asset('lib/assets/icons/google.svg'), onPressed: null),
                    GFIconButton(
                        type: GFType.solid,
                        color: GFColor.danger,
                        shape: GFButtonShape.pills,
                        icon: SvgPicture.asset('lib/assets/icons/dribble.svg'), onPressed: null),

                  ],
                ),


                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    GFIconButton(
                        type: GFType.solid,
                        color: GFColor.info,
                        shape: GFButtonShape.pills,
                        icon: SvgPicture.asset('lib/assets/icons/linkedin.svg'), onPressed: null),
                    GFIconButton(
                        type: GFType.solid,
                        color: GFColor.light,
                        shape: GFButtonShape.pills,
                        icon: SvgPicture.asset('lib/assets/icons/youtube.svg'), onPressed: null),
                    GFIconButton(
                        type: GFType.solid,
                        color: GFColor.dark,
                        shape: GFButtonShape.pills,
                        icon: SvgPicture.asset('lib/assets/icons/slack.svg'), onPressed: null),
                    GFIconButton(
                        type: GFType.solid,
                        color: GFColor.danger,
                        shape: GFButtonShape.pills,
                        icon: SvgPicture.asset('lib/assets/icons/pinterest.svg'), onPressed: null),

                  ],
                ),
                SizedBox(
                  height: 10,
                ),


              ],
            ),
          ),


        ],
      ),
    );
  }
}
