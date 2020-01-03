import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/components/header/gf_header.dart';
import 'package:ui_kit/components/toggle/gf_toggle.dart';
import 'package:ui_kit/types/gf_heading_type.dart';
import 'package:ui_kit/types/gf_toggle_type.dart';
import 'package:ui_kit/colors/gf_color.dart';

class Toggles extends StatefulWidget {
  @override
  _TogglesState createState() => _TogglesState();
}

class _TogglesState extends State<Toggles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getGFColor(GFColor.dark),
        title: Text('Toggle', style: TextStyle(fontSize: 14),),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            GFCard(
              content: Column(
                children: <Widget>[
                  GFHeader(
                    text: 'Android',
                    type: GFHeadingType.typo6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GFToggle(onChanged: null, value: null,
                  type: GFToggleType.android,
                  )
                ],
              ),
            ),
            GFCard(
              content: Column(
                children: <Widget>[
                  GFHeader(
                    text: 'IOS',
                    type: GFHeadingType.typo6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GFToggle(onChanged: null, value: null,
                    type: GFToggleType.ios,
                  )
                ],
              ),
            ),
            GFCard(
              content: Column(
                children: <Widget>[
                  GFHeader(
                    text: 'Square',
                    type: GFHeadingType.typo6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GFToggle(onChanged: null, value: null,
                    type: GFToggleType.square,
                  )
                ],
              ),
            ),
            GFCard(
              content: Column(
                children: <Widget>[
                  GFHeader(
                    text: 'Custom',
                    type: GFHeadingType.typo6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GFToggle(onChanged: null, value: null,
                        type: GFToggleType.custom,
                      ),
                      GFToggle(onChanged: null, value: null,
                        type: GFToggleType.android,
                        boxShape: BoxShape.rectangle,
                        enabledTrackColor: getGFColor(GFColor.warning),

                      ),
                      GFToggle(onChanged: null, value: null,
                        type: GFToggleType.ios,
                        boxShape: BoxShape.rectangle,
                        enabledTrackColor: getGFColor(GFColor.info),


                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      GFToggle(onChanged: null, value: null,
                        type: GFToggleType.ios,
                        boxShape: BoxShape.rectangle,
                        enabledText: 'ON',
                        disabledText: 'OFF',
                        enabledTrackColor: getGFColor(GFColor.danger),
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      )
                    ],
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
