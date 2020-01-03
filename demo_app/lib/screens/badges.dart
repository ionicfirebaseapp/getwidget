import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/badge/gf_badge.dart';
import 'package:ui_kit/components/badge/gf_button_badge.dart';
import 'package:ui_kit/components/badge/gf_icon_badge.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/components/header/gf_header.dart';
import 'package:ui_kit/components/tabs/gf_tabs.dart';
import 'package:ui_kit/components/button/gf_icon_button.dart';
import 'package:ui_kit/position/gf_position.dart';
import 'package:ui_kit/shape/gf_badge_shape.dart';
import 'package:ui_kit/shape/gf_button_shape.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:ui_kit/components/button/gf_button.dart';
import 'package:ui_kit/types/gf_heading_type.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/components/tabs/gf_tabBarView.dart';

class Badges extends StatefulWidget {
  @override
  _BadgesState createState() => _BadgesState();
}

class _BadgesState extends State<Badges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getGFColor(GFColor.dark),
        title: Text(
          'Badges',
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: GFTabs(
        height: MediaQuery.of(context).size.height,
        tabBarColor: Color(0xFFD3E9ED),
        initialIndex: 0,
        length: 3,
        tabs: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Text('Badge'),
          ),
          Text('Button Badge'),
          Text('Icon Badge'),
        ],
        tabBarView: GFTabBarView(
          children: <Widget>[
            ListView(
              children: <Widget>[
                GFCard(
                  content: Column(
                    children: <Widget>[
                      GFHeader(
                        text: 'Types of Badges',
                        type: GFHeadingType.typo6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GFBadge(
                            text: '1',
                            shape: GFBadgeShape.circle,
                            color: GFColor.success,
                          ),
                          GFBadge(
                            text: '1',
                            shape: GFBadgeShape.square,
                            color: GFColor.primary,
                          ),
                          GFBadge(
                            text: '1',
                            shape: GFBadgeShape.pills,
                            color: GFColor.danger,
                            textColor: GFColor.white,
                          ),
                          GFBadge(
                            text: '1',
                            shape: GFBadgeShape.standard,
                            color: GFColor.warning,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GFCard(
                  content: Column(
                    children: <Widget>[
                      GFHeader(
                        text: 'Circled Badges with different Sizes',
                        type: GFHeadingType.typo6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GFBadge(
                            text: '1',
                            shape: GFBadgeShape.circle,
                            size: GFSize.large,
                            color: GFColor.success,
                          ),
                          GFBadge(
                            text: '1',
                            shape: GFBadgeShape.circle,
                            size: GFSize.medium,
                            color: GFColor.success,
                          ),
                          GFBadge(
                            text: '1',
                            shape: GFBadgeShape.circle,
                            size: GFSize.small,
                            color: GFColor.success,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GFCard(
                  content: Column(
                    children: <Widget>[
                      GFHeader(
                        text: 'Squared Badges with different sizes',
                        type: GFHeadingType.typo6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GFBadge(
                            text: '1',
                            shape: GFBadgeShape.square,
                            size: GFSize.large,
                            color: GFColor.primary,
                          ),
                          GFBadge(
                            text: '1',
                            shape: GFBadgeShape.square,
                            size: GFSize.medium,
                            color: GFColor.primary,
                          ),
                          GFBadge(
                            text: '1',
                            shape: GFBadgeShape.square,
                            size: GFSize.small,
                            color: GFColor.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GFCard(
                  content: Column(
                    children: <Widget>[
                      GFHeader(
                        text: 'Pills with different sizes',
                        type: GFHeadingType.typo6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GFBadge(
                            text: '1',
                            shape: GFBadgeShape.pills,
                            size: GFSize.large,
                            color: GFColor.danger,
                            textColor: GFColor.white,
                          ),
                          GFBadge(
                            text: '1',
                            shape: GFBadgeShape.pills,
                            size: GFSize.medium,
                            textColor: GFColor.white,
                            color: GFColor.danger,
                          ),
                          GFBadge(
                            text: '1',
                            shape: GFBadgeShape.pills,
                            size: GFSize.small,
                            textColor: GFColor.white,
                            color: GFColor.danger,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GFCard(
                  content: Column(
                    children: <Widget>[
                      GFHeader(
                        text: 'Standard Badges with different sizes',
                        type: GFHeadingType.typo6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GFBadge(
                            text: '1',
                            shape: GFBadgeShape.standard,
                            size: GFSize.large,
                            color: GFColor.warning,
                          ),
                          GFBadge(
                            text: '1',
                            shape: GFBadgeShape.standard,
                            size: GFSize.medium,
                            color: GFColor.warning,
                          ),
                          GFBadge(
                            text: '1',
                            shape: GFBadgeShape.standard,
                            size: GFSize.small,
                            color: GFColor.warning,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                GFCard(
                  content: Column(
                    children: <Widget>[
                      GFHeader(
                        text: 'Types of Button Badges',
                        type: GFHeadingType.typo6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GFButtonBadge(
                            shape: GFButtonShape.pills,
                            type: GFType.solid,
                            color: GFColor.info,
                            counterChild: GFBadge(
                              text: '12',
                              color: GFColor.warning,
                              shape: GFBadgeShape.circle,
                            ),
                            onPressed: null,
                            text: 'Pills',
                            position: GFPosition.end,
                          ),
                          GFButtonBadge(
                            shape: GFButtonShape.square,
                            type: GFType.solid,
                            color: GFColor.warning,
                            counterChild: GFBadge(
                              text: '12',
                              shape: GFBadgeShape.circle,
                              color: GFColor.info,
                            ),
                            onPressed: null,
                            text: 'Square',
                          ),
                          GFButtonBadge(
                            color: GFColor.success,
                            shape: GFButtonShape.standard,
                            type: GFType.solid,
                            counterChild: GFBadge(
                              text: '12',
 textColor: GFColor.white,
 color: GFColor.danger,
                              shape: GFBadgeShape.circle,
                            ),
                            onPressed: null,
                            text: 'Standard',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                GFCard(
                  content: Column(
                    children: <Widget>[
                      GFHeader(
                        text: 'Positions of Button Badges',
                        type: GFHeadingType.typo6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GFButtonBadge(
                            shape: GFButtonShape.pills,
                            type: GFType.solid,
                            color: GFColor.info,
                            counterChild: GFBadge(
                              text: '12',
                              color: GFColor.warning,
                              shape: GFBadgeShape.circle,
                            ),
                            onPressed: null,
                            text: 'Pills',
                            position: GFPosition.start,
                          ),
                          GFButtonBadge(
                            shape: GFButtonShape.square,
                            type: GFType.solid,
                            color: GFColor.warning,
                            counterChild: GFBadge(
                              text: '12',
                              shape: GFBadgeShape.circle,
                              color: GFColor.info,
                            ),
                            onPressed: null,
                            text: 'Square',
                            position: GFPosition.start,
                          ),
                          GFButtonBadge(
                            color: GFColor.success,
                            shape: GFButtonShape.standard,
                            type: GFType.solid,
                            counterChild: GFBadge(
                              text: '12',
                              textColor: GFColor.white,
                              color: GFColor.danger,
                              shape: GFBadgeShape.circle,
                            ),
                            onPressed: null,
                            text: 'Standard',
                            position: GFPosition.start,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                GFCard(
                  content: Column(
                    children: <Widget>[
                      GFHeader(
                        text: 'Pilled shape Button Badges with sizes',
                        type: GFHeadingType.typo6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GFButtonBadge(
                            shape: GFButtonShape.pills,
                            size: GFSize.large,
                            type: GFType.solid,
                            color: GFColor.info,
                            counterChild: GFBadge(
                              text: '12',
                              color: GFColor.warning,
                              size: GFSize.large,
                              shape: GFBadgeShape.circle,
                            ),
                            onPressed: null,
                            text: 'Solid',
                            position: GFPosition.end,
                          ),
                          GFButtonBadge(
                            shape: GFButtonShape.pills,
                            size: GFSize.medium,
                            type: GFType.outline,
                            color: GFColor.info,
                            counterChild: GFBadge(
                              text: '12',
                              color: GFColor.warning,
                              size: GFSize.medium,
                              shape: GFBadgeShape.circle,
                            ),
                            onPressed: null,
                            text: 'Outline',
                            position: GFPosition.end,
                          ),
                          GFButtonBadge(
                            shape: GFButtonShape.pills,
                            size: GFSize.small,
                            type: GFType.transparent,
                            color: GFColor.info,
                            counterChild: GFBadge(
                              text: '12',
                              color: GFColor.warning,
                              size: GFSize.small,
                              shape: GFBadgeShape.circle,
                            ),
                            onPressed: null,
                            text: 'Transp',
                            position: GFPosition.end,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                GFCard(
                  content: Column(
                    children: <Widget>[
                      GFHeader(
                        text: 'Squared shape Button Badges with sizes',
                        type: GFHeadingType.typo6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GFButtonBadge(
                            shape: GFButtonShape.square,
                            size: GFSize.large,
                            type: GFType.solid,
                            color: GFColor.warning,
                            counterChild: GFBadge(
                              text: '12',
                              color: GFColor.info,
                              size: GFSize.large,
                              shape: GFBadgeShape.circle,
                            ),
                            onPressed: null,
                            text: 'Solid',
                            position: GFPosition.end,
                          ),
                          GFButtonBadge(
                            shape: GFButtonShape.square,
                            size: GFSize.medium,
                            type: GFType.outline,
                            color: GFColor.warning,
                            counterChild: GFBadge(
                              text: '12',
                              color: GFColor.info,
                              size: GFSize.medium,
                              shape: GFBadgeShape.circle,
                            ),
                            onPressed: null,
                            text: 'Outline',
                            position: GFPosition.end,
                          ),
                          GFButtonBadge(
                            shape: GFButtonShape.square,
                            size: GFSize.small,
                            type: GFType.transparent,
                            color: GFColor.warning,
                            counterChild: GFBadge(
                              text: '12',
                              color: GFColor.info,
                              size: GFSize.small,
                              shape: GFBadgeShape.circle,
                            ),
                            onPressed: null,
                            text: 'Transp',
                            position: GFPosition.end,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                GFCard(
                  content: Column(
                    children: <Widget>[
                      GFHeader(
                        text: 'Standard  Button Badges with sizes',
                        type: GFHeadingType.typo6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GFButtonBadge(
                            shape: GFButtonShape.standard,
                            size: GFSize.large,
                            type: GFType.solid,
                            color: GFColor.primary,
                            counterChild: GFBadge(
                              text: '12',
                              color: GFColor.danger,
                              size: GFSize.large,
                              textColor: GFColor.white,
                              shape: GFBadgeShape.circle,
                            ),
                            onPressed: null,
                            text: 'Solid',
                            position: GFPosition.end,
                          ),
                          GFButtonBadge(
                            shape: GFButtonShape.standard,
                            size: GFSize.medium,
                            type: GFType.outline,
                            color: GFColor.primary,
                            counterChild: GFBadge(
                              text: '12',
                              color: GFColor.danger,
                              textColor: GFColor.white,
                              size: GFSize.medium,
                              shape: GFBadgeShape.circle,
                            ),
                            onPressed: null,
                            text: 'Outline',
                            position: GFPosition.end,
                          ),
                          GFButtonBadge(
                            shape: GFButtonShape.standard,
                            size: GFSize.small,
                            type: GFType.transparent,
                            color: GFColor.primary,
                            counterChild: GFBadge(
                              text: '12',
                              color: GFColor.danger,
                              textColor: GFColor.white,
                              size: GFSize.small,
                              shape: GFBadgeShape.circle,
                            ),
                            onPressed: null,
                            text: 'Transp',
                            position: GFPosition.end,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
           ListView(
             children: <Widget>[
               GFCard(
                 content: Column(
                   children: <Widget>[
                     GFHeader(
                       text: 'Types of Icon Badges',
                       type: GFHeadingType.typo6,
                     ),
                   SizedBox(
                     height: 10,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                       GFIconBadges(
                         onPressed: null,
                         child: GFIconButton(
                           shape: GFButtonShape.circle,
                           color: GFColor.success,
                           type: GFType.solid,
                           onPressed: null,
                           icon: Icon(Icons.mail),
                         ),
                         counterChild: GFBadge(
                           text: '12',

//                color: GFColor.dark,
//
                           shape: GFBadgeShape.circle,

                           size: GFSize.small,
                         )
                       ),
                       GFIconBadges(
                         onPressed: null,
                         child: GFIconButton(
                           shape: GFButtonShape.square,
                           color: GFColor.primary,
                           type: GFType.solid,
                           onPressed: null,
                           icon: Icon(Icons.mail),
                         ),
                         counterChild: GFBadge(
                           text: '12',

//                color: GFColor.dark,
//
                           shape: GFBadgeShape.circle,

                           size: GFSize.small,
                         )
                       ),
                       GFIconBadges(
                         onPressed: null,
                         child: GFIconButton(
                           shape: GFButtonShape.pills,
                           color: GFColor.danger,
                           type: GFType.solid,
                           onPressed: null,
                           icon: Icon(Icons.mail),
                         ),
                         counterChild: GFBadge(
                           text: '12',

//                color: GFColor.dark,
//
                           shape: GFBadgeShape.circle,

                           size: GFSize.small,
                         )
                       ),
                       GFIconBadges(
                         onPressed: null,
                         child: GFIconButton(
                           shape: GFButtonShape.standard,
                           type: GFType.solid,
                           color: GFColor.warning,
                           onPressed: null,
                           icon: Icon(Icons.mail),
                         ),
                         counterChild: GFBadge(
                           text: '12',

//                color: GFColor.dark,
//
                           shape: GFBadgeShape.circle,

                           size: GFSize.small,
                         )
                       ),
                     ],
                   )
                   ],
                 ),
               ),
               GFCard(
                 content: Column(
                   children: <Widget>[
                     GFHeader(
                       text: 'Shapes of Icon Badges',
                       type: GFHeadingType.typo6,
                     ),
                     SizedBox(
                       height: 10,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         GFIconBadges(
                             onPressed: null,
                             child: GFIconButton(
                               shape: GFButtonShape.circle,

                               onPressed: null,
                               icon: Icon(Icons.mail),
                             ),
                             counterChild: GFBadge(
                               text: '12',

//                color: GFColor.dark,
//
                               shape: GFBadgeShape.circle,

                               size: GFSize.small,
                             )
                         ),
                         GFIconBadges(
                             onPressed: null,
                             child: GFIconButton(
                               shape: GFButtonShape.square,


                               onPressed: null,
                               icon: Icon(Icons.mail),
                             ),
                             counterChild: GFBadge(
                               text: '12',

//                color: GFColor.dark,
//
                               shape: GFBadgeShape.circle,

                               size: GFSize.small,
                             )
                         ),
                         GFIconBadges(
                             onPressed: null,
                             child: GFIconButton(
                               shape: GFButtonShape.pills,


                               onPressed: null,
                               icon: Icon(Icons.mail),
                             ),
                             counterChild: GFBadge(
                               text: '12',

//                color: GFColor.dark,
//
                               shape: GFBadgeShape.circle,

                               size: GFSize.small,
                             )
                         ),
                         GFIconBadges(
                             onPressed: null,
                             child: GFIconButton(
                               shape: GFButtonShape.standard,

                               onPressed: null,
                               icon: Icon(Icons.mail),
                             ),
                             counterChild: GFBadge(
                               text: '12',

//                color: GFColor.dark,
//
                               shape: GFBadgeShape.circle,

                               size: GFSize.small,
                             )
                         ),
                       ],
                     )
                   ],
                 ),
               ),
               GFCard(
                 content: Column(
                   children: <Widget>[
                     GFHeader(
                       text: 'Sizes of Icon Badges',
                       type: GFHeadingType.typo6,
                     ),
                     SizedBox(
                       height: 10,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[

                         GFIconBadges(
                             onPressed: null,
                             child: GFIconButton(
                               size: GFSize.large,

                               onPressed: null,
                               icon: Icon(Icons.mail),
                             ),
                             counterChild: GFBadge(
                               text: '12',

//                color: GFColor.dark,
//
                               shape: GFBadgeShape.circle,

                               size: GFSize.small,
                             )
                         ),
                         GFIconBadges(
                             onPressed: null,
                             child: GFIconButton(

                               size: GFSize.medium,

                               onPressed: null,
                               icon: Icon(Icons.mail),
                             ),
                             counterChild: GFBadge(
                               text: '12',

//                color: GFColor.dark,
//
                               shape: GFBadgeShape.circle,

                               size: GFSize.small,
                             )
                         ),
                         GFIconBadges(

                             onPressed: null,
                             child: GFIconButton(

                                size: GFSize.small,

                               onPressed: null,
                               icon: Icon(Icons.mail),
                             ),
                             counterChild: GFBadge(
                               text: '12',

//                color: GFColor.dark,
//
                               shape: GFBadgeShape.circle,

                               size: GFSize.small,
                             )
                         ),
                       ],
                     )
                   ],
                 ),
               )
             ],
           )
          ],
        ),
        indicatorColor: getGFColor(GFColor.dark),
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: getGFColor(GFColor.success),
        unselectedLabelColor: Colors.black,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13.0,
          color: Colors.deepOrange,
          fontFamily: 'OpenSansBold',
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13.0,
          color: Colors.black,
          fontFamily: 'OpenSansBold',
        ),
      ),
    );
  }
}
