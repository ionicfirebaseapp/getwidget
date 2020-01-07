import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/button/gf_button.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/components/header/gf_typography.dart';
import 'package:ui_kit/components/toast/gf_toast.dart';
import 'package:ui_kit/types/gf_typography_type.dart';
import 'package:ui_kit/types/gf_type.dart';

class Toasts extends StatefulWidget {
  @override
  _ToastsState createState() => _ToastsState();
}

class _ToastsState extends State<Toasts> {
  bool showToast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: getGFColor(GFColor.dark),
          title: Text(
            'Toast',
            style: TextStyle(fontSize: 14),
          ),
        ),
        body: ListView(
          children: <Widget>[
            GFCard(
              content: Column(
                children: <Widget>[
                  GFHeader(
                    text: 'Toast',
                    type: GFHeadingType.typo6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GFToast(
                    text: 'Happy New Year',
                    button: GFButton(
                      onPressed: null,
                      text: 'OK',
                      type: GFType.outline,
                      color: GFColor.warning,
                    ),
                  ),
                ],
              ),
            ),

//          GFCard(
//            content: Column(
//              children: <Widget>[
//                GFHeader(
//                  text: 'Floating Toast',
//                  type: GFHeadingType.typo6,
//                ),
//                GFFloatingWidget(
//                    horizontalPosition: 80,
//                    child:  showToast? GFToast(
//                   width: 300,
//                      text: 'Happy New Year',
//                      button: GFButton(onPressed: null,
//                        text: 'OK',
//                        type: GFType.outline,
//                        color: GFColor.warning,
//                      ),
//                    ):Container(),
//                    body: Column(
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: <Widget>[
//                        Container(
//
//                          margin: EdgeInsets.only(top:0, bottom: 10, right: 40),
//                          alignment: Alignment.center,
//                          child:  GFButton(onPressed: (){
//                            setState(() {
//                              showToast = !showToast;
//                            });
//                          },
//                            text: 'Click to View the toast',
//                            type: GFType.outline,
//                            color: GFColor.warning,
//                          ),
//                        )
//                      ],
//                    )
//                )
//              ],
//            ),
//          )
          ],
        ));
  }
}
