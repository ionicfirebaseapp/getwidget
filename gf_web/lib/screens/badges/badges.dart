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
import 'package:ui_kit/shape/gf_badge_shape.dart';
import 'package:ui_kit/components/badge/gf_badge.dart';
import 'package:ui_kit/components/badge/gf_button_badge.dart';
import 'package:ui_kit/components/badge/gf_icon_badge.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/components/typography/gf_typography.dart';
import 'package:ui_kit/types/gf_typography_type.dart';




import 'package:ui_kit/components/button/gf_icon_button.dart';



class Badges extends StatefulWidget {
  @override
  _BadgesState createState() => _BadgesState();
}

class _BadgesState extends State<Badges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
        body: ListView(
          children: <Widget>[
            Text('Badges', style: hintStyleTextblackbolder(),),
            SizedBox(
              height: 20,
            ),
            Text('Badges can be used for an additional marker for any widget, e.g. show a number of items in a shopping cart.', style: hintStyleTextblackdull(),),
            SizedBox(
              height: 30,
            ),
            Text('With Buttons',  style: hintStyleTextblackbold(),),
             GFCard(
            content: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GFButtonBadge(
                      icon: GFBadge(
                        text: '6',
                        shape: GFBadgeShape.pills,
                      ),
                      onPressed: () {},
                      text: 'Primary',
                    ),
                    GFButtonBadge(
                      icon: GFBadge(
                        text: '6',
                        shape: GFBadgeShape.pills,
                      ),
                      onPressed: () {},
                      text: 'Second',
                      color: GFColor.secondary,
                    ),
                    GFButtonBadge(
                      icon: GFBadge(
                        text: '6',
                        shape: GFBadgeShape.pills,
                      ),
                      onPressed: () {},
                      text: 'Success',
                      color: GFColor.success,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GFButtonBadge(
                      icon: GFBadge(
                        text: '6',
                        shape: GFBadgeShape.pills,
                      ),
                      onPressed: () {},
                      text: 'Warning',
                      color: GFColor.warning,
                    ),
                    GFButtonBadge(
                      icon: GFBadge(
                        text: '6',
                        shape: GFBadgeShape.pills,
                      ),
                      onPressed: () {},
                      text: 'Danger',
                      color: GFColor.danger,
                    ),
                    GFButtonBadge(
                      icon: GFBadge(
                        text: '6',
                        shape: GFBadgeShape.pills,
                      ),
                      onPressed: () {},
                      text: 'Info',
                      color: GFColor.info,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GFButtonBadge(
                      icon: GFBadge(
                        text: '6',
                        shape: GFBadgeShape.pills,
                      ),
                      onPressed: () {},
                      text: 'Light',
                      color: GFColor.light,
                    ),
                    GFButtonBadge(
                      icon: GFBadge(
                        text: '6',
                        shape: GFBadgeShape.pills,
                      ),
                      onPressed: () {},
                      text: 'Dark',
                      textStyle: TextStyle(color: getGFColor(GFColor.white)),
                      color: GFColor.dark,
                    ),
                    GFButtonBadge(
                      icon: GFBadge(
                        text: '6',
                        shape: GFBadgeShape.pills,
                      ),
                      onPressed: () {},
                      text: 'Link',
                      color: GFColor.transparent,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
         
      
//icons with badges
Text('Icon with Badges',  style: hintStyleTextblackbold(),),
            GFCard(
            content: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    GFIconBadge(
                        child: GFIconButton(
                            type: GFType.transparent,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'lib/assets/icons/primary.svg',
                              color: getGFColor(GFColor.primary),
                            )),
                        counterChild: GFBadge(
                          text: '12',
                          shape: GFBadgeShape.circle,
                          size: GFSize.small,
                        )),
                    GFIconBadge(
                        child: GFIconButton(
                            type: GFType.transparent,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'lib/assets/icons/secondary.svg',
                              color: getGFColor(GFColor.secondary),
                            )),
                        counterChild: GFBadge(
                          text: '12',
                          shape: GFBadgeShape.circle,
                          size: GFSize.small,
                        )),
                    GFIconBadge(
                        child: GFIconButton(
                            type: GFType.transparent,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'lib/assets/icons/success.svg',
                              color: getGFColor(GFColor.success),
                            )),
                        counterChild: GFBadge(
                          text: '12',
                          shape: GFBadgeShape.circle,
                          size: GFSize.small,
                        )),
                    GFIconBadge(
                        child: GFIconButton(
                            type: GFType.transparent,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'lib/assets/icons/warning.svg',
                              color: getGFColor(GFColor.warning),
                            )),
                        counterChild: GFBadge(
                          text: '12',
                          shape: GFBadgeShape.circle,
                          size: GFSize.small,
                        )),
                    GFIconBadge(
                        child: GFIconButton(
                            type: GFType.transparent,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'lib/assets/icons/danger.svg',
                              color: getGFColor(GFColor.danger),
                            )),
                        counterChild: GFBadge(
                          text: '12',
                          shape: GFBadgeShape.circle,
                          size: GFSize.small,
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    GFIconBadge(
                        child: GFIconButton(
                            type: GFType.transparent,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'lib/assets/icons/info.svg',
                              color: getGFColor(GFColor.info),
                            )),
                        counterChild: GFBadge(
                          text: '12',
                          shape: GFBadgeShape.standard,
                          size: GFSize.small,
                        )),
                    GFIconBadge(
                        child: GFIconButton(
                            type: GFType.transparent,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'lib/assets/icons/light.svg',
                              color: getGFColor(GFColor.light),
                            )),
                        counterChild: GFBadge(
                          text: '12',
                          shape: GFBadgeShape.square,
                          size: GFSize.small,
                        )),
                    GFIconBadge(
                        child: GFIconButton(
                            type: GFType.transparent,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'lib/assets/icons/dark.svg',
                              color: getGFColor(GFColor.dark),
                            )),
                        counterChild: GFBadge(
                          text: '12',
                          shape: GFBadgeShape.pills,
                          size: GFSize.small,
                        )),
                  ],
                )
              ],
            ),
          ),        

          ],
        ),
      ),
    );
  }
}
