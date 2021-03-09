// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:getwidget/getwidget.dart';

// class StateMarker extends StatefulWidget {
//   const StateMarker({Key? key, this.child}) : super(key: key);
//   final Widget? child;
//   @override
//   StateMarkerState createState() => StateMarkerState();
// }

// class StateMarkerState extends State<StateMarker> {
//   String? marker;
//   @override
//   Widget build(BuildContext context) {
//     if (widget.child != null) {
//       return widget.child!;
//     }
//     return Container();
//   }
// }

// void main() {
//   final Key tabBarViewKey = UniqueKey();
//   final List<String> tabs = <String>[
//     'AAAAAA',
//     'BBBBBB',
//     'CCCCCC',
//     'DDDDDD',
//     'EEEEEE'
//   ];
//   final List<Widget> tabList = [
//     Text(tabs[0]),
//     Text(tabs[1]),
//     Text(tabs[2]),
//     Text(tabs[3]),
//     Text(tabs[4])
//   ];

//   testWidgets('GFTabBarView without length, isScrollable', (tester) async {
//     // `GFTabBarView.children` null or `GFTabBarView.dragStartBehavior` null, GFTabBarView.controller` null
//     expect(
//       () => GFTabBarView(
//         controller: null,
//         dragStartBehavior: null,
//         children: null,
//       ),
//       throwsAssertionError,
//     );
//   });

//   testWidgets('GFTabBarView can be constructed', (tester) async {
//     final TabController tabController =
//         TabController(length: tabList.length, initialIndex: 0, vsync: tester);
//     String value = tabs[0];

//     final GFTabBarView tabBarView = GFTabBarView(
//         key: tabBarViewKey,
//         controller: tabController,
//         children: tabList.map((text) => StateMarker(child: text)).toList());

//     StateMarkerState findStateMarkerState(String name) =>
//         tester.state(find.widgetWithText(StateMarker, name));

//     final TestApp app = TestApp(tabBarView);
//     await tester.pumpWidget(app);

//     // find tabBarView by key
//     expect(find.byKey(tabBarViewKey), findsOneWidget);
//     // find the 'AAAAAA' text in tabBarView
//     expect(find.text('AAAAAA'), findsOneWidget);

//     TestGesture gesture =
//         await tester.startGesture(tester.getCenter(find.text('AAAAAA')));
//     await gesture.moveBy(const Offset(-600, 0));
//     await tester.pump();
//     expect(value, equals(tabs[0]));
//     findStateMarkerState(tabs[1]).marker = 'marked';
//     await gesture.up();
//     await tester.pump();
//     await tester.pump(const Duration(seconds: 1));
//     value = tabs[tabController.index];
//     expect(value, equals(tabs[1]));
//     await tester.pumpWidget(app);
//     expect(findStateMarkerState(tabs[1]).marker, equals('marked'));

//     // slide on to the third tab.
//     gesture = await tester.startGesture(tester.getCenter(find.text(tabs[1])));
//     await gesture.moveBy(const Offset(-600, 0));
//     await gesture.up();
//     await tester.pump();
//     expect(findStateMarkerState(tabs[1]).marker, equals('marked'));
//     await tester.pump(const Duration(seconds: 1));
//     value = tabs[tabController.index];
//     expect(value, equals(tabs[2]));
//     await tester.pumpWidget(app);
//     expect(find.text(tabs[1]), findsNothing);
//     // slide back to the second tab.
//     gesture = await tester.startGesture(tester.getCenter(find.text(tabs[2])));
//     await gesture.moveBy(const Offset(600, 0));
//     await tester.pump();
//     final StateMarkerState markerState = findStateMarkerState(tabs[1]);
//     expect(markerState.marker, isNull);
//     markerState.marker = 'marked';
//     await gesture.up();
//     await tester.pump();
//     await tester.pump(const Duration(seconds: 1));
//     value = tabs[tabController.index];
//     expect(value, equals(tabs[1]));
//     await tester.pumpWidget(app);
//     expect(findStateMarkerState(tabs[1]).marker, equals('marked'));
//   });

//   testWidgets('GFTabBarView can be constructed with properties',
//       (tester) async {
//     final TabController tabController =
//         TabController(length: tabList.length, initialIndex: 0, vsync: tester);

//     final GFTabBarView tabBarView = GFTabBarView(
//       key: tabBarViewKey,
//       controller: tabController,
//       children: tabList,
//       height: 345,
//     );

//     final TestApp app = TestApp(tabBarView);
//     await tester.pumpWidget(app);

//     expect(app.tabBarView.controller, tabController);
//     expect(app.tabBarView.children, tabList);
//     expect(app.tabBarView.height, 345);
//   });
// }

// class TestApp extends StatefulWidget {
//   const TestApp(this.tabBarView);

//   final GFTabBarView tabBarView;

//   @override
//   _TestAppState createState() => _TestAppState();
// }

// class _TestAppState extends State<TestApp> {
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         home: Scaffold(
//           appBar: AppBar(
//             title: const Text('TabBarView'),
//           ),
//           body: widget.tabBarView,
//         ),
//       );
// }
