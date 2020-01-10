import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                flex: 6,
//                child: Image.asset('lib/assets/logo.png')
            child: Image.network('https://ik.imagekit.io/ionicfirebaseapp/get-flutter-logo_FAN-82xCG.png', height: 40.0,),
            ),
          Flexible(
              fit: FlexFit.tight,
              flex: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Home', style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600),),
              Text('Features', style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600),),
              Text('Docs', style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600),),
              Text('Blog', style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600),),
              Text('Contact', style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600),)
            ],
          ))
          ],
        ),

      ),
    );
  }
}
