import 'package:flutter/material.dart';
import 'package:gf_web/screens/layout/layout.dart';
import '../../styles/styles.dart';
import 'package:ui_kit/components/button/gf_button.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_kit/shape/gf_button_shape.dart';
import 'package:ui_kit/components/typography/gf_typography.dart';


import 'package:ui_kit/components/button/gf_icon_button.dart';



class IconButtons extends StatefulWidget {
  @override
  _IconButtonsState createState() => _IconButtonsState();
}

class _IconButtonsState extends State<IconButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
        body: ListView(
          children: <Widget>[
            Text('Icon Buttons', style: hintStyleTextblackbolder(),),
            SizedBox(
              height: 20,
            ),
            Text('Buttons of type icon which comes in different sizes that can be used in forms, alerts, and more...', style: hintStyleTextblackdull(),),
            SizedBox(
              height: 30,
            ),
            Text('Solid Icons',  style: hintStyleTextblackbold(),),
            GFCard(
              content: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Primary',
                        icon: SvgPicture.asset(
                                'lib/assets/icons/primary.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Secondary',
                        color: GFColor.secondary,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/secondary.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Success',
                        color: GFColor.success,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/success.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Warning',
                        color: GFColor.warning,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/warning.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'danger',
                        color: GFColor.danger,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/danger.svg')
                      ))
                    ],
                  ),
SizedBox(
  height: 20,
),
                  Row(
                    children: <Widget>[
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Info',
                        color: GFColor.info,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/info.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Light',
                        color: GFColor.light,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/light.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Dark',
                        color: GFColor.dark,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/dark.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Link',
                        color: GFColor.transparent,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/link.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: Text(''))

                    ],
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
 //outline icons
             Text('Outline Icons',  style: hintStyleTextblackbold(),),
            GFCard(
              content: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child: GFButton(
                        onPressed: (){},
                            type: GFType.outline,
                              color: GFColor.primary,
                          
                        text: 'Primary',
                        icon: SvgPicture.asset(
                                'lib/assets/icons/primary.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                            type: GFType.outline,
                        text: 'Secondary',
                        color: GFColor.secondary,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/secondary.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                            type: GFType.outline,
                        text: 'Success',
                        color: GFColor.success,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/success.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                            type: GFType.outline,
                        text: 'Warning',
                        color: GFColor.warning,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/warning.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                            type: GFType.outline,
                        text: 'danger',
                        color: GFColor.danger,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/danger.svg')
                      ))
                    ],
                  ),
SizedBox(
  height: 20,
),
                  Row(
                    children: <Widget>[
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Info',
                            type: GFType.outline,
                        color: GFColor.info,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/info.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                            type: GFType.outline,
                        text: 'Light',
                        color: GFColor.light,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/light.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                            type: GFType.outline,
                        text: 'Dark',
                        color: GFColor.dark,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/dark.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                            type: GFType.outline,
                        text: 'Link',
                        color: GFColor.transparent,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/link.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: Text(''))

                    ],
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

//outline 2x icons
             Text('Outline 2x Icons',  style: hintStyleTextblackbold(),),
            GFCard(
              content: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child: GFButton(
                        onPressed: (){},
                            type: GFType.outline2x,
                              color: GFColor.primary,
                          
                        text: 'Primary',
                        icon: SvgPicture.asset(
                                'lib/assets/icons/primary.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                            type: GFType.outline2x,
                        text: 'Secondary',
                        color: GFColor.secondary,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/secondary.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                            type: GFType.outline2x,
                        text: 'Success',
                        color: GFColor.success,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/success.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                            type: GFType.outline2x,
                        text: 'Warning',
                        color: GFColor.warning,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/warning.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                            type: GFType.outline2x,
                        text: 'danger',
                        color: GFColor.danger,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/danger.svg')
                      ))
                    ],
                  ),
SizedBox(
  height: 20,
),
                  Row(
                    children: <Widget>[
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Info',
                            type: GFType.outline2x,
                        color: GFColor.info,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/info.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                            type: GFType.outline2x,
                        text: 'Light',
                        color: GFColor.light,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/light.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                            type: GFType.outline2x,
                        text: 'Dark',
                        color: GFColor.dark,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/dark.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                            type: GFType.outline2x,
                        text: 'Link',
                        color: GFColor.transparent,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/link.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: Text(''))

                    ],
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
//square icons
Text('Square Icons',  style: hintStyleTextblackbold(),),
            GFCard(
              content: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child: GFButton(
                        onPressed: (){},
                            shape: GFButtonShape.square,
                        text: 'Primary',
                        icon: SvgPicture.asset(
                                'lib/assets/icons/primary.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Secondary',
                            shape: GFButtonShape.square,
                        color: GFColor.secondary,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/secondary.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Success',
                            shape: GFButtonShape.square,
                        color: GFColor.success,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/success.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Warning',
                            shape: GFButtonShape.square,
                        color: GFColor.warning,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/warning.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'danger',
                            shape: GFButtonShape.square,
                        color: GFColor.danger,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/danger.svg')
                      ))
                    ],
                  ),
SizedBox(
  height: 20,
),
                  Row(
                    children: <Widget>[
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Info',
                            shape: GFButtonShape.square,
                        color: GFColor.info,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/info.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Light',
                            shape: GFButtonShape.square,
                        color: GFColor.light,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/light.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Dark',
                            shape: GFButtonShape.square,
                        color: GFColor.dark,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/dark.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                            shape: GFButtonShape.square,
                        text: 'Link',
                        color: GFColor.transparent,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/link.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: Text(''))

                    ],
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
//pills icons
Text('Pills Icons',  style: hintStyleTextblackbold(),),
            GFCard(
              content: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child: GFButton(
                        onPressed: (){},
                            shape: GFButtonShape.pills,
                        text: 'Primary',
                        icon: SvgPicture.asset(
                                'lib/assets/icons/primary.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Secondary',
                            shape: GFButtonShape.pills,
                        color: GFColor.secondary,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/secondary.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Success',
                            shape: GFButtonShape.pills,
                        color: GFColor.success,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/success.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Warning',
                            shape: GFButtonShape.pills,
                        color: GFColor.warning,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/warning.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'danger',
                            shape: GFButtonShape.pills,
                        color: GFColor.danger,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/danger.svg')
                      ))
                    ],
                  ),
SizedBox(
  height: 20,
),
                  Row(
                    children: <Widget>[
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Info',
                            shape: GFButtonShape.pills,
                        color: GFColor.info,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/info.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Light',
                            shape: GFButtonShape.pills,
                        color: GFColor.light,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/light.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Dark',
                            shape: GFButtonShape.pills,
                        color: GFColor.dark,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/dark.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                            shape: GFButtonShape.pills,
                        text: 'Link',
                        color: GFColor.transparent,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/link.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: Text(''))

                    ],
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
//shadow icons
Text('Shadow Icons',  style: hintStyleTextblackbold(),),
            GFCard(
              content: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child: GFButton(
                        onPressed: (){},
                          buttonBoxShadow: true,
                        text: 'Primary',
                        icon: SvgPicture.asset(
                                'lib/assets/icons/primary.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Secondary',
                          buttonBoxShadow: true,
                        color: GFColor.secondary,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/secondary.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Success',
                          buttonBoxShadow: true,
                        color: GFColor.success,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/success.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Warning',
                          buttonBoxShadow: true,
                        color: GFColor.warning,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/warning.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'danger',
                          buttonBoxShadow: true,
                        color: GFColor.danger,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/danger.svg')
                      ))
                    ],
                  ),
SizedBox(
  height: 20,
),
                  Row(
                    children: <Widget>[
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Info',
                          buttonBoxShadow: true,
                        color: GFColor.info,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/info.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Light',
                          buttonBoxShadow: true,
                        color: GFColor.light,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/light.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Dark',
                          buttonBoxShadow: true,
                        color: GFColor.dark,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/dark.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Link',
                          buttonBoxShadow: true,
                        color: GFColor.transparent,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/link.svg')
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: Text(''))

                    ],
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
         
//
            // Text('Disabled Buttons',  style: hintStyleTextblackbold(),),
            // GFCard(
            //   content: Column(
            //     children: <Widget>[
            //       Row(
            //         children: <Widget>[
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Primary',
            //             icon: SvgPicture.asset(
            //                     'lib/assets/icons/primary.svg')
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Secondary',
            //             color: GFColor.secondary,
            //             icon: SvgPicture.asset(
            //                     'lib/assets/icons/secondary.svg')
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Success',
            //             color: GFColor.success,
            //             icon: SvgPicture.asset(
            //                     'lib/assets/icons/success.svg')
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Warning',
            //             color: GFColor.warning,
            //             icon: SvgPicture.asset(
            //                     'lib/assets/icons/warning.svg')
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'danger',
            //             color: GFColor.danger,
            //             icon: SvgPicture.asset(
            //                     'lib/assets/icons/danger.svg')
            //           ))
            //         ],
            //       ),
            //       SizedBox(
            //         height: 20,
            //       ),
            //       Row(
            //         children: <Widget>[
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Info',
            //             color: GFColor.info,
            //             icon: SvgPicture.asset(
            //                     'lib/assets/icons/info.svg')
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Light',
            //             color: GFColor.light,
            //             icon: SvgPicture.asset(
            //                     'lib/assets/icons/light.svg')
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Dark',
            //             color: GFColor.dark,
            //             icon: SvgPicture.asset(
            //                     'lib/assets/icons/dark.svg')
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed: (){},
            //             text: 'Link',
            //             color: GFColor.transparent,
            //             icon: SvgPicture.asset(
            //                     'lib/assets/icons/link.svg')
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: Text(''))

            //         ],
            //       ),

            //     ],
            //   ),
            // ),

            // SizedBox(
            //   height: 20,
            // ),

            // Text('Transparent Buttons',  style: hintStyleTextblackbold(),),
            // GFCard(
            //   content: Column(
            //     children: <Widget>[
            //       Row(
            //         children: <Widget>[
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Primary',
            //             type: GFType.transparent,
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Secondary',
            //             color: GFColor.secondary,
            //             type: GFType.transparent,
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Success',
            //             color: GFColor.success,
            //             type: GFType.transparent,
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Warning',
            //             color: GFColor.warning,
            //             type: GFType.transparent,
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'danger',
            //             color: GFColor.danger,
            //             type: GFType.transparent,
            //           ))
            //         ],
            //       ),
            //       SizedBox(
            //         height: 20,
            //       ),
            //       Row(
            //         children: <Widget>[
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Info',
            //             color: GFColor.info,
            //             type: GFType.transparent,
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Light',
            //             color: GFColor.light,
            //             type: GFType.transparent,
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Dark',
            //             color: GFColor.dark,
            //             type: GFType.transparent,
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed: (){},
            //             text: 'Link',
            //             color: GFColor.transparent,
            //             type: GFType.transparent,
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: Text(''))

            //         ],
            //       ),

            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),

            Text(' Button Sizes',  style: hintStyleTextblackbold(),),
            GFCard(
              content: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child:GFButton(
                              onPressed: (){},
                              child: Text("Large",
                                  ),
                                  icon: SvgPicture.asset(
                                'lib/assets/icons/primary.svg'),

                              size: GFSize.large,
                            ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child:GFButton(
                        onPressed: (){},
                        child: Text("Medium",
                            ),
                        size: GFSize.medium,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/secondary.svg')
                      ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child:GFButton(
                        onPressed: (){},
                        child: Text("Small",
                            ),
                        size: GFSize.small,
                        icon: SvgPicture.asset(
                                'lib/assets/icons/primary.svg')
                      ),
                      ),

                    ],
                  ),


                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Text(' Block Buttons',  style: hintStyleTextblackbold(),),
            GFCard(
              content:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        GFButton(
                          onPressed: (){},
                          blockButton: true,
                          child: Text("Large",
                              style: TextStyle(
                                  color: getGFColor(GFColor.white))),
                          color: GFColor.primary,
                          size: GFSize.large,
                          icon: SvgPicture.asset(
                                'lib/assets/icons/primary.svg')
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        GFButton(
                          onPressed: (){},
                          blockButton: true,
                          child: Text("Normal",
                              style: TextStyle(
                                  color: getGFColor(GFColor.white))),
                          color: GFColor.primary,
                          size: GFSize.medium,
                          icon: SvgPicture.asset(
                                'lib/assets/icons/secondary.svg')
                        ),

                        SizedBox(
                          height: 10,
                        ),


                        GFButton(
                          onPressed: (){},
                          blockButton: true,
                          child: Text("Small",
                              style: TextStyle(
                                  color: getGFColor(GFColor.white))),
                          color: GFColor.primary,
                          size: GFSize.small,
                          icon: SvgPicture.asset(
                                'lib/assets/icons/success.svg')
                        ),
                        SizedBox(
                          height: 10,
                        ),

                      ],
                    ),

            ),
             Padding(
              padding: EdgeInsets.only(left: 15, top: 20),
              child: GFTypography(
                text: 'Icons Only',
                // type: GFTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Color(0xFF19CA4B),
              ),
            ),

            GFCard(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GFIconButton(
                          icon:
                              SvgPicture.asset('lib/assets/icons/primary.svg'),
                          onPressed: () {}),
                      GFIconButton(
                          color: GFColor.secondary,
                          icon: SvgPicture.asset(
                              'lib/assets/icons/secondary.svg'),
                          onPressed: () {}),
                      GFIconButton(
                          color: GFColor.success,
                          icon:
                              SvgPicture.asset('lib/assets/icons/success.svg'),
                          onPressed: () {}),
                      GFIconButton(
                          color: GFColor.warning,
                          icon:
                              SvgPicture.asset('lib/assets/icons/warning.svg'),
                          onPressed: () {}),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GFIconButton(
                          color: GFColor.danger,
                          icon: SvgPicture.asset('lib/assets/icons/danger.svg'),
                          onPressed: () {}),
                      GFIconButton(
                          color: GFColor.info,
                          icon: SvgPicture.asset('lib/assets/icons/info.svg'),
                          onPressed: () {}),
                      GFIconButton(
                          color: GFColor.light,
                          icon: SvgPicture.asset('lib/assets/icons/light.svg'),
                          onPressed: () {}),
                      GFIconButton(
                          color: GFColor.dark,
                          icon: SvgPicture.asset('lib/assets/icons/dark.svg'),
                          onPressed: () {}),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GFIconButton(
                          type: GFType.outline,
                          icon: Icon(Icons.settings),
                          onPressed: () {}),
                      GFIconButton(
                          type: GFType.outline,
                          color: GFColor.secondary,
                          icon: Icon(Icons.send),
                          onPressed: () {}),
                      GFIconButton(
                          type: GFType.outline,
                          color: GFColor.success,
                          icon: Icon(Icons.file_download),
                          onPressed: () {}),
                      GFIconButton(
                          type: GFType.outline,
                          color: GFColor.warning,
                          icon: Icon(Icons.warning),
                          onPressed: () {}),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GFIconButton(
                          type: GFType.outline,
                          color: GFColor.danger,
                          icon: Icon(Icons.insert_drive_file),
                          onPressed: () {}),
                      GFIconButton(
                          type: GFType.outline,
                          color: GFColor.info,
                          icon: Icon(Icons.delete),
                          onPressed: () {}),
                      GFIconButton(
                          type: GFType.outline,
                          color: GFColor.light,
                          icon: Icon(Icons.info),
                          onPressed: () {}),
                      GFIconButton(
                          type: GFType.outline,
                          color: GFColor.dark,
                          icon: Icon(Icons.apps),
                          onPressed: () {}),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
