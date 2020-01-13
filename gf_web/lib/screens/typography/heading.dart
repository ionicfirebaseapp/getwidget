import 'package:flutter/material.dart';
import 'package:gf_web/screens/layout/layout.dart';
import '../../styles/styles.dart';
import 'package:ui_kit/components/button/gf_button.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/components/button/gf_button_bar.dart';
import 'package:ui_kit/components/list_tile/gf_list_tile.dart';
import 'package:ui_kit/components/avatar/gf_avatar.dart';
import 'package:ui_kit/position/gf_position.dart';
import 'package:ui_kit/components/button/gf_icon_button.dart';
import 'package:ui_kit/components/typography/gf_typography.dart';
import 'package:ui_kit/types/gf_typography_type.dart';

import 'package:ui_kit/components/button/gf_icon_button.dart';



class Heading extends StatefulWidget {
  @override
  _TypographyState createState() => _TypographyState();
}

class _TypographyState extends State<Heading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
        body: ListView(
          children: <Widget>[
            Text('Typography', style: hintStyleTextblackbolder(),),
            // SizedBox(
            //   height: 20,
            // ),
            // Text('A card is a sheet of Material used to represent some related information, for example an album, a geographical location, a meal, contact details, etc.', style: hintStyleTextblackdull(),),
            // SizedBox(
            //   height: 30,
            // ),
            // Text('Basic Card',  style: hintStyleTextblackbold(),),
GFCard(
                content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GFTypography(
                  text: 'GF Header Typo1',
                  textColor: Colors.grey,
                  dividerColor: Colors.grey,
                  type: GFTypographyType.typo1,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2019/12/25/16/49/happy-new-year-4718894_960_720.png'),
                ),
                SizedBox(
                  height: 40,
                ),
                GFTypography(
                  icon: GFAvatar(),
                  text: 'GF Header Typo2',
                  type: GFTypographyType.typo2,
                  dividerColor: GFColor.primary,
                  dividerAlignment: Alignment.center,
                ),
                SizedBox(
                  height: 40,
                ),
                GFTypography(
                  icon: Icon(Icons.insert_emoticon),
                  text: 'GF Header Typo3',
                  type: GFTypographyType.typo3,
                  dividerWidth: 150,
                  dividerColor: GFColor.warning,
                  dividerBorderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                SizedBox(
                  height: 40,
                ),
                GFTypography(
                    text: 'GF Header Typo4',
                    type: GFTypographyType.typo4,
                    dividerWidth: 345,
                    icon: Image.network(
                      'https://cdn.pixabay.com/photo/2016/12/15/03/27/cocoa-1908020_960_720.jpg',
                      width: 50,
                    )),
                SizedBox(
                  height: 40,
                ),
                GFTypography(
                  text: 'GF Header Typo5',
                  type: GFTypographyType.typo5,
                  dividerColor: GFColor.alt,
                ),
                SizedBox(
                  height: 40,
                ),
                GFTypography(
                  text: 'GF Header Typo6',
                  type: GFTypographyType.typo6,
                  dividerWidth: 20,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
