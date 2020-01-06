import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/button/gf_icon_button.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/components/header/gf_header.dart';
import 'package:ui_kit/types/gf_heading_type.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/size/gf_size.dart';

class IconButtons extends StatefulWidget {
  @override
  _IconButtonsState createState() => _IconButtonsState();
}

class _IconButtonsState extends State<IconButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getGFColor(GFColor.dark),
        title: Text(
          'Icon Button',
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: ListView(
        children: <Widget>[
          GFCard(
            content: Column(
              children: <Widget>[
                GFHeader(
                  text: 'Solid Icon Button',
                  type: GFHeadingType.typo6,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GFIconButton(
                      onPressed: null,
                      icon: Icon(Icons.ac_unit),
//              iconSize: 12.0,

                      type: GFType.solid,
                      size: GFSize.large,
                      buttonBoxShadow: true,
                      color: GFColor.primary,
//                boxShadow: BoxShadow(
//                  color: Colors.pink,
//                  blurRadius: 2.0,
//                  spreadRadius: 1.0,
//                  offset: Offset.zero,
//                ),
//                borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//                borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
                    ),
                    GFIconButton(
                      onPressed: null,
                      icon: Icon(Icons.ac_unit),
//              iconSize: 12.0,

                      type: GFType.solid,
                      size: GFSize.medium,

                      color: GFColor.warning,
//                boxShadow: BoxShadow(
//                  color: Colors.pink,
//                  blurRadius: 2.0,
//                  spreadRadius: 1.0,
//                  offset: Offset.zero,
//                ),
//                borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//                borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
                    ),
                    GFIconButton(
                      onPressed: null,
                      icon: Icon(Icons.ac_unit),
//              iconSize: 12.0,

                      type: GFType.solid,
                      size: GFSize.small,
                      buttonBoxShadow: true,
                      color: GFColor.success,
//                boxShadow: BoxShadow(
//                  color: Colors.pink,
//                  blurRadius: 2.0,
//                  spreadRadius: 1.0,
//                  offset: Offset.zero,
//                ),
//                borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//                borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
                    ),
                  ],
                )
              ],
            ),
          ),
          GFCard(
            content: Column(
              children: <Widget>[
                GFHeader(
                  text: 'Outline Icon Button',
                  type: GFHeadingType.typo6,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GFIconButton(
                      onPressed: null,
                      icon: Icon(Icons.ac_unit),
//              iconSize: 12.0,

                      type: GFType.outline,
                      size: GFSize.large,

//                boxShadow: BoxShadow(
//                  color: Colors.pink,
//                  blurRadius: 2.0,
//                  spreadRadius: 1.0,
//                  offset: Offset.zero,
//                ),
//                borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//                borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
                    ),
                    GFIconButton(
                      onPressed: null,
                      icon: Icon(Icons.ac_unit),
//              iconSize: 12.0,

                      size: GFSize.medium,
                      type: GFType.outline,
//                boxShadow: BoxShadow(
//                  color: Colors.pink,
//                  blurRadius: 2.0,
//                  spreadRadius: 1.0,
//                  offset: Offset.zero,
//                ),
//                borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//                borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
                    ),
                    GFIconButton(
                      onPressed: null,
                      icon: Icon(Icons.ac_unit),
//              iconSize: 12.0,

                      type: GFType.outline,
                      size: GFSize.small,

//                boxShadow: BoxShadow(
//                  color: Colors.pink,
//                  blurRadius: 2.0,
//                  spreadRadius: 1.0,
//                  offset: Offset.zero,
//                ),
//                borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//                borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
                    ),
                  ],
                )
              ],
            ),
          ),
          GFCard(
            content: Column(
              children: <Widget>[
                GFHeader(
                  text: 'Transparent Icon Button',
                  type: GFHeadingType.typo6,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GFIconButton(
                      onPressed: null,
                      icon: Icon(Icons.ac_unit),
//              iconSize: 12.0,

                      type: GFType.transparent,
                      size: GFSize.large,

//                boxShadow: BoxShadow(
//                  color: Colors.pink,
//                  blurRadius: 2.0,
//                  spreadRadius: 1.0,
//                  offset: Offset.zero,
//                ),
//                borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//                borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
                    ),
                    GFIconButton(
                      onPressed: null,
                      icon: Icon(Icons.ac_unit),
//              iconSize: 12.0,

                      size: GFSize.medium,
                      type: GFType.transparent,
//                boxShadow: BoxShadow(
//                  color: Colors.pink,
//                  blurRadius: 2.0,
//                  spreadRadius: 1.0,
//                  offset: Offset.zero,
//                ),
//                borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//                borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
                    ),
                    GFIconButton(
                      onPressed: null,
                      icon: Icon(Icons.ac_unit),
//              iconSize: 12.0,

                      type: GFType.transparent,
                      size: GFSize.small,

//                boxShadow: BoxShadow(
//                  color: Colors.pink,
//                  blurRadius: 2.0,
//                  spreadRadius: 1.0,
//                  offset: Offset.zero,
//                ),
//                borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//                borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
