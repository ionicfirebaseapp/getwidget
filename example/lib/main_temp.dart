import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'dart:async';

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
        home: BottomSheetPage(),
      );
}

// Yashraj$07

class BottomSheetPage extends StatefulWidget {
  @override
  _BottomSheetPageState createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  final GFBottomSheetController _controller = GFBottomSheetController();
  bool isSelected = false;

  bool showFloatingToast = false;
  Timer autoTimer;
  bool showBlurness = true;
  Duration autoTimerDuration = Duration(milliseconds: 400);

  bool check = true;
  int groupValue = 0;

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
        appBar: GFAppBar(
          title: Text('GF Toasting'),
        ),
        body: GFFloatingWidget(
          verticalPosition: MediaQuery.of(context).size.width * 0.5,
          horizontalPosition: MediaQuery.of(context).size.height * 0.02,
          showBlurness: showFloatingToast,
          blurnessColor: Colors.black87,
          child: showFloatingToast
              ? GFToast(
            backgroundColor: Colors.white,
            text:
            'You have succesfully viewed how the floating toast works!!',
            textStyle: const TextStyle(color: Colors.black87),
            button: GFButton(
              onPressed: () {
                setState(() {
                  showFloatingToast = false;
                });
              },
              text: 'OK',
              type: GFButtonType.transparent,
              color: GFColors.SUCCESS,
            ),
            autoDismiss: false,
          )
              : Container(),
          body: ListView(
            physics: const ScrollPhysics(),
            children: <Widget>[
              GFSearchBar(
                  searchList: list,
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
                  onItemSelected: (item) {
                    setState(() {
                      print('$item');
                    });
                  }),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
                child: GFTypography(
                  text: 'Customised SearchBar',
                  type: GFTypographyType.typo5,
                  dividerWidth: 25,
                  dividerColor: Color(0xFF19CA4B),
                ),
              ),
              GFSearchBar(
                  searchBoxInputDecoration: InputDecoration(
                    labelText: 'Type Here',
                    labelStyle: const TextStyle(color: Colors.black26),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black26,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  searchList: list,
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
                  onItemSelected: (item) {
                    setState(() {
                      print('$item');
                    });
                  }),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
                child: GFTypography(
                  text: 'Animated Toasts (Auto Dismissable)',
                  type: GFTypographyType.typo5,
                  dividerWidth: 25,
                  dividerColor: Color(0xFF19CA4B),
                ),
              ),
              GFToast(
                text: 'Auto Dismissable after the given duration !',
                button: GFButton(
                  onPressed: () {},
                  text: 'OK',
                  type: GFButtonType.transparent,
                  color: GFColors.SUCCESS,
                ),
                autoDismiss: true,
                duration: const Duration(seconds: 5),
              ),
              const SizedBox(
                height: 15,
              ),
              const GFToast(
                text: 'Pass true to autoDismiss property to use this effect!',
                autoDismiss: true,
                duration: Duration(seconds: 2),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
                child: GFTypography(
                  text: 'Basic Toasts',
                  type: GFTypographyType.typo5,
                  dividerWidth: 25,
                  dividerColor: Color(0xFF19CA4B),
                ),
              ),
              GFToast(
                text: 'Paired Succesfully !',
                button: GFButton(
                  onPressed: () {},
                  text: 'OK',
                  type: GFButtonType.transparent,
                  color: GFColors.SUCCESS,
                ),
                autoDismiss: false,
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.topLeft,
              ),
              const SizedBox(
                height: 15,
              ),
              GFToast(
                text:
                'This item already has the label “travel”. You can add  new label. !',
                button: GFButton(
                  onPressed: () {},
                  text: 'OK',
                  type: GFButtonType.transparent,
                  color: GFColors.SUCCESS,
                ),
                autoDismiss: false,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
                child: GFTypography(
                  text: 'Rounded Toasts',
                  type: GFTypographyType.typo5,
                  dividerWidth: 25,
                  dividerColor: Color(0xFF19CA4B),
                ),
              ),
              GFToast(
                text: 'Paired Succesfully !',
                button: GFButton(
                  onPressed: () {},
                  text: 'OK',
                  type: GFButtonType.transparent,
                  color: GFColors.SUCCESS,
                ),
                type: GFToastType.rounded,
                autoDismiss: false,
                alignment: Alignment.topLeft,
              ),
              const SizedBox(
                height: 15,
              ),
              GFToast(
                text:
                'This item already has the label “travel”. You can add a new label. !',
                button: GFButton(
                  onPressed: () {},
                  text: 'OK',
                  type: GFButtonType.transparent,
                  color: GFColors.SUCCESS,
                ),
                autoDismiss: false,
                type: GFToastType.rounded,
                alignment: Alignment.topLeft,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
                child: GFTypography(
                  text: 'Full Width Toasts',
                  type: GFTypographyType.typo5,
                  dividerWidth: 25,
                  dividerColor: Color(0xFF19CA4B),
                ),
              ),
              GFToast(
                text: 'Paired Succesfully !',
                button: GFButton(
                  onPressed: () {},
                  text: 'OK',
                  type: GFButtonType.transparent,
                  color: GFColors.SUCCESS,
                ),
                type: GFToastType.fullWidth,
                autoDismiss: false,
              ),
              const SizedBox(
                height: 15,
              ),
              GFToast(
                text:
                'This item already has the label “travel”. You can add a new label.!',
                button: GFButton(
                  onPressed: () {},
                  text: 'OK',
                  type: GFButtonType.transparent,
                  color: GFColors.SUCCESS,
                ),
                autoDismiss: false,
                type: GFToastType.fullWidth,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
                child: GFTypography(
                  text: 'Floating Toast',
                  type: GFTypographyType.typo5,
                  dividerWidth: 25,
                  dividerColor: Color(0xFF19CA4B),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                child: GFButton(
                  onPressed: () {
                    setState(() {
                      showFloatingToast = !showFloatingToast;
                    });
                  },
                  text: 'View Floating Toast',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        bottomSheet: GFBottomSheet(
          controller: _controller,
          maxContentHeight: 300,
          // minContentHeight: 200,
          enableExpandableContent: true,
          stickyHeaderHeight: 70,
          stickyHeader: const GFListTile(
            padding: EdgeInsets.zero,
            avatar: GFAvatar(
                // backgroundImage: AssetImage('lib/assets/images/img.png'),
                ),
            titleText: 'Eva Mendez',
            subtitleText: '11 minutes ago',
          ),
          contentBody: Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: [
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 10),
                //   height: 60,
                //   padding: EdgeInsets.only(bottom: 15),
                //   child: TextFormField(
                //
                //     initialValue: "Enter Message",
                //     keyboardType: TextInputType.emailAddress,
                //     decoration: InputDecoration(
                //
                //         errorBorder: OutlineInputBorder(
                //             borderSide: BorderSide(
                //                 width: 0, color: Color(0xFFF44242))),
                //         errorStyle: TextStyle(color: Color(0xFFF44242)),
                //         contentPadding: EdgeInsets.all(10),
                //         enabledBorder: const OutlineInputBorder(
                //           borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                //         ),
                //
                //         focusedBorder: OutlineInputBorder(
                //           borderSide: BorderSide(color: Colors.grey),
                //         ),
                //         fillColor: Colors.white,
                //         focusColor: Colors.white),
                //   ),
                // ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                                image: AssetImage('assets/images/pixa.jpg'))),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 6),
                          child: Text(
                            'Add to your story',
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                ),
                ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return SingleChildScrollView(
                          child: InkWell(
                        child: GFListTile(
                          avatar: GFAvatar(
                            backgroundImage:
                                AssetImage('assets/images/pixa.jpg'),
                            size: 20,
                          ),
                          subtitleText: 'John Mendez',
                          icon: Container(
                            width: 66,
                            height: 30,
                            child: GFButton(
                              onPressed: () {},
                              color: GFColors.PRIMARY,
                              child: Center(
                                  child: Text(
                                'Send',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                      ));
                    }),
              ],
            ),
          ),
        ),
      );
}
