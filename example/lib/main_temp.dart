import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/getwidget.dart';

final List<String> imageList = [
  'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg',
  'https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg',
  'https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg',
  'https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg',
  'https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg',
  'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg',
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'GetWidget Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'GetWidget Example'),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  final _ratingController = TextEditingController();
  bool check = false;
  String searchData;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _ratingController.text = '4.5';
    tabController = TabController(length: 6, initialIndex: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  bool switchValue = true;
  bool showToast = false;

  List list = [
    'Flutter',
    'React',
    'Ionic',
    'Xamarin',
    'Flutter2',
    'React2',
    'Ionic2',
    'Xamarin2',
  ];

  @override
  Widget build(BuildContext context) =>
      // final Widget emptyBlock = Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16),
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Container(
      //         width: 54,
      //         height: 46,
      //         color: Colors.white,
      //       ),
      //       const SizedBox(width: 12),
      //       Expanded(
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             Container(
      //               width: double.infinity,
      //               height: 8,
      //               color: Colors.white,
      //             ),
      //             const SizedBox(height: 6),
      //             Container(
      //               width: MediaQuery.of(context).size.width * 0.5,
      //               height: 8,
      //               color: Colors.white,
      //             ),
      //             const SizedBox(height: 6),
      //             Container(
      //               width: MediaQuery.of(context).size.width * 0.25,
      //               height: 8,
      //               color: Colors.white,
      //             ),
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // );

      Scaffold(
        // drawer: GFDrawer(
//        colorFilter: new ColorFilter.mode(
//            Colors.teal.withOpacity(0.6), BlendMode.DARKen),
//        backgroundImage: NetworkImage(
//            "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
//       gradient: LinearGradient(
//         begin: Alignment.topRight,
//         end: Alignment.bottomLeft,
//         stops: const [0.1, 0.5, 0.7, 0.9],
//         colors: [
//           Colors.teal[800],
//           Colors.teal[600],
//           Colors.teal[400],
//           Colors.teal[200],
//         ],
//       ),
//           color: Colors.greenAccent,
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               GFDrawerHeader(
//                 currentAccountPicture: const GFAvatar(
//                   radius: 80,
//                   backgroundImage: NetworkImage(
//                       'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg'),
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.teal,
//                 ),
//                 otherAccountsPictures: const <Widget>[
//                   Image(
//                     image: NetworkImage(
//                         'https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                   GFAvatar(
//                     child: Text('dcf'),
//                   )
//                 ],
// //              closeButton: Text("Close"),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const <Widget>[
//                     Text('user name'),
//                     Text('user@userid.com'),
//                   ],
//                 ),
//               ),
//               const ListTile(
//                 title: Text('Item 1'),
//                 onTap: null,
//               ),
//               const ListTile(
//                 title: Text('Item 2'),
//                 onTap: null,
//               ),
//             ],
//           ),s
//         ),

        appBar: GFAppBar(
          // toolbarOpacity: 0.5,
          // bottomOpacity: 0.6,
          // elevation: 1,
          // textTheme: const TextTheme(
          //   headline5: TextStyle(color: Colors.tealAccent)
          // ),
          iconTheme: const IconThemeData(
              color: Colors.red
          ),
          actionsIconTheme: const IconThemeData(
              color: Colors.amber
          ),
          // brightness: Brightness.light,
          // primary: false,
          // titleSpacing: 5,
          // automaticallyImplyLeading: false,
       //    backgroundColor: Colors.teal,
       // shape: RoundedRectangleBorder(
       //     side: const BorderSide(color: Colors.tealAccent, width: 1, style: BorderStyle.solid),
       //     borderRadius: BorderRadius.circular(25)),
       // centerTitle: true,
          leading: const Icon(
            Icons.wb_sunny,
            // color: GFColors.WHITE,
          ),
//         flexibleSpace: Container(child: Text('vgfd'), color: Colors.red,),
          title: const Text('Appbar'),
//              title: GFSegmentTabs(
//            tabController: tabController,
//            length: 6,
//            tabs: const <Widget>[
//              Text(
//                'Tab1',
//              ),
//              Text(
//                'Tab2',
//              ),
//              Text(
//                'Tab3',
//              ),
//              Text(
//                'Tab1',
//              ),
//              Text(
//                'Tab2',
//              ),
//              Text(
//                'Tab3',
//              ),
//            ],
//          ),
        bottom: PreferredSize(
            child: Container(
              color: Colors.orange,
              height: 4,
            ),
            preferredSize: const Size.fromHeight(4)
        ),
//        bottom: TabBar(
//          controller: tabController,
//          tabs: const [
//            Tab(
//              text: 'Tab1',
//            ),
//            Text(
//              'Tab2',
//            ),
//            Text(
//              'Tab3',
//            ),
//            Text(
//              'Tab4',
//            ),
//            Text(
//              'Tab5',
//            ),
//            Text(
//              'Tab6',
//            ),
//          ],
//          labelStyle: TextStyle(
//            fontWeight: FontWeight.w900,
//            fontSize: 19,
//            color: Colors.deepOrange,
//            fontFamily: 'OpenSansBold',
//          ),
//          unselectedLabelStyle: TextStyle(
//            fontWeight: FontWeight.w500,
//            fontSize: 13,
//            color: Colors.black,
//            fontFamily: 'OpenSansBold',
//          ),
//        ),
          searchBar: true,
          searchController: _searchController,
          // onChanged: (value) {
          //   setState(() {
          //     searchData = value;
          //   });
          // },
       searchHintText: 'Search',
       searchHintStyle: const TextStyle(fontSize: 14, color: Colors.white70),
       searchTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
       searchBarColorTheme: Colors.white,
          onChanged: (value) {
            print('on change $value');
          },
          onSubmitted: (value) {
            print('submitted $value');
          },
          onTap: () {
            print('tapped');
          },
          actions: const <Widget>[
            // GFIconButton(
            //   icon:
         Icon(
                Icons.favorite,
                // color: GFColors.WHITE,
              ),
            //   onPressed: () {},
            //   type: GFButtonType.transparent,
            // ),
          ],
        ),
//      backgroundColor: Colors.blueGrey,
        body:
//        GFTabBarView(
//          height: 200.0,
//            controller: tabController,
//            children: <Widget>[
//          Container(color: Colors.red,),
//          Container(color: Colors.green),
//          Container(color: Colors.blue)
//      ]),
//      DefaultTabController(
//        length: 9,
//        child: Scaffold(
//          appBar: AppBar(
//            bottom: TabBar(
//              isScrollable: true,
//              tabs: [
//                Tab(icon: Icon(Icons.directions_car)),
//                Tab(icon: Icon(Icons.directions_transit)),
//                Tab(icon: Icon(Icons.directions_bike)),
//                Tab(icon: Icon(Icons.directions_car)),
//                Tab(icon: Icon(Icons.directions_transit)),
//                Tab(icon: Icon(Icons.directions_bike)),
//                Tab(icon: Icon(Icons.directions_car)),
//                Tab(icon: Icon(Icons.directions_transit)),
//                Tab(icon: Icon(Icons.directions_bike)),
//              ],
//            ),
//            title: Text('Tabs Demo'),
//          ),
//          body: TabBarView(
//            children: [
//              Icon(Icons.directions_car),
//              Icon(Icons.directions_transit),
//              Icon(Icons.directions_bike),
//              Icon(Icons.directions_car),
//              Icon(Icons.directions_transit),
//              Icon(Icons.directions_bike),
//              Icon(Icons.directions_car),
//              Icon(Icons.directions_transit),
//              Icon(Icons.directions_bike),
//            ],
//          ),
//        ),
//      )
//    );
            SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('se $searchData'),
//            GFAccordion(
//              titleChild: Text('fgk'),
//              contentChild: Text('hhjk'),
////                title: 'GF Accordion',
////                content: 'GetWidget is an open source library that comes with pre-build 1000+ UI components.',
//                collapsedIcon: Text('Show'),
//                expandedIcon: Text('Hide')
//            ),

              // GFFloatingWidget(
              //     child: GFToast(
              //       text: 'This item already has the label “travel”',
              //       autoDismiss: true,
              //     ),
              //     body: Container(
              //       color: Colors.blueAccent,
              //       child: Text('body or any kind of widget here..'),
              //     )),

//            GFRating(
//              value: _rating,
//              color: GFColors.DANGER,
//              borderColor: GFColors.WARNING,
//              onChanged: (value) {
//                setState(() {
//                  _rating = value;
//                });
//              },
//            ),

//            GFShimmer(
//              child: const Text(
//                'GF Shimmer',
//                style: TextStyle(fontSize: 48, fontWeight: FontWeight.w700),
//              ),
//              showGradient: true,
//              gradient: LinearGradient(
//                begin: Alignment.bottomRight,
//                end: Alignment.centerLeft,
//                stops: const <double>[0, 0.3, 0.6, 0.9, 1],
//                colors: [
//                  Colors.teal[100],
//                  Colors.teal[200],
//                  Colors.teal[300],
//                  Colors.teal[400],
//                  Colors.teal[500],
//                ],
//              ),
//            ),

//            GFShimmer(
//              child: emptyBlock,
////              mainColor: GFColors.DARK,
////              secondaryColor: GFColors.LIGHT,
////              direction: GFShimmerDirection.rightToLeft,
////              duration: const Duration(milliseconds: 1200),
////              shimmerEffectCount: 3,
////              showShimmerEffect: false,
//            ),

//              GFRating(
//                value: _rating,
////              size: 50,
//                filledIcon: Icon(
//                  Icons.done_outline,
//                  size: 40,
//                  color: Colors.teal,
//                ),
//                halfFilledIcon: Icon(
//                  Icons.done_all,
//                  size: 40,
//                  color: Colors.teal.withOpacity(0.75),
//                ),
//                defaultIcon: Icon(
//                  Icons.done,
//                  size: 40,
//                  color: Colors.teal.withOpacity(0.25),
//                ),
////                spacing: 8,
////              color: Colors.teal,
////              borderColor: Colors.tealAccent,
////              allowHalfRating: false,
//                onChanged: (value) {
//                  setState(() {
//                    _rating = value;
//                    print('user selected $_rating');
//                  });
//                },
//              ),
//
//              GFRating(
//                value: _rating,
//                size: GFSize.large,
//                filledIcon: Icon(
//                  Icons.sentiment_very_satisfied,
//                  color: Colors.green,
//                  size: 50,
//                ),
//                halfFilledIcon: Icon(
//                  Icons.sentiment_neutral,
//                  color: Colors.amber,
//                  size: 50,
//                ),
//                defaultIcon: Icon(
//                  Icons.sentiment_very_dissatisfied,
//                  color: Colors.red,
//                  size: 50,
//                ),
//                onChanged: (value) {
//                  setState(() {
//                    _rating = value;
//                    print('user selected $_rating');
//                  });
//                },
//              ),

//            GFRating(
//              value: _userRating,
////                filledIcon: Image.asset(
////                  'lib/assets/heart.png',
////                  height: 50,
////                  width: 50,
////                  color: Colors.amber,
////                ),
////                halfFilledIcon: Image.asset(
////                  'lib/assets/heart_half.png',
////                  height: 50,
////                  width: 50,
////                  color: Colors.amber,
////                ),
////                defaultIcon: Image.asset(
////                  'lib/assets/heart_border.png',
////                  height: 50,
////                  width: 50,
////                  color: Colors.amber,
////                ),
////                spacing: 8,
//              controller: _ratingController,
//              showTextForm: true,
//              suffixIcon: GFButton(
//                type: GFButtonType.transparent,
//                onPressed: () {
//                  setState(() {
//                    _userRating = double.parse(_ratingController.text ?? '0.0');
//                  });
//                },
//                child: const Text('Rate'),
//              ),
//            ),

              GFSearchBar(
                  // searchBoxInputDecoration: InputDecoration(
                  //   enabledBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(
                  //       color: Colors.teal,
                  //     ),
                  //     borderRadius: BorderRadius.circular(50)
                  //   ),
                  // ),
                  searchList: list,
//              hideSearchBoxWhenItemSelected: false,
//              overlaySearchListHeight: 100.0,
                  searchQueryBuilder: (query, list) => list
                      .where((item) =>
                          item.toLowerCase().contains(query.toLowerCase()))
                      .toList(),
                  overlaySearchListItemBuilder: (item) => Container(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          item,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                  // noItemsFoundWidget: Container(
                  //   color: Colors.green,
                  //   child: Text("no items found..."),
                  // ),
                  onItemSelected: (item) {
                    setState(() {
                      print('selected item $item');
                    });
                  }),

//            GFCard(
//              content: Column(
//                children: <Widget>[
//                  const GFTypography(
//                    text: 'Toast',
//                    type: GFTypographyType.typo6,
//                  ),
//                  const SizedBox(
//                    height: 20,
//                  ),
//                  const SizedBox(
//                    height: 20,
//                  ),
//                  GFToast(
//                    text: 'Happy New Year',
//                    button: GFButton(
//                      onPressed: () {
//                        print('dfr');
//                      },
//                      text: 'OK',
//                      type: GFButtonType.outline,
//                      color: GFColors.WARNING,
//                    ),
//                  ),
//                ],
//              ),
//            ),
//
//            GFCard(
//              content: Column(
//                children: <Widget>[
//                  GFTypography(
//                    text: 'Floating Toast',
//                    type: GFTypographyType.typo6,
//                  ),
//                  GFFloatingWidget(
//                      verticalPosition: 100,
//                      child: showToast
//                          ? GFToast(
//                              width: 300,
//                              text: 'Happy New Year',
//                              button: GFButton(
//                                onPressed: () {
//                                  print("df");
//                                },
//                                text: 'OK',
//                                type: GFButtonType.outline,
//                                color: GFColors.WARNING,
//                              ),
//                            )
//                          : Container(),
//                      body: Column(
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          Container(
//                            alignment: Alignment.center,
//                            child: GFButton(
//                              onPressed: () {
//                                setState(() {
//                                  showToast = !showToast;
//                                });
//                              },
//                              text: 'Click to View the toast',
//                              type: GFButtonType.outline,
//                              color: GFColors.WARNING,
//                            ),
//                          )
//                        ],
//                      ))
//                ],
//              ),
//            ),

//            Container(
//              height: 130,
//              width: 105,
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(8),
//                gradient: LinearGradient(
//                    begin: FractionalOffset.bottomLeft,
//                    end: FractionalOffset.topRight,
//                    colors: const [
//                      Color(0x5a0b486b),
//                      Color(0xFFF56217),
//                    ]),
//              ),
//            ),

//            GFCard(
//              content: Column(
//                children: <Widget>[
//                  GFTypography(
//                    text: 'IOS',
//                    type: GFTypographyType.typo6,
//                  ),
//                  SizedBox(
//                    height: 10,
//                  ),
//                  GFToggle(
//                    onChanged: null,
//                    value: null,
//                    type: GFToggleType.ios,
//                  )
//                ],
//              ),
//            ),

//            GFCard(
//              content: Container(
//                height: 300.0,
//                child: new Stack(       //if fit not specified then, it aligns to top left....
//                  fit: StackFit.expand,
//                  children: <Widget>[
//                    Column(
//                      children: <Widget>[
//            GFTypography(
//              text: 'GF Header Typo1',
//              type: GFTypographyType.typo1,
////                          showDivider: false,
//            ),
//                        GFTypography(
//                          text: 'GF Header Typo2',
//                          type: GFTypographyType.typo2,
//                          showDivider: false,
//                        ),
//                        GFTypography(
//                          text: 'GF Header Typo3',
//                          type: GFTypographyType.typo3,
//                          showDivider: false,
//                        ),
//                        GFTypography(
//                          text: 'GF Header Typo4',
//                          type: GFTypographyType.typo4,
//                          showDivider: false,
//                        ),
//                        GFTypography(
//                          text: 'GF Header Typo5',
//                          type: GFTypographyType.typo5,
//                          showDivider: false,
//                        ),
//                        GFTypography(
//                          text: 'GF Header Typo6',
//                          type: GFTypographyType.typo6,
//                          showDivider: false,
//                        ),
//                      ],
//                    ),
//                    new DecoratedBox(
//                      decoration: new BoxDecoration(
//                        //color: Colors.lightGreen
//                          gradient: new LinearGradient(
//                              begin: FractionalOffset.bottomLeft,
//                              end: FractionalOffset.topRight,
//                              colors: [
//                                const Color(0x5a0b486b),
//                                const Color(0xFFF56217),
//                              ]
//                          )
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),

              GFButtonBar(
                  alignment: WrapAlignment.spaceEvenly,
                  children: <Widget>[
                    GFButton(
                      onPressed: null,
                      child: Text("dshsc"),
                      icon: Icon(Icons.access_time),
                    ),
                    GFButton(
                      onPressed: null,
                      child: Text("dszndc"),
                      icon: Icon(Icons.arrow_drop_down),
                    ),
                  ]),

              GFButtonBadge(
                onPressed: null,
                text: 'test button',
                icon: Icon(Icons.label),
              ),
//                GFButton(
//                  onPressed: null,
//                  child: Text("gcnjd"),
//                ),
//                GFButton(
//                  onPressed: null,
//                  child: Text("dsqdsc"),
//                  icon: Icon(Icons.favorite),
//                ),
//                GFButton(
//                  onPressed: null,
//                  child: Text("gcd"),
//                ),
//                GFButton(
//                  onPressed: null,
//                  child: Text("dascdsc"),
//                ),
//                GFButton(
//                  onPressed: null,
//                  child: Text("gtgcd"),
//                ),
//              ],
//            ),

//            GFCard(
//                content: Column(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                GFTypography(
//                  text: 'GF Header Typo1',
//                  type: GFTypographyType.typo1,
//                  backgroundImage: NetworkImage(
//                      'https://cdn.pixabay.com/photo/2019/12/25/16/49/happy-new-year-4718894_960_720.png'),
//                ),
//                SizedBox(
//                  height: 40,
//                ),
//                GFTypography(
//                  icon: GFAvatar(),
//                  text: 'GF Header Typo2',
//                  type: GFTypographyType.typo2,
//                  dividerColor: GFColors.PRIMARY,
//                  dividerAlignment: Alignment.center,
//                ),
//                SizedBox(
//                  height: 40,
//                ),
//                GFTypography(
//                  icon: Icon(Icons.insert_emoticon),
//                  text: 'GF Header Typo3',
//                  type: GFTypographyType.typo3,
//                  dividerWidth: 150,
//                  dividerColor: GFColors.WARNING,
//                  dividerBorderRadius: BorderRadius.all(Radius.circular(0)),
//                ),
//                SizedBox(
//                  height: 40,
//                ),
//                GFTypography(
//                    text: 'GF Header Typo4',
//                    type: GFTypographyType.typo4,
//                    dividerWidth: 345,
//                    icon: Image.network(
//                      'https://cdn.pixabay.com/photo/2016/12/15/03/27/cocoa-1908020_960_720.jpg',
//                      width: 50,
//                    )),
//                SizedBox(
//                  height: 40,
//                ),
//                GFTypography(
//                  text: 'GF Header Typo5',
//                  type: GFTypographyType.typo5,
//                  dividerColor: GFColors.ALT,
//                ),
//                SizedBox(
//                  height: 40,
//                ),
//                GFTypography(
//                  text: 'GF Header Typo6',
//                  type: GFTypographyType.typo6,
//                  dividerWidth: 20,
//                ),
//              ],
//            )
//            ),

              GFButton(
                type: GFButtonType.transparent,
                color: GFColors.WARNING,
                onPressed: () {},
                text: 'whatsapp',
                icon: Icon(Icons.directions_bike),
              ),

              GFButton(
                blockButton: true,
                text: "linkedin",
                icon: Icon(Icons.directions_bike),
              ),

//          GFListTile(
////              padding: EdgeInsets.all(30.0),
////              margin: EdgeInsets.all(50.0),
//            color: Colors.blueGrey,
////              avatar: const GFAvatar(
////                child: Text('tb'),
////              ),
//            title: const Text('title'),
////              subTitle: const Text('subtitle'),
////              description:
////                  const Text('A page view that displays the widget which '),
//            icon: const Icon(Icons.category),
////              dividerColor: Colors.blue,
////              dividerEndIndent: 20.0,
////              dividerHeight: 2.0,
////              dividerIndent: 30.0,
////              dividerThickness: 5.0,
////              showDivider: false,
//          ),

//            GFCard(
//              title: GFListTile(
//                avatar: GFAvatar(
//                  shape: GFAvatarShape.standard,
//                ),
//                title: GFTypography(
//                  text: 'List tile',
//                  type: GFTypographyType.typo5,
//                  showDivider: false,
//                ),
//                subTitle: Text(
//                  'Lorem ipsum',
//                  style: TextStyle(color: getGFColors(GFColors.DARK)),
//                ),
//                description: Text(
//                    'Dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt '
//                    'sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ',
//                    style: TextStyle(
//                        fontSize: 13, color: getGFColors(GFColors.SECONDARY))),
//              showDivider: false,
//                icon: GFIconButton(
//                  onPressed: null,
//                  type: GFButtonType.transparent,
//                  icon: Icon(Icons.favorite_border),
//                ),
//              ),
//            ),
//
//            GFCard(
//              content: GFListTile(
//                avatar: GFAvatar(
//                  shape: GFAvatarShape.standard,
//                ),
//                title: GFTypography(
//                  text: 'List tile',
//                  type: GFTypographyType.typo5,
//                  showDivider: false,
//                ),
//                subTitle: Text(
//                  'Lorem ipsum',
//                  style: TextStyle(color: getGFColors(GFColors.DARK)),
//                ),
//                description: Text(
//                    'Dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ',
//                    style: TextStyle(
//                        fontSize: 13, color: getGFColors(GFColors.SECONDARY))),
//                showDivider: false,
//              ),
//            ),
//
//            GFCard(
//                content: Row(
//              children: <Widget>[
//                GFImageOverlay(
//                  height: 200.0,
//                  width: 304.0,
//                  image: AssetImage("lib/assets/food.jpeg"),
//                  boxFit: BoxFit.cover,
//                  colorFilter: new ColorFilter.mode(
//                      Colors.black.withOpacity(0.67), BlendMode.DARKen),
// //                shape: BoxShape.circle,
//                ),
//              ],
//            )),

              // Image.asset(
              //   'lib/assets/food.jpeg',
              //   fit: BoxFit.cover,
              //   color: Color(0xff0d69ff).withOpacity(1.0),
              //   colorBlendMode: BlendMode.softLight,
              // ),

//            GFCard(
//              content: Container(
//                  width: 190.0,
//                  height: 190.0,
//                  decoration: new BoxDecoration(
//                      shape: BoxShape.circle,
//                      image: new DecorationImage(
//                        fit: BoxFit.fill,
//                        image: AssetImage(
//                          "lib/assets/food.jpeg",
//                        ),
//                      ))),
//            ),

              GFButtonBadge(
//              boxShadow: BoxShadow(
//                color: Colors.pink,
//                blurRadius: 2.0,
//                spreadRadius: 1.0,
//                offset: Offset.zero,
//              ),
//              badgeBoxShadow: true,
                onPressed: () {},
//              position: GFPosition.start,
//              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
                text: 'goodiesdxs',
//              color: GFColors.success,
                textColor: GFColors.DARK,
                shape: GFButtonShape.pills,
                type: GFButtonType.outline2x,
//              size: GFSize.small,
                icon: const GFBadge(
                  child: Text('12'),
//              color: GFColors.DARK,
//              shape: GFBadgeShape.circle,
//              size: GFSize.small,
//              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//              borderShape: RoundedRectangleBorder(),
//              textColor: GFColors.WHITE,
//              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
                ),
              ),

//            TabBar(
//              isScrollable: true,
//              labelColor: GFColors.PRIMARY,
//              controller: tabController,
//              tabs: <Widget>[
//                Tab(
//                  icon: Icon(Icons.directions_bike),
//                  child: Text(
//                    "Tab1",
//                  ),
//                ),
//                Tab(
//                  icon: Icon(Icons.directions_bus),
//                  child: Text(
//                    "Tab2",
//                  ),
//                ),
//                Tab(
//                  icon: Icon(Icons.directions_railway),
//                  child: Text(
//                    "Tab3",
//                  ),
//                ),
//                Tab(
//                  icon: Icon(Icons.directions_bike),
//                  child: Text(
//                    "Tab1",
//                  ),
//                ),
//                Tab(
//                  icon: Icon(Icons.directions_bus),
//                  child: Text(
//                    "Tab2",
//                  ),
//                ),
//                Tab(
//                  icon: Icon(Icons.directions_railway),
//                  child: Text(
//                    "Tab3",
//                  ),
//                ),
//              ],
//            ),
//
//
//            GFTabs(
//              initialIndex: 4,
//              isScrollable: true,
//              length: 6,
//              tabs: <Widget>[
//                Tab(
//                  icon: Icon(Icons.directions_bike),
//                  child: Text(
//                    "Tab1",
//                  ),
//                ),
//                Tab(
//                  icon: Icon(Icons.directions_bus),
//                  child: Text(
//                    "Tab2",
//                  ),
//                ),
//                Tab(
//                  icon: Icon(Icons.directions_railway),
//                  child: Text(
//                    "Tab3",
//                  ),
//                ),
//                Tab(
//                  icon: Icon(Icons.directions_bike),
//                  child: Text(
//                    "Tab1",
//                  ),
//                ),
//                Tab(
//                  icon: Icon(Icons.directions_bus),
//                  child: Text(
//                    "Tab2",
//                  ),
//                ),
//                Tab(
//                  icon: Icon(Icons.directions_railway),
//                  child: Text(
//                    "Tab3",
//                  ),
//                ),
//              ],
//              tabBarView: GFTabBarView(
//                children: <Widget>[
//                  Container(child: Icon(Icons.directions_bike), color: Colors.red,),
//                  Container(child: Icon(Icons.directions_bus), color: Colors.blue,),
//                  Container(child: Icon(Icons.directions_railway), color: Colors.orange,),
//                  Container(child: Icon(Icons.directions_bike), color: Colors.red,),
//                  Container(child: Icon(Icons.directions_bus), color: Colors.blue,),
//                  Container(child: Icon(Icons.directions_railway), color: Colors.orange,),
//                ],
//              ),
//            ),

//            GFSocialButton(
//              text: 'social goodies',
//              onPressed: (){},
////              icon: GFBadge(
////                child: Text("12"),
////                color: GFColors.DARK,
//////              shape: GFBadgeShape.circle,
//////              size: GFSize.small,
//////              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//////              textColor: GFColors.WHITE,
//////              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
////              ),
//              type: GFButtonType.outline2x,
//              shape: GFButtonShape.pills,
////          blockButton: true,
//              fullWidthButton: true,
//
//            ),
//
              GFButton(
//              position: GFPosition.end,
//              icon: GFBadge(
//                child: Text("12"),
//                color: GFColors.DARK,
////              shape: GFBadgeShape.circle,
////              size: GFSize.small,
////              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
////              textColor: GFColors.WHITE,
////              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
//              ),
                text: 'goodies',
                onPressed: () {},
//          textColor: GFColors.danger,
//          icon: Icon(Icons.access_alarms),
//          hoverColor: GFColors.DARK,
                color: GFColors.SECONDARY,
//          focusColor: GFColors.danger,
//              type: GFButtonType.solid,
//              shape: GFButtonShape.pills,
//              buttonBoxShadow: true,
//              boxShadow: BoxShadow(
//                color: Colors.pink,
//                blurRadius: 2.0,
//                spreadRadius: 1.0,
//                offset: Offset.zero,
//              ),
//          splashColor: GFColors.WARNING,
//          highlightColor: GFColors.ALT,
//          size: GFSize.large,
//          disabledColor: GFColors.DARK,
//          disabledTextColor: GFColors.light,
//              blockButton: true,
//          fullWidthButton: true,
//          borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//          borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
              ),
//
              GFIconButton(
                onPressed: null,
                icon: Icon(
                  Icons.ac_unit,
                ),
//              iconSize: 12.0,
                type: GFButtonType.solid,
//          shape: GFButtonShape.pills,
//          size: GFSize.large,
                buttonBoxShadow: true,
                color: GFColors.SECONDARY,
//              boxShadow: BoxShadow(
//                color: Colors.pink,
//                blurRadius: 2.0,
//                spreadRadius: 1.0,
//                offset: Offset.zero,
//              ),
//              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
              ),

              RaisedButton(
                child: Text('goodiesMaterialButton button '),
                onPressed: () {},
//          color: Colors.blueGrey,
//          hoverColor: Colors.blueGrey,
//          focusColor: Colors.teal,
//          splashColor: Colors.amber,
//          highlightColor: Colors.cyan,
              ),
//
//            GFAvatar(
//              radius: 80.0,
//              backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
//            ),

              // GFSegmentTabs(
              //   tabController: tabController,
              //   length: 6,
              //   tabs: const <Widget>[
              //     Text(
              //       '1',
              //     ),
              //     Text(
              //       '2',
              //     ),
              //     Text(
              //       '3',
              //     ),
              //     Text(
              //       '1',
              //     ),
              //     Text(
              //       '2',
              //     ),
              //     Text(
              //       '3',
              //     ),
              //   ],
              //   indicatorColor: Colors.teal,
              //   border: Border.all(color: Colors.teal),
              //   labelColor: GFColors.WHITE,
              //   unselectedLabelColor: Colors.teal,
              //   labelStyle: TextStyle(
              //     fontWeight: FontWeight.w500,
              //     fontSize: 14,
              //   ),
              //   unselectedLabelStyle: TextStyle(
              //     fontWeight: FontWeight.w400,
              //     fontSize: 12,
              //   ),
              // ),
              //
              // GFTabBarView(
              //   height: 200,
              //     controller: tabController,
              //     children: <Widget>[
              //   Container(color: Colors.red),
              //   Container(color: Colors.green),
              //   Container(color: Colors.blue),
              //   Container(color: Colors.red),
              //   Container(color: Colors.green),
              //   Container(color: Colors.blue)
              // ]),
//
//            GFItemsCarousel(
//              rowCount: 6,
////              itemHeight: 600,
//              children: imageList
//                  .map((url) => Container(
//                        margin: const EdgeInsets.all(5),
//                        child: ClipRRect(
//                          borderRadius:
//                              const BorderRadius.all(Radius.circular(5)),
//                          child: Image.network(
//                            url,
//                            fit: BoxFit.cover,
//                          ),
//                        ),
//                      ))
//                  .toList(),
//            ),
//
//          CheckboxListTile(
//            title: Text("title text"),
//            value: check,
//            onChanged: (newValue) {
//              setState(() {
//                check = newValue;
//              });
//            },
//            controlAffinity: ListTileControlAffinity.leading,
//          ),
//
//          GFCheckboxListTile(
//            color: Colors.blueGrey.withOpacity(0.3),
//            title: const Text('title'),
//            subTitle: const Text('subtitle'),
// //                avatar: const GFAvatar(
// //                  backgroundColor: GFColors.SUCCESS,
// //                ),
//            description: const Text('description'),
// //                padding: const EdgeInsets.all(16),
// //                margin: const EdgeInsets.all(16),
// //                size: 24,
// //                type: GFCheckboxType.basic,
// //                checkColor: Colors.white,
// //                activebgColor: Colors.red,
// //                inactivebgColor: Colors.red.withOpacity(0.3),
// //                activeBorderColor: Colors.red,
// //                inactiveBorderColor: Colors.red.withOpacity(0.3),
// //                custombgColor: GFColors.SUCCESS,
//            value: check,
//            onChanged: (val) {
//              setState(() {
//                check = val;
//              });
//            },
// //                inactiveIcon: const Icon(
// //                  Icons.close,
// //                  color: GFColors.DARK,
// //                  size: 16,
// //                ),
// //                activeIcon: const Icon(
// //                  Icons.check,
// //                  size: 20,
// //                  color: GFColors.WHITE,
// //                ),
//          ),
//
//          Checkbox(
//            value: check,
//            onChanged: null,
// //                      (val){
// //                    print('on change val $val');
// //                  }
//          ),
//
//          GFCheckbox(
//            size: GFSize.SMALL,
//            activebgColor: GFColors.DANGER,
//            onChanged:
// //                null,
//                (val) {
//              setState(() {
//                check = val;
//              });
//            },
//            value: check,
//            inactiveIcon: null,
//          ),
//
//              GFCheckbox(
//                size: GFSize.SMALL,
//                onChanged: (val) {
//                  print('on change val $val');
//                },
//                value: true,
//                type: GFCheckboxType.circle,
//                checkColor: GFColors.DANGER,
// //                  activebgColor: Colors.green,
// //                  inactivebgColor: Colors.white,
// //                  activeBorderColor: Colors.red,
//              ),
//
//              GFRadioButton(
//                size: GFSize.SMALL,
//                value: true,
//                type: GFRadioButtonType.basic,
//                radioColor: GFColors.SUCCESS,
// //                activebgColor: GFColors.ALT,
// //                inactivebgColor: GFColors.PRIMARY,
// //                activeBorderColor: GFColors.DANGER,
// //                inactiveBorderColor: GFColors.DARK,
//                onChanged: (val) {
//                  print('on change val $val');
//                },
//                activeIcon: const Icon(
//                  Icons.check,
//                  size: 20,
//                  color: GFColors.DARK,
//                ),
// //                inactiveIcon: const Icon(Icons.close, size: 20, color: GFColors.DARK,),
// //                custombgColor: GFColors.SUCCESS,
// //                groupValue:
//              ),
//
//            const Padding(
//              padding: EdgeInsets.only(left: 15, top: 30),
//              child: GFTypography(
//                text: 'Basic Checkbox',
//                type: GFTypographyType.typo5,
//                dividerWidth: 25,
//                dividerColor: Color(0xFF19CA4B),
//              ),
//            ),
//            GFCard(
//              content: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  GFCheckbox(
//                    size: GFSize.SMALL,
//                    activebgColor: GFColors.DANGER,
//                    onChanged: (val) {
//                      print('on change val $val');
//                    },
//                    value: true,
//                    inactiveIcon: null,
//                  ),
//                  GFCheckbox(
//                    activebgColor: GFColors.SECONDARY,
//                    onChanged: (val) {
//                      print('on change val $val');
//                    },
//                    value: true,
//                    inactiveIcon: null,
//                  ),
//                  GFCheckbox(
//                    size: GFSize.LARGE,
//                    activebgColor: GFColors.SUCCESS,
//                    onChanged: (val) {
//                      print('on change val $val');
//                    },
//                    value: true,
//                    inactiveIcon: null,
//                  ),
//                ],
//              ),
//            ),
//            const Padding(
//              padding: EdgeInsets.only(left: 15, top: 30),
//              child: GFTypography(
//                text: 'Square Checkbox',
//                type: GFTypographyType.typo5,
//                dividerWidth: 25,
//                dividerColor: Color(0xFF19CA4B),
//              ),
//            ),
//            GFCard(
//              content: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  GFCheckbox(
//                    size: GFSize.SMALL,
//                    activebgColor: GFColors.ALT,
//                    type: GFCheckboxType.square,
//                    onChanged: (val) {
//                      print('on change val $val');
//                    },
//                    value: true,
//                    inactiveIcon: null,
//                  ),
//                  GFCheckbox(
//                    type: GFCheckboxType.square,
//                    activebgColor: GFColors.INFO,
//                    onChanged: (val) {
//                      print('on change val $val');
//                    },
//                    value: true,
//                    inactiveIcon: null,
//                  ),
//                  GFCheckbox(
//                    size: GFSize.LARGE,
//                    activebgColor: GFColors.DARK,
//                    type: GFCheckboxType.square,
//                    onChanged: (val) {
//                      print('on change val $val');
//                    },
//                    value: true,
//                    inactiveIcon: null,
//                  ),
//                ],
//              ),
//            ),
//            const Padding(
//              padding: EdgeInsets.only(left: 15, top: 30),
//              child: GFTypography(
//                text: 'Circular Checkbox',
//                type: GFTypographyType.typo5,
//                dividerWidth: 25,
//                dividerColor: Color(0xFF19CA4B),
//              ),
//            ),
//            GFCard(
//              content: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  GFCheckbox(
//                    size: GFSize.SMALL,
//                    type: GFCheckboxType.circle,
//                    onChanged: (val) {
//                      print('on change val $val');
//                    },
//                    value: true,
//                    inactiveIcon: null,
//                  ),
//                  GFCheckbox(
//                    type: GFCheckboxType.circle,
//                    activebgColor: GFColors.WARNING,
//                    onChanged: (val) {
//                      print('on change val $val');
//                    },
//                    value: true,
//                  ),
//                  GFCheckbox(
//                    activebgColor: GFColors.SECONDARY,
//                    size: GFSize.LARGE,
//                    type: GFCheckboxType.circle,
//                    onChanged: (val) {
//                      print('on change val $val');
//                    },
//                    value: true,
//                    inactiveIcon: null,
//                  ),
//                ],
//              ),
//            ),
//            const Padding(
//              padding: EdgeInsets.only(left: 15, top: 30),
//              child: GFTypography(
//                text: 'Custom Checkbox',
//                type: GFTypographyType.typo5,
//                dividerWidth: 25,
//                dividerColor: Color(0xFF19CA4B),
//              ),
//            ),
//            GFCard(
//              content: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  GFCheckbox(
//                    size: GFSize.SMALL,
//                    type: GFCheckboxType.custom,
//                    onChanged: (val) {
//                      print('on change val $val');
//                    },
//                    value: true,
//                    inactiveIcon: null,
//                  ),
//                  GFCheckbox(
//                    type: GFCheckboxType.square,
//                    activebgColor: GFColors.INFO,
//                    activeIcon: Icon(Icons.sentiment_satisfied),
//                    onChanged: (val) {
//                      print('on change val $val');
//                    },
//                    value: true,
//                    inactiveIcon: Icon(Icons.sentiment_dissatisfied),
//                  ),
//                  GFCheckbox(
//                    size: GFSize.MEDIUM,
// //            activebgColor: GFColors.,
//                    type: GFCheckboxType.custom,
//                    onChanged: (val) {
//                      print('on change val $val');
//                    },
//                    value: true,
//                    custombgColor: Colors.purple,
//                    inactiveIcon: null,
//                  ),
//                ],
//              ),
//            ),

//

//
//              GFCarousel(
// //              initialPage: 1,
//                pagerSize: 12,
//                activeIndicator: Colors.pink,
//                passiveIndicator: Colors.pink.withOpacity(0.4),
//                viewportFraction: 1.0,
// //              aspectRatio: 1,
//                autoPlay: true,
//                enlargeMainPage: true,
//                pagination: true,
//                items: imageList
//                    .map((url) => Container(
//                          padding: const EdgeInsets.only(bottom: 16),
//                          margin: const EdgeInsets.all(12),
//                          child: ClipRRect(
//                            borderRadius:
//                                const BorderRadius.all(Radius.circular(5)),
//                            child: Image.network(url,
//                                fit: BoxFit.cover, width: 1000),
//                          ),
//                        ))
//                    .toList(),
// //              onPageChanged: (int index) {
// //                setState(() {
// //                   index;
// //                });
// //              },
//              ),

//
//              GFCarousel(
//                autoPlay: true,
//                viewportFraction: 1.0,
//                aspectRatio: MediaQuery.of(context).size.aspectRatio,
//                items: imageList.map(
//                  (url) {
//                    return Container(
//                      margin: EdgeInsets.all(5.0),
//                      child: ClipRRect(
//                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                        child: Image.network(
//                          url,
//                          fit: BoxFit.cover,
//                          width: 1000.0,
//                        ),
//                      ),
//                    );
//                  },
//                ).toList(),
//                onPageChanged: (index) {
//                  setState(() {
//                    index;
//                  });
//                },
//              ),
//
//            GFCard(
////              gradient: LinearGradient(
////                  begin: FractionalOffset.bottomLeft,
////                  end: FractionalOffset.topRight,
////                  colors: [
////                    const Color(0x5a0b486b),
////                    const Color(0xFFF56217),
////                  ]),
//              padding: EdgeInsets.all(0),
//              boxFit: BoxFit.fill,
////              colorFilter: new ColorFilter.mode(
////                  Colors.black.withOpacity(0.67), BlendMode.DARKen),
//              image: Image.network(
//                'https://cdn.pixabay.com/photo/2020/03/11/01/53/landscape-4920705_960_720.jpg',
//                fit: BoxFit.fill
//              ),
////borderRadius:  BorderRadius.vertical(top: Radius.circular(20)),
//shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
////              imageOverlay: NetworkImage('https://cdn.pixabay.com/photo/2020/03/11/01/53/landscape-4920705_960_720.jpg',),
//              titlePosition: GFPosition.end,
//              title: GFListTile(
//                avatar: GFAvatar(
//                  backgroundColor: Color(0x5a0b486b),
//                  child: Text("tb"),
//                ),
//                title: Text(
//                  'Flutter',
//                ),
//                subTitle: Text(
//                  "Flutter is Google's mobile UI",
//                ),
//                description: Text(
//                    "Flutter Flutter is Google's mobile UI framework for crafting"),
//                icon: GFIconButton(
//                  onPressed: null,
//                  icon: Icon(Icons.favorite),
//                  type: GFButtonType.transparent,
//                ),
//              ),
////              borderOnForeground: true,
//              content: Text(
//                "Flutter Flutter is Google's mobile UI framework for crafting"
//                "Flutter Flutter is Google's mobile UI framework for crafting"
//                "Flutter Flutter is Google's mobile UI framework for crafting",
//              ),
//              buttonBar: GFButtonBar(
//                children: <Widget>[
//                  GFButton(
//                    onPressed: null,
//                    child: Text("favorite"),
//                    icon: Icon(Icons.favorite_border),
//                    type: GFButtonType.transparent,
//                  ),
//                  GFButton(
//                    onPressed: null,
//                    child: Text("share"),
//                    icon: Icon(Icons.share),
//                    type: GFButtonType.outline,
//                  ),
//                  GFButton(
//                    onPressed: null,
//                    child: Text("share"),
//                    icon: Icon(Icons.share),
//                  ),
//                ],
//              ),
//            ),

              GFButtonBar(
                children: <Widget>[
                  GFButton(
                    onPressed: null,
                    child: Text("like"),
                    icon: Icon(Icons.favorite_border),
                    type: GFButtonType.transparent,
                  ),
                  GFButton(
                    onPressed: null,
                    child: Text("comment"),
                  ),
                  GFButton(
                    color: Colors.teal,
                    onPressed: () {},
                    child: Text("share"),
                    icon: Icon(Icons.share),
                    type: GFButtonType.outline,
                  ),
                ],
              ),
//
//
//        GFListTile(
//          color: Colors.red,
//              avatar: GFAvatar(
//                child: Text("tb"),
//              ),
//              title: Text('title'),
//              subTitle: Text('subtitle'),
//              icon: GFIconButton(
//                onPressed: null,
//                type: GFButtonType.transparent,
//                icon: Icon(Icons.favorite_border),
//              ),
//            ),

//            GFImageOverlay(
//              width: MediaQuery.of(context).size.width,
//              margin: const EdgeInsets.all(16),
//              padding: const EdgeInsets.all(16),
//              child: Column(
//                children: <Widget>[
//                  Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                ],
//              ),
//              color: Colors.orange,
//              image: const NetworkImage(
//                  'https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg'),
//              boxFit: BoxFit.fitHeight,
//              colorFilter: ColorFilter.mode(
//                  Colors.black.withOpacity(0.6), BlendMode.darken),
//              borderRadius: BorderRadius.circular(5),
// //              border: Border.all(color: Colors.pink, width: 2.0),
//            ),

              GFAvatar(
                radius: 20.0,
//                 maxRadius: 50,

                child: Text("de"),

                backgroundColor: Colors.pink,

//              backgroundImage: ,

                foregroundColor: Colors.deepOrangeAccent,

                shape: GFAvatarShape.square,

                size: GFSize.LARGE,

                borderRadius: BorderRadius.circular(10.0),
              ),

              const GFIconBadge(
                child: GFAvatar(
                  backgroundColor: GFColors.SUCCESS,
                ),
                counterChild: GFBadge(
                  text: '12',
                  shape: GFBadgeShape.circle,
                ),
              ),

//GFIconBadge(child: null, counterChild: null)

//           GFIconButton(
//             onPressed: () {},
//             icon: Icon(Icons.ac_unit),
// //              iconSize: 12.0,
// //              type: GFType.solid,
// //              shape: GFIconButtonShape.pills,
// //              size: GFSize.large,
// //              buttonBoxShadow: true,
// //              color: GFColors.WARNING,
// //              boxShadow: BoxShadow(
// //                color: Colors.pink,
// //                blurRadius: 2.0,
// //                spreadRadius: 1.0,
// //                offset: Offset.zero,
// //              ),
// //              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
// //              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
//           ),

              // ignore: prefer_const_constructors
              GFBadge(
                  // text: '12',
//              color: GFColors.DARK,
//              shape: GFBadgeShape.circle,
//              size: GFSize.MEDIUM,
//              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//              textColor: GFColors.WHITE,
//              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
                  ),

              RaisedButton(
                onPressed: () {},
                child: Text('fvb'),
              ),

              GFButton(
                onPressed: () {},
                child: Text('fvb'),
              ),

              GFButton(
                // text: 'goodies',
                size: GFSize.SMALL,
                icon: Icon(
                  Icons.directions_bike_sharp,
                ),
                child: Text('tap me'),
                // type: GFButtonType.outline,
                // shape: GFButtonShape.pills,
//              icon: Icon(Icons.share),
                onPressed: () {},
//              hoverColor: Colors.orange,
//              focusColor: Colors.teal,
//              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
//              size: GFSize.large,
//              buttonBoxShadow: true,
//              blockButton: true,
//              fullWidthButton: true,
//              color: GFColors.PRIMARY,
//              textColor: GFColors.SECONDARY,
//              icon: Icon(Icons.error, color: Colors.WHITE,),
//              position: GFIconPosition.start,
//              boxShadow: BoxShadow(
//                color: Colors.pink,
//                blurRadius: 2.0,
//                spreadRadius: 1.0,
//                offset: Offset.zero,
//              ),
//              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
              ),
            ],
          ),
        ),
//        bottomNavigationBar: GFTabBar(
//          length: 6,
//          isScrollable: true,
//          controller: tabController,
//          tabs: const [
//            Text(
//              'Tab1',
//            ),
//            Text(
//              'Tab2',
//            ),
//            Tab(
//              icon: Icon(Icons.directions_railway),
//              child: Text(
//                'Tab3',
//              ),
//            ),
//            Text(
//              'Tab1',
//            ),
//            Text(
//              'Tab2',
//            ),
//            Tab(
//              icon: Icon(Icons.directions_railway),
//              child: Text(
//                'Tab3',
//              ),
//            ),
//          ],
////          shape: RoundedRectangleBorder(
////              borderRadius: BorderRadius.only(
////                  topLeft: Radius.circular(24.0),
////                  topRight: Radius.circular(24.0))),
//          indicatorColor: GFColors.WHITE,
////        indicatorSize: TabBarIndicatorSize.label,
////          labelColor: Colors.lightGreen,
////          labelPadding: EdgeInsets.all(8.0),
////          tabBarColor: Colors.blueGrey,
////          unselectedLabelColor: Colors.black,
////          labelStyle: TextStyle(
////            fontWeight: FontWeight.w500,
////            fontSize: 13,
////            color: Colors.deepOrange,
////            fontFamily: 'OpenSansBold',
////          ),
////          unselectedLabelStyle: TextStyle(
////            fontWeight: FontWeight.w500,
////            fontSize: 13,
////            color: Colors.black,
////            fontFamily: 'OpenSansBold',
////          ),
//        ),
      );
}

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//     title: 'GetWidget DropdownExample',
//     theme: ThemeData(
//       primarySwatch: Colors.blue,
//     ),
//     debugShowCheckedModeBanner: false,
//     home: DropdownExample(),
//   );
// }

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String dropdownValue = 'One';
  List<dynamic> dropList = [
    'Running',
    'Walking',
    'Eating',
    'Sleeping',
    'Playing',
    'Drinking',
    'Jogging'
  ];
  String dropdown;
  String selected, selectedIndex;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: GFAppBar(
          title: const Text('drop down examples'),
        ),
        backgroundColor: Colors.teal,
        body: SingleChildScrollView(
          child: Column(
            children: [
              GFMultiSelect(
                items: dropList,
                onSelect: (value) {
                  print('sel $value ');
                },
                // dropDownTitleTileText: 'Select options : ',
                // dropDownTitleTileHintText: 'select',
                // dropDownTitleTileHintTextStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.pink),
                // dropdownTitleTileMargin: EdgeInsets.all(2),
                // dropdownTitleTilePadding: EdgeInsets.all(4),
                // hideDropdownUnderline: true,
                // dropdownUnderlineBorder: const BorderSide(color: Colors.pink, width: 2),
                // dropdownTitleTileBorder: Border.all(color: Colors.pink, width: 2),
                // dropdownTitleTileBorderRadius: BorderRadius.circular(55),
                // expandedIcon: const Icon(Icons.edit, color: Colors.tealAccent,),
                // collapsedIcon: const Text('close'),
                // submitButton: const Text('OK'),
                // dropDownTitleTileTextStyle: const TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.w500,
                //     color: Colors.pink),
                //
                // color: Colors.blueGrey,
                // avatar: const GFAvatar(
                //   backgroundColor: Colors.red,
                // ),
                // padding: const EdgeInsets.all(6),
                // margin: const EdgeInsets.all(6),
                // size: GFSize.LARGE,
                // type: GFCheckboxType.basic,
                // checkColor: GFColors.ALT,
                // activebgColor: GFColors.LIGHT,
                // inactivebgColor: GFColors.SECONDARY,
                // activeBorderColor: GFColors.SUCCESS,
                // inactiveBorderColor: GFColors.PRIMARY,
                // dropdownbgColor: Colors.pink,
                // activeIcon: const Icon(
                //   Icons.check,
                //   size: 20,
                //   color: GFColors.DARK,
                // ),
                // inactiveIcon: const Icon(
                //   Icons.check_box_outline_blank,
                //   size: 20,
                //   color: GFColors.DARK,
                // ),
                // custombgColor: GFColors.DANGER,
                // selected: true,
              ),
              const SizedBox(
                height: 22,
              ),
              GFDropdown(
                // isExpanded: true,
                // isDense: true,
                hint: selected == null
                    ? const Text('select')
                    : Text('$selectedIndex $selected'),
                // padding: const EdgeInsets.all(12),
                // borderRadius: BorderRadius.circular(12),
                // border: const BorderSide(color: Colors.pink, width: 2, style: BorderStyle.solid),
                // dropdownColor: Colors.tealAccent,
                // dropdownButtonColor: Colors.amber,
                value: dropdown,
                onChanged: (newValue) {
                  print('val $newValue');
                  setState(() {
                    selected = newValue.value;
                    selectedIndex = newValue.key.toString();
                  });
                },
                items: ['One', 'Two', 'Free', 'Four']
                    .asMap()
                    .entries
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text('${value.value}'),
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 22,
              ),
              GFDropdown(
                // isExpanded: true,
                // isDense: true,
                // hint: const Text('select'),
                // padding: const EdgeInsets.all(12),
                // borderRadius: BorderRadius.circular(12),
                // border: const BorderSide(color: Colors.pink, width: 2, style: BorderStyle.solid),
                // dropdownColor: Colors.tealAccent,
                // dropdownButtonColor: Colors.amber,
                value: dropdownValue,
                onChanged: (newValue) {
                  print('value $newValue');
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: ['One', 'Two', 'Free', 'Four']
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      );
}
