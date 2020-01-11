import 'package:flutter/material.dart';
import 'package:gf_web/screens/layout/layout.dart';
import '../../styles/styles.dart';
import 'package:ui_kit/components/button/gf_button.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_kit/shape/gf_button_shape.dart';
import 'package:ui_kit/components/typography/gf_typography.dart';
import 'package:ui_kit/shape/gf_icon_button_shape.dart';



import 'package:ui_kit/components/button/gf_icon_button.dart';



class SocialButtons extends StatefulWidget {
  @override
  _SocialButtonsState createState() => _SocialButtonsState();
}

class _SocialButtonsState extends State<SocialButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
        body: ListView(
          children: <Widget>[
            Text('Social Buttons', style: hintStyleTextblackbolder(),),
            SizedBox(
              height: 20,
            ),
            Text('Buttons of type social which comes in different sizes that can be used in forms, alerts, and more...', style: hintStyleTextblackdull(),),
            SizedBox(
              height: 30,
            ),
            Text('Solid Buttons Full',  style: hintStyleTextblackbold(),),
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
                    GFButton(
                      onPressed: () {},
                      child: Text(
                        "Google +",
                      ),
                      icon: SvgPicture.asset('lib/assets/icons/google.svg'),
                      color: Color(0xFFDD4B39),
                      buttonBoxShadow: true,
                    ),
                    GFButton(
                      onPressed: () {},
                      child: Text(
                        "Dribble",
                      ),
                      icon: SvgPicture.asset('lib/assets/icons/dribble.svg'),
                      color: Color(0xFFEA4C89),
                      buttonBoxShadow: true,
                    ),
                    GFButton(
                      onPressed: () {},
                      child: Text(
                        "LinkedIn",
                      ),
                      icon: SvgPicture.asset('lib/assets/icons/linkedin.svg'),
                      color: Color(0xFF0E76A8),
                      buttonBoxShadow: true,
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
                      onPressed: () {},
                      child: Text(
                        "Youtube",
                      ),
                      icon: SvgPicture.asset('lib/assets/icons/youtube.svg'),
                      color: Color(0xFFC4302B),
                      buttonBoxShadow: true,
                    ),
                    GFButton(
                      onPressed: () {},
                      child: Text(
                        "Slack",
                        style: TextStyle(color: getGFColor(GFColor.white)),
                      ),
                      icon: SvgPicture.asset('lib/assets/icons/slack.svg'),
                      color: Color(0XFF2EB67D),
                      buttonBoxShadow: true,
                    ),
                    GFButton(
                      onPressed: () {},
                      child: Text(
                        "Pinterest",
                      ),
                      icon: SvgPicture.asset('lib/assets/icons/pinterest.svg'),
                      color: Color(0XFFC8232C),
                      buttonBoxShadow: true,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
      
//social buttons icons
Text('Social Buttons Icons',  style: hintStyleTextblackbold(),),
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
//shadow icons
Text('Floating Social Buttons',  style: hintStyleTextblackbold(),),
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
                        shape: GFIconButtonShape.pills,
                        icon: SvgPicture.asset('lib/assets/icons/fb.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0xFF00ACEE),
                        shape: GFIconButtonShape.pills,
                        icon: SvgPicture.asset('lib/assets/icons/twitter.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0xFF25D366),
                        shape: GFIconButtonShape.pills,
                        icon: SvgPicture.asset('lib/assets/icons/whatsapp.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0xFFDD4B39),
                        shape: GFIconButtonShape.pills,
                        icon: SvgPicture.asset('lib/assets/icons/google.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0xFFEA4C89),
                        shape: GFIconButtonShape.pills,
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
                        shape: GFIconButtonShape.pills,
                        icon: SvgPicture.asset('lib/assets/icons/linkedin.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0xFFC4302B),
                        shape: GFIconButtonShape.pills,
                        icon: SvgPicture.asset('lib/assets/icons/youtube.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0XFF2EB67D),
                        shape: GFIconButtonShape.pills,
                        icon: SvgPicture.asset('lib/assets/icons/slack.svg'),
                        onPressed: () {}),
                    GFIconButton(
                        color: Color(0XFFC8232C),
                        shape: GFIconButtonShape.pills,
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
      ),
    );
  }
}
