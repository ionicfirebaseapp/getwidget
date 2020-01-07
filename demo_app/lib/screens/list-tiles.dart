import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/avatar/gf_avatar.dart';
import 'package:ui_kit/components/button/gf_icon_button.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/components/typography/gf_typography.dart';
import 'package:ui_kit/components/list_tile/gf_list_tile.dart';
import 'package:ui_kit/shape/gf_avatar_shape.dart';
import 'package:ui_kit/types/gf_typography_type.dart';

class ListTiles extends StatefulWidget {
  @override
  _ListTilesState createState() => _ListTilesState();
}

class _ListTilesState extends State<ListTiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getGFColor(GFColor.dark),
        title: Text('List Tile', style: TextStyle(fontSize: 14),),
      ),
      body: ListView(
        children: <Widget>[


          GFCard(
            content:  GFListTile(

              title: GFTypography(
                text: 'List tile',
                type: GFTypographyType.typo5,
                showDivider: false,
              ),
              subTitle: Text('Lorem ipsum', style: TextStyle(color: getGFColor(GFColor.dark)),),

              showDivider: false,

            ),
          ),
         GFCard(
           content:  GFListTile(
             avatar: GFAvatar(
               shape: GFAvatarShape.standard,
             ),
             title: GFTypography(
               text: 'List tile',
               type: GFTypographyType.typo5,
               showDivider: false,
             ),
             subTitle: Text('Lorem ipsum', style: TextStyle(color: getGFColor(GFColor.dark)),),

             description: Text('Dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ',
                 style: TextStyle(fontSize: 13, color: getGFColor(GFColor.secondary))),
             showDivider: false,
           ),
         ),

         GFCard(
           content:  GFListTile(

               title: GFTypography(
                 text: 'List tile',
                 type: GFTypographyType.typo5,
                 showDivider: false,
               ),
               subTitle: Text('Lorem ipsum', style: TextStyle(color: getGFColor(GFColor.dark)),),

               description: Text('Dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ',
                   style: TextStyle(fontSize: 13, color: getGFColor(GFColor.secondary))),
               icon: GFAvatar(
                 shape: GFAvatarShape.circle,
               ),
             showDivider: false,

           ),
         ),

          GFCard(
            content:  GFListTile(
             avatar: GFAvatar(
               shape: GFAvatarShape.square,
             ),
              title: GFTypography(
                text: 'List tile',
                type: GFTypographyType.typo5,
                showDivider: false,
              ),
              subTitle: Text('Lorem ipsum', style: TextStyle(color: getGFColor(GFColor.dark)),),

              description: Text('Dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ',
                  style: TextStyle(fontSize: 13, color: getGFColor(GFColor.secondary))),
              icon: GFIconButton(icon: Icon(Icons.share), onPressed: null),
              showDivider: false,

            ),
          )
        ],
      ),
    );
  }
}
