import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/components/avatar/gf_avatar.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/components/typography/gf_typography.dart';
import 'package:ui_kit/shape/gf_avatar_shape.dart';
import 'package:ui_kit/types/gf_typography_type.dart';
import 'package:ui_kit/colors/gf_color.dart';

class Avatars extends StatefulWidget {
  @override
  _AvatarsState createState() => _AvatarsState();
}

class _AvatarsState extends State<Avatars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getGFColor(GFColor.dark),
        title: Text('Avatar', style: TextStyle(fontSize: 14),),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
         GFCard(
           content:   Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               GFTypography(
                 text: 'Circle Avatar',
                 type: GFTypographyType.typo6,
               ),
               SizedBox(
                 height: 10,
               ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GFAvatar(
                      backgroundColor: getGFColor(GFColor.primary),
                      child: Icon(Icons.face),
                    foregroundColor: getGFColor(GFColor.white),
                  ),
                  GFAvatar(
                      backgroundColor: getGFColor(GFColor.secondary),
                      child: Icon(Icons.face),
                    foregroundColor: getGFColor(GFColor.white),
                  ),
                  GFAvatar(
                      backgroundColor: getGFColor(GFColor.success),
                      child: Icon(Icons.face),
                    foregroundColor: getGFColor(GFColor.white),
                  ),
                  GFAvatar(
                      backgroundColor: getGFColor(GFColor.info),
                      child: Icon(Icons.face),
                    foregroundColor: getGFColor(GFColor.white),
                  ),
                  GFAvatar(
                      backgroundColor: getGFColor(GFColor.danger),
                      child: Icon(Icons.face),
                    foregroundColor: getGFColor(GFColor.white),
                  ),


                ],
              ),

               SizedBox(
                 height: 15,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   GFAvatar(
                       backgroundColor: getGFColor(GFColor.warning),
                       child: Icon(Icons.face),
                     foregroundColor: getGFColor(GFColor.white),
                   ),
                   GFAvatar(
                       backgroundColor: getGFColor(GFColor.dark),
                       child: Icon(Icons.face),
                     foregroundColor: getGFColor(GFColor.white),
                   ),
                   GFAvatar(
                       backgroundColor: getGFColor(GFColor.light),
                       child: Icon(Icons.face),
                     foregroundColor: getGFColor(GFColor.white),
                   ),
                   GFAvatar(
                       backgroundColor: getGFColor(GFColor.alt),
                       child: Icon(Icons.face),
                     foregroundColor: getGFColor(GFColor.white),
                   ),
                   GFAvatar(
                       backgroundColor: getGFColor(GFColor.transparent),
                       child: Icon(Icons.face),
                     foregroundColor: getGFColor(GFColor.dark),
                   ),

                 ],
               ),

             ],
           ),
         ),
            GFCard(
              content:   Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GFTypography(
                    text: 'Square Avatar',
                    type: GFTypographyType.typo6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GFAvatar(
                        backgroundColor: getGFColor(GFColor.primary),
                        child: Icon(Icons.face),
                        foregroundColor: getGFColor(GFColor.white),
                        shape: GFAvatarShape.square,
                      ),
                      GFAvatar(
                        backgroundColor: getGFColor(GFColor.secondary),
                        child: Icon(Icons.face),
                        foregroundColor: getGFColor(GFColor.white),
                        shape: GFAvatarShape.square,
                      ),
                      GFAvatar(
                        backgroundColor: getGFColor(GFColor.success),
                        child: Icon(Icons.face),
                        foregroundColor: getGFColor(GFColor.white),
                        shape: GFAvatarShape.square,
                      ),
                      GFAvatar(
                        backgroundColor: getGFColor(GFColor.info),
                        child: Icon(Icons.face),
                        foregroundColor: getGFColor(GFColor.white),
                        shape: GFAvatarShape.square,
                      ),
                      GFAvatar(
                        backgroundColor: getGFColor(GFColor.danger),
                        child: Icon(Icons.face),
                        foregroundColor: getGFColor(GFColor.white),
                        shape: GFAvatarShape.square,
                      ),


                    ],
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GFAvatar(
                        backgroundColor: getGFColor(GFColor.warning),
                        child: Icon(Icons.face),
                        foregroundColor: getGFColor(GFColor.white),
                        shape: GFAvatarShape.square,
                      ),
                      GFAvatar(
                        backgroundColor: getGFColor(GFColor.dark),
                        child: Icon(Icons.face),
                        foregroundColor: getGFColor(GFColor.white),
                        shape: GFAvatarShape.square,
                      ),
                      GFAvatar(
                        backgroundColor: getGFColor(GFColor.light),
                        child: Icon(Icons.face),
                        foregroundColor: getGFColor(GFColor.white),
                        shape: GFAvatarShape.square,
                      ),
                      GFAvatar(
                        backgroundColor: getGFColor(GFColor.alt),
                        child: Icon(Icons.face),
                        foregroundColor: getGFColor(GFColor.white),
                        shape: GFAvatarShape.square,
                      ),
                      GFAvatar(
                        backgroundColor: getGFColor(GFColor.transparent),
                        child: Icon(Icons.face),
                        foregroundColor: getGFColor(GFColor.dark),

                      ),

                    ],
                  ),
                ],
              ),
            ),
            GFCard(
              content:   Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GFTypography(
                    text: 'Standard Avatar',
                    type: GFTypographyType.typo6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GFAvatar(
                        backgroundColor: getGFColor(GFColor.primary),
                        child: Icon(Icons.face),
                        foregroundColor: getGFColor(GFColor.white),
                        shape: GFAvatarShape.standard,
                      ),
                      GFAvatar(
                        backgroundColor: getGFColor(GFColor.secondary),
                        child: Icon(Icons.face),
                        foregroundColor: getGFColor(GFColor.white),
                        shape: GFAvatarShape.standard,
                      ),
                      GFAvatar(
                        backgroundColor: getGFColor(GFColor.success),
                        child: Icon(Icons.face),
                        foregroundColor: getGFColor(GFColor.white),
                        shape: GFAvatarShape.standard,
                      ),
                      GFAvatar(
                        backgroundColor: getGFColor(GFColor.info),
                        child: Icon(Icons.face),
                        foregroundColor: getGFColor(GFColor.white),
                        shape: GFAvatarShape.standard,
                      ),
                      GFAvatar(
                        backgroundColor: getGFColor(GFColor.danger),
                        child: Icon(Icons.face),
                        foregroundColor: getGFColor(GFColor.white),
                        shape: GFAvatarShape.standard,
                      ),


                    ],
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GFAvatar(
                        backgroundColor: getGFColor(GFColor.warning),
                        child: Icon(Icons.face),
                        foregroundColor: getGFColor(GFColor.white),
                        shape: GFAvatarShape.standard,
                      ),
                      GFAvatar(
                        backgroundColor: getGFColor(GFColor.dark),
                        child: Icon(Icons.face),
                        foregroundColor: getGFColor(GFColor.white),
                        shape: GFAvatarShape.standard,
                      ),
                      GFAvatar(
                        backgroundColor: getGFColor(GFColor.light),
                        child: Icon(Icons.face),
                        foregroundColor: getGFColor(GFColor.white),
                        shape: GFAvatarShape.standard,
                      ),
                      GFAvatar(
                        backgroundColor: getGFColor(GFColor.alt),
                        child: Icon(Icons.face),
                        foregroundColor: getGFColor(GFColor.white),
                        shape: GFAvatarShape.standard,
                      ),
                      GFAvatar(
                        backgroundColor: getGFColor(GFColor.transparent),
                        child: Icon(Icons.face),
                        foregroundColor: getGFColor(GFColor.dark),

                      ),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
