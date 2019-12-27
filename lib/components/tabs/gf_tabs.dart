import 'package:flutter/material.dart';

class GFTabs extends StatefulWidget {

  @override
  _GFTabsState createState() => _GFTabsState();
}

class _GFTabsState extends State<GFTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height * 0.5,
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: <Widget>[
              Material(
                type: MaterialType.button,
                color: Colors.teal,
                child: TabBar(
                  indicatorColor: Colors.pink,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.lightGreen,
                  unselectedLabelColor: Colors.black,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0,
                    color: Colors.deepOrange,
                    fontFamily: 'OpenSansBold',
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0,
                    color: Colors.black,
                    fontFamily: 'OpenSansBold',
                  ),
                  tabs: [
//                    GFButton(
//                      onPressed: null,
//                      child: Text("share"),
//                      icon: Icon(Icons.share),
//                      type: GFType.outline,
//                      shape: GFShape.pills,
//                    ),
                    Tab(
                      icon: Icon(Icons.error),
                      child: Text(
                        "Orders",
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Pastry",
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
//                    Container(
//                      color: Colors.red,
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          Icon(Icons.directions_railway),
////                          GFButton(
////                            onPressed: null,
////                            child: Text("share"),
////                            icon: Icon(Icons.share),
////                            type: GFType.outline,
////                            shape: GFShape.pills,
////                          ),
//                        ],
//                      ),
//                    ),
                    Icon(Icons.directions_car),
                    Icon(Icons.directions_transit),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

















