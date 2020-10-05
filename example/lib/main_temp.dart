import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) => Scaffold(
        body:GFTabs(
          initialIndex: 4,
          isScrollable: true,
          length: 8,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.directions_bike),
              child: Text(
                "Tab1",
              ),
            ),
            Tab(
              icon: Icon(Icons.directions_bus),
              child: Text(
                "Tab2",
              ),
            ),
            Tab(
              icon: Icon(Icons.directions_railway),
              child: Text(
                "Tab3",
              ),
            ),
            Tab(
              icon: Icon(Icons.directions_bike),
              child: Text(
                "Tab4",
              ),
            ),
            Tab(
              icon: Icon(Icons.directions_bus),
              child: Text(
                "Tab5",
              ),
            ),
            Tab(
              icon: Icon(Icons.directions_railway),
              child: Text(
                "Tab6",
              ),
            ),
            Tab(
              icon: Icon(Icons.directions_bike),
              child: Text(
                "Tab66",
              ),
            ),
            Tab(
              icon: Icon(Icons.directions_bike),
              child: Text(
                "Tab666",
              ),
            ),
          ],
          tabBarView: GFTabBarView(
            children: <Widget>[
              Container(child: Icon(Icons.directions_bike), color: Colors.red,),
              Container(child: Icon(Icons.directions_bus), color: Colors.blue,),
              Container(child: Icon(Icons.directions_railway), color: Colors.orange,),
              Container(child: Icon(Icons.directions_bike), color: Colors.red,),
              Container(child: Icon(Icons.directions_bus), color: Colors.blue,),
              Container(child: Icon(Icons.directions_railway), color: Colors.orange,),
              Container(child: Icon(Icons.directions_bus), color: Colors.blue,),
              Container(child: Icon(Icons.directions_railway), color: Colors.orange,),
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
