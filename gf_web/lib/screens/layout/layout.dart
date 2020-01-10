import 'package:flutter/material.dart';
import 'package:gf_web/screens/layout/mobile-demo.dart';
import 'sidebar.dart';
import 'header.dart';
import 'body.dart';

class Layout extends StatefulWidget {
  final Widget  body;
  const Layout ({Key key,
  this.body,
  }):super(key:key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            height: 70,
            child:  Header(),
          ),
          Row(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height-70,
                width: 300,
                child:  Sidebar(),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  height:MediaQuery.of(context).size.height -70,
                  width: MediaQuery.of(context).size.width -730,
                  child: widget.body
              ),
              Container(
                width: 430,
//                color: Colors.red,
                height: 600,
                child: MobileDemo(),
              )
            ],
          )
        ],
      ),
    );
  }
}
