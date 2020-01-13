import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/button/gf_button.dart';
import 'package:ui_kit/components/button/gf_button_bar.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/components/image/gf_image_overlay.dart';
import 'package:ui_kit/shape/gf_icon_button_shape.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:ui_kit/types/gf_typography_type.dart';
import 'package:ui_kit/components/typography/gf_typography.dart';
import 'package:ui_kit/components/tabs/gf_tabBarView.dart';
import 'package:ui_kit/components/tabs/gf_segment_tabs.dart';
import 'package:ui_kit/components/list_tile/gf_list_tile.dart';
import 'package:ui_kit/components/avatar/gf_avatar.dart';
import 'package:ui_kit/position/gf_position.dart';
import 'package:ui_kit/components/button/gf_icon_button.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/shape/gf_button_shape.dart';
import 'package:flutter/cupertino.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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
            'Cards',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: Column(
            children: <Widget>[
              Container(
                height: 40,
                margin: EdgeInsets.only(top:20),
                child: GFSegmentTabs(
                  tabController: tabController,
//              height: 38.0,
                  width: 280.0,
                  initialIndex: 0,
                  length: 3,
                  tabs: <Widget>[
                    Text(
                      "Basic",
                    ),
                    Tab(
                      child: Text(
                        "Avatars",
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Full Image",
                      ),
                    ),
                  ],
                  tabBarColor: getGFColor(GFColor.light),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: getGFColor(GFColor.white),
                  unselectedLabelColor: Colors.white,
                  indicator: BoxDecoration(
                    color: Colors.black,
                    border: Border(bottom: BorderSide(color: getGFColor(GFColor.success), width: 3.0,),),
//                borderRadius: BorderRadius.circular(2.0)
                  ),
                  indicatorPadding: EdgeInsets.all(8.0),
                  indicatorWeight: 2.0,
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
              ),

              Container(
                  height: MediaQuery.of(context).size.height-140,
                  child: GFTabBarView(
                      controller: tabController,
                      height: 400.0,
                      children: <Widget>[


                        Container(
                          child:  ListView(
                            children: <Widget>[
                              GFCard(
                                boxFit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.67), BlendMode.darken),
                                image: Image.asset('lib/assets/images/card.png', width: MediaQuery.of(context).size.width,fit: BoxFit.fitWidth,),
//              imageOverlay: AssetImage("lib/assets/food.jpeg"),
                                titlePosition: GFPosition.end,
                                title: GFListTile(
                                  title: Text(
                                    'Card Title',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                   icon:
                                       GFIconButton(
                                         onPressed: null,
                                         icon: Icon(Icons.favorite_border),
                                         type: GFType.transparent,
                                       ),

                                ),
                                content: Text(
                                 "Some quick example text to build on the card",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                buttonBar: GFButtonBar(
                                  alignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    GFButton(onPressed: (){},text: 'Button', ),
                                    GFButton(onPressed: (){},text: 'Button', )
                                  ],
                                ),

                              ),

                              GFCard(
                                boxFit: BoxFit.contain,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.67), BlendMode.darken),
                                image:Image.asset('lib/assets/images/card1.png', width: MediaQuery.of(context).size.width,fit: BoxFit.fitWidth,),
//              imageOverlay: AssetImage("lib/assets/food.jpeg"),
                                titlePosition: GFPosition.end,
                                title: GFListTile(
                                  title: Text(
                                    'Card Title',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  icon:
                                  GFIconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.favorite_border),
                                    type: GFType.transparent,
                                  ),

                                ),
                                content: Text(
                                  "Some quick example text to build on the card",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                buttonBar: GFButtonBar(
                                  alignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    GFButton(
                                      onPressed: null,
                                      child: Text("Read More"),
                                      icon: Icon(Icons.keyboard_arrow_right),
                                      type: GFType.transparent,
                                      position: GFPosition.end,
                                    ),
                                  ],
                                ),

                              ),

                              GFCard(
                                boxFit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.67), BlendMode.darken),
                                image:Image.asset('lib/assets/images/card2.png', width: MediaQuery.of(context).size.width,fit: BoxFit.fitWidth,),
//              imageOverlay: AssetImage("lib/assets/food.jpeg"),
                                titlePosition: GFPosition.end,
                                title: GFListTile(
                                  title: Text(
                                    'Card Title',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  showDivider: false,

                                ),
                                content: Text(
                                  "Some quick example text to build on the card",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                buttonBar: GFButtonBar(
                                  alignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    GFButton(onPressed: (){},text: 'Button', )
                                  ],
                                ),

                              ),

                              GFCard(
                                boxFit: BoxFit.fitWidth,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.67), BlendMode.darken),
                                image:Image.asset('lib/assets/images/card3.png', width: MediaQuery.of(context).size.width,fit: BoxFit.fitWidth,),
//              imageOverlay: AssetImage("lib/assets/food.jpeg"),
                                titlePosition: GFPosition.end,
                                title: GFListTile(
                                  title: Text(
                                    'Card Title',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  showDivider: false,

                                ),
                                content: Text(
                                  "Some quick example text to build on the card",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                buttonBar: GFButtonBar(
                                  alignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    GFButton(onPressed: (){},text: 'Button', ),
                                    GFButton(onPressed: (){},text: 'Button', )
                                  ],
                                ),

                              ),
                            ],
                          ),
                        ),


                        Container(
                          child:  ListView(
                            children: <Widget>[
                              GFCard(
                                boxFit: BoxFit.fill,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.67), BlendMode.darken),
                                image: Image.asset("lib/assets/images/image1.png", width: MediaQuery.of(context).size.width,fit: BoxFit.fitWidth,),
//              imageOverlay: AssetImage("lib/assets/food.jpeg"),
                                titlePosition: GFPosition.end,
                                title: GFListTile(
                                  avatar: GFAvatar(
                                    backgroundImage: AssetImage('lib/assets/images/three3.png'),
                                  ),
                                  title: Text(
                                    'title',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  subTitle: Text(
                                    'subtitle',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  icon: GFIconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.favorite_border),
                                    type: GFType.transparent,
                                  ),
                                ),
                                content: Text(
                                  "Flutter Flutter is Google's mobile UI framework for crafting"
                                      "Flutter Flutter is Google's mobile UI framework for crafting",
                                  style: TextStyle(color: Colors.grey),
                                ),
//              buttonBar: GFButtonBar(
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  GFButton(
//                    onPressed: null,
//                    child: Text("favorite"),
//                    icon: Icon(Icons.favorite_border),
//                    type: GFType.transparent,
//                  ),
//                  GFButton(
//                    onPressed: null,
//                    child: Text("share"),
//                    icon: Icon(Icons.share),
//                    type: GFType.outline,
//                  ),
//                ],
//              ),
                              ),

//                              GFCard(
//                                boxFit: BoxFit.fill,
//                                colorFilter: new ColorFilter.mode(
//                                    Colors.black.withOpacity(0.67), BlendMode.darken),
//                                image: Image.asset('lib/assets/images/image.png'),
//
//                                titlePosition: GFPosition.end,
//                                title: GFListTile(
//                                  avatar: GFAvatar(
//                                    backgroundImage: AssetImage('lib/assets/images/avatar3.png'),
//                                  ),
//                                  title: Text(
//                                    'Card Title',
//                                    style: TextStyle(color: Colors.grey),
//                                  ),
//                                  subTitle: Text('Subtitle'),
//
//                                ),
//                                content: Text(
//                                  "Some quick example text to build on the card",
//                                  style: TextStyle(color: Colors.grey),
//                                ),
//                                buttonBar: GFButtonBar(
//                                  alignment: MainAxisAlignment.start,
//                                  children: <Widget>[
//                                    GFButton(onPressed: (){},text: 'Button', ),
//                                    GFButton(onPressed: (){},text: 'Button', )
//                                  ],
//                                ),
//
//                              ),

                              GFCard(
                                boxFit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.67), BlendMode.darken),
                               image: Image.asset('lib/assets/images/image2.png', width: MediaQuery.of(context).size.width,fit: BoxFit.fitWidth,),
//              imageOverlay: AssetImage("lib/assets/food.jpeg"),
                                titlePosition: GFPosition.end,
                                title: GFListTile(
                                  avatar: GFAvatar(
                                    backgroundImage: AssetImage('lib/assets/images/three4.png'),
                                  ),
                                  title: Text(
                                    'Card Title',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  subTitle: Text('Subtitle'),

                                ),
                                content: Text(
                                  "Some quick example text to build on the card",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                buttonBar: GFButtonBar(
                                  alignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    GFIconButton(
                                        color: Color(0xFF3B5998),
                                        shape: GFIconButtonShape.circle,
                                        icon: SvgPicture.asset('lib/assets/icons/fb.svg'),
                                        onPressed: () {}),
                                    GFIconButton(
                                        color: Color(0xFF00ACEE),
                                        shape: GFIconButtonShape.circle,
                                        icon: SvgPicture.asset('lib/assets/icons/twitter.svg'),
                                        onPressed: () {}),
                                    GFIconButton(
                                        color: Color(0xFF25D366),
                                        shape: GFIconButtonShape.circle,
                                        icon: SvgPicture.asset('lib/assets/icons/whatsapp.svg'),
                                        onPressed: () {}),
                                  ],
                                ),

                              ),
                            ],
                          ),
                        ),


                        Container(
                          child: ListView(
                            children: <Widget>[

                              GFCard(
                                boxFit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.60), BlendMode.darken),
                                imageOverlay: AssetImage('lib/assets/images/image.png'),
                                title: GFListTile(
avatar: GFAvatar(
  backgroundImage: AssetImage('lib/assets/images/three5.png'),
),
                                  title: Text(
                                    'title',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  subTitle: Text(
                                    'subtitle',
                                    style: TextStyle(color: Colors.grey),
                                  ),
//                                    icon: GFAvatar(
//                                        child: Icon(Icons.insert_emoticon)
//                                    )
                                ),
                                content: Text(
                                  "Flutter "
                                      "Flutter is Google's mobile UI framework for crafting"
                                      " high-quality native interfaces on iOS and Android in "
                                      "Flutter ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                buttonBar: GFButtonBar(
                                  alignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                   GFButton(onPressed: (){}, text: 'Button',),
                                    GFButton(onPressed: (){}, text: 'Button',)
                                  ],
                                ),

                              ),
                              GFCard(
                                boxFit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.40), BlendMode.darken),
imageOverlay: AssetImage('lib/assets/images/image1.png'),
                                title: GFListTile(

                                    title: Text(
                                      'title',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    subTitle: Text(
                                      'subtitle',
                                      style: TextStyle(color: Colors.grey),
                                    ),
//                                    icon: GFAvatar(
//                                        child: Icon(Icons.insert_emoticon)
//                                    )
                                ),
                                content: Text(
                                  "Flutter "
                                      "Flutter is Google's mobile UI framework for crafting"
                                      " high-quality native interfaces on iOS and Android in "
                                      "Flutter ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                buttonBar: GFButtonBar(
                                  alignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    GFIconButton(
                                        color: Color(0xFF3B5998),
                                        shape: GFIconButtonShape.circle,
                                        icon: SvgPicture.asset('lib/assets/icons/fb.svg'),
                                        onPressed: () {}),
                                  ],
                                ),

                              ),

                            ],
                          ),
                        )


                      ]))


            ])
    )
    ;
  }
}
