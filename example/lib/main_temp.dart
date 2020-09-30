import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

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

class BottomSheetPage extends StatefulWidget {
  @override
  _BottomSheetPageState createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  final GFBottomSheetController _controller = GFBottomSheetController();
  bool isSelected = false;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
              ),
              GFBorder(
                  type: GFBorderType.Rect,
                  dashedLine: [4, 6],
                  child: Text('Dashed Border')),
              SizedBox(height: 20),
              GFBorder(
                  type: GFBorderType.Rect,
                  dashedLine: [2, 0],
                  child: Text('Basic Border')),
              SizedBox(height: 20),
              GFBorder(
                  type: GFBorderType.Rect,
                  dashedLine: [2, 1],
                  radius: Radius.circular(5),
                  child: Text('Dotted Border')),
              SizedBox(height: 20),
              GFBorder(
                  type: GFBorderType.RRect,
                  dashedLine: [2, 1],
                  radius: Radius.circular(20),
                  child: Text('Dotted Border with radius')),
              SizedBox(height: 20),
              GFBorder(
                  type: GFBorderType.RRect,
                  dashedLine: [2, 0],
                  radius: Radius.circular(20),
                  child: Container(
                      height: 50,
                      width: 222,
                      child: Center(
                        child: Text('solid Border with radius'),
                      ))),
              SizedBox(height: 20),
              GFBorder(
                  type: GFBorderType.RRect,
                  dashedLine: [4, 6],
                  radius: Radius.circular(5),
                  padding: EdgeInsets.zero,
                  child: GFButton(
                    onPressed: null,
                    child: Text('button'),
                  )),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                GFBorder(
                  type: GFBorderType.Oval,
                  dashedLine: [6, 0],
                  strokeWidth: 2,
                  child: Container(
                      alignment: AlignmentDirectional.center,
                      width: 123,
                      height: 55,
                      child: Text('Oval')),
                ),
                GFBorder(
                  type: GFBorderType.Circle,
                  dashedLine: [4, 6],
                  strokeWidth: 2,
                  padding: EdgeInsets.all(20),
                  child: Container(
                      alignment: AlignmentDirectional.center,
                      width: 222,
                      height: 222,
                      child: GFButton(
                        onPressed: null,
                        child: Text('button'),
                      )),
                ),
              ]),
            ]),
        bottomSheet: GFBottomSheet(
          controller: _controller,
          maxContentHeight: 300,
          // minContentHeight: 200,
          // enableExpandableContent: true,
          stickyHeaderHeight: 100,
          stickyHeader: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 0)]),
            child: const GFListTile(
              avatar: GFAvatar(
                  // backgroundImage: AssetImage('assets image here'),
                  ),
              titleText: 'GetWidget',
              subtitleText: 'Open source UI library',
            ),
          ),
          contentBody: Container(
            height: 200,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'What do people call you?',
                    labelText: 'Name *',
                  ),
                  onSaved: (String value) {},
                  validator: (String value) {
                    return 'Do not use the @ char.';
                  },
                ),
                Center(
                    child: Text(
                  'Getwidget reduces your overall app development time to minimum 30% because of its pre-build clean UI widget that you can use in flutter app development. We have spent more than 1000+ hours to build this library to make flutter developer’s life easy.',
                  style: TextStyle(
                      fontSize: 15, wordSpacing: 0.3, letterSpacing: 0.2),
                ))
              ],
            ),
          ),
          stickyFooter: Container(
            color: GFColors.SUCCESS,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Get in touch',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'info@getwidget.dev',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          ),
          stickyFooterHeight: 50,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: GFColors.SUCCESS,
            child: _controller.isBottomSheetOpened
                ? Icon(Icons.keyboard_arrow_down)
                : Icon(Icons.keyboard_arrow_up),
            onPressed: () {
              _controller.isBottomSheetOpened
                  ? _controller.hideBottomSheet()
                  : _controller.showBottomSheet();
            }),
      );
}
