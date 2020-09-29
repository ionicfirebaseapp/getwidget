import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

void main() => runApp(MyApp());


final List<String> imageList = [
  'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg',
  'https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg',
  'https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg',
  'https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg',
  'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg',
  'https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg',
  'https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg',
  'https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg',
  'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg',
];

// class BottomSheetPage extends StatefulWidget {
//   @override
//   _BottomSheetPageState createState() => _BottomSheetPageState();
// }
//
// class _BottomSheetPageState extends State<BottomSheetPage> {
//   final GFBottomSheetController _controller = GFBottomSheetController();
//   bool isSelected = false;
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     bottomSheet: GFBottomSheet(
//       controller: _controller,
//       maxContentHeight: 150,
//       enableExpandableContent: true,
//       stickyHeaderHeight: 100,
//       stickyHeader: Container(
//         decoration: BoxDecoration(color: Colors.white,
//             boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 0)]
//         ),
//         child: const GFListTile(
//           avatar: GFAvatar(
//             backgroundImage: AssetImage('assets image here'),
//           ),
//           titleText: 'GetWidget',
//           subtitleText: 'Open source UI library',
//         ),
//       ),
//       contentBody: Container(
//         height: 200,
//         margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//         child: ListView(
//           shrinkWrap: true,
//           physics: const ScrollPhysics(),
//           children: const [
//             Center(
//                 child: Text(
//                   'Getwidget reduces your overall app development time to minimum 30% because of its pre-build clean UI widget that you can use in flutter app development. We have spent more than 1000+ hours to build this library to make flutter developer’s life easy.',
//                   style: TextStyle(
//                       fontSize: 15, wordSpacing: 0.3, letterSpacing: 0.2),
//                 ))
//           ],
//         ),
//       ),
//       stickyFooter: Container(
//         color: GFColors.SUCCESS,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               'Get in touch',
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             ),
//             Text(
//               'info@getwidget.dev',
//               style: TextStyle(fontSize: 15, color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//       stickyFooterHeight: 50,
//     ),
//     floatingActionButton: FloatingActionButton(
//         backgroundColor: GFColors.SUCCESS,
//         child: _controller.isBottomSheetOpened ? Icon(Icons.keyboard_arrow_down):Icon(Icons.keyboard_arrow_up),
//         onPressed: () {
//           _controller.isBottomSheetOpened
//               ? _controller.hideBottomSheet()
//               : _controller.showBottomSheet();
//         }
//     ),
//   );
// }


class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        body: IntroScreen(),
      ),
    );
  }
}
class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);
  @override
  _IntroScreenState createState() => _IntroScreenState();
}
class _IntroScreenState extends State<IntroScreen> {

  PageController _pageController;
  List<Widget> slideList;
  int initialPage;

  @override
  void initState() {
    _pageController = PageController(initialPage: 2, keepPage: false, viewportFraction: 2);
    initialPage = _pageController.initialPage;
    super.initState();
  }

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return SafeArea(
      child: GFIntroScreen(
        height: 500,
        width: 300,
        color: Colors.blueGrey,
        // borderRadius: BorderRadius.circular(50),
        // border: Border.all(color: Colors.red, width: 5),
        slides: slides(),
        pageController: _pageController,
        // showIntroBottomNavigation: false,

        // introScreenBottomNavigationBar:  GFIntroScreenBottomNavigationBar(
        //   pageController: _pageController,
        //   pageCount: slideList.length,
        //   currentIndex: initialPage,
        //   child: Text('dfghj'),

          // onForwardButtonTap: () {
          //   print('fffffff');
          //   // _pageController.nextPage(
          //   //     duration: const Duration(milliseconds: 500),
          //   //     curve: Curves.linear);
          // },
          // onBackButtonTap: () {
          //   print('kkkkkkkkk');
          //   // _pageController.previousPage(
          //   //     duration: const Duration(milliseconds: 500),
          //   //     curve: Curves.linear);
          // },
          // onDoneTap: (){
          //   print('done');
          // },
          // onSkipTap: (){
          //   print('skip');
          // },
          // backButtonTextStyle: TextStyle(
          //   fontSize: 12
          // ),

          // backButton: GFButton(onPressed: null, child: Text('back'),),
          // forwardButton: GFButton(onPressed: null, child: Text('next'),),
          // skipButton: GFButton(onPressed: null, child: Text('skip'),),
          // doneButton: GFButton(onPressed: null, child: Text('done'),),

          // backButtonText: 'bbbb',
          // forwardButtonText: 'ffffff',
          // skipButtonText: 'ssssss',
          // doneButtonText: 'ddddddd',

          // navigationBarHeight: 100,
          // navigationBarWidth: 300,
          // navigationBarMargin: EdgeInsets.all(20),
          // navigationBarPadding: EdgeInsets.all(20),
          // navigationBarShape: RoundedRectangleBorder(
          //   side: const BorderSide(color: Colors.blue, width: 4),
          //   borderRadius: BorderRadius.circular(50),
          // ),
          // navigationBarColor: GFColors.SECONDARY,
          //
          // showDivider: true,
          // dividerHeight: 2,
          // dividerThickness: 13,
          // dividerColor: GFColors.ALT,
          //
          // dotHeight: 10,
          // dotWidth: 16,
          // dotShape: RoundedRectangleBorder(
          //   side: BorderSide(color: Colors.red, width: 2),
          //     borderRadius: BorderRadius.circular(5)
          // ),
          // inActiveColor: GFColors.DARK,
          // activeColor: GFColors.DANGER,
          // dotMargin: EdgeInsets.symmetric(horizontal: 6),
          //
          // showButton: false,
          // showPagination: true,
        // ),
      ),
    );
  }
  List<Widget> slides() {
    slideList = [
      Container(
        decoration: BoxDecoration(
            // color: Colors.tealAccent,
          borderRadius: BorderRadius.circular(20)
        ),

      ),
      Container(
        color: Colors.teal,
        child: GFImageOverlay(
          width: MediaQuery.of(context).size.width,
          // margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Text(
                'Hello world',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Hello world',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Hello world',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Hello world',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Hello world',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Hello world',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Hello world',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Hello world',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Hello world',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Hello world',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Hello world',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Hello world',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Hello world',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Hello world',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Hello world',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Hello world',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Hello world',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          color: Colors.orange,
          image: const NetworkImage(
              'https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg'),
          boxFit: BoxFit.fitHeight,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6), BlendMode.darken),
          borderRadius: BorderRadius.circular(5),
//              border: Border.all(color: Colors.pink, width: 2.0),
        ),
      ),
      Container(
        color: Colors.grey,
      ),
      Container(
        color: Colors.red,
      ),
    ];
    return slideList;
  }
}

// class MyApp extends StatelessWidget {
//   static const String _title = 'Flutter Code Sample';
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: AnimationPage(),
//       ),
//     );
//   }
// }
// class AnimationPage extends StatefulWidget {
//   @override
//   _AnimationPageState createState() => _AnimationPageState();
// }
// class _AnimationPageState extends State<AnimationPage>
//     with SingleTickerProviderStateMixin {
//   bool selected = false;
//   // bool _large = false;
//   // double _size = 50.0;
//   AnimationController controller;
//   Animation<double> animation;
//   // bool _first = true;
//   // double _fontSize = 30;
//   // Color _color = GFColors.SUCCESS;
//   Animation<Offset> offsetAnimation;
//   @override
//   void initState() {
//     super.initState();
//     controller =
//         AnimationController(duration: const Duration(seconds: 5), vsync: this);
//     animation = new CurvedAnimation(parent: controller, curve: Curves.linear);
//     controller.repeat();
//     offsetAnimation = Tween<Offset>(
//       begin: Offset(-5, 0),
//       end: const Offset(0, 0),
//     ).animate(CurvedAnimation(
//       parent: controller,
//       curve: Curves.linear,
//     ));
//   }
//   @override
//   Widget build(BuildContext context) => Scaffold(
//       body:
//       ListView(
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(left: 15, top: 30),
//             child: GFTypography(
//               text: 'Rotation',
//               type: GFTypographyType.typo5,
//               dividerWidth: 25,
//               dividerColor: Color(0xFF19CA4B),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               controller.repeat();
//             },
//             child: GFAnimation(
//               turnsAnimation: animation,
//               controller: controller,
//               type: GFAnimationType.rotateTransition,
//               alignment: Alignment.center,
//               child: Image.asset(
//                 'assets/images/pixa.jpg',
//                 width: 80,
//                 height: 80,
//               ),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(left: 15, top: 30),
//             child: GFTypography(
//               text: 'Scaling',
//               type: GFTypographyType.typo5,
//               dividerWidth: 25,
//               dividerColor: Color(0xFF19CA4B),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               controller.repeat();
//             },
//             child: GFAnimation(
//               scaleAnimation: animation,
//               controller: controller,
//               type: GFAnimationType.scaleTransition,
//               child: Image.asset(
//                 'assets/images/pixa.jpg',
//                 width: 80,
//                 height: 80,
//               ),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(left: 15, top: 30),
//             child: GFTypography(
//               text: 'Alignment',
//               type: GFTypographyType.typo5,
//               dividerWidth: 25,
//               dividerColor: Color(0xFF19CA4B),
//             ),
//           ),
//           GFAnimation(
//             duration: Duration(seconds: 2),
//             alignment: Alignment.bottomLeft,
//             type: GFAnimationType.align,
//             child: Image.asset(
//               'assets/images/pixa.jpg',
//               width: 80,
//               height: 80,
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(left: 15, top: 30),
//             child: GFTypography(
//               text: 'Slide Transition',
//               type: GFTypographyType.typo5,
//               dividerWidth: 25,
//               dividerColor: Color(0xFF19CA4B),
//             ),
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             child: GFAnimation(
//               controller: controller,
//               slidePosition: offsetAnimation,
//               type: GFAnimationType.slideTransition,
//               child: Image.asset(
//                 'assets/images/pixa.jpg',
//                 width: 80,
//                 height: 80,
//               ),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(left: 15, top: 30),
//             child: GFTypography(
//               text: 'Size',
//               type: GFTypographyType.typo5,
//               dividerWidth: 25,
//               dividerColor: Color(0xFF19CA4B),
//             ),
//           ),
//           GFAnimation(
//             onTap: () {
//               if (mounted) {
//                 setState(() {
//                   selected = !selected;
//                 });
//               }
//             },
//             width: selected ? 100 : 50,
//             height: selected ? 100 : 50,
//             type: GFAnimationType.size,
//             controller: controller,
//             child: Image.asset(
//               'assets/images/pixa.jpg',
//             ),
//           ),
//           Container(
//             height: 200,
//           )
//         ],
//       )
//   );
// }


//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         title: 'GetWidget Example',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         debugShowCheckedModeBanner: false,
//         home: MyHomePage(),
//       );
// }
//
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   final _scaffoldKey = new GlobalKey<ScaffoldState>();
//   TabController tabController;
//   final _ratingController = TextEditingController();
//   bool isChecked = false;
//   String searchData;
//   final TextEditingController _searchController = TextEditingController();
//   int groupValue = 0;
//   final GFBottomSheetController _controller = GFBottomSheetController();
//
//   @override
//   void initState() {
//     super.initState();
//     _ratingController.text = '4.5';
//     tabController = TabController(length: 6, initialIndex: 3, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }
//
//   bool switchValue = true;
//   bool showToast = false;
//
//   List list = [
//     'Flutter',
//     'React',
//     'Ionic',
//     'Xamarin',
//     'Flutter2',
//     'React2',
//     'Ionic2',
//     'Xamarin2',
//   ];
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//       appBar: GFAppBar(
//         title: const Text('UI KIt'),
//       ),
//       body:
//
//       SingleChildScrollView(
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        children: [
//          Container(
//            height: 10,
//          ),
//          Radio(
//            value: 0,
//            groupValue: groupValue,
//            onChanged: (val) {
//              setState(() {
//                groupValue = val;
//              });
//            },
//          ),
//          Radio(
//            value: 1,
//            groupValue: groupValue,
//            onChanged: (val) {
//              setState(() {
//                groupValue = val;
//              });
//            },
//          ),
//        ],
//      ),
//    ),
//    bottomSheet: GFBottomSheet(
//      controller: _controller,
//      maxContentHeight: 300,
//      enableExpandableContent: true,
//      stickyHeaderHeight: 100,
//      stickyHeader: Container(
//        decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(10),
//            color: Colors.tealAccent),
//        child: const Center(
//          child: Text('Swipe me!'),
//        ),
//      ),
//      contentBody: Container(
//        color: Colors.teal,
//        child: ListView(
//          shrinkWrap: true,
//          physics: const ScrollPhysics(),
//          children: const [
//            Text('fhj'),
//            Text('fhj'),
//            Text('fhj'),
//            Text('fhj'),
//            Text('fhj'),
//            Text('fhj'),
//            Text('fhj'),
//            Text('fhj'),
//            Text('fhj'),
//            Text('fhj'),
//            Text('fhj'),
//            Text('fhj'),
//          ],
//        ),
//      ),
// //      stickyFooter: Container(
// //        color: Theme.of(context).primaryColor,
// //        height: 100,
// //        child: const Center(
// //          child: Text('I am Footer!'),
// //        ),
// //      ),
// //      stickyFooterHeight: 50,
//    ),
//    floatingActionButton: FloatingActionButton(
//        child: const Icon(Icons.stars),
//        onPressed: () {
//          _controller.isBottomSheetOpened
//              ? _controller.hideBottomSheet()
//              : _controller.showBottomSheet();
//        }),
//  );
// }


// SingleChildScrollView(
// child: Container(
// child: Column(
// children: [
//
// GFBorder(
// type: GFBorderType.Rect,
// dashedLine: [4, 6],
// child: Text('Dashed Border')
// ),
// SizedBox(height: 20),
// GFBorder(
// type: GFBorderType.Rect,
// dashedLine: [2, 0],
// child: Text('Basic Border')
// ),
// SizedBox(height: 20),
// GFBorder(
// type: GFBorderType.Rect,
// dashedLine: [2, 1],
// child: Text('Dotted Border')
// ),
// SizedBox(height: 20),
// GFBorder(
// type: GFBorderType.RRect,
// dashedLine: [2, 1],
// radius: Radius.circular(20),
// child: Text('Dotted Border with radius')),
// SizedBox(height: 20),
// GFBorder(
// type: GFBorderType.RRect,
// dashedLine: [2, 0],
// radius: Radius.circular(20),
// child: Text('solid Border with radius')),
// SizedBox(height: 20),
// GFBorder(
// type: GFBorderType.RRect,
// dashedLine: [4, 6],
// radius: Radius.circular(20),
// child: Text('Dashed Border with radius')),
// SizedBox(height: 20),
// Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
// GFBorder(
// type: GFBorderType.Oval,
// dashedLine: [6, 0],
// strokeWidth: 2,
// child: Container(child: Text('Oval')),
// ),
// GFBorder(
// type: GFBorderType.Circle,
// dashedLine: [4, 6],
// strokeWidth: 2,
// child: Container(child: Text('Circle')),
// ),
// ]),
//
// GFRadioListTile(
// titleText: 'Arthur Shelby',
// subtitleText: 'By order of the peaky blinders',
// avatar: GFAvatar(
// backgroundImage: AssetImage('assets/images/pixa.jpg'),
// ),
// size: 25,
// activeBorderColor: Colors.green,
// focusColor: Colors.green,
// type: GFRadioType.square,
// value: 0,
// groupValue: groupValue,
// onChanged: (value) {
// setState(() {
// groupValue = value;
// });
// },
// inactiveIcon: null,
// ),
// GFRadioListTile(
// titleText: 'Arthur Shelby',
// subtitleText: 'By order of the peaky blinders',
// avatar: GFAvatar(
// backgroundImage: AssetImage('assets/images/pixa.jpg'),
// ),
// size: 25,
// activeBorderColor: Colors.green,
// focusColor: Colors.green,
// type: GFRadioType.square,
// value: 1,
// groupValue: groupValue,
// onChanged: (value) {
// setState(() {
// groupValue = value;
// });
// },
// inactiveIcon: null,
// ),
//
// const Padding(
// padding: EdgeInsets.only(left: 15, top: 30),
// child: GFTypography(
// text: 'Basic Radio Button',
// type: GFTypographyType.typo5,
// dividerWidth: 25,
// dividerColor: Color(0xFF19CA4B),
// ),
// ),
//
// GFCard(
// content: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// GFRadio(
// size: GFSize.LARGE,
// activeBorderColor: GFColors.SUCCESS,
// value: 0,
// groupValue: groupValue,
// onChanged: (val) {
// setState(() {
// groupValue = val;
// });
// },
// inactiveIcon: null,
// radioColor: GFColors.SUCCESS,
// ),
// GFRadio(
// size: GFSize.MEDIUM,
// value: 1,
// groupValue: groupValue,
// onChanged: (val) {
// setState(() {
// groupValue = val;
// });
// },
// inactiveIcon: null,
// activeBorderColor: GFColors.SUCCESS,
// radioColor: GFColors.SUCCESS,
// ),
// GFRadio(
// size: GFSize.SMALL,
// value: 2,
// groupValue: groupValue,
// onChanged: (val) {
// setState(() {
// groupValue = val;
// });
// },
// inactiveIcon: null,
// activeBorderColor: GFColors.SUCCESS,
// radioColor: GFColors.SUCCESS,
// ),
// GFRadio(
// size: 20,
// value: 3,
// groupValue: groupValue,
// onChanged: (val) {
// setState(() {
// groupValue = val;
// });
// },
// inactiveIcon: null,
// activeBorderColor: GFColors.SUCCESS,
// radioColor: GFColors.SUCCESS,
// )
// ],
// )),
//
// const Padding(
// padding: EdgeInsets.only(left: 15, top: 30),
// child: GFTypography(
// text: 'Sqaure Radio Button',
// type: GFTypographyType.typo5,
// dividerWidth: 25,
// dividerColor: Color(0xFF19CA4B),
// ),
// ),
//
// GFCard(
// content: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// GFRadio(
// type: GFRadioType.square,
// size: GFSize.LARGE,
// value: 4,
// groupValue: groupValue,
// onChanged: (val) {
// setState(() {
// groupValue = val;
// });
// },
// inactiveIcon: null,
// activeBorderColor: GFColors.SUCCESS,
// radioColor: GFColors.SUCCESS,
// ),
// GFRadio(
// type: GFRadioType.square,
// size: GFSize.MEDIUM,
// value: 5,
// groupValue: groupValue,
// onChanged: (val) {
// setState(() {
// groupValue = val;
// });
// },
// inactiveIcon: null,
// activeBorderColor: GFColors.SUCCESS,
// radioColor: GFColors.SUCCESS,
// ),
// GFRadio(
// type: GFRadioType.square,
// size: GFSize.SMALL,
// value: 6,
// groupValue: groupValue,
// onChanged: (val) {
// setState(() {
// groupValue = val;
// });
// },
// inactiveIcon: null,
// activeBorderColor: GFColors.SUCCESS,
// radioColor: GFColors.SUCCESS,
// ),
// GFRadio(
// type: GFRadioType.square,
// size: 20,
// value: 7,
// groupValue: groupValue,
// onChanged: (val) {
// setState(() {
// groupValue = val;
// });
// },
// inactiveIcon: null,
// activeBorderColor: GFColors.SUCCESS,
// radioColor: GFColors.SUCCESS,
// activeIcon: Icon(Icons.close),
// )
// ],
// )),
//
// const Padding(
// padding: EdgeInsets.only(left: 15, top: 30),
// child: GFTypography(
// text: 'Custom type 1 Radio Button',
// type: GFTypographyType.typo5,
// dividerWidth: 25,
// dividerColor: Color(0xFF19CA4B),
// ),
// ),
//
// GFCard(
// content: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// GFRadio(
// type: GFRadioType.blunt,
// size: GFSize.LARGE,
// activeBorderColor: GFColors.SUCCESS,
// value: 8,
// groupValue: groupValue,
// onChanged: (val) {
// setState(() {
// groupValue = val;
// });
// },
// inactiveIcon: null,
// custombgColor: GFColors.SUCCESS),
// GFRadio(
// type: GFRadioType.blunt,
// size: GFSize.MEDIUM,
// value: 9,
// groupValue: groupValue,
// onChanged: (val) {
// setState(() {
// groupValue = val;
// });
// },
// inactiveIcon: null,
// activeBorderColor: GFColors.SUCCESS,
// custombgColor: GFColors.SUCCESS,
// ),
// GFRadio(
// type: GFRadioType.blunt,
// size: GFSize.SMALL,
// value: 10,
// groupValue: groupValue,
// onChanged: (val) {
// setState(() {
// groupValue = val;
// });
// },
// inactiveIcon: null,
// activeBorderColor: GFColors.SUCCESS,
// custombgColor: GFColors.SUCCESS,
// ),
// GFRadio(
// type: GFRadioType.blunt,
// size: 25,
// value: 11,
// groupValue: groupValue,
// onChanged: (val) {
// setState(() {
// groupValue = val;
// });
// },
// inactiveIcon: null,
// activeBorderColor: GFColors.SUCCESS,
// custombgColor: GFColors.SUCCESS,
// )
// ],
// )),
//
// const Padding(
// padding: EdgeInsets.only(left: 15, top: 30),
// child: GFTypography(
// text: 'Custom Type 2 Radio Button',
// type: GFTypographyType.typo5,
// dividerWidth: 25,
// dividerColor: Color(0xFF19CA4B),
// ),
// ),
//
// GFCard(
// content: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// GFRadio(
// type: GFRadioType.custom,
// activeIcon: Icon(Icons.check),
// radioColor: Colors.red,
// size: GFSize.LARGE,
// activebgColor: GFColors.SUCCESS,
// inactiveBorderColor: GFColors.DARK,
// activeBorderColor: GFColors.SUCCESS,
// value: 12,
// groupValue: groupValue,
// onChanged: (val) {
// setState(() {
// groupValue = val;
// });
// },
// ),
// GFRadio(
// type: GFRadioType.custom,
// activeIcon: Icon(Icons.sentiment_satisfied),
// size: GFSize.MEDIUM,
// value: 13,
// groupValue: groupValue,
// onChanged: (val) {
// setState(() {
// groupValue = val;
// });
// },
// inactiveIcon: Icon(Icons.sentiment_dissatisfied),
// custombgColor: GFColors.WARNING,
// activebgColor: GFColors.SUCCESS,
// activeBorderColor: GFColors.SUCCESS,
// ),
// GFRadio(
// type: GFRadioType.blunt,
// size: GFSize.SMALL,
// value: 14,
// groupValue: groupValue,
// onChanged: (val) {
// setState(() {
// groupValue = val;
// });
// },
// inactiveIcon: null,
// custombgColor: GFColors.SUCCESS,
// activeBorderColor: GFColors.SUCCESS,
// ),
// GFRadio(
// type: GFRadioType.blunt,
// size: 25,
// value: 15,
// groupValue: groupValue,
// onChanged: (val) {
// setState(() {
// groupValue = val;
// });
// },
// inactiveIcon: null,
// activeBorderColor: GFColors.SUCCESS,
// custombgColor: GFColors.SUCCESS,
// ),
// ],
// )),
//
// GFCheckboxListTile(
// titleText: 'Arthur Shelby',
// subtitleText: 'By order of the peaky blinders',
// avatar: GFAvatar(
// backgroundImage: AssetImage('assets/images/pixa.jpg'),
// ),
// size: 25,
// activebgColor: Colors.green,
//
// activeIcon: Icon(
// Icons.check,
// size: 15,
// color: Colors.white,
// ),
// onChanged: (value) {
// setState(() {
// isChecked = value;
// });
// },
// value: isChecked,
// inactiveIcon: null,
// ),
// GFCheckboxListTile(
// titleText: 'Arthur Shelby',
// subtitleText: 'By order of the peaky blinders',
// avatar: GFAvatar(
// backgroundImage: AssetImage('assets/images/pixa.jpg'),
// ),
// size: 25,
// activebgColor: Colors.green,
// type: GFCheckboxType.circle,
// activeIcon: Icon(
// Icons.check,
// size: 15,
// color: Colors.white,
// ),
// onChanged: (value) {
// setState(() {
// isChecked = value;
// });
// },
// value: isChecked,
// inactiveIcon: null,
// ),
//
// const Padding(
// padding: EdgeInsets.only(left: 15, top: 30),
// child: GFTypography(
// text: 'Basic Checkbox',
// type: GFTypographyType.typo5,
// dividerWidth: 25,
// dividerColor: Color(0xFF19CA4B),
// ),
// ),
// GFCard(
// content: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// GFCheckbox(
// size: GFSize.SMALL,
// activebgColor: GFColors.DANGER,
// onChanged: (val) {
// setState(() {
// isChecked = val;
// });
// },
// value: isChecked,
// inactiveIcon: null,
// ),
// GFCheckbox(
// activebgColor: GFColors.SECONDARY,
// onChanged: (val) {
// setState(() {
// isChecked = val;
// });
// },
// value: isChecked,
// inactiveIcon: null,
// ),
// GFCheckbox(
// size: GFSize.LARGE,
// activebgColor: GFColors.SUCCESS,
// onChanged: (val) {
// setState(() {
// isChecked = val;
// });
// },
// value: isChecked,
// inactiveIcon: null,
// ),
// ],
// ),
// ),
// const Padding(
// padding: EdgeInsets.only(left: 15, top: 30),
// child: GFTypography(
// text: 'Square Checkbox',
// type: GFTypographyType.typo5,
// dividerWidth: 25,
// dividerColor: Color(0xFF19CA4B),
// ),
// ),
// GFCard(
// content: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// GFCheckbox(
// size: GFSize.SMALL,
// activebgColor: GFColors.DANGER,
// type: GFCheckboxType.square,
// onChanged: (val) {
// setState(() {
// isChecked = val;
// });
// },
// value: isChecked,
// inactiveIcon: null,
// ),
// GFCheckbox(
// type: GFCheckboxType.square,
// activebgColor: GFColors.SECONDARY,
// onChanged: (val) {
// setState(() {
// isChecked = val;
// });
// },
// value: isChecked,
// inactiveIcon: null,
// ),
// GFCheckbox(
// size: GFSize.LARGE,
// activebgColor: GFColors.SUCCESS,
// type: GFCheckboxType.square,
// onChanged: (val) {
// setState(() {
// isChecked = val;
// });
// },
// value: isChecked,
// inactiveIcon: null,
// ),
// ],
// ),
// ),
// const Padding(
// padding: EdgeInsets.only(left: 15, top: 30),
// child: GFTypography(
// text: 'Circular Checkbox',
// type: GFTypographyType.typo5,
// dividerWidth: 25,
// dividerColor: Color(0xFF19CA4B),
// ),
// ),
// GFCard(
// content: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// GFCheckbox(
// size: GFSize.SMALL,
// activebgColor: GFColors.DANGER,
// type: GFCheckboxType.circle,
// onChanged: (val) {
// setState(() {
// isChecked = val;
// });
// },
// value: isChecked,
// inactiveIcon: null,
// ),
// GFCheckbox(
// type: GFCheckboxType.circle,
// activebgColor: GFColors.SECONDARY,
// onChanged: (val) {
// setState(() {
// isChecked = val;
// });
// },
// value: isChecked,
// ),
// GFCheckbox(
// activebgColor: GFColors.SUCCESS,
// size: GFSize.LARGE,
// type: GFCheckboxType.circle,
// onChanged: (val) {
// setState(() {
// isChecked = val;
// });
// },
// value: isChecked,
// inactiveIcon: null,
// ),
// ],
// ),
// ),
// const Padding(
// padding: EdgeInsets.only(left: 15, top: 30),
// child: GFTypography(
// text: 'Custom Checkbox',
// type: GFTypographyType.typo5,
// dividerWidth: 25,
// dividerColor: Color(0xFF19CA4B),
// ),
// ),
// GFCard(
// content: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// GFCheckbox(
// size: GFSize.SMALL,
// type: GFCheckboxType.custom,
// onChanged: (val) {
// setState(() {
// isChecked = val;
// });
// },
// value: isChecked,
// inactiveIcon: null,
// ),
// GFCheckbox(
// type: GFCheckboxType.square,
// activebgColor: GFColors.SECONDARY,
// activeIcon: Icon(Icons.sentiment_satisfied),
// onChanged: (val) {
// setState(() {
// isChecked = val;
// });
// },
// value: isChecked,
// inactiveIcon: Icon(Icons.sentiment_dissatisfied),
// ),
// GFCheckbox(
// size: GFSize.MEDIUM,
// type: GFCheckboxType.custom,
// onChanged: (val) {
// setState(() {
// isChecked = val;
// });
// },
// value: isChecked,
// custombgColor: GFColors.INFO,
// ),
// ],
// ),
// ),
//
// CheckboxListTile(
// autofocus: true,
// title: Text("title text"),
// value: isChecked,
// onChanged: (value) {
// setState(() {
// isChecked = value;
// });
// },
// controlAffinity: ListTileControlAffinity.leading,
// ),
//
// GFCheckbox(
// autofocus: true,
// size: GFSize.SMALL,
// activebgColor: GFColors.DANGER,
// onChanged: (value) {
// setState(() {
// isChecked = value;
// });
// },
// value: isChecked,
// ),
//
// GFCheckboxListTile(
// size: GFSize.SMALL,
// activebgColor: GFColors.DANGER,
// onChanged: (value) {
// setState(() {
// isChecked = value;
// });
// },
// value: isChecked,
// inactiveIcon: null,
// title: Text('title'),
// color: Colors.blueGrey,
// ),
//
// GFRadio(
// size: GFSize.SMALL,
// type: GFRadioType.basic,
// radioColor: GFColors.SUCCESS,
// //                activebgColor: GFColors.ALT,
// //                inactivebgColor: GFColors.PRIMARY,
// //                activeBorderColor: GFColors.DANGER,
// //                inactiveBorderColor: GFColors.DARK,
// value: 0,
// groupValue: groupValue,
// onChanged: (val) {
// setState(() {
// groupValue = val;
// });
// },
// activeIcon: const Icon(
// Icons.check,
// size: 20,
// color: GFColors.DARK,
// ),
// //                inactiveIcon: const Icon(Icons.close, size: 20, color: GFColors.DARK,),
// //                custombgColor: GFColors.SUCCESS,
// ),
// //
// GFRadio(
// size: GFSize.SMALL,
// type: GFRadioType.basic,
// radioColor: GFColors.SUCCESS,
// //                activebgColor: GFColors.ALT,
// //                inactivebgColor: GFColors.PRIMARY,
// //                activeBorderColor: GFColors.DANGER,
// //                inactiveBorderColor: GFColors.DARK,
// value: 1,
// groupValue: groupValue,
// onChanged: (val) {
// setState(() {
// groupValue = val;
// });
// },
// activeIcon: const Icon(
// Icons.check,
// size: 20,
// color: GFColors.DARK,
// ),
// //                inactiveIcon: const Icon(Icons.close, size: 20, color: GFColors.DARK,),
// //                custombgColor: GFColors.SUCCESS,
// ),
//
// const Padding(
// padding: EdgeInsets.only(left: 15, top: 30),
// child: GFTypography(
// text: 'Basic Checkbox',
// type: GFTypographyType.typo5,
// dividerWidth: 25,
// dividerColor: Color(0xFF19CA4B),
// ),
// ),
// GFCard(
// content: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// GFCheckbox(
// size: GFSize.SMALL,
// activebgColor: GFColors.DANGER,
// onChanged: (val) {
// print('on change val $val');
// },
// value: true,
// inactiveIcon: null,
// ),
// GFCheckbox(
// activebgColor: GFColors.SECONDARY,
// onChanged: (val) {
// print('on change val $val');
// },
// value: true,
// inactiveIcon: null,
// ),
// GFCheckbox(
// size: GFSize.LARGE,
// activebgColor: GFColors.SUCCESS,
// onChanged: (val) {
// print('on change val $val');
// },
// value: true,
// inactiveIcon: null,
// ),
// ],
// ),
// ),
// const Padding(
// padding: EdgeInsets.only(left: 15, top: 30),
// child: GFTypography(
// text: 'Square Checkbox',
// type: GFTypographyType.typo5,
// dividerWidth: 25,
// dividerColor: Color(0xFF19CA4B),
// ),
// ),
// GFCard(
// content: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// GFCheckbox(
// size: GFSize.SMALL,
// activebgColor: GFColors.ALT,
// type: GFCheckboxType.square,
// onChanged: (val) {
// print('on change val $val');
// },
// value: true,
// inactiveIcon: null,
// ),
// GFCheckbox(
// type: GFCheckboxType.square,
// activebgColor: GFColors.INFO,
// onChanged: (val) {
// print('on change val $val');
// },
// value: true,
// inactiveIcon: null,
// ),
// GFCheckbox(
// size: GFSize.LARGE,
// activebgColor: GFColors.DARK,
// type: GFCheckboxType.square,
// onChanged: (val) {
// print('on change val $val');
// },
// value: true,
// inactiveIcon: null,
// ),
// ],
// ),
// ),
// const Padding(
// padding: EdgeInsets.only(left: 15, top: 30),
// child: GFTypography(
// text: 'Circular Checkbox',
// type: GFTypographyType.typo5,
// dividerWidth: 25,
// dividerColor: Color(0xFF19CA4B),
// ),
// ),
// GFCard(
// content: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// GFCheckbox(
// size: GFSize.SMALL,
// type: GFCheckboxType.circle,
// onChanged: (val) {
// print('on change val $val');
// },
// value: true,
// inactiveIcon: null,
// ),
// GFCheckbox(
// type: GFCheckboxType.circle,
// activebgColor: GFColors.WARNING,
// onChanged: (val) {
// print('on change val $val');
// },
// value: true,
// ),
// GFCheckbox(
// activebgColor: GFColors.SECONDARY,
// size: GFSize.LARGE,
// type: GFCheckboxType.circle,
// onChanged: (val) {
// print('on change val $val');
// },
// value: true,
// inactiveIcon: null,
// ),
// ],
// ),
// ),
// const Padding(
// padding: EdgeInsets.only(left: 15, top: 30),
// child: GFTypography(
// text: 'Custom Checkbox',
// type: GFTypographyType.typo5,
// dividerWidth: 25,
// dividerColor: Color(0xFF19CA4B),
// ),
// ),
// GFCard(
// content: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// GFCheckbox(
// size: GFSize.SMALL,
// type: GFCheckboxType.custom,
// onChanged: (val) {
// print('on change val $val');
// },
// value: true,
// inactiveIcon: null,
// ),
// GFCheckbox(
// type: GFCheckboxType.square,
// activebgColor: GFColors.INFO,
// activeIcon: Icon(Icons.sentiment_satisfied),
// onChanged: (val) {
// print('on change val $val');
// },
// value: true,
// inactiveIcon: Icon(Icons.sentiment_dissatisfied),
// ),
// GFCheckbox(
// size: GFSize.MEDIUM,
// //            activebgColor: GFColors.,
// type: GFCheckboxType.custom,
// onChanged: (val) {
// print('on change val $val');
// },
// value: true,
// custombgColor: Colors.purple,
// inactiveIcon: null,
// ),
// ],
// ),
// ),
//
// ])),
// ));



// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//     title: 'Example',
//     theme: ThemeData(
//       primarySwatch: Colors.blue,
//     ),
//     debugShowCheckedModeBanner: false,
//     home: const MyHomePage(title: 'Example'),
//   );
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//
//   List countryCode = [
//     {'name': 'India', 'dialCode': '91'},
//     {'name': 'xyz', 'dialCode': '92'},
//     {'name': 'abc', 'dialCode': '93'},
//   ];
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//       appBar: GFAppBar(
//         title: const Text('UI KIt'),
//       ),
//       body: Scaffold(
//           body: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Container(
//                     margin: EdgeInsets.only(bottom: 35),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           ' Mobile Number*',
//                         ),
//                         SizedBox(
//                           height: 6,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                               border: Border(
//                                 bottom: BorderSide(color: Colors.white54, width: 1),
//                               )),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: <Widget>[
//                               InkWell(
//                                 onTap: () async {
//                                 },
//                                 child: Container(
//                                   height: 48,
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey.withOpacity(0.5),
// //                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
// //                          border: Border.all(color: Colors.green)
//                                   ),
//                                   child: Row(
//                                     children: <Widget>[
//                                       Text('+91'
//                                       ),
//                                       SizedBox(
//                                         width: 6,
//                                       ),
//                                       Icon(
//                                         Icons.keyboard_arrow_down,
//                                         color: Colors.black,
//                                         size: 16,
//                                       ),
//                                       SizedBox(
//                                         width: 16,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: TextFormField(
//                                   keyboardType: TextInputType.number,
//                                   validator: (String value) {
//                                     if (value.isEmpty) {
//                                       return 'Please Enter Mobile Number';
//                                     } else
//                                       return null;
//                                   },
//                                   decoration: new InputDecoration(
//                                     hintText: 'Mobile Number',
//                                     border: InputBorder.none,
//                                     filled: true,
//                                     fillColor: Colors.grey.withOpacity(0.2),
//                                     focusedBorder: OutlineInputBorder(
//                                         borderRadius:
//                                         BorderRadius.all(Radius.circular(5.0)),
//                                         borderSide: BorderSide(color: Colors.green)),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     )),
//                 SizedBox(
//                   height: 60,
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 16),
//                   child: TextFormField(
//                     // controller: _controller,
//                     decoration: InputDecoration(
//                       labelText: 'Search country',
//                       fillColor: Colors.white,
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(50.0),
//                         borderSide: BorderSide(
//                           color: Colors.grey,
//                         ),
//                       ),
//                       contentPadding: EdgeInsets.all(16),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(50.0),
//                         borderSide: BorderSide(
//                           color: Colors.grey.withOpacity(0.6),
//                           width: 1.0,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                     height: MediaQuery.of(context).size.height - 120,
//                     child: ListView.builder(
//                         physics: ScrollPhysics(),
//                         shrinkWrap: true,
//                         itemCount: countryCode == null ? 0 : countryCode.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Column(
//                             children: <Widget>[
//                               InkWell(
//                                 onTap: () {
//                                   Navigator.of(context).pop(countryCode[index]);
//                                 },
//                                 child: ListTile(
//                                   title: Text(
//                                     countryCode[index]['name'],
//                                   ),
//                                   trailing: Text(
//                                     '+${countryCode[index]['dialCode']}',
//                                   ),
//                                 ),
//                               ),
//                               Divider(
//                                 height: 18,
//                                 color: Colors.grey.withOpacity(0.5),
//                               )
//                             ],
//                           );
//                         }))
//               ],
//             ),
//           )));
