import 'package:flutter/material.dart';
import 'package:ui_kit/components/header/gf_header.dart';
import 'package:ui_kit/components/tabs/gf_tabs.dart';
import 'package:ui_kit/components/button/gf_button.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:ui_kit/types/gf_heading_type.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/shape/gf_button_shape.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/components/tabs/gf_tabBarView.dart';

class StandardButtons extends StatefulWidget {
  @override
  _StandardButtonsState createState() => _StandardButtonsState();
}

class _StandardButtonsState extends State<StandardButtons> {
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
          'Standard Buttons',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: GFTabs(
        height: MediaQuery.of(context).size.height,
        tabBarColor: Color(0xFFD3E9ED),
        initialIndex: 0,
        length: 3,
        indicatorColor: getGFColor(GFColor.info),
        unselectedLabelColor: getGFColor(GFColor.danger),
        labelColor: getGFColor(GFColor.warning),
        tabs: <Widget>[
          GFButton(
            onPressed: null,
            child: Text(
              "Solid",
              style: TextStyle(fontSize: 12),
            ),
            type: GFType.solid,
            textColor: GFColor.white,
          ),
          GFButton(
            onPressed: null,
            child: Text(
              "Outline",
              style: TextStyle(fontSize: 12),
            ),
            type: GFType.outline,
            shape: GFButtonShape.pills,
          ),
          GFButton(
            onPressed: null,
            text: 'Outline 2x',
            textStyle: TextStyle(fontSize: 12, color: getGFColor(GFColor.dark)),
            type: GFType.transparent,
          ),
        ],
        tabBarView: GFTabBarView(
          children: <Widget>[
            Container(
//              color: Colors.red,
              child: ListView(
                children: <Widget>[
                Padding(padding: EdgeInsets.only(left:15, top:30),
                child:   GFHeader(
                  text: 'Default',
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
                            GFButton(
                              onPressed: null,
                              shape: GFButtonShape.standard,
                              child: Text("Primary",
                                  style: TextStyle(
                                      color: getGFColor(GFColor.white))),
                              type: GFType.solid,
                              color: GFColor.primary,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Secondary",
                                  style: TextStyle(
                                      color: getGFColor(GFColor.white))),
                              type: GFType.solid,
                              color: GFColor.secondary,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Success",
                              ),
                              type: GFType.solid,
                              color: GFColor.success,
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
                                "Warning",
                              ),
                              type: GFType.solid,
                              color: GFColor.warning,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Danger",
                                  style: TextStyle(
                                      color: getGFColor(GFColor.white))),
                              type: GFType.solid,
                              color: GFColor.danger,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Info",
                              ),
                              type: GFType.solid,
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
                                "Light",
                              ),
                              type: GFType.solid,
                              color: GFColor.light,
                            ),

                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Dark",
                                style:
                                    TextStyle(color: getGFColor(GFColor.white)),
                              ),
                              type: GFType.solid,
                              color: GFColor.dark,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Alt",
                                  style: TextStyle(
                                      color: getGFColor(GFColor.white))),
                              type: GFType.solid,
                              color: GFColor.alt,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Transparent",
                              ),
                              type: GFType.solid,
                              color: GFColor.transparent,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  Padding(padding: EdgeInsets.only(left:15, top:20),
                    child:   GFHeader(
                      text: 'Transparent Buttons',
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
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Primary",
                              ),
                              type: GFType.transparent,
                              textColor: GFColor.primary,
                              color: GFColor.dark,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Secondary",
                              ),
                              type: GFType.transparent,
                              textColor: GFColor.secondary,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Success",
                              ),
                              type: GFType.transparent,
                              textColor: GFColor.success,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Warning",
                              ),
                              type: GFType.transparent,
                              textColor: GFColor.warning,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Danger",
                              ),
                              type: GFType.transparent,
                              textColor: GFColor.danger,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Info",
                              ),
                              type: GFType.transparent,
                              textColor: GFColor.info,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Light",
                              ),
                              type: GFType.transparent,
                              textColor: GFColor.light,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Dark",
                              ),
                              type: GFType.transparent,
                              textColor: GFColor.dark,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Alt",
                              ),
                              type: GFType.transparent,
                              textColor: GFColor.alt,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),


                  Padding(padding: EdgeInsets.only(left:15, top:20),
                    child:   GFHeader(
                      text: 'Button Sizes',
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
                            GFButton(
                              onPressed: null,
                              child: Text("Large",
                                  style: TextStyle(
                                      color: getGFColor(GFColor.white))),
                              color: GFColor.primary,
                              size: GFSize.large,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Normal",
                                  style: TextStyle(
                                      color: getGFColor(GFColor.white))),
                              color: GFColor.primary,
                              size: GFSize.medium,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Small",
                                  style: TextStyle(
                                      color: getGFColor(GFColor.white))),
                              color: GFColor.primary,
                              size: GFSize.small,
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),


                  Padding(padding: EdgeInsets.only(left:15, top:20),
                    child:   GFHeader(
                      text: 'Block Buttons',
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
                        GFButton(
                          onPressed: null,
                          blockButton: true,
                          child: Text("Large",
                              style: TextStyle(
                                  color: getGFColor(GFColor.white))),
                          color: GFColor.primary,
                          size: GFSize.large,
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        GFButton(
                          onPressed: null,
                          blockButton: true,
                          child: Text("Normal",
                              style: TextStyle(
                                  color: getGFColor(GFColor.white))),
                          color: GFColor.primary,
                          size: GFSize.medium,
                        ),

                        SizedBox(
                          height: 10,
                        ),


                        GFButton(
                          onPressed: null,
                          blockButton: true,
                          child: Text("Small",
                              style: TextStyle(
                                  color: getGFColor(GFColor.white))),
                          color: GFColor.primary,
                          size: GFSize.small,
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),


            //tab 2
            Container(
//              color: Colors.red,
              child: ListView(
                children: <Widget>[

                  Padding(padding: EdgeInsets.only(left:15, top:30),
                    child:   GFHeader(
                      text: 'Default',
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
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Primary",
                              ),
                              type: GFType.outline,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Secondary"),
                              type: GFType.outline,
                              color: GFColor.secondary,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Success",
                              ),
                              type: GFType.outline,
                              color: GFColor.success,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Warning",
                              ),
                              type: GFType.outline,
                              color: GFColor.warning,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Danger",
                              ),
                              type: GFType.outline,
                              color: GFColor.danger,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Info",
                              ),
                              type: GFType.outline,
                              color: GFColor.info,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Light",
                              ),
                              type: GFType.outline,
                              color: GFColor.light,
                            ),

                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Dark",
                              ),
                              type: GFType.outline,
                              color: GFColor.dark,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Alt",
                              ),
                              type: GFType.outline,
                              color: GFColor.alt,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),



                  Padding(padding: EdgeInsets.only(left:15, top:20),
                    child:   GFHeader(
                      text: 'Button Sizes',
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
                            GFButton(
                              onPressed: null,
                              child: Text("Large",
                                 ),
                              color: GFColor.primary,
                              size: GFSize.large,
                              type: GFType.outline,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Normal",
                                  ),
                              color: GFColor.primary,
                              size: GFSize.medium,
                              type: GFType.outline,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Small",
                                  ),
                              color: GFColor.primary,
                              size: GFSize.small,
                              type: GFType.outline,
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),


                  Padding(padding: EdgeInsets.only(left:15, top:20),
                    child:   GFHeader(
                      text: 'Block Buttons',
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
                        GFButton(
                          onPressed: null,
                          blockButton: true,
                          child: Text("Large",
                              ),
                          color: GFColor.primary,
                          size: GFSize.large,
                          type: GFType.outline,
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        GFButton(
                          onPressed: null,
                          blockButton: true,
                          child: Text("Normal",
                              ),
                          color: GFColor.primary,
                          size: GFSize.medium,
                          type: GFType.outline,
                        ),

                        SizedBox(
                          height: 10,
                        ),


                        GFButton(
                          onPressed: null,
                          blockButton: true,
                          child: Text("Small",
                             ),
                          color: GFColor.primary,
                          size: GFSize.small,
                          type: GFType.outline,
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),


            //tab 3
            Container(
                margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                height: 100,
                child: Column(
                  children: <Widget>[
                    GFHeader(
                      text: 'Transparent',
                      type: GFHeadingType.typo6,
                    ),
                    Row(
                      children: <Widget>[
                        GFButton(
                          onPressed: null,
                          child: Text(
                            "Primary",
                          ),
                          type: GFType.transparent,
                          textColor: GFColor.primary,
                        ),
                        GFButton(
                          onPressed: null,
                          child: Text(
                            "Secondary",
                          ),
                          type: GFType.transparent,
                          textColor: GFColor.secondary,
                        ),
                        GFButton(
                          onPressed: null,
                          child: Text(
                            "Success",
                          ),
                          type: GFType.transparent,
                          textColor: GFColor.success,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        GFButton(
                          onPressed: null,
                          child: Text(
                            "Warning",
                          ),
                          type: GFType.transparent,
                          textColor: GFColor.warning,
                        ),
                        GFButton(
                          onPressed: null,
                          child: Text(
                            "Danger",
                          ),
                          type: GFType.transparent,
                          textColor: GFColor.danger,
                        ),
                        GFButton(
                          onPressed: null,
                          child: Text(
                            "Dark",
                          ),
                          type: GFType.transparent,
                          textColor: GFColor.dark,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        GFButton(
                          onPressed: null,
                          child: Text(
                            "Light",
                          ),
                          type: GFType.transparent,
                          textColor: GFColor.light,
                        ),
                        GFButton(
                          onPressed: null,
                          child: Text(
                            "Info",
                          ),
                          type: GFType.transparent,
                          textColor: GFColor.info,
                        ),
                        GFButton(
                          onPressed: null,
                          child: Text(
                            "Alt",
                          ),
                          type: GFType.transparent,
                          textColor: GFColor.alt,
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
