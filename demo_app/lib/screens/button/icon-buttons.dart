import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/button/gf_button.dart';
import 'package:ui_kit/components/button/gf_icon_button.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/components/typography/gf_typography.dart';
import 'package:ui_kit/types/gf_typography_type.dart';
import 'package:ui_kit/shape/gf_button_shape.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset('lib/assets/icons/back.png')),
          title: Text(
            'Icon Buttons',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: GFTypography(
                text: 'Solid Icons',
                type: GFTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Color(0xFF19CA4B),
              ),
            ),
//
//          GFCard(
//            content: Column(
//              children: <Widget>[
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
////    GFIconButton(
////              onPressed: (){},
////              icon: Icon(Icons.ac_unit),
//////              iconSize: 12.0,
////              type: GFType.solid,
////              shape: GFButtonShape.pills,
////              size: GFSize.large,
//////              buttonBoxShadow: true,
//////              color: GFColor.primary,
//////              boxShadow: BoxShadow(
//////                color: Colors.pink,
//////                blurRadius: 2.0,
//////                spreadRadius: 1.0,
//////                offset: Offset.zero,
//////              ),
//////              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//////              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
////            ),
//
//
//                  ],
//                ),
//              ],
//            )
//          )

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
                            onPressed: () {},
                            child: Text(
                              "Primary",
                            ),
                            icon: SvgPicture.asset(
                                'lib/assets/icons/primary.svg')),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: GFButton(
                          onPressed: () {},
                          child: Text("Second"),
                          icon: SvgPicture.asset(
                              'lib/assets/icons/secondary.svg'),
                          color: GFColor.secondary,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: GFButton(
                          onPressed: () {},
                          child: Text(
                            "Success",
                          ),
                          icon:
                              SvgPicture.asset('lib/assets/icons/success.svg'),
                          color: GFColor.success,
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
                          "Warning",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/warning.svg'),
                        color: GFColor.warning,
                      ),
                      GFButton(
                        onPressed: () {},
                        child: Text(
                          "Danger",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/danger.svg'),
                        color: GFColor.danger,
                      ),
                      GFButton(
                        onPressed: () {},
                        child: Text(
                          "Info",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/info.svg'),
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
                        onPressed: () {},
                        child: Text(
                          "Light",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/light.svg'),
                        type: GFType.solid,
                        color: GFColor.light,
                      ),
                      GFButton(
                        onPressed: () {},
                        child: Text(
                          "Dark",
                          style: TextStyle(color: getGFColor(GFColor.white)),
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/dark.svg'),
                        color: GFColor.dark,
                      ),
                      GFButton(
                        onPressed: () {},
                        child: Text(
                          "Link",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/link.svg'),
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
              padding: EdgeInsets.only(left: 15, top: 10),
              child: GFTypography(
                text: 'Outline Icons',
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
                            onPressed: () {},
                            type: GFType.outline,
                            child: Text(
                              "Primary",
                            ),
                            icon: SvgPicture.asset(
                              'lib/assets/icons/primary.svg',
                              color: getGFColor(GFColor.primary),
                            )),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: GFButton(
                          onPressed: () {},
                          child: Text("Second"),
                          icon: SvgPicture.asset(
                            'lib/assets/icons/secondary.svg',
                            color: getGFColor(GFColor.secondary),
                          ),
                          color: GFColor.secondary,
                          type: GFType.outline,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: GFButton(
                          onPressed: () {},
                          child: Text(
                            "Success",
                          ),
                          icon: SvgPicture.asset(
                            'lib/assets/icons/success.svg',
                            color: getGFColor(GFColor.success),
                          ),
                          color: GFColor.success,
                          type: GFType.outline,
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
                          "Warning",
                        ),
                        icon: SvgPicture.asset(
                          'lib/assets/icons/warning.svg',
                          color: getGFColor(GFColor.warning),
                        ),
                        color: GFColor.warning,
                        type: GFType.outline,
                      ),
                      GFButton(
                        onPressed: () {},
                        child: Text(
                          "Danger",
                        ),
                        icon: SvgPicture.asset(
                          'lib/assets/icons/danger.svg',
                          color: getGFColor(GFColor.danger),
                        ),
                        color: GFColor.danger,
                        type: GFType.outline,
                      ),
                      GFButton(
                        onPressed: () {},
                        child: Text(
                          "Info",
                        ),
                        icon: SvgPicture.asset(
                          'lib/assets/icons/info.svg',
                          color: getGFColor(GFColor.info),
                        ),
                        color: GFColor.info,
                        type: GFType.outline,
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
                          "Light",
                        ),
                        icon: SvgPicture.asset(
                          'lib/assets/icons/light.svg',
                          color: getGFColor(GFColor.light),
                        ),
                        type: GFType.outline,
                        color: GFColor.light,
                      ),
                      GFButton(
                        onPressed: () {},
                        child: Text(
                          "Dark",
                        ),
                        icon: SvgPicture.asset(
                          'lib/assets/icons/dark.svg',
                          color: getGFColor(GFColor.dark),
                        ),
                        color: GFColor.dark,
                        type: GFType.outline,
                      ),
                      GFButton(
                        onPressed: () {},
                        child: Text(
                          "Link",
                        ),
                        icon: SvgPicture.asset(
                          'lib/assets/icons/link.svg',
                          color: getGFColor(GFColor.alt),
                        ),
                        color: GFColor.transparent,
                        type: GFType.outline,
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
              padding: EdgeInsets.only(left: 15, top: 10),
              child: GFTypography(
                text: 'Outline 2x Icons',
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
                            onPressed: () {},
                            type: GFType.outline2x,
                            child: Text(
                              "Primary",
                            ),
                            icon: SvgPicture.asset(
                              'lib/assets/icons/primary.svg',
                              color: getGFColor(GFColor.primary),
                            )),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: GFButton(
                          onPressed: () {},
                          child: Text("Second"),
                          icon: SvgPicture.asset(
                            'lib/assets/icons/secondary.svg',
                            color: getGFColor(GFColor.secondary),
                          ),
                          color: GFColor.secondary,
                          type: GFType.outline2x,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: GFButton(
                          onPressed: () {},
                          child: Text(
                            "Success",
                          ),
                          icon: SvgPicture.asset(
                            'lib/assets/icons/success.svg',
                            color: getGFColor(GFColor.success),
                          ),
                          color: GFColor.success,
                          type: GFType.outline2x,
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
                          "Warning",
                        ),
                        icon: SvgPicture.asset(
                          'lib/assets/icons/warning.svg',
                          color: getGFColor(GFColor.warning),
                        ),
                        color: GFColor.warning,
                        type: GFType.outline2x,
                      ),
                      GFButton(
                        onPressed: () {},
                        child: Text(
                          "Danger",
                        ),
                        icon: SvgPicture.asset(
                          'lib/assets/icons/danger.svg',
                          color: getGFColor(GFColor.danger),
                        ),
                        color: GFColor.danger,
                        type: GFType.outline2x,
                      ),
                      GFButton(
                        onPressed: () {},
                        child: Text(
                          "Info",
                        ),
                        icon: SvgPicture.asset(
                          'lib/assets/icons/info.svg',
                          color: getGFColor(GFColor.info),
                        ),
                        color: GFColor.info,
                        type: GFType.outline2x,
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
                          "Light",
                        ),
                        icon: SvgPicture.asset(
                          'lib/assets/icons/light.svg',
                          color: getGFColor(GFColor.light),
                        ),
                        type: GFType.outline2x,
                        color: GFColor.light,
                      ),
                      GFButton(
                        onPressed: () {},
                        child: Text(
                          "Dark",
                        ),
                        icon: SvgPicture.asset(
                          'lib/assets/icons/dark.svg',
                          color: getGFColor(GFColor.dark),
                        ),
                        color: GFColor.dark,
                        type: GFType.outline2x,
                      ),
                      GFButton(
                        onPressed: () {},
                        child: Text(
                          "Link",
                        ),
                        icon: SvgPicture.asset(
                          'lib/assets/icons/link.svg',
                          color: getGFColor(GFColor.alt),
                        ),
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
              padding: EdgeInsets.only(left: 15, top: 10),
              child: GFTypography(
                text: 'Square Icons',
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
                            onPressed: () {},
                            shape: GFButtonShape.square,
                            child: Text(
                              "Primary",
                            ),
                            icon: SvgPicture.asset(
                                'lib/assets/icons/primary.svg')),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: GFButton(
                          onPressed: () {},
                          shape: GFButtonShape.square,
                          child: Text("Second"),
                          icon: SvgPicture.asset(
                              'lib/assets/icons/secondary.svg'),
                          color: GFColor.secondary,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: GFButton(
                          shape: GFButtonShape.square,
                          onPressed: () {},
                          child: Text(
                            "Success",
                          ),
                          icon:
                              SvgPicture.asset('lib/assets/icons/success.svg'),
                          color: GFColor.success,
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
                        shape: GFButtonShape.square,
                        child: Text(
                          "Warning",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/warning.svg'),
                        color: GFColor.warning,
                      ),
                      GFButton(
                        onPressed: () {},
                        shape: GFButtonShape.square,
                        child: Text(
                          "Danger",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/danger.svg'),
                        color: GFColor.danger,
                      ),
                      GFButton(
                        onPressed: () {},
                        shape: GFButtonShape.square,
                        child: Text(
                          "Info",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/info.svg'),
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
                        onPressed: () {},
                        shape: GFButtonShape.square,
                        child: Text(
                          "Light",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/light.svg'),
                        type: GFType.solid,
                        color: GFColor.light,
                      ),
                      GFButton(
                        onPressed: () {},
                        shape: GFButtonShape.square,
                        child: Text(
                          "Dark",
                          style: TextStyle(color: getGFColor(GFColor.white)),
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/dark.svg'),
                        color: GFColor.dark,
                      ),
                      GFButton(
                        onPressed: () {},
                        shape: GFButtonShape.square,
                        child: Text(
                          "Link",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/link.svg'),
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
              padding: EdgeInsets.only(left: 15, top: 10),
              child: GFTypography(
                text: 'Pills Icons',
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
                            onPressed: () {},
                            shape: GFButtonShape.pills,
                            child: Text(
                              "Primary",
                            ),
                            icon: SvgPicture.asset(
                                'lib/assets/icons/primary.svg')),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: GFButton(
                          onPressed: () {},
                          shape: GFButtonShape.pills,
                          child: Text("Second"),
                          icon: SvgPicture.asset(
                              'lib/assets/icons/secondary.svg'),
                          color: GFColor.secondary,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: GFButton(
                          shape: GFButtonShape.pills,
                          onPressed: () {},
                          child: Text(
                            "Success",
                          ),
                          icon:
                              SvgPicture.asset('lib/assets/icons/success.svg'),
                          color: GFColor.success,
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
                        shape: GFButtonShape.pills,
                        child: Text(
                          "Warning",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/warning.svg'),
                        color: GFColor.warning,
                      ),
                      GFButton(
                        onPressed: () {},
                        shape: GFButtonShape.pills,
                        child: Text(
                          "Danger",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/danger.svg'),
                        color: GFColor.danger,
                      ),
                      GFButton(
                        onPressed: () {},
                        shape: GFButtonShape.pills,
                        child: Text(
                          "Info",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/info.svg'),
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
                        onPressed: () {},
                        shape: GFButtonShape.pills,
                        child: Text(
                          "Light",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/light.svg'),
                        type: GFType.solid,
                        color: GFColor.light,
                      ),
                      GFButton(
                        onPressed: () {},
                        shape: GFButtonShape.pills,
                        child: Text(
                          "Dark",
                          style: TextStyle(color: getGFColor(GFColor.white)),
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/dark.svg'),
                        color: GFColor.dark,
                      ),
                      GFButton(
                        onPressed: () {},
                        shape: GFButtonShape.pills,
                        child: Text(
                          "Link",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/link.svg'),
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
              padding: EdgeInsets.only(left: 15, top: 10),
              child: GFTypography(
                text: 'Shadow Buttons',
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
                          onPressed: () {},
                          child: Text(
                            "Primary",
                          ),
                          icon:
                              SvgPicture.asset('lib/assets/icons/primary.svg'),
                          buttonBoxShadow: true,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: GFButton(
                          onPressed: () {},
                          child: Text("Second"),
                          icon: SvgPicture.asset(
                              'lib/assets/icons/secondary.svg'),
                          color: GFColor.secondary,
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
                            "Success",
                          ),
                          icon:
                              SvgPicture.asset('lib/assets/icons/success.svg'),
                          color: GFColor.success,
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
                          "Warning",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/warning.svg'),
                        color: GFColor.warning,
                        buttonBoxShadow: true,
                      ),
                      GFButton(
                        onPressed: () {},
                        child: Text(
                          "Danger",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/danger.svg'),
                        color: GFColor.danger,
                        buttonBoxShadow: true,
                      ),
                      GFButton(
                        onPressed: () {},
                        child: Text(
                          "Info",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/info.svg'),
                        color: GFColor.info,
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
                          "Light",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/light.svg'),
                        type: GFType.solid,
                        color: GFColor.light,
                        buttonBoxShadow: true,
                      ),
                      GFButton(
                        onPressed: () {},
                        child: Text(
                          "Dark",
                          style: TextStyle(color: getGFColor(GFColor.white)),
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/dark.svg'),
                        color: GFColor.dark,
                        buttonBoxShadow: true,
                      ),
                      GFButton(
                        onPressed: () {},
                        child: Text(
                          "Link",
                        ),
                        icon: SvgPicture.asset('lib/assets/icons/link.svg'),
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
              padding: EdgeInsets.only(left: 15, top: 10),
              child: GFTypography(
                text: 'Button Sizes',
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
                      GFButton(
                        onPressed: () {},
                        child: Text("Large",
                            style: TextStyle(color: getGFColor(GFColor.white))),
                        color: GFColor.primary,
                        size: GFSize.large,
                        icon: SvgPicture.asset('lib/assets/icons/primary.svg'),
                      ),
                      GFButton(
                        onPressed: () {},
                        child: Text("Normal",
                            style: TextStyle(color: getGFColor(GFColor.white))),
                        color: GFColor.primary,
                        size: GFSize.medium,
                        icon:
                            SvgPicture.asset('lib/assets/icons/secondary.svg'),
                      ),
                      GFButton(
                        onPressed: () {},
                        child: Text("Small",
                            style: TextStyle(color: getGFColor(GFColor.white))),
                        color: GFColor.primary,
                        size: GFSize.small,
                        icon: SvgPicture.asset('lib/assets/icons/info.svg'),
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
              padding: EdgeInsets.only(left: 15, top: 10),
              child: GFTypography(
                text: 'Block Buttons',
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
                  GFButton(
                    onPressed: () {},
                    blockButton: true,
                    child: Text(
                      "Large",
                    ),
                    size: GFSize.large,
                    icon: SvgPicture.asset('lib/assets/icons/primary.svg'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GFButton(
                    onPressed: () {},
                    blockButton: true,
                    child: Text(
                      "Normal",
                    ),
                    size: GFSize.medium,
                    icon: SvgPicture.asset('lib/assets/icons/secondary.svg'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GFButton(
                    onPressed: () {},
                    blockButton: true,
                    child: Text(
                      "Small",
                    ),
                    size: GFSize.small,
                    icon: SvgPicture.asset('lib/assets/icons/success.svg'),
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
                text: 'Icons Only',
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
                          icon:
                              SvgPicture.asset('lib/assets/icons/primary.svg'),
                          onPressed: () {}),
                      GFIconButton(
                          color: GFColor.secondary,
                          icon: SvgPicture.asset(
                              'lib/assets/icons/secondary.svg'),
                          onPressed: () {}),
                      GFIconButton(
                          color: GFColor.success,
                          icon:
                              SvgPicture.asset('lib/assets/icons/success.svg'),
                          onPressed: () {}),
                      GFIconButton(
                          color: GFColor.warning,
                          icon:
                              SvgPicture.asset('lib/assets/icons/warning.svg'),
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
                          color: GFColor.danger,
                          icon: SvgPicture.asset('lib/assets/icons/danger.svg'),
                          onPressed: () {}),
                      GFIconButton(
                          color: GFColor.info,
                          icon: SvgPicture.asset('lib/assets/icons/info.svg'),
                          onPressed: () {}),
                      GFIconButton(
                          color: GFColor.light,
                          icon: SvgPicture.asset('lib/assets/icons/light.svg'),
                          onPressed: () {}),
                      GFIconButton(
                          color: GFColor.dark,
                          icon: SvgPicture.asset('lib/assets/icons/dark.svg'),
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
                          type: GFType.outline,
                          icon: Icon(Icons.settings),
                          onPressed: () {}),
                      GFIconButton(
                          type: GFType.outline,
                          color: GFColor.secondary,
                          icon: Icon(Icons.send),
                          onPressed: () {}),
                      GFIconButton(
                          type: GFType.outline,
                          color: GFColor.success,
                          icon: Icon(Icons.file_download),
                          onPressed: () {}),
                      GFIconButton(
                          type: GFType.outline,
                          color: GFColor.warning,
                          icon: Icon(Icons.warning),
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
                          type: GFType.outline,
                          color: GFColor.danger,
                          icon: Icon(Icons.insert_drive_file),
                          onPressed: () {}),
                      GFIconButton(
                          type: GFType.outline,
                          color: GFColor.info,
                          icon: Icon(Icons.delete),
                          onPressed: () {}),
                      GFIconButton(
                          type: GFType.outline,
                          color: GFColor.light,
                          icon: Icon(Icons.info),
                          onPressed: () {}),
                      GFIconButton(
                          type: GFType.outline,
                          color: GFColor.dark,
                          icon: Icon(Icons.apps),
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
        ));
  }
}
