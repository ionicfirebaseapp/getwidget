import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';
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
import 'package:ui_kit/components/carousel/gf_carousel.dart';
import 'package:ui_kit/components/carousel/gf_items_carousel.dart';
import 'package:flutter/cupertino.dart';


final List<String> imageList = [
  "lib/assets/images/car.png",
  "lib/assets/images/image.png",
  "lib/assets/images/image1.png",
  "lib/assets/images/image2.png",
  "lib/assets/images/car4.png",
];

final List<String> assetImg = [
      "lib/assets/images/red.png",
      "lib/assets/images/purple.png",
      "lib/assets/images/orange.png",
      "lib/assets/images/red.png",


];

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel>  with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
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
          'Carousel',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 40,
            margin: EdgeInsets.only(top:20),
            child:
            GFSegmentTabs(
              tabController: tabController,
//              height: 38.0,
              width: 280.0,
              initialIndex: 0,
              length: 2,
              tabs: <Widget>[
                Text(
                  "Gradient",
                ),
                Tab(
                  child: Text(
                    "Image",
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
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
              child: GFTypography(
                text: 'Full Width',
                type: GFTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Color(0xFF19CA4B),
              ),
            ),
            GFCarousel(
              autoPlay: true,
              pagination: true,
              viewportFraction: 1.0,
              activeIndicator: getGFColor(GFColor.success),
              passiveIndicator: getGFColor(GFColor.dark),
              aspectRatio: 2.0,
              items: assetImg.map(
                    (url) {

                  return   GFImageOverlay(
//                    height: 200,
boxFit: BoxFit.fitWidth,
color: Colors.transparent,
//                        width: 300,
                    margin: EdgeInsets.only(left: 15, right: 15, bottom:30,),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    child: Padding(padding: EdgeInsets.only(top:30, left: 0),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Title', style: TextStyle(color: getGFColor(GFColor.white)),),
                            Padding(padding: EdgeInsets.only(left: 30, right: 30, top: 30), child:
                            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                                ' sed do eiusmod tempor dolor sit amet, consectetur', textAlign:TextAlign.center, style: TextStyle( color: getGFColor(GFColor.light)),))
                          ],
                        )),
//                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.60), BlendMode.darken),
                    image: AssetImage(url),
                  );
                },
              ).toList(),
              onPageChanged: (index) {
                setState(() {
                  index;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
              child: GFTypography(
                text: 'Multiple Items',
                type: GFTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Color(0xFF19CA4B),
              ),
            ),
            GFItemsCarousel(
              rowCount: 3,

              children: assetImg.map(
                    (url) {
                  return  GFImageOverlay(
                    height: 400,
                    width: 300,
                    margin: EdgeInsets.only(left: 15, right: 5),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text('Title', style: TextStyle(color: getGFColor(GFColor.white)),),
                            Padding(padding: EdgeInsets.only( right: 5,), child:
                            Text('Lorem ipsum dolor sit amet, ', style: TextStyle(fontSize: 10, color: getGFColor(GFColor.light)),))
                          ],
                        )),
                    image: AssetImage(url),
                  );
                },
              ).toList(),
            ),

            Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
              child: GFTypography(
                text: 'Full Size',
                type: GFTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Color(0xFF19CA4B),
              ),
            ),

            GFCarousel(
              autoPlay: true,
              pagination: true,
              viewportFraction: 1.0,
              activeIndicator: getGFColor(GFColor.success),
              passiveIndicator: getGFColor(GFColor.white),
              aspectRatio: 2.0,
              items: assetImg.map(
                    (url) {

                  return   GFImageOverlay(
                    height: 200,
//                        width: 300,
                    margin: EdgeInsets.only(left: 15, right: 15),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    child: Padding(padding: EdgeInsets.only(top:30, left: 0),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Title', style: TextStyle(color: getGFColor(GFColor.white)),),
                            Padding(padding: EdgeInsets.only(left: 30, right: 30, top: 30), child:
                            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                                ' sed do eiusmod tempor dolor sit amet, consectetur', textAlign:TextAlign.center, style: TextStyle( color: getGFColor(GFColor.light)),))
                          ],
                        )),
                    image: AssetImage(url),
                  );
                },
              ).toList(),
              onPageChanged: (index) {
                setState(() {
                  index;
                });
              },
            ),

            SizedBox(height: 20,)
          ],
        ),
      )
,

      Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
              child: GFTypography(
                text: 'Full Width',
                type: GFTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Color(0xFF19CA4B),
              ),
            ),
            GFCarousel(
              autoPlay: true,
              pagination: true,
              viewportFraction: 1.0,
              activeIndicator: getGFColor(GFColor.success),
              passiveIndicator: getGFColor(GFColor.dark),
              aspectRatio: 2.0,
              items: imageList.map(
                    (url) {

                      return   GFImageOverlay(
                        height: 200,
//                        width: 300,
                      margin: EdgeInsets.only(left: 15, right: 15, bottom:30,),
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        child: Padding(padding: EdgeInsets.only(top:30, left: 0),
                            child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Title', style: TextStyle(color: getGFColor(GFColor.white)),),
                           Padding(padding: EdgeInsets.only(left: 30, right: 30, top: 30), child:
                           Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                               ' sed do eiusmod tempor dolor sit amet, consectetur', textAlign:TextAlign.center, style: TextStyle( color: getGFColor(GFColor.light)),))
                          ],
                        )),
                        image: AssetImage(url),
                      );
                },
              ).toList(),
              onPageChanged: (index) {
                setState(() {
                  index;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
              child: GFTypography(
                text: 'Multiple Items',
                type: GFTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Color(0xFF19CA4B),
              ),
            ),
            GFItemsCarousel(
              rowCount: 3,

              children: imageList.map(
                    (url) {
                  return  GFImageOverlay(
                    height: 400,
                        width: 300,
                    margin: EdgeInsets.only(left: 15, right: 5),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text('Title', style: TextStyle(color: getGFColor(GFColor.white)),),
                            Padding(padding: EdgeInsets.only( right: 5,), child:
                            Text('Lorem ipsum dolor sit amet, ', style: TextStyle(fontSize: 10, color: getGFColor(GFColor.light)),))
                          ],
                        )),
                    image: AssetImage(url),
                  );
                },
              ).toList(),
            ),

            Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
              child: GFTypography(
                text: 'Full Size',
                type: GFTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Color(0xFF19CA4B),
              ),
            ),

            GFCarousel(
              autoPlay: true,
              pagination: true,
              viewportFraction: 1.0,
              activeIndicator: getGFColor(GFColor.success),
              passiveIndicator: getGFColor(GFColor.white),
              aspectRatio: 2.0,
              items: imageList.map(
                    (url) {

                  return   GFImageOverlay(
                    height: 200,
//                        width: 300,
                    margin: EdgeInsets.only(left: 15, right: 15),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    child: Padding(padding: EdgeInsets.only(top:30, left: 0),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Title', style: TextStyle(color: getGFColor(GFColor.white)),),
                            Padding(padding: EdgeInsets.only(left: 30, right: 30, top: 30), child:
                            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                                ' sed do eiusmod tempor dolor sit amet, consectetur', textAlign:TextAlign.center, style: TextStyle( color: getGFColor(GFColor.light)),))
                          ],
                        )),
                    image: AssetImage(url),
                  );
                },
              ).toList(),
              onPageChanged: (index) {
                setState(() {
                  index;
                });
              },
            ),

            SizedBox(height: 20,)
          ],
        ),
      )

    ]))

        ],
      ),
    );
  }
}
