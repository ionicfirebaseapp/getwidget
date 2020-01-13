import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/typography/gf_typography.dart';
import 'package:ui_kit/types/gf_typography_type.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:flutter/cupertino.dart';


class TypographyPage extends StatefulWidget {
  @override
  _TypographyPageState createState() => _TypographyPageState();
}

class _TypographyPageState extends State<TypographyPage> {
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
          'Typography',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body:
      ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15, top: 30),
            child: GFTypography(
              text: 'Headings Regular',
              type: GFTypographyType.typo5,
              dividerWidth: 25,
              dividerColor: Color(0xFF19CA4B),
            ),
          ),
          GFCard(
            content: Column(
              children: <Widget>[
                SizedBox(height: 15,),
                GFTypography(
                  text: 'GF Header Typo1',
                  type: GFTypographyType.typo1,
                  showDivider: false,
                ),
                SizedBox(height: 15,),
                GFTypography(
                  text: 'GF Header Typo2',
                  type: GFTypographyType.typo2,
                  showDivider: false,
                ),
                SizedBox(height: 15,),
                GFTypography(
                  text: 'GF Header Typo3',
                  type: GFTypographyType.typo3,
                  showDivider: false,
                ),
                SizedBox(height: 15,),
                GFTypography(
                  text: 'GF Header Typo4',
                  type: GFTypographyType.typo4,
                  showDivider: false,
                ),
                SizedBox(height: 15,),
                GFTypography(
                  text: 'GF Header Typo5',
                  type: GFTypographyType.typo5,
                  showDivider: false,
                ),
                SizedBox(height: 15,),
                GFTypography(
                  text: 'GF Header Typo6',
                  type: GFTypographyType.typo6,
                  showDivider: false,
                ),
                SizedBox(height: 15,),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 15, top: 30),
            child: GFTypography(
              text: 'Opacity',
              type: GFTypographyType.typo5,
              dividerWidth: 25,
              dividerColor: Color(0xFF19CA4B),
            ),
          ),
          GFCard(
            content: Column(
              children: <Widget>[
                SizedBox(height: 15,),
                GFTypography(
                  text: 'GF Header Typo1',
                  type: GFTypographyType.typo1,
                  showDivider: false,
                  textColor: Colors.black87
                ),
                SizedBox(height: 15,),
                GFTypography(
                  text: 'GF Header Typo2',
                  type: GFTypographyType.typo2,
                  showDivider: false,
                    textColor: Colors.black54
                ),
                SizedBox(height: 15,),
                GFTypography(
                  text: 'GF Header Typo3',
                  type: GFTypographyType.typo3,
                  showDivider: false,
                    textColor: Colors.black45
                ),
                SizedBox(height: 15,),
                GFTypography(
                  text: 'GF Header Typo4',
                  type: GFTypographyType.typo4,
                  showDivider: false,
                    textColor: Colors.black38
                ),
                SizedBox(height: 15,),
                GFTypography(
                  text: 'GF Header Typo5',
                  type: GFTypographyType.typo5,
                  showDivider: false,
                    textColor: Colors.black26
                ),
                SizedBox(height: 15,),
                GFTypography(
                  text: 'GF Header Typo6',
                  type: GFTypographyType.typo6,
                  showDivider: false,
                    textColor: Colors.black12
                ),
                SizedBox(height: 15,),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
