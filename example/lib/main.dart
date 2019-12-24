import 'package:ui_kit/components/slider/gf_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

void main() => runApp(CarouselDemo());

final Widget placeholder = Container(color: Colors.grey);

final List child = map<Widget>(
  imgList,
      (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(i, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                'No. $index image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class CarouselWithIndicator extends StatefulWidget {
  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GFSlider(
        items: child,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(
          imgList,
              (index, url) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4)),
            );
          },
        ),
      ),
    ]);
  }
}

class CarouselDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Manually operated Carousel
    final GFSlider manualCarouselDemo = GFSlider(
      items: child,
      autoPlay: false,
      enlargeCenterPage: true,
      viewportFraction: 0.9,
      aspectRatio: 2.0,
    );

    //Auto playing carousel
    final GFSlider autoPlayDemo = GFSlider(
      viewportFraction: 0.9,
      aspectRatio: 2.0,
      autoPlay: true,
      enlargeCenterPage: true,
      items: imgList.map(
            (url) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                url,
                fit: BoxFit.cover,
                width: 1000.0,
              ),
            ),
          );
        },
      ).toList(),
    );

    //Button controlled carousel
    Widget buttonDemo() {
      final basicSlider = GFSlider(
        items: child,
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 2.0,
      );
      return Column(children: [
        basicSlider,
        Row(children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: RaisedButton(
                onPressed: () => basicSlider.previousPage(
                    duration: Duration(milliseconds: 300), curve: Curves.linear),
                child: Text('prev slider'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: RaisedButton(
                onPressed: () => basicSlider.nextPage(
                    duration: Duration(milliseconds: 300), curve: Curves.linear),
                child: Text('next slider'),
              ),
            ),
          ),
        ]),
      ]);
    }

    //Pages covers entire carousel
    final GFSlider coverScreenExample = GFSlider(
      viewportFraction: 1.0,
      aspectRatio: 2.0,
      autoPlay: false,
      enlargeCenterPage: false,
      items: map<Widget>(
        imgList,
            (index, i) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(i), fit: BoxFit.cover),
            ),
          );
        },
      ),
    );

    //User input pauses carousels automatic playback
    final GFSlider touchDetectionDemo = GFSlider(
      viewportFraction: 0.9,
      aspectRatio: 2.0,
      autoPlay: true,
      enlargeCenterPage: true,
      pauseAutoPlayOnTouch: Duration(seconds: 3),
      items: imgList.map(
            (url) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                url,
                fit: BoxFit.cover,
                width: 1000.0,
              ),
            ),
          );
        },
      ).toList(),
    );

    //Non-looping manual Carousel
    final GFSlider nonLoopingCarousel = GFSlider(
      items: child,
      scrollPhysics: BouncingScrollPhysics(),
      enableInfiniteScroll: false,
      autoPlay: false,
      enlargeCenterPage: true,
      viewportFraction: 0.9,
      aspectRatio: 2.0,
    );

    //Vertical carousel
    final GFSlider verticalScrollCarousel = GFSlider(
      scrollDirection: Axis.vertical,
      aspectRatio: 2.0,
      autoPlay: true,
      enlargeCenterPage: true,
      viewportFraction: 0.9,
      pauseAutoPlayOnTouch: Duration(seconds: 3),
      items: imgList.map(
            (url) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                url,
                fit: BoxFit.cover,
                width: 1000.0,
              ),
            ),
          );
        },
      ).toList(),
    );

    //create full screen Carousel with context
    GFSlider getFullScreenCarousel(BuildContext mediaContext) {
      return GFSlider(
        autoPlay: true,
        viewportFraction: 1.0,
        aspectRatio: MediaQuery.of(mediaContext).size.aspectRatio,
        items: imgList.map(
              (url) {
            return Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(0.0)),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  width: 1000.0,
                ),
              ),
            );
          },
        ).toList(),
      );
    }

    return MaterialApp(
      title: 'demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Carousel slider demo')),
        body: ListView(
          children: <Widget>[
//            Padding(
//                padding: EdgeInsets.symmetric(vertical: 15.0),
//                child: Column(children: [
//                  Text('Manuell Carousel'),
//                  manualCarouselDemo,
//                ])),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Column(children: [
                  Text('Auto Playing Carousel'),
                  autoPlayDemo,
                ])),
//            Padding(
//                padding: EdgeInsets.symmetric(vertical: 15.0),
//                child: Column(children: [
//                  Text('Button Controlled Carousel'),
//                  buttonDemo(),
//                ])),
//            Padding(
//                padding: EdgeInsets.symmetric(vertical: 15.0),
//                child: Column(children: [
//                  Text('Full Screen Carousel'),
//                  coverScreenExample,
//                ])),
//            Padding(
//                padding: EdgeInsets.symmetric(vertical: 15.0),
//                child: Column(children: [
//                  Text('Carousel With Indecator'),
//                  CarouselWithIndicator(),
//                ])),
//            Padding(
//                padding: EdgeInsets.symmetric(vertical: 15.0),
//                child: Column(children: [
//                  Text('Pause When Touched Carousel'),
//                  touchDetectionDemo,
//                ])),
//            Padding(
//                padding: EdgeInsets.symmetric(vertical: 15.0),
//                child: Column(children: [
//                  Text('No infinity scroll carousel'),
//                  nonLoopingCarousel,
//                ])),
//            Padding(
//                padding: EdgeInsets.symmetric(vertical: 15.0),
//                child: Column(children: [
//                  Text('Vertical scroll carousel'),
//                  verticalScrollCarousel,
//                ])),
//            Padding(
//                padding: EdgeInsets.only(top: 15.0),
//                //Builder needed to provide mediaQuery context from material app
//                child: Builder(builder: (context) {
//                  return Column(children: [
//                    Text('Full screen carousel'),
//                    getFullScreenCarousel(context),
//                  ]);
//                })),
          ],
        ),
      ),
    );
  }
}

//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/painting.dart';
//import 'package:ui_kit/components/button/gf_button.dart';
//import 'package:ui_kit/components/button/gf_icon_button.dart';
//import 'package:ui_kit/components/badge/gf_button_badge.dart';
//import 'package:ui_kit/components/badge/gf_icon_badge.dart';
//import 'package:ui_kit/components/avatar/gf_avatar.dart';
//import 'package:ui_kit/components/badge/gf_badge.dart';
//import 'package:ui_kit/components/card/gf_card.dart';
//import 'package:ui_kit/components/header_bar/gf_title_bar.dart';
//import 'package:ui_kit/components/button_bar/gf_button_bar.dart';
//import 'package:ui_kit/position/gf_position.dart';
//import 'package:ui_kit/types/gf_type.dart';
//import 'package:ui_kit/components/image/gf_image_overlay.dart';
//import 'package:ui_kit/shape/gf_shape.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'UI_KIT_EXAMPLE',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: 'UI_KIT_EXAMPLE'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text(widget.title),
//        ),
//        body: SingleChildScrollView(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              GFCard(
//                boxFit: BoxFit.cover,
//                colorFilter: new ColorFilter.mode(
//                    Colors.black.withOpacity(0.67), BlendMode.darken),
//                image: Image.asset("lib/assets/food.jpeg"),
////              imageOverlay: AssetImage("lib/assets/food.jpeg"),
//                titlePosition: GFPosition.end,
//                title: GFTitleBar(
//                  avatar: GFAvatar(
//                    child: Text("tb"),
//                  ),
//                  title: Text(
//                    'title',
//                    style: TextStyle(color: Colors.grey),
//                  ),
//                  subTitle: Text(
//                    'subtitle',
//                    style: TextStyle(color: Colors.grey),
//                  ),
//                  icon: GFIconButton(
//                    onPressed: null,
//                    icon: Icon(Icons.favorite_border),
//                    type: GFType.transparent,
//                  ),
//                ),
//                content: Text(
//                  "Flutter "
//                  "Flutter is Google's mobile UI framework for crafting"
//                  " high-quality native interfaces on iOS and Android in "
//                  "Flutter ",
//                  style: TextStyle(color: Colors.grey),
//                ),
//                buttonBar: GFButtonBar(
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    GFButton(
//                      onPressed: null,
//                      child: Text("favorite"),
//                      icon: Icon(Icons.favorite_border),
//                      type: GFType.transparent,
//                    ),
//                    GFButton(
//                      onPressed: null,
//                      child: Text("share"),
//                      icon: Icon(Icons.share),
//                      type: GFType.outline,
//                    ),
//                  ],
//                ),
//              ),
//
////            GFButtonBar(
////              mainAxisSize: MainAxisSize.min,
////              children: <Widget>[
////                GFButton(onPressed: null, child: Text("like"), icon: Icon(Icons.favorite_border), type: GFType.transparent,),
////                GFButton(onPressed: null, child: Text("comment"),),
////                GFButton(onPressed: null, child: Text("share"), icon: Icon(Icons.share), type: GFType.outline,),
////              ],
////            ),
////
////            GFTitleBar(
////              avatar: GFAvatar(
////                child: Text("tb"),
////              ),
////              title: Text('title'),
////              subTitle: Text('subtitle'),
////              icon: GFIconButton(
////                onPressed: null,
////                type: GFType.transparent,
////                icon: Icon(Icons.favorite_border),
////              ),
////            ),
//
//              GFImageOverlay(
//                width: MediaQuery.of(context).size.width,
//                margin: EdgeInsets.all(16.0),
//                padding: EdgeInsets.all(16.0),
//                child: Column(
//                  children: <Widget>[
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    new Text(
//                      'Hello world',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                  ],
//                ),
////              color: Colors.orange,
//                image: AssetImage("lib/assets/food.jpeg"),
//                boxFit: BoxFit.cover,
//                colorFilter: new ColorFilter.mode(
//                    Colors.black.withOpacity(0.6), BlendMode.darken),
//                borderRadius: new BorderRadius.circular(5.0),
////              border: Border.all(color: Colors.pink, width: 2.0),
//              ),
//
////
////            GFAvatar(
//////              radius: 40.0,
////              child: Text("de"),
////              backgroundColor: Colors.pink,
//////              backgroundImage: ,
//////              foregroundColor: Colors.deepOrangeAccent,
//////              shape: GFShape.square,
//////              size: GFSize.medium,
//////              borderRadius: BorderRadius.circular(20.0),
////            ),
////            GFIconBadges(
////              onPressed: null,
////              child: GFIconButton(
////                onPressed: null,
////                icon: Icon(Icons.ac_unit),
////              ),
////              counterChild: GFBadge(
////                text: '12',
//////                color: GFColor.dark,
//////                shape: GFShape.circle,
//////                size: GFSize.small,
//////                border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//////                textColor: GFColor.white,
//////                textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
//////                borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.orange, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
////              ),
////            ),
////            GFIconButton(
////              onPressed: null,
////              icon: Icon(Icons.ac_unit),
//////              iconSize: 12.0,
//////              type: GFType.solid,
//////              shape: GFShape.pills,
//////              size: GFSize.large,
//////              buttonBoxShadow: true,
//////              color: GFColor.primary,
//////              boxShadow: BoxShadow(
//////                color: Colors.pink,
//////                blurRadius: 2.0,
//////                spreadRadius: 1.0,
//////                offset: Offset.zero,
//////              ),
//////              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//////              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
////            ),
////            GFButtonBadge(
////              onPressed: null,
//////              position: GFIconPosition.start,
//////              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//////              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
////              text: 'goodies',
//////              color: GFColor.danger,
//////              shape: GFShape.pills,
//////              type: GFType.outline,
//////              size: GFSize.small,
////            counterChild: GFBadge(
////              child: Text("12"),
//////              color: GFColor.dark,
//////              shape: GFShape.circle,
//////              size: GFSize.small,
//////              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//////              textColor: GFColor.white,
//////              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
////            ),
////            ),
////            GFBadge(
////              text: '12',
//////              color: GFColor.dark,
//////              shape: GFShape.circle,
//////              size: GFSize.small,
//////              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//////              textColor: GFColor.white,
//////              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
////            ),
////            GFButton(
//////              type: GFType.solid,
//////              shape: GFShape.pills,
////              text: 'goodies',
////              onPressed: () {},
//////              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
//////              size: GFSize.large,
//////              buttonBoxShadow: true,
//////              blockButton: true,
//////              fullWidthButton: true,
//////              color: GFColor.primary,
//////              textColor: GFColor.secondary,
//////              icon: Icon(Icons.error, color: Colors.white,),
//////              position: GFIconPosition.start,
//////              boxShadow: BoxShadow(
//////                color: Colors.pink,
//////                blurRadius: 2.0,
//////                spreadRadius: 1.0,
//////                offset: Offset.zero,
//////              ),
//////              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//////              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
////            ),
//            ],
//          ),
//        ));
//  }
//}
