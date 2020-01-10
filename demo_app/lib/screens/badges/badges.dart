import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/badge/gf_badge.dart';
import 'package:ui_kit/components/badge/gf_button_badge.dart';
import 'package:ui_kit/components/badge/gf_icon_badge.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/components/header/gf_header.dart';
import 'package:ui_kit/components/tabs/gf_tabs.dart';
import 'package:ui_kit/components/button/gf_icon_button.dart';
import 'package:ui_kit/position/gf_position.dart';
import 'package:ui_kit/shape/gf_badge_shape.dart';
import 'package:ui_kit/shape/gf_button_shape.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:ui_kit/types/gf_heading_type.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/components/tabs/gf_tabBarView.dart';

class Badges extends StatefulWidget {
  @override
  _BadgesState createState() => _BadgesState();
}

class _BadgesState extends State<Badges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getGFColor(GFColor.dark),
        title: Text(
          'Badges',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
     body: ListView(
       children: <Widget>[
         Padding(
           padding: EdgeInsets.only(left: 15, top: 20),
           child: GFHeader(
             text: 'With Buttons',
             type: GFHeadingType.typo5,
             dividerWidth: 25,
             dividerColor: Color(0xFF19CA4B),
           ),
         ),
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
                     counterChild: GFBadge(
                       text: '6',
                       shape: GFBadgeShape.pills,
                     ),
                     onPressed: (){},
                     text: 'Primary',
                   ),
                   GFButtonBadge(
                     counterChild: GFBadge(
                       text: '6',
                       shape: GFBadgeShape.pills,
                     ),
                     onPressed: (){},
                     text: 'Second',
                     color: GFColor.secondary,
                   ),
                   GFButtonBadge(
                     counterChild: GFBadge(
                       text: '6',
                       shape: GFBadgeShape.pills,
                     ),
                     onPressed: (){},
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
                     counterChild: GFBadge(
                       text: '6',
                       shape: GFBadgeShape.pills,
                     ),
                     onPressed: (){},
                     text: 'Warning',
                     color: GFColor.warning,
                   ),
                   GFButtonBadge(
                     counterChild: GFBadge(
                       text: '6',
                       shape: GFBadgeShape.pills,
                     ),
                     onPressed: (){},
                     text: 'Danger',
                     color: GFColor.danger,
                   ),
                   GFButtonBadge(
                     counterChild: GFBadge(
                       text: '6',
                       shape: GFBadgeShape.pills,
                     ),
                     onPressed: (){},
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
                     counterChild: GFBadge(
                       text: '6',
                       shape: GFBadgeShape.pills,
                     ),
                     onPressed: (){},
                     text: 'Light',
                     color: GFColor.light,
                   ),
                   GFButtonBadge(
                     counterChild: GFBadge(
                       text: '6',
                       shape: GFBadgeShape.pills,
                     ),
                     onPressed: (){},
                     text: 'Dark',
                     textStyle: TextStyle(color: getGFColor(GFColor.white)),

                     color: GFColor.dark,
                   ),
                   GFButtonBadge(
                     counterChild: GFBadge(
                       text: '6',
                       shape: GFBadgeShape.pills,
                     ),
                     onPressed: (){},
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

         Padding(
           padding: EdgeInsets.only(left: 15, top: 20),
           child: GFHeader(
             text: 'Icon with Badges',
             type: GFHeadingType.typo5,
             dividerWidth: 25,
             dividerColor: Color(0xFF19CA4B),
           ),
         ),

         GFCard(
           content: Column(
             children: <Widget>[
               SizedBox(
                 height: 20,
               ),
               Row(
                 children: <Widget>[
                   GFIconBadge(
                       onPressed: null,
                       child: GFIconButton(
                           type: GFType.transparent,
                           onPressed: (){},
                           icon: SvgPicture.asset('lib/assets/icons/primary.svg', color: getGFColor(GFColor.primary),)
                       ),
                       counterChild: GFBadge(
                         text: '12',
                         shape: GFBadgeShape.circle,
                         size: GFSize.small,
                       )),
                   GFIconBadge(
                       onPressed: null,
                       child: GFIconButton(
                           type: GFType.transparent,
                           onPressed: (){},
                           icon: SvgPicture.asset('lib/assets/icons/secondary.svg', color: getGFColor(GFColor.secondary),)
                       ),
                       counterChild: GFBadge(
                         text: '12',
                         shape: GFBadgeShape.circle,
                         size: GFSize.small,
                       )),
                   GFIconBadge(
                       onPressed: null,
                       child: GFIconButton(
                           type: GFType.transparent,
                           onPressed: (){},
                           icon: SvgPicture.asset('lib/assets/icons/success.svg', color: getGFColor(GFColor.success),)
                       ),
                       counterChild: GFBadge(
                         text: '12',
                         shape: GFBadgeShape.circle,
                         size: GFSize.small,
                       )),
                   GFIconBadge(
                       onPressed: null,
                       child: GFIconButton(
                           type: GFType.transparent,
                           onPressed: (){},
                           icon: SvgPicture.asset('lib/assets/icons/warning.svg', color: getGFColor(GFColor.warning),)
                       ),
                       counterChild: GFBadge(
                         text: '12',
                         shape: GFBadgeShape.circle,
                         size: GFSize.small,
                       )),
                   GFIconBadge(
                       onPressed: null,
                       child: GFIconButton(
                           type: GFType.transparent,
                           onPressed: (){},
                           icon: SvgPicture.asset('lib/assets/icons/danger.svg', color: getGFColor(GFColor.danger),)
                       ),
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
                       onPressed: null,
                       child: GFIconButton(
                           type: GFType.transparent,
                           onPressed: (){},
                           icon: SvgPicture.asset('lib/assets/icons/info.svg', color: getGFColor(GFColor.info),)
                       ),
                       counterChild: GFBadge(
                         text: '12',
                         shape: GFBadgeShape.standard,
                         size: GFSize.small,
                       )),
                   GFIconBadge(
                       onPressed: null,
                       child: GFIconButton(
                           type: GFType.transparent,
                           onPressed: (){},
                           icon: SvgPicture.asset('lib/assets/icons/light.svg', color: getGFColor(GFColor.light),)
                       ),
                       counterChild: GFBadge(
                         text: '12',
                         shape: GFBadgeShape.square,
                         size: GFSize.small,
                       )),
                   GFIconBadge(
                       onPressed: null,
                       child: GFIconButton(
                           type: GFType.transparent,
                           onPressed: (){},
                           icon: SvgPicture.asset('lib/assets/icons/dark.svg', color: getGFColor(GFColor.dark),)
                       ),
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
    );
  }
}
