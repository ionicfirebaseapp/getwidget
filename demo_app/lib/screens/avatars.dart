import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/components/avatar/gf_avatar.dart';
import 'package:ui_kit/shape/gf_shape.dart';

class Avatars extends StatefulWidget {
  @override
  _AvatarsState createState() => _AvatarsState();
}

class _AvatarsState extends State<Avatars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar', style: TextStyle(fontSize: 14),),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GFAvatar(
                child: Icon(Icons.face)
            ),
            GFAvatar(
                shape: GFShape.square,
                child: Icon(Icons.face)
            ),
            GFAvatar(
                shape: GFShape.standard,
                child: Icon(Icons.face)
            )
          ],
        ),
      )
    );
  }
}
