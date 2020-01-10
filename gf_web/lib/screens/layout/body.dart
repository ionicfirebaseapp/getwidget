import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body:Container(
         margin: EdgeInsets.only(left: 40, top: 20),
         child:  ListView(
           children: <Widget>[
             Text('dfcghyjunkm')
           ],
         ),
       )
    );
  }
}
