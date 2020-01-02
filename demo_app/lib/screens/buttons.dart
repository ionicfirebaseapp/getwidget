import 'package:flutter/material.dart';
import 'package:ui_kit/components/header/gf_header.dart';
import 'package:ui_kit/components/tabs/gf_tabs.dart';
import 'package:ui_kit/components/button/gf_button.dart';
import 'package:ui_kit/types/gf_heading_type.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/shape/gf_shape.dart';
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
        title: Text('Buttons', style: TextStyle(fontSize: 14),),
      ),
      body:    GFTabs(
        height: MediaQuery.of(context).size.height,
        tabBarColor: Color(0xFFD3E9ED),
        initialIndex: 0,
        length: 3,
        indicatorColor: Colors.transparent,
        unselectedLabelColor: getGFColor(GFColor.danger),
        labelColor:  getGFColor(GFColor.warning),

        tabs: <Widget>[
          GFButton(
            onPressed: null,
            child: Text("Solid",  style: TextStyle(fontSize: 12),),
            type: GFType.outline,
            shape: GFShape.pills,
          ),
          GFButton(
            onPressed: null,
            child: Text("Outline",  style: TextStyle(fontSize: 12),),
            type: GFType.outline,
            shape: GFShape.pills,

          ),
          GFButton(
            onPressed: null,
            text: 'Transparent',
            textStyle: TextStyle(fontSize: 12, color: getGFColor(GFColor.dark)),
            type: GFType.outline,
            shape: GFShape.pills,

          ),

        ],
        tabBarView: TabBarView(
          children: <Widget>[

            Container(
//              color: Colors.red,
              child:
              ListView(

                children: <Widget>[
                  GFCard(
                    content:Column(
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
                              child: Text("Primary", style: TextStyle(color: getGFColor(GFColor.white))),
                              type: GFType.solid,
                              color: GFColor.primary,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Secondary", style: TextStyle(color: getGFColor(GFColor.white))),
                              type: GFType.solid,
                              color: GFColor.secondary,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Success",),
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
                              child: Text("Warning",),
                              type: GFType.solid,
                              color: GFColor.warning,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Danger", style: TextStyle(color: getGFColor(GFColor.white))),
                              type: GFType.solid,
                              color: GFColor.danger,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Light",),
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
                              child: Text("Info",),
                              type: GFType.solid,
                              color: GFColor.info,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Alt", style: TextStyle(color: getGFColor(GFColor.white))),
                              type: GFType.solid,
                              color: GFColor.alt,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Dark", style: TextStyle(color: getGFColor(GFColor.white)),),
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
                              child: Text("Transparent",),
                              type: GFType.solid,
                              color: GFColor.transparent,
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                  GFCard(
                    content:Column(
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
                              child: Text("Primary", style: TextStyle(color: getGFColor(GFColor.white))),

                              color: GFColor.primary,
                              shape: GFShape.pills,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Secondary", style: TextStyle(color: getGFColor(GFColor.white))),
                              color: GFColor.secondary,
                              shape: GFShape.pills,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Success",),
                              shape: GFShape.pills,
                              color: GFColor.success,
                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text("Warning",),
                              shape: GFShape.pills,
                              color: GFColor.warning,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Danger", style: TextStyle(color: getGFColor(GFColor.white))),
                              shape: GFShape.pills,
                              color: GFColor.danger,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Light",),
                              shape: GFShape.pills,
                              color: GFColor.light,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text("Info",),
                              shape: GFShape.pills,
                              color: GFColor.info,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Alt", style: TextStyle(color: getGFColor(GFColor.white))),
                              shape: GFShape.pills,
                              color: GFColor.alt,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Dark", style: TextStyle(color: getGFColor(GFColor.white)),),
                              shape: GFShape.pills,
                              color: GFColor.dark,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text("Transparent",),
                              shape: GFShape.pills,
                              color: GFColor.transparent,
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                  GFCard(
                    content:Column(
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
                              child: Text("Primary", style: TextStyle(color: getGFColor(GFColor.white))),

                              color: GFColor.primary,
                              shape: GFShape.square,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Secondary", style: TextStyle(color: getGFColor(GFColor.white))),
                              color: GFColor.secondary,
                              shape: GFShape.square,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Success",),
                              shape: GFShape.square,
                              color: GFColor.success,
                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text("Warning",),
                              shape: GFShape.square,
                              color: GFColor.warning,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Danger", style: TextStyle(color: getGFColor(GFColor.white))),
                              shape: GFShape.square,
                              color: GFColor.danger,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Light",),
                              shape: GFShape.square,
                              color: GFColor.light,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text("Info",),
                              shape: GFShape.square,
                              color: GFColor.info,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Alt", style: TextStyle(color: getGFColor(GFColor.white))),
                              shape: GFShape.square,
                              color: GFColor.alt,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Dark", style: TextStyle(color: getGFColor(GFColor.white)),),
                              shape: GFShape.square,
                              color: GFColor.dark,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text("Transparent",),
                              shape: GFShape.square,
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
              child:
              ListView(

                children: <Widget>[
                  GFCard(
                    content:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Standard'),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text("Primary",),
                              type: GFType.outline,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Secondary"),
                              type: GFType.outline,

                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Success",),
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
                              child: Text("Warning",),
                              type: GFType.solid,
                              color: GFColor.warning,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Danger", style: TextStyle(color: getGFColor(GFColor.white))),
                              type: GFType.solid,
                              color: GFColor.danger,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Light",),
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
                              child: Text("Info",),
                              type: GFType.solid,
                              color: GFColor.info,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Alt", style: TextStyle(color: getGFColor(GFColor.white))),
                              type: GFType.solid,
                              color: GFColor.alt,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Dark", style: TextStyle(color: getGFColor(GFColor.white)),),
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
                              child: Text("Transparent",),
                              type: GFType.solid,
                              color: GFColor.transparent,
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                  GFCard(
                    content:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Pills'),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text("Primary", style: TextStyle(color: getGFColor(GFColor.white))),

                              color: GFColor.primary,
                              shape: GFShape.pills,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Secondary", style: TextStyle(color: getGFColor(GFColor.white))),
                              color: GFColor.secondary,
                              shape: GFShape.pills,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Success",),
                              shape: GFShape.pills,
                              color: GFColor.success,
                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text("Warning",),
                              shape: GFShape.pills,
                              color: GFColor.warning,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Danger", style: TextStyle(color: getGFColor(GFColor.white))),
                              shape: GFShape.pills,
                              color: GFColor.danger,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Light",),
                              shape: GFShape.pills,
                              color: GFColor.light,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text("Info",),
                              shape: GFShape.pills,
                              color: GFColor.info,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Alt", style: TextStyle(color: getGFColor(GFColor.white))),
                              shape: GFShape.pills,
                              color: GFColor.alt,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Dark", style: TextStyle(color: getGFColor(GFColor.white)),),
                              shape: GFShape.pills,
                              color: GFColor.dark,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text("Transparent",),
                              shape: GFShape.pills,
                              color: GFColor.transparent,
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                  GFCard(
                    content:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Square'),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text("Primary", style: TextStyle(color: getGFColor(GFColor.white))),

                              color: GFColor.primary,
                              shape: GFShape.square,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Secondary", style: TextStyle(color: getGFColor(GFColor.white))),
                              color: GFColor.secondary,
                              shape: GFShape.square,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Success",),
                              shape: GFShape.square,
                              color: GFColor.success,
                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text("Warning",),
                              shape: GFShape.square,
                              color: GFColor.warning,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Danger", style: TextStyle(color: getGFColor(GFColor.white))),
                              shape: GFShape.square,
                              color: GFColor.danger,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Light",),
                              shape: GFShape.square,
                              color: GFColor.light,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text("Info",),
                              shape: GFShape.square,
                              color: GFColor.info,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Alt", style: TextStyle(color: getGFColor(GFColor.white))),
                              shape: GFShape.square,
                              color: GFColor.alt,
                            ),
                            GFButton(
                              onPressed: null,
                              child: Text("Dark", style: TextStyle(color: getGFColor(GFColor.white)),),
                              shape: GFShape.square,
                              color: GFColor.dark,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GFButton(
                              onPressed: null,
                              child: Text("Transparent",),
                              shape: GFShape.square,
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
            Icon(Icons.directions_transit),

          ],
        ),
      ),
    );
  }
}
