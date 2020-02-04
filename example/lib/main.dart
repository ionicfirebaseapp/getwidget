import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getflutter/getflutter.dart';

final List<String> imageList = [
  'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg',
  'https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg',
  'https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg',
  'https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg',
  'https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg'
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'getflutter_EXAMPLE',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'getflutter_EXAMPLE'),
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
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  TabController tabController;
  final _ratingController = TextEditingController();
  double _rating = 3;
  double _userRating = 4.5;

  @override
  void initState() {
    super.initState();
    _ratingController.text = '4.5';
    tabController = TabController(length: 3, vsync: this);
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
  Widget build(BuildContext context) => Scaffold(
        drawer: GFDrawer(
//        colorFilter: new ColorFilter.mode(
//            Colors.teal.withOpacity(0.6), BlendMode.darken),
//        backgroundImage: NetworkImage(
//            "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: const [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.teal[800],
              Colors.teal[600],
              Colors.teal[400],
              Colors.teal[200],
            ],
          ),
          color: Colors.greenAccent,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              GFDrawerHeader(
                currentAccountPicture: const GFAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg'),
                ),
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
                otherAccountsPictures: const <Widget>[
                  Image(
                    image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg'),
                    fit: BoxFit.cover,
                  ),
                  GFAvatar(
                    child: Text('dcf'),
                  )
                ],
//              closeButton: Text("Close"),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text('user name'),
                    Text('user@userid.com'),
                  ],
                ),
              ),
              const ListTile(
                title: Text('Item 1'),
                onTap: null,
              ),
              const ListTile(
                title: Text('Item 2'),
                onTap: null,
              ),
            ],
          ),
        ),

        appBar: GFAppBar(
          backgroundColor: Colors.teal,
//        centerTitle: true,
//        leading: GFIconButton(icon: Icon(Icons.directions_bus), onPressed: (){}),
          title:
          const Text('UI Kit'),
//              GFSegmentTabs(
//            tabController: tabController,
//            initialIndex: 0,
//            length: 3,
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
//            ],
//          ),
//        bottom: TabBar(
//          controller: tabController,
//          tabs: const [
//            Text(
//              'Tab1',
//            ),
//            Text(
//              'Tab1',
//            ),
//            Text(
//              'Tab1',
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
//          searchBar: true,
//        searchHintText: "aaaaaaa",
//        searchHintStyle: TextStyle(fontSize: 18.0, color: Colors.redAccent),
//        searchStyle: TextStyle(fontSize: 10.0, color: Colors.green),
//        searchBarColorTheme: Colors.greenAccent,

          actions: <Widget>[
//          GFIconButton(icon: Icon(Icons.access_time), onPressed: () {}),
            GFIconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () {},
              type: GFButtonType.transparent,
            ),
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
            SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[


              GFRating(
                value: _rating,
//              size: 50,
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
//                spacing: 8,
//              color: Colors.teal,
//              borderColor: Colors.tealAccent,
//              allowHalfRating: false,
                onChanged: (value) {
                  setState(() {
                    _rating = value;
                    print('user selected $_rating');
                  });
                },
              ),

              GFRating(
                value: _userRating,
                filledIcon: Image.asset(
                  'lib/assets/heart.png',
                  height: 50,
                  width: 50,
                  color: Colors.amber,
                ),
                halfFilledIcon: Image.asset(
                  'lib/assets/heart_half.png',
                  height: 50,
                  width: 50,
                  color: Colors.amber,
                ),
                defaultIcon: Image.asset(
                  'lib/assets/heart_border.png',
                  height: 50,
                  width: 50,
                  color: Colors.amber,
                ),
                spacing: 8,
                color: Colors.teal,
                borderColor: Colors.tealAccent,
                controller: _ratingController,
                textForm: true,
                suffixIcon: GFButton(
                  type: GFButtonType.transparent,
                  onPressed: () {
                    setState(() {
                      _userRating =
                          double.parse(_ratingController.text ?? '0.0');
                    });
                  },
                  child: const Text('Rate'),
                ),
              ),

              GFSearchBar(
//              searchBoxInputDecoration: InputDecoration(
//                enabledBorder: OutlineInputBorder(
//                  borderSide: BorderSide(
//                    color: Colors.teal,
//                  ),
//                  borderRadius: BorderRadius.circular(50)
//                ),
//              ),
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
//              noItemsFoundWidget: Container(
//                color: Colors.green,
//                child: Text("no items found..."),
//              ),
                  onItemSelected: (item) {
                    setState(() {
                      print('ssssssss $item');
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
//                      color: GFColor.warning,
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
//                                color: GFColor.warning,
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
//                              color: GFColor.warning,
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

//            GFButtonBar(
//              alignment: WrapAlignment.spaceEvenly,
//              children: <Widget>[
//                GFButton(
//                  onPressed: null,
//                  child: Text("dshsc"),
//                  icon: Icon(Icons.access_time),
//                ),
//                GFButton(
//                  onPressed: null,
//                  child: Text("dszndc"),
//                  icon: Icon(Icons.warning),
//                ),
//                GFButtonBadge(
//                  onPressed: null,
//                  text: "djvhcfdscc",
//                  icon: Icon(Icons.label),
//                ),
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
//                  dividerColor: GFColor.primary,
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
//                  dividerColor: GFColor.warning,
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
//                  dividerColor: GFColor.alt,
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
              color: GFColor.warning,
              onPressed: (){},
              text: 'whatsapp',
              icon: Icon(Icons.directions_bike),
            ),
//
//            GFButton(
//              text: "linkedin",
//              icon: Icon(Icons.directions_bike),
//            ),

//            GFListTile(
//              padding: const EdgeInsets.all(30.0),
//              color: Colors.redAccent,
//              avatar: const GFAvatar(
//                child: Text('tb'),
//              ),
//              title: Text('title'),
//              subTitle: Text('subtitle'),
//              description: Text('A page view that displays the widget which '
//                  'corresponds to the currently selected tab. This widget is typically used in'),
//              icon: Text("99"),
////              dividerColor: Colors.blue,
////              dividerEndIndent: 20.0,
////              dividerHeight: 2.0,
////              dividerIndent: 30.0,
////              dividerThickness: 5.0,
////              showDivider: false,
//            ),

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
//                  style: TextStyle(color: getGFColor(GFColor.dark)),
//                ),
//                description: Text(
//                    'Dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt '
//                    'sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ',
//                    style: TextStyle(
//                        fontSize: 13, color: getGFColor(GFColor.secondary))),
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
//                  style: TextStyle(color: getGFColor(GFColor.dark)),
//                ),
//                description: Text(
//                    'Dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ',
//                    style: TextStyle(
//                        fontSize: 13, color: getGFColor(GFColor.secondary))),
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
//                      Colors.black.withOpacity(0.67), BlendMode.darken),
////                shape: BoxShape.circle,
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

//            GFButtonBadge(
////              boxShadow: BoxShadow(
////                color: Colors.pink,
////                blurRadius: 2.0,
////                spreadRadius: 1.0,
////                offset: Offset.zero,
////              ),
////              badgeBoxShadow: true,
//              onPressed: () {},
////              position: GFPosition.start,
////              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
////              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
//              text: 'goodiesdxs',
////              color: GFColor.success,
////              textColor: GFColor.dark,
////              shape: GFButtonShape.pills,
////              type: GFButtonType.outline2x,
////              size: GFSize.small,
//              icon: GFBadge(
//                child: Text("12"),
////              color: GFColor.dark,
////              shape: GFBadgeShape.circle,
////              size: GFSize.small,
////              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
////              borderShape: RoundedRectangleBorder(),
////              textColor: GFColor.white,
////              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
//              ),
//            ),

//            GFSocialButton(
//              text: 'social goodies',
//              onPressed: (){},
////              icon: GFBadge(
////                child: Text("12"),
////                color: GFColor.dark,
//////              shape: GFBadgeShape.circle,
//////              size: GFSize.small,
//////              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//////              textColor: GFColor.white,
//////              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
////              ),
//              type: GFButtonType.outline2x,
//              shape: GFButtonShape.pills,
////          blockButton: true,
//              fullWidthButton: true,
//
//            ),
//
//            GFButton(
////              position: GFPosition.end,
////              icon: GFBadge(
////                child: Text("12"),
////                color: GFColor.dark,
//////              shape: GFBadgeShape.circle,
//////              size: GFSize.small,
//////              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//////              textColor: GFColor.white,
//////              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
////              ),
//              text: 'goodies',
//              onPressed: () {},
////          textColor: GFColor.danger,
////          icon: Icon(Icons.access_alarms),
////          hoverColor: GFColor.dark,
//              color: GFColor.secondary,
////          focusColor: GFColor.danger,
////              type: GFButtonType.solid,
////              shape: GFButtonShape.pills,
////              buttonBoxShadow: true,
////              boxShadow: BoxShadow(
////                color: Colors.pink,
////                blurRadius: 2.0,
////                spreadRadius: 1.0,
////                offset: Offset.zero,
////              ),
////          splashColor: GFColor.warning,
////          highlightColor: GFColor.alt,
////          size: GFSize.large,
////          disabledColor: GFColor.dark,
////          disabledTextColor: GFColor.light,
////              blockButton: true,
////          fullWidthButton: true,
////          borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
////          borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
//            ),
//
//            GFIconButton(
//              onPressed: null,
//              icon: Icon(Icons.ac_unit,),
////              iconSize: 12.0,
//              type: GFButtonType.solid,
////          shape: GFButtonShape.pills,
////          size: GFSize.large,
//              buttonBoxShadow: true,
//              color: GFColor.secondary,
////              boxShadow: BoxShadow(
////                color: Colors.pink,
////                blurRadius: 2.0,
////                spreadRadius: 1.0,
////                offset: Offset.zero,
////              ),
////              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
////              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
//            ),
//
//            RaisedButton(
//              child: Text('goodiesMaterialButton button '),
//              onPressed: (){},
////          color: Colors.blueGrey,
////          hoverColor: Colors.blueGrey,
////          focusColor: Colors.teal,
////          splashColor: Colors.amber,
////          highlightColor: Colors.cyan,
//            ),
//
//            GFAvatar(
//              radius: 80.0,
//              backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
//            ),

              GFSegmentTabs(
                tabController: tabController,
                initialIndex: 0,
                length: 3,
                tabs: const <Widget>[
                  Text(
                    'Tab1',
                  ),
                  Text(
                    'Tab2',
                  ),
                  Text(
                    'Tab3',
                  ),
                ],
                indicatorColor: Colors.teal,
                border: Border.all(color: Colors.teal),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.teal,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
//
//            GFTabBarView(controller: tabController, children: <Widget>[
//              Container(color: Colors.red),
//              Container(color: Colors.green),
//              Container(color: Colors.blue)
//            ]),

//            GFItemsCarousel(
//              rowCount: 3,
//              children: imageList.map(
//                (url) {
//                  return Container(
//                    margin: EdgeInsets.all(5.0),
//                    child: ClipRRect(
//                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                      child:
//                          Image.network(url, fit: BoxFit.cover, width: 1000.0),
//                    ),
//                  );
//                },
//              ).toList(),
//            ),
//
//            GFCarousel(
////              pagerSize: 12.0,
////              activeIndicator: Colors.pink,
////              passiveIndicator: Colors.pink.withOpacity(0.4),
////              viewportFraction: 1.0,
////              aspectRatio: 1.0,
////              autoPlay: true,
////              enlargeMainPage: true,
////              pagination: true,
//              items: imageList.map(
//                (url) {
//                  return Container(
//                    margin: EdgeInsets.all(8.0),
//                    child: ClipRRect(
//                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                      child:
//                          Image.network(url, fit: BoxFit.cover, width: 1000.0),
//                    ),
//                  );
//                },
//              ).toList(),
//              onPageChanged: (index) {
//                setState(() {
//                  // index;
//                });
//              },
//            ),

//            GFTabs(
//              initialIndex: 0,
//              length: 3,
//              tabs: <Widget>[
//                Tab(
////                icon: Icon(Icons.directions_bike),
//                  icon: Icon(
//                    IconData(0xe907, fontFamily: 'icomoon'),
//                  ),
//                  child: Text(
//                    "Tab1",
//                  ),
//                ),
//                Tab(
////                icon: Icon(Icons.directions_bus),
//                  icon: Icon(
//                    IconData(0xe900, fontFamily: 'icomoon'),
//                  ),
//                  child: Text(
//                    "Tab2",
//                  ),
//                ),
//                Tab(
//                  icon: Icon(
//                    IconData(0xe904, fontFamily: 'icomoon'),
//                  ),
//                  child: Text(
//                    "Tab3",
//                  ),
//                ),
//              ],
//              tabBarView: GFTabBarView(
//                children: <Widget>[
//                  Container(
//                    child: Icon(Icons.directions_bike),
//                    color: Colors.red,
//                  ),
//                  Container(
//                    child: Icon(Icons.directions_bus),
//                    color: Colors.blue,
//                  ),
//                  Container(
//                    child: Icon(Icons.directions_railway),
//                    color: Colors.orange,
//                  ),
//                ],
//              ),
//            ),
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

//            GFCard(
//              gradient: LinearGradient(
//                  begin: FractionalOffset.bottomLeft,
//                  end: FractionalOffset.topRight,
//                  colors: [
//                    const Color(0x5a0b486b),
//                    const Color(0xFFF56217),
//                  ]),
//              boxFit: BoxFit.fill,
//              colorFilter: new ColorFilter.mode(
//                  Colors.black.withOpacity(0.67), BlendMode.darken),
////              image: Image.asset(
////                "lib/assets/img.png",
////                fit: BoxFit.fitWidth,
////                width: 400.0,
////              ),
////              imageOverlay: AssetImage("lib/assets/food.jpeg"),
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

//            GFButtonBar(
//              mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//                GFButton(
//                  onPressed: null,
//                  child: Text("like"),
//                  icon: Icon(Icons.favorite_border),
//                  type: GFButtonType.transparent,
//                ),
//                GFButton(
//                  onPressed: null,
//                  child: Text("comment"),
//                ),
//                GFButton(
//                  color: Colors.teal,
//                  onPressed: (){},
//                  child: Text("share"),
//                  icon: Icon(Icons.share),
//                  type: GFButtonType.outline,
//                ),
//              ],
//            ),
//
//
//        GFListTile(
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
//              margin: EdgeInsets.all(16.0),
//              padding: EdgeInsets.all(16.0),
//              child: Column(
//                children: <Widget>[
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  new Text(
//                    'Hello world',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                ],
//              ),
////              color: Colors.orange,
//              image: AssetImage("lib/assets/food.jpeg"),
//              boxFit: BoxFit.cover,
//              colorFilter: new ColorFilter.mode(
//                  Colors.black.withOpacity(0.6), BlendMode.darken),
//              borderRadius: new BorderRadius.circular(5.0),
////              border: Border.all(color: Colors.pink, width: 2.0),
//            ),
//            GFAvatar(
              //              radius: 20.0,
//                 maxRadius: 50,

//              child: Text("de"),

//                 backgroundColor: Colors.pink,
//
////              backgroundImage: ,
//
//              foregroundColor: Colors.deepOrangeAccent,
//
//       shape: GFAvatarShape.square,
//
//              size: GFSize.large,
//
//              borderRadius: BorderRadius.circular(10.0),
//            ),

//            GFIconBadge(
//              child:
//              GFIconButton(
//                onPressed: (){},
//                icon: Icon(Icons.ac_unit),
////                size: GFSize.large,
//              ),
//
//              counterChild: GFBadge(
//                text: '12',
//
////                color: GFColor.dark,
////
////                shape: GFBadgeShape.circle,
////
////                size: GFSize.small,
////
////                border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
////
////                textColor: GFColor.white,
////
////                textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
////
////                borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.orange, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
//              ),
//            ),

//            GFIconButton(
//              onPressed: () {},
//              icon: Icon(Icons.ac_unit),
////              iconSize: 12.0,
////              type: GFType.solid,
////              shape: GFIconButtonShape.pills,
////              size: GFSize.large,
////              buttonBoxShadow: true,
////              color: GFColor.warning,
////              boxShadow: BoxShadow(
////                color: Colors.pink,
////                blurRadius: 2.0,
////                spreadRadius: 1.0,
////                offset: Offset.zero,
////              ),
////              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
////              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
//            ),
//
//            GFBadge(
//              text: '12',
////              color: GFColor.dark,
//              shape: GFBadgeShape.circle,
////              size: GFSize.small,
////              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
////              textColor: GFColor.white,
////              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
//            ),
//
//            GFButton(
//              type: GFButtonType.outline,
//              shape: GFButtonShape.pills,
//              text: 'goodies',
//              icon: Icon(Icons.share),
//              onPressed: () {},
////              hoverColor: Colors.orange,
////              focusColor: Colors.teal,
////              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
////              size: GFSize.large,
////              buttonBoxShadow: true,
////              blockButton: true,
////              fullWidthButton: true,
////              color: GFColor.primary,
////              textColor: GFColor.secondary,
////              icon: Icon(Icons.error, color: Colors.white,),
////              position: GFIconPosition.start,
////              boxShadow: BoxShadow(
////                color: Colors.pink,
////                blurRadius: 2.0,
////                spreadRadius: 1.0,
////                offset: Offset.zero,
////              ),
////              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
////              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
//            ),
            ],
          ),
        ),
//        bottomNavigationBar: GFTabBar(
//          initialIndex: 0,
//          length: 3,
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
//          ],
//          shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.only(
//                  topLeft: Radius.circular(24.0),
//                  topRight: Radius.circular(24.0))),
////          indicatorColor: Colors.white,
//        indicatorSize: TabBarIndicatorSize.label,
////          labelColor: Colors.lightGreen,
////          labelPadding: EdgeInsets.all(8.0),
////          tabBarColor: Colors.blueGrey,
////          unselectedLabelColor: Colors.black,
//          labelStyle: TextStyle(
//            fontWeight: FontWeight.w500,
//            fontSize: 13,
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
      );
}
