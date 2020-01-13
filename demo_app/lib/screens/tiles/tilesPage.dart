import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/avatar/gf_avatar.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/components/list_tile/gf_list_tile.dart';
import 'package:ui_kit/components/typography/gf_typography.dart';
import 'package:ui_kit/shape/gf_avatar_shape.dart';
import 'package:ui_kit/types/gf_typography_type.dart';
import 'package:flutter/cupertino.dart';

class TilesPage extends StatefulWidget {
  @override
  _TilesPageState createState() => _TilesPageState();
}

class _TilesPageState extends State<TilesPage> {
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
          'Tiles',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15, top: 30),
            child: GFTypography(
              text: 'with Label',
              type: GFTypographyType.typo5,
              dividerWidth: 25,
              dividerColor: Color(0xFF19CA4B),
            ),
          ),

          GFCard(
            content: GFListTile(
              title: Text('Title'),
              subTitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing'),
              icon: Icon(Icons.favorite),
              showDivider: false,
            ),

                  ),

          GFCard(
            content: GFListTile(
              avatar: Icon(Icons.favorite),
              title: Text('Title'),
              icon: Text('Caption'),
              showDivider: false,
            ),

          ),

          Padding(
            padding: EdgeInsets.only(left: 15, top: 30),
            child: GFTypography(
              text: 'with avatar',
              type: GFTypographyType.typo5,
              dividerWidth: 25,
              dividerColor: Color(0xFF19CA4B),
            ),
          ),

          GFCard(
            content: GFListTile(
              avatar:GFAvatar(
                backgroundImage: AssetImage('lib/assets/images/three3.png'),
              ),
              title: Text('Title'),
              subTitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing'),
              showDivider: false,
            ),

          ),

          GFCard(
            content: GFListTile(
              avatar:GFAvatar(
                shape: GFAvatarShape.standard,
                backgroundImage: AssetImage('lib/assets/images/three5.png'),
              ),
              title: Text('Title'),
              icon: Text('Caption'),
              showDivider: false,
            ),

          ),


        ],
      ),
    );
  }
}
