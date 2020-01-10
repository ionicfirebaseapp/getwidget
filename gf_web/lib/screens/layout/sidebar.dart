import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gf_web/styles/styles.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> with TickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  AnimationController controller;
  Animation<Offset> offset;


  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 2), vsync: this);
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 0.1),).animate(controller);
//    animation =   Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(parent: animationController, curve: Curves.fastLinearToSlowEaseIn));
  }



  bool showButtonTypes = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
margin: EdgeInsets.only(right: 10,),
        padding: EdgeInsets.only(left:60, right: 20, top:30),
        width: 300,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withOpacity(0.30)
          ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.40),
                  blurRadius: 5.0
              ),
            ]
        ),
        child: ListView(
          children: <Widget>[

            Text('COMPONENTS', style: hintStyleTextblack(),),
           SizedBox(
             height: 25,
           ),
           GestureDetector(
             onTap: (){
               setState(() {
                 switch (controller.status) {
                   case AnimationStatus.completed:
                     controller.forward(from: 0);
                     break;
                   case AnimationStatus.dismissed:
                     controller.forward();
                     break;
                   default:
                 }
                 showButtonTypes = !showButtonTypes;
               });

             },
             child:  Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Text('GF Buttons', style: hintStyleTextblackdull()),
                 showButtonTypes? Icon(Icons.keyboard_arrow_down): Icon(Icons.keyboard_arrow_right)
               ],
             )
           ),
           showButtonTypes?
           SlideTransition(
             position: offset,
             child: Container(
               height: 200,
               decoration: BoxDecoration(
                 color: Colors.white,
                 boxShadow: [
                   BoxShadow(
                     color: Colors.black.withOpacity(0.40)
                   )
                 ]
               ),
                padding: EdgeInsets.only(top:0, bottom: 30, left: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                   GestureDetector(
                     onTap: (){
                       Navigator.pushNamed(context, '/gf-buttons/standard-button');
                     },
                     child:  Text('Standard Buttons'),
                   ),
                    Text('Pills Buttons'),
                    Text('Square Buttons'),
                    Text('Shadow Buttons'),
                    Text('Icon Buttons'),
                    Text('Social Buttons')
                  ],
                ),
              ),
           ):Container(),

            SizedBox(
              height: 20,
            ),

            Text('GF Badge', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Avatar', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Image', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Card', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Slider', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Tile', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Tab', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Typography', style: hintStyleTextblackdull()),
            SizedBox(
              height: 30,
            ),
            Text('COMING SOON', style: hintStyleTextblack(),),
            SizedBox(
              height: 25,
            ),
            Text('GF Forms', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Chip', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),

            Text('GF List', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Spinner', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Header', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Footer', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Toggle', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Drawer', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Accordian', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Toast', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Alert', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Model', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Action Sheet', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Floating Button', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Popover', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Recorder', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Infinite Scroll', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Searchbar', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
            Text('GF Refresher', style: hintStyleTextblackdull()),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
