//import 'package:flutter/material.dart';
//import 'package:ui_kit/components/avatar/gf_avatar.dart';
//import 'package:ui_kit/components/list_tile/gf_list_tile.dart';
//
//class GFList extends StatefulWidget {
//
//  const GFList(
//      {Key key,
//        this.child,
//        this.text = 'Lorem ipsum',
//        this.icon = const Icon(Icons.keyboard_arrow_right),
//        this.textStyle,
//        this.showDivider= true
//
//      })
//      : super(key: key);
//
//
//
//  final Widget child;
//
//  final String text;
//
//  final Widget icon;
//
//  final TextStyle textStyle;
//
//  final bool showDivider;
//
//
//  @override
//  _GFListState createState() => _GFListState();
//}
//
//class _GFListState extends State<GFList> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        height: MediaQuery.of(context).size.height,
//        width: MediaQuery.of(context).size.width,
//      margin: EdgeInsets.only(left: 10),
//      padding: EdgeInsets.only(right: 5, top: 10),
//      child:ListView.builder(
//    shrinkWrap: true,
////    scrollDirection: Axis.horizontal,
////     itemCount: 0,
//    itemBuilder: (BuildContext context, int index) {
//      return Container(
////        height: MediaQuery.of(context).size.height,
////        width: MediaQuery.of(context).size.width,
//        child: GFListTile(
//          title: Text('j'),
//          avatar: GFAvatar(),
//        ),
//      );
//    }
//
//
//)
//    );
//  }
//}
