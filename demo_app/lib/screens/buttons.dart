import 'package:flutter/material.dart';
import 'package:ui_kit/components/header/gf_header.dart';
import 'package:ui_kit/components/tabs/gf_tabs.dart';
import 'package:ui_kit/components/button/gf_button.dart';
import 'package:ui_kit/types/gf_heading_type.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/shape/gf_button_shape.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/card/gf_card.dart';

class Buttons extends StatefulWidget {
  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getGFColor(GFColor.dark),
        title: Text(
          'Buttons',
          style: TextStyle(fontSize: 14),
        ),
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
            text: 'Transparent',
            textStyle: TextStyle(fontSize: 12, color: getGFColor(GFColor.dark)),
            type: GFType.transparent,
          ),
        ],
        tabBarView: TabBarView(
          children: <Widget>[
            Container(
//              color: Colors.red,
              child: ListView(
                children: <Widget>[
                  GFCard(
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GFHeader(
                          text: 'Standard',
                          type: GFHeadingType.typo6,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
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
                                "Light",
                              ),
                              type: GFType.solid,
                              color: GFColor.light,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Info",
                              ),
                              type: GFType.solid,
                              color: GFColor.info,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Alt",
                                  style: TextStyle(
                                      color: getGFColor(GFColor.white))),
                              type: GFType.solid,
                              color: GFColor.alt,
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
                  GFCard(
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GFHeader(
                          text: 'Pills',
                          type: GFHeadingType.typo6,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text("Primary",
                                  style: TextStyle(
                                      color: getGFColor(GFColor.white))),
                              color: GFColor.primary,
                              shape: GFButtonShape.pills,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Secondary",
                                  style: TextStyle(
                                      color: getGFColor(GFColor.white))),
                              color: GFColor.secondary,
                              shape: GFButtonShape.pills,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Success",
                              ),
                              shape: GFButtonShape.pills,
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
                              shape: GFButtonShape.pills,
                              color: GFColor.warning,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Danger",
                                  style: TextStyle(
                                      color: getGFColor(GFColor.white))),
                              shape: GFButtonShape.pills,
                              color: GFColor.danger,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Light",
                              ),
                              shape: GFButtonShape.pills,
                              color: GFColor.light,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Info",
                              ),
                              shape: GFButtonShape.pills,
                              color: GFColor.info,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Alt",
                                  style: TextStyle(
                                      color: getGFColor(GFColor.white))),
                              shape: GFButtonShape.pills,
                              color: GFColor.alt,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Dark",
                                style:
                                    TextStyle(color: getGFColor(GFColor.white)),
                              ),
                              shape: GFButtonShape.pills,
                              color: GFColor.dark,
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
                              shape: GFButtonShape.pills,
                              color: GFColor.transparent,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  GFCard(
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GFHeader(
                          text: 'Square',
                          type: GFHeadingType.typo6,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text("Primary",
                                  style: TextStyle(
                                      color: getGFColor(GFColor.white))),
                              color: GFColor.primary,
                              shape: GFButtonShape.square,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Secondary",
                                  style: TextStyle(
                                      color: getGFColor(GFColor.white))),
                              color: GFColor.secondary,
                              shape: GFButtonShape.square,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Success",
                              ),
                              shape: GFButtonShape.square,
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
                              shape: GFButtonShape.square,
                              color: GFColor.warning,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Danger",
                                  style: TextStyle(
                                      color: getGFColor(GFColor.white))),
                              shape: GFButtonShape.square,
                              color: GFColor.danger,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Light",
                              ),
                              shape: GFButtonShape.square,
                              color: GFColor.light,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Info",
                              ),
                              shape: GFButtonShape.square,
                              color: GFColor.info,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Alt",
                                  style: TextStyle(
                                      color: getGFColor(GFColor.white))),
                              shape: GFButtonShape.square,
                              color: GFColor.alt,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Dark",
                                style:
                                    TextStyle(color: getGFColor(GFColor.white)),
                              ),
                              shape: GFButtonShape.square,
                              color: GFColor.dark,
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
                              shape: GFButtonShape.square,
                              color: GFColor.transparent,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
//              color: Colors.red,
              child: ListView(
                children: <Widget>[
                  GFCard(
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GFHeader(
                          text: 'Standard',
                          type: GFHeadingType.typo6,
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
                                "Light",
                              ),
                              type: GFType.outline,
                              color: GFColor.light,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Info",
                              ),
                              type: GFType.outline,
                              color: GFColor.info,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Alt",
                              ),
                              type: GFType.outline,
                              color: GFColor.alt,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Dark",
                              ),
                              type: GFType.outline,
                              color: GFColor.dark,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GFCard(
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GFHeader(
                          text: 'Pills',
                          type: GFHeadingType.typo6,
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
                                "Primary",
                              ),
                              type: GFType.outline,
                              color: GFColor.primary,
                              shape: GFButtonShape.pills,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Secondary",
                              ),
                              color: GFColor.secondary,
                              shape: GFButtonShape.pills,
                              type: GFType.outline,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Success",
                              ),
                              shape: GFButtonShape.pills,
                              color: GFColor.success,
                              type: GFType.outline,
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
                              shape: GFButtonShape.pills,
                              color: GFColor.warning,
                              type: GFType.outline,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Danger",
                              ),
                              shape: GFButtonShape.pills,
                              color: GFColor.danger,
                              type: GFType.outline,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Light",
                              ),
                              shape: GFButtonShape.pills,
                              color: GFColor.light,
                              type: GFType.outline,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Info",
                              ),
                              shape: GFButtonShape.pills,
                              color: GFColor.info,
                              type: GFType.outline,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Alt",
                              ),
                              shape: GFButtonShape.pills,
                              color: GFColor.alt,
                              type: GFType.outline,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Dark",
                              ),
                              shape: GFButtonShape.pills,
                              color: GFColor.dark,
                              type: GFType.outline,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GFCard(
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GFHeader(
                          text: 'Square',
                          type: GFHeadingType.typo6,
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
                                "Primary",
                              ),
                              type: GFType.outline,
                              color: GFColor.primary,
                              shape: GFButtonShape.square,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Secondary",
                              ),
                              color: GFColor.secondary,
                              shape: GFButtonShape.square,
                              type: GFType.outline,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Success",
                              ),
                              shape: GFButtonShape.square,
                              color: GFColor.success,
                              type: GFType.outline,
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
                              shape: GFButtonShape.square,
                              color: GFColor.warning,
                              type: GFType.outline,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Danger",
                              ),
                              shape: GFButtonShape.square,
                              color: GFColor.danger,
                              type: GFType.outline,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Light",
                              ),
                              shape: GFButtonShape.square,
                              color: GFColor.light,
                              type: GFType.outline,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Info",
                              ),
                              shape: GFButtonShape.square,
                              color: GFColor.info,
                              type: GFType.outline,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Alt",
                              ),
                              shape: GFButtonShape.square,
                              color: GFColor.alt,
                              type: GFType.outline,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text(
                                "Dark",
                              ),
                              shape: GFButtonShape.square,
                              color: GFColor.dark,
                              type: GFType.outline,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
