import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/avatar/gf_avatar.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/components/typography/gf_typography.dart';
import 'package:ui_kit/types/gf_typography_type.dart';

class Headers extends StatefulWidget {
  @override
  _HeadersState createState() => _HeadersState();
}

class _HeadersState extends State<Headers> {
  bool showToast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getGFColor(GFColor.dark),
        title: Text(
          'Headers',
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GFCard(
                content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GFTypography(
                  text: 'GF Header Typo1',
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

//    body:
//
//    Container(
//      child: ListView(
//        children: <Widget>[
//          GFToast(
////            width: 70,
//            text: 'Happy New Year',
//            button: GFButton(onPressed: null,
//              text: 'OK',
//              type: GFType.outline,
//              color: GFColor.warning,
//            ),
//          ),
//
//
//          GFFloatingWidget(
////            horizontalPosition: 150,
//              child:  showToast? GFToast(
//                width: 200,
//                text: 'Happy New Year',
//                button: GFButton(onPressed: null,
//                  text: 'OK',
//                  type: GFType.outline,
//                  color: GFColor.warning,
//                ),
//              ):Container(),
//              body: Column(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  Container(
//
//                    margin: EdgeInsets.only(top:80, bottom: 10),
//                    alignment: Alignment.center,
//                    child:  GFButton(onPressed: (){
//                      setState(() {
//                        showToast = !showToast;
//                      });
//                    },
//                      text: 'Click to View the toast',
//                      type: GFType.outline,
//                      color: GFColor.warning,
//                    ),
//                  )
//                ],
//              )
//          )
//        ],
//      ),
//    ),
//
//    body:
//
//    ListView(
//      children: <Widget>[
//        GFToast(
//                width: 340,
//          text: 'Happy New Year',
//          button: GFButton(onPressed: null,
//            text: 'OK',
//            type: GFType.outline,
//            color: GFColor.warning,
//          ),
//        ),
//        GFFloatingWidget(
//            horizontalPosition: 80,
//            child:  showToast? GFToast(
//              width: 250,
//              text: 'Happy New Year',
//              button: GFButton(onPressed: null,
//                text: 'OK',
//                type: GFType.outline,
//                color: GFColor.warning,
//              ),
//            ):Container(),
//            body: Column(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[
//                Container(
//
//                  margin: EdgeInsets.only(top:0, bottom: 10, right: 40),
//                  alignment: Alignment.center,
//                  child:  GFButton(onPressed: (){
//                    setState(() {
//                      showToast = !showToast;
//                    });
//                  },
//                    text: 'Click to View the toast',
//                    type: GFType.outline,
//                    color: GFColor.warning,
//                  ),
//                )
//              ],
//            )
//        )
//      ],
//    ),
    );
  }
}
