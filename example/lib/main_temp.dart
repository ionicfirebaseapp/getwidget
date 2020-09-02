import 'package:flutter/cupertino.dart';
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
  int groupValue = 0;

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
      Scaffold(
        appBar: GFAppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('UI Kit'),
          centerTitle: true,
//    title:   GFSegmentTabs(
//      tabBarColor: Colors.tealAccent,
//      tabController: tabController,
//      length: 6,
//      tabs: const <Widget>[
//        Text(
//          '1',
//        ),
//        Text(
//          '2',
//        ),
//        Text(
//          '3',
//        ),
//        Text(
//          '4',
//        ),
//        Text(
//          '5',
//        ),
//        Text(
//          '6',
//        ),
//      ],
//      indicatorColor: Colors.teal,
//      border: Border.all(color: Colors.teal),
//      labelColor: GFColors.WHITE,
//      unselectedLabelColor: Colors.teal,
//      labelStyle: TextStyle(
//        fontWeight: FontWeight.w500,
//        fontSize: 14,
//      ),
//      unselectedLabelStyle: TextStyle(
//        fontWeight: FontWeight.w400,
//        fontSize: 12,
//      ),
//    ),
        ),
        body:
//    GFTabBarView(
//      controller: tabController,
//      children: <Widget>[
//        Container(
//          child: const Icon(Icons.directions_bike),
//          color: Colors.red,
//        ),
//        Container(
//          child: const Icon(Icons.directions_bus),
//          color: Colors.blue,
//        ),
//        Container(
//          child: const Icon(Icons.directions_railway),
//          color: Colors.orange,
//        ),
//        Container(
//          child: const Icon(Icons.directions_bike),
//          color: Colors.red,
//        ),
//        Container(
//          child: const Icon(Icons.directions_bus),
//          color: Colors.blue,
//        ),
//        Container(
//          child: const Icon(Icons.directions_railway),
//          color: Colors.orange,
//        ),
//      ],
//    ),


        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 10,
              ),

              Radio(
                value: 0,
                groupValue: groupValue,
                onChanged: (val) {
                  print('val $val');
                  setState(() {
                    groupValue = val;
                  });
                  print('radio $groupValue $val');
                },
              ),

              Radio(
                value: 1,
                groupValue: groupValue,
                onChanged: (val) {
                  print('val $val');
                  setState(() {
                    groupValue = val;
                  });
                  print('radio $groupValue $val');
                },
              ),
//              RadioListTile(value: null, groupValue: null, onChanged: null),

              GFRadioButton(
                size: GFSize.SMALL,
                type: GFRadioButtonType.basic,
                radioColor: GFColors.SUCCESS,
//                activebgColor: GFColors.ALT,
//                inactivebgColor: GFColors.PRIMARY,
//                activeBorderColor: GFColors.DANGER,
//                inactiveBorderColor: GFColors.DARK,
                value: 0,
                groupValue: groupValue,
                onChanged: (val) {
                  print('val $val');
//                  setState(() {
//                    groupValue = val;
//                  });
                  print('radio $groupValue $val');
                },
                activeIcon: const Icon(
                  Icons.check,
                  size: 20,
                  color: GFColors.DARK,
                ),
//                inactiveIcon: const Icon(Icons.close, size: 20, color: GFColors.DARK,),
//                custombgColor: GFColors.SUCCESS,
              ),

              GFRadioButton(
                size: GFSize.SMALL,
                type: GFRadioButtonType.basic,
                radioColor: GFColors.SUCCESS,
//                activebgColor: GFColors.ALT,
//                inactivebgColor: GFColors.PRIMARY,
//                activeBorderColor: GFColors.DANGER,
//                inactiveBorderColor: GFColors.DARK,
                value: 1,
                groupValue: groupValue,
                onChanged: (val) {
                  print('val $val');
//                  setState(() {
//                    groupValue = val;
//                  });
                  print('radio $groupValue $val');
                },
                activeIcon: const Icon(
                  Icons.check,
                  size: 20,
                  color: GFColors.DARK,
                ),
//                inactiveIcon: const Icon(Icons.close, size: 20, color: GFColors.DARK,),
//                custombgColor: GFColors.SUCCESS,
              ),

              GFCheckboxListTile(
                color: GFColors.LIGHT,
                title: const Text('is checked'),
                size: GFSize.LARGE,
                activebgColor: GFColors.DANGER,
                onChanged: (val) {
                  setState(() {
                    check = val;
                  });
                  print('cch $check $val');
                },
                value: check,
                inactiveIcon: null,
              ),

              GFListTile(
                title: Text('title'),
                subTitle: Text('subtitle'),
                color: check ? GFColors.LIGHT : GFColors.DARK,
                onTap: (){
                  setState(() {
                    check = !check;
                  });
                },
              ),


              GFCheckbox(
                size: GFSize.SMALL,
                activebgColor: GFColors.DANGER,
                onChanged:
                    (val) {
                  setState(() {
                    check = val;
                  });
                },
                value: check,
                inactiveIcon: null,
              ),

              GFCheckbox(
                size: GFSize.SMALL,
                onChanged: (val) {
                  setState(() {
                    check = val;
                  });
                },
                value: check,
                type: GFCheckboxType.circle,
                checkColor: GFColors.DANGER,
                  activebgColor: Colors.green,
                  inactivebgColor: Colors.white54,
                  activeBorderColor: Colors.red,
                inactiveBorderColor: Colors.black12,
                inactiveIcon: Icon(Icons.check_box_outline_blank),
                activeIcon: Icon(Icons.check_box),
                autofocus: true,
              ),

              Checkbox(
                value: check,
                onChanged: (bool value) {
                  setState(() {
                    check = value;
                  });
                },
              ),

              const Padding(
                padding: EdgeInsets.only(left: 15, top: 30),
                child: GFTypography(
                  text: 'Basic Checkbox',
                  type: GFTypographyType.typo5,
                  dividerWidth: 25,
                  dividerColor: Color(0xFF19CA4B),
                ),
              ),
              GFCard(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GFCheckbox(
                      size: GFSize.SMALL,
                      activebgColor: GFColors.DANGER,
                      onChanged: (val) {
                        print('on change val $val');
                      },
                      value: true,
                      inactiveIcon: null,
                    ),
                    GFCheckbox(
                      activebgColor: GFColors.SECONDARY,
                      onChanged: (val) {
                        print('on change val $val');
                      },
                      value: true,
                      inactiveIcon: null,
                    ),
                    GFCheckbox(
                      size: GFSize.LARGE,
                      activebgColor: GFColors.SUCCESS,
                      onChanged: (val) {
                        print('on change val $val');
                      },
                      value: false,
                      inactiveIcon: null,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 30),
                child: GFTypography(
                  text: 'Square Checkbox',
                  type: GFTypographyType.typo5,
                  dividerWidth: 25,
                  dividerColor: Color(0xFF19CA4B),
                ),
              ),
              GFCard(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GFCheckbox(
                      size: GFSize.SMALL,
                      activebgColor: GFColors.ALT,
                      type: GFCheckboxType.square,
                      onChanged: (val) {
                        print('on change val $val');
                      },
                      value: true,
                      inactiveIcon: null,
                    ),
                    GFCheckbox(
                      type: GFCheckboxType.square,
                      activebgColor: GFColors.INFO,
                      onChanged: (val) {
                        print('on change val $val');
                      },
                      value: true,
                      inactiveIcon: null,
                    ),
                    GFCheckbox(
                      size: GFSize.LARGE,
                      activebgColor: GFColors.DARK,
                      type: GFCheckboxType.square,
                      onChanged: (val) {
                        print('on change val $val');
                      },
                      value: true,
                      inactiveIcon: null,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 30),
                child: GFTypography(
                  text: 'Circular Checkbox',
                  type: GFTypographyType.typo5,
                  dividerWidth: 25,
                  dividerColor: Color(0xFF19CA4B),
                ),
              ),
              GFCard(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GFCheckbox(
                      size: GFSize.SMALL,
                      type: GFCheckboxType.circle,
                      onChanged: (val) {
                        print('on change val $val');
                      },
                      value: true,
                      inactiveIcon: null,
                    ),
                    GFCheckbox(
                      type: GFCheckboxType.circle,
                      activebgColor: GFColors.WARNING,
                      onChanged: (val) {
                        print('on change val $val');
                      },
                      value: true,
                    ),
                    GFCheckbox(
                      activebgColor: GFColors.SECONDARY,
                      size: GFSize.LARGE,
                      type: GFCheckboxType.circle,
                      onChanged: (val) {
                        print('on change val $val');
                      },
                      value: true,
                      inactiveIcon: null,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 30),
                child: GFTypography(
                  text: 'Custom Checkbox',
                  type: GFTypographyType.typo5,
                  dividerWidth: 25,
                  dividerColor: Color(0xFF19CA4B),
                ),
              ),
              GFCard(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GFCheckbox(
                      size: GFSize.SMALL,
                      type: GFCheckboxType.custom,
                      onChanged: (val) {
                        print('on change val $val');
                      },
                      value: true,
                      inactiveIcon: null,
                    ),
                    GFCheckbox(
                      type: GFCheckboxType.square,
                      activebgColor: GFColors.INFO,
                      activeIcon: Icon(Icons.sentiment_satisfied),
                      onChanged: (val) {
                        print('on change val $val');
                      },
                      value: true,
                      inactiveIcon: Icon(Icons.sentiment_dissatisfied),
                    ),
                    GFCheckbox(
                      size: GFSize.MEDIUM,
//            activebgColor: GFColors.,
                      type: GFCheckboxType.custom,
                      onChanged: (val) {
                        print('on change val $val');
                      },
                      value: true,
                      custombgColor: Colors.purple,
                      inactiveIcon: null,
                    ),
                  ],
                ),
              ),

              GFImageOverlay(
                height: 200.0,
                width: 200.0,
                image: NetworkImage("https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
                boxFit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken,
                ),
                shape: BoxShape.circle,
              ),

              GFCard(
                  content:
                  GFImageOverlay(
                    height: 200.0,
                    width: 304.0,
                    image: NetworkImage("https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
                    boxFit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken,
                    ),
                  )
              ),

              RaisedButton(
                onPressed: (){},
                child: Text('hbjh'),
              ),
              GFButton(
                onPressed: (){},
                child: Text('hbjh'),
              ),
              GFButtonBar(
                  crossAxisAlignment: WrapCrossAlignment.center,
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
                  ]
              ),

              GFButtonBadge(
                onPressed: null,
                text: 'test button',
                icon: Icon(Icons.label),
              ),

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
                icon: Icon(Icons.ac_unit,),
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
                onPressed: (){},
//          color: Colors.blueGrey,
//          hoverColor: Colors.blueGrey,
//          focusColor: Colors.teal,
//          splashColor: Colors.amber,
//          highlightColor: Colors.cyan,
              ),
//

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
                    onPressed: (){},
                    child: Text("share"),
                    icon: Icon(Icons.share),
                    type: GFButtonType.outline,
                  ),
                ],
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


              GFIconButton(
                onPressed: () {},
                icon: Icon(Icons.ac_unit),
//              iconSize: 12.0,
//              type: GFType.solid,
//              shape: GFIconButtonShape.pills,
//              size: GFSize.large,
//              buttonBoxShadow: true,
//              color: GFColors.WARNING,
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
                onPressed: (){

                },
                child: Text('fvb'),
              ),

              GFButton(
                onPressed: (){

                },
                fullWidthButton: true,
                child: Text('fvb'),
              ),


              GFButton(
                type: GFButtonType.outline,
                shape: GFButtonShape.pills,
                text: 'goodies',
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
//          isScrollable: true,
//          controller: tabController,
//          length: 6,
//          tabs: const [
//            Tab(
//              icon: Icon(Icons.directions_bike),
//              child: Text(
//                'home',
//              ),
//            ),
//            Tab(
//              icon: Icon(Icons.directions_bus),
//              child: Text(
//                'cafe rounds',
//              ),
//            ),
//            Tab(
//              icon: Icon(Icons.directions_railway),
//              child: Text(
//                'walking',
//              ),
//            ),
//            Tab(
//              icon: Icon(Icons.directions_bike),
//              child: Text(
//                'pillow',
//              ),
//            ),
//            Tab(
//              icon: Icon(Icons.directions_bus),
//              child: Text(
//                'fire place',
//              ),
//            ),
//            Tab(
//              icon: Icon(Icons.directions_railway),
//              child: Text(
//                'rain harvest',
//              ),
//            ),
//          ],
//        ),
      );
}
