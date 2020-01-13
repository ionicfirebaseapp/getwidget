import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/typography/gf_typography.dart';
import 'package:ui_kit/types/gf_typography_type.dart';
import 'package:ui_kit/components/button/gf_button.dart';
import 'package:ui_kit/components/button/gf_icon_button.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/shape/gf_icon_button_shape.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';

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
            onTap: () {
              Navigator.pop(context);
            },
          child:  Icon(CupertinoIcons.back, color: getGFColor(GFColor.success), ),),
        title: Text(
          'Social Buttons',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15, top: 20),
            child: GFTypography(
              text: 'Social Buttons Full',
              type: GFTypographyType.typo5,
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
                    Expanded(
                      child: GFButton(
                          buttonBoxShadow: true,
                          color: Color(0xFF3B5998),
                          onPressed: () {},
                          child: Text(
                            "FB",
                          ),
                          icon: SvgPicture.asset('lib/assets/icons/fb.svg')),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: GFButton(
                        onPressed: () {},
                        child: Text("Twitter"),
                        icon: SvgPicture.asset('lib/assets/icons/twitter.svg'),
                        color: Color(0xFF00ACEE),
                        buttonBoxShadow: true,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: GFButton(
                        onPressed: () {},
                        child: Text(
                          "Whatsap",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/whatsapp.svg'),
                        color: Color(0xFF25D366),
                        buttonBoxShadow: true,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                   Expanded(child:  GFButton(
                     onPressed: () {},
                     child: Text(
                       "Google +",
                     ),
                     icon: SvgPicture.asset('lib/assets/icons/google.svg'),
                     color: Color(0xFFDD4B39),
                     buttonBoxShadow: true,
                   ),),
                    SizedBox(width: 6,),
                   Expanded(child:  GFButton(
                     onPressed: () {},
                     child: Text(
                       "Dribble",
                     ),
                     icon: SvgPicture.asset('lib/assets/icons/dribble.svg'),
                     color: Color(0xFFEA4C89),
                     buttonBoxShadow: true,
                   ),),
                    SizedBox(width: 6,),
                    Expanded(child: GFButton(
                      onPressed: () {},
                      child: Text(
                        "LinkedIn",
                      ),
                      icon: SvgPicture.asset('lib/assets/icons/linkedin.svg'),
                      color: Color(0xFF0E76A8),
                      buttonBoxShadow: true,
                    ),)
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(child: GFButton(
                      onPressed: () {},
                      child: Text(
                        "Youtube",
                      ),
                      icon: SvgPicture.asset('lib/assets/icons/youtube.svg'),
                      color: Color(0xFFC4302B),
                      buttonBoxShadow: true,
                    ),),
                    SizedBox(width: 6,),
                    Expanded(child: GFButton(
                      onPressed: () {},
                      child: Text(
                        "Slack",
                        style: TextStyle(color: getGFColor(GFColor.white)),
                      ),
                      icon: SvgPicture.asset('lib/assets/icons/slack.svg'),
                      color: Color(0XFF2EB67D),
                      buttonBoxShadow: true,
                    ),),
                    SizedBox(width: 6,),
                    
                    Expanded(child: GFButton(
                      onPressed: () {},
                      child: Text(
                        "Pinterest",
                      ),
                      icon: SvgPicture.asset('lib/assets/icons/pinterest.svg'),
                      color: Color(0XFFC8232C),
                      buttonBoxShadow: true,
                    ),)
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 20),
            child: GFTypography(
              text: 'Social Buttons Icons',
              type: GFTypographyType.typo5,
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
                        color: Color(0xFF3B5998),
                        icon: SvgPicture.asset('lib/assets/icons/fb.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0xFF00ACEE),
                        icon: SvgPicture.asset('lib/assets/icons/twitter.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0xFF25D366),
                        icon: SvgPicture.asset('lib/assets/icons/whatsapp.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0xFFDD4B39),
                        icon: SvgPicture.asset('lib/assets/icons/google.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0xFFEA4C89),
                        icon: SvgPicture.asset('lib/assets/icons/dribble.svg'),
                        onPressed: () {}),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GFIconButton(
                        color: Color(0xFF0E76A8),
                        icon: SvgPicture.asset('lib/assets/icons/linkedin.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0xFFC4302B),
                        icon: SvgPicture.asset('lib/assets/icons/youtube.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0XFF2EB67D),
                        icon: SvgPicture.asset('lib/assets/icons/slack.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0XFFC8232C),
                        icon:
                            SvgPicture.asset('lib/assets/icons/pinterest.svg'),
                        onPressed: () {}),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 20),
            child: GFTypography(
              text: 'Floating Social Buttons',
              type: GFTypographyType.typo5,
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
                        color: Color(0xFF3B5998),
                        shape: GFIconButtonShape.circle,
                        icon: SvgPicture.asset('lib/assets/icons/fb.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0xFF00ACEE),
                        shape: GFIconButtonShape.circle,
                        icon: SvgPicture.asset('lib/assets/icons/twitter.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0xFF25D366),
                        shape: GFIconButtonShape.circle,
                        icon: SvgPicture.asset('lib/assets/icons/whatsapp.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0xFFDD4B39),
                        shape: GFIconButtonShape.circle,
                        icon: SvgPicture.asset('lib/assets/icons/google.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0xFFEA4C89),
                        shape: GFIconButtonShape.circle,
                        icon: SvgPicture.asset('lib/assets/icons/dribble.svg'),
                        onPressed: () {}),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GFIconButton(
                        color: Color(0xFF0E76A8),
                        shape: GFIconButtonShape.circle,
                        icon: SvgPicture.asset('lib/assets/icons/linkedin.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0xFFC4302B),
                        shape: GFIconButtonShape.circle,
                        icon: SvgPicture.asset('lib/assets/icons/youtube.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0XFF2EB67D),
                        shape: GFIconButtonShape.circle,
                        icon: SvgPicture.asset('lib/assets/icons/slack.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0XFFC8232C),
                        shape: GFIconButtonShape.circle,
                        icon:
                            SvgPicture.asset('lib/assets/icons/pinterest.svg'),
                        onPressed: () {}),
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
