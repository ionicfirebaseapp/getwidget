import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'buttons.dart';
import 'avatars.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GET FLUTTER', style: TextStyle(fontSize: 14),),
        centerTitle: true,
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 150,
              width: 150,
              child:  GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Buttons()),
                  );
                },
                child:  GFCard(
                  color: getGFColor(GFColor.success),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.bubble_chart),
                      Text('Buttons')
                    ],
                  ),
                ),
              )
            ),
            Container(
              height: 150,
              width: 150,
              child:   GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Avatars()),
                  );
                },
                child: GFCard(
                  color: getGFColor(GFColor.warning),
                  content: Column(
                    children: <Widget>[
                      Icon(Icons.face),
                      Text('Avatar')
                    ],
                  ),
                ),
              )
            )
          ],
        ),
      )
    );
  }
}
