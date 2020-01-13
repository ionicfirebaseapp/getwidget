import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/avatar/gf_avatar.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/shape/gf_avatar_shape.dart';
import 'package:ui_kit/types/gf_typography_type.dart';
import 'package:ui_kit/components/typography/gf_typography.dart';
import 'package:flutter/cupertino.dart';


class Avatar extends StatefulWidget {
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getGFColor(GFColor.dark),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
          child:  Icon(CupertinoIcons.back, color: getGFColor(GFColor.success), ),),
        title: Text(
          'Avatar',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15, top: 30),
            child: GFTypography(
              text: 'Basic Avatar',
              type: GFTypographyType.typo5,
              dividerWidth: 25,
              dividerColor: Color(0xFF19CA4B),
            ),
          ),
          
          GFCard(
            content: Column(
              children: <Widget>[
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GFAvatar(
                      backgroundImage: AssetImage('lib/assets/images/three.png'),
                    ),
                    GFAvatar(
                      backgroundImage: AssetImage('lib/assets/images/img.png'),
                    ),
                    GFAvatar(
                      backgroundImage: AssetImage('lib/assets/images/img1.png'),
                    ), GFAvatar(
                      backgroundImage: AssetImage('lib/assets/images/img2.png'),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GFAvatar(
backgroundImage: AssetImage('lib/assets/images/three1.png'),
                      shape: GFAvatarShape.standard,

                    ),
                    GFAvatar(
                      backgroundImage: AssetImage('lib/assets/images/three6.png'),
                      shape: GFAvatarShape.standard,
                    ),
                    GFAvatar(
                      backgroundImage: AssetImage('lib/assets/images/three4.png'),
                      shape: GFAvatarShape.standard,
                    ),
                    GFAvatar(
                      backgroundImage: AssetImage('lib/assets/images/three7.png'),
                      shape: GFAvatarShape.standard,
                    ),
                  ],
                ),

                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GFAvatar(
                      backgroundImage: AssetImage('lib/assets/images/three5.png',),
                      shape: GFAvatarShape.square,

                    ),
                    GFAvatar(
                      backgroundImage: AssetImage('lib/assets/images/three7.png'),
                      shape: GFAvatarShape.square,
                    ),
                    GFAvatar(
                      backgroundImage: AssetImage('lib/assets/images/three6.png'),
                      shape: GFAvatarShape.square,
                    ),
                    GFAvatar(
                      backgroundImage: AssetImage('lib/assets/images/three1.png'),
                      shape: GFAvatarShape.square,
                    ),
                  ],
                ),
                SizedBox(height: 10,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
