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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
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

 void _persistentBottomSheet(){
    _scaffoldKey.currentState.showBottomSheet((context) =>
        Container(
          color: Colors.redAccent,
          height: 250,
          child: const Center(
            child: Text('Hey! guys , this is a persistent bottom sheet'),
          ),
        )
    );
  }

  List<IconData> icons = [
    Icons.ac_unit,
    Icons.account_balance,
    Icons.adb,
    Icons.add_photo_alternate,
    Icons.format_line_spacing
  ];

  GlobalKey<ExpandableBottomSheetState> key = new GlobalKey();
//  int _contentAmount = 0;
//  ExpansionStatus _expansionStatus = ExpansionStatus.contracted;


  @override
  Widget build(BuildContext context) =>  Scaffold(
      key: _scaffoldKey,
      appBar: GFAppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('UI Kit'),
        centerTitle: true,
      ),
      body:

//      ExpandableBottomSheet(
//        key: key,
//        onIsContractedCallback: () => print('contracted'),
//        onIsExtendedCallback: () => print('extended'),
//        animationDurationExtend: Duration(milliseconds: 500),
//        animationDurationContract: Duration(milliseconds: 250),
//        animationCurveExpand: Curves.bounceOut,
//        animationCurveContract: Curves.ease,
////        persistentContentHeight: 220,
//        background: Container(
//          color: Colors.teal,
//        ),
//        persistentHeader: Container(
//          alignment: AlignmentDirectional.center,
//          color: Colors.orange,
//          constraints: BoxConstraints.expand(height: 40),
//          child: Text('dgfh hg  '),
//        ),
//
//        expandableContent: Container(
//          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
//          child: SingleChildScrollView(
//            child: Column(
//              mainAxisSize: MainAxisSize.min,
//              children: const <Widget>[
//                GFListTile(
//                  titleText: 'dfg',
//                  description: Text('df hgdata '),
//                ),
//                GFListTile(
//                  titleText: 'dfg',
//                  description: Text('df hgdata '),
//                ),
//                GFListTile(
//                  titleText: 'dfg',
//                  description: Text('df hgdata '),
//                ),
//                GFListTile(
//                  titleText: 'dfg',
//                  description: Text('df hgdata '),
//                ),
//                GFListTile(
//                  titleText: 'dfg',
//                  description: Text('df hgdata '),
//                ),
//                GFListTile(
//                  titleText: 'dfg',
//                  description: Text('df hgdata '),
//                ),
//                GFListTile(
//                  titleText: 'dfg',
//                  description: Text('df hgdata '),
//                ),
//                GFListTile(
//                  titleText: 'dfg',
//                  description: Text('df hgdata '),
//                ),
//                GFListTile(
//                  titleText: 'dfg',
//                  description: Text('df hgdata '),
//                ),
//                GFListTile(
//                  titleText: 'dfg',
//                  description: Text('df hgdata '),
//                ),
//                GFListTile(
//                  titleText: 'dfg',
//                  description: Text('df hgdata '),
//                ),
//                GFListTile(
//                  titleText: 'dfg',
//                  description: Text('df hgdata '),
//                ),
//              ],
//            ),
//          ),
//        ),
//      ),

//        persistentFooter: Container(
//          color: Colors.green,
//          height: 100,
//          child: Row(
//            mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              IconButton(
//                icon: Icon(Icons.add),
//                onPressed: () => setState(() {
//                  _contentAmount++;
//                }),
//              ),
//              IconButton(
//                icon: Icon(Icons.arrow_upward),
//                onPressed: () => setState(() {
//                  key.currentState.expand();
//                }),
//              ),
//              IconButton(
//                icon: Icon(Icons.cloud),
//                onPressed: () => setState(() {
//                  _expansionStatus = key.currentState.expansionStatus;
//                }),
//              ),
//              IconButton(
//                icon: Icon(Icons.arrow_downward),
//                onPressed: () => setState(() {
//                  key.currentState.contract();
//                }),
//              ),
//              IconButton(
//                icon: Icon(Icons.remove),
//                onPressed: () => setState(() {
//                  if (_contentAmount > 0) _contentAmount--;
//                }),
//              ),
//            ],
//          ),
//        ),
//      ),


      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 10,
            ),

        RaisedButton(
          child: const Text('showModalBottomSheet'), onPressed: () {
          showModalGFBottomSheet<void>(
            context: context,
//              key: key,
              animationDurationExtend: Duration(milliseconds: 500),
              animationDurationContract: Duration(milliseconds: 250),
              animationCurveExpand: Curves.bounceOut,
              animationCurveContract: Curves.ease,
        persistentContentHeight: 220.0,
//              background: Container(
//                color: Colors.teal,
//              ),
              persistentHeader: Container(
                alignment: AlignmentDirectional.center,
                color: Colors.orange,
                constraints: BoxConstraints.expand(height: 40),
                child: Text('dgfh hg  '),
              ),

              expandableContent: Container(
                constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      GFListTile(
                        titleText: 'dfg',
                        description: Text('df hgdata '),
                      ),
                    ],
                  ),
                ),
              ),
            builder: (BuildContext context) =>
                Container(
                height: 200,
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet'),
                      RaisedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                ),
              )
          );
          },),

            Radio(
              value: 0,
              groupValue: groupValue,
              onChanged: (val) {
                setState(() {
                  groupValue = val;
                });
              },
            ),

            Radio(
              value: 1,
              groupValue: groupValue,
              onChanged: (val) {
                setState(() {
                  groupValue = val;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _persistentBottomSheet();
        },
        child: const Icon(Icons.add),
      ),
    );
}
