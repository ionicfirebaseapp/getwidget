// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:getwidget/getwidget.dart';

// void main() {
//   final Key segmentTabsKey = UniqueKey();

//   final List<Widget> tabList = [
//     const Text(
//       'Tab1',
//     ),
//     const Tab(
//       icon: Icon(Icons.favorite),
//     ),
//     const Text(
//       'Tab3',
//     ),
//   ];

//   final indicator = BoxDecoration(
//       color: Colors.teal,
//       border: Border.all(color: Colors.tealAccent, width: 2));

//   testWidgets('GFSegmentTabs without length, isScrollable', (tester) async {
//     // `GFSegmentTabs.length` null, `GFSegmentTabs.tabs` null and `GFSegmentTabs.tabController null
//     expect(
//       () => GFSegmentTabs(
//         tabs: null,
//         length: null,
//         tabController: null,
//       ),
//       throwsAssertionError,
//     );
//   });

//   testWidgets('GFSegmentTabs can be constructed', (tester) async {
//     final TabController tabController =
//         TabController(length: 3, initialIndex: 0, vsync: tester);

//     final GFSegmentTabs segmentTabs = GFSegmentTabs(
//       key: segmentTabsKey,
//       tabController: tabController,
//       length: tabList.length,
//       tabs: tabList,
//     );

//     final TestApp app = TestApp(segmentTabs);
//     await tester.pumpWidget(app);

//     // find segmentTabs by key
//     expect(find.byKey(segmentTabsKey), findsOneWidget);
//     // find the 'Tab1' text in segmentTabs
//     expect(find.text('Tab1'), findsOneWidget);

//     expect(tabController, isNotNull);
//     expect(tabController.index, 0);
//     expect(tabController.previousIndex, 0);
//     await tester.tap(find.byIcon(Icons.favorite));
//     await tester.pump();
//     expect(tabController.indexIsChanging, true);
//     await tester.pump(const Duration(seconds: 1));
//     expect(tabController.index, 1);
//     expect(tabController.previousIndex, 0);
//     expect(tabController.indexIsChanging, false);
//     await tester.tap(find.byWidget(tabList[2]));
//     await tester.pump();
//     await tester.pump(const Duration(seconds: 1));
//     expect(tabController.index, 2);
//     expect(tabController.previousIndex, 1);
//     await tester.tap(find.text('Tab1'));
//     await tester.pump();
//     await tester.pump(const Duration(seconds: 1));
//     expect(tabController.index, 0);
//     expect(tabController.previousIndex, 2);
//   });

//   testWidgets('GFSegmentTabs with on taps selected tab', (tester) async {
//     final TabController tabController =
//         TabController(length: 3, initialIndex: 0, vsync: tester);

//     final GFSegmentTabs segmentTabs = GFSegmentTabs(
//       key: segmentTabsKey,
//       tabController: tabController,
//       length: tabList.length,
//       tabs: tabList,
//     );

//     final TestApp app = TestApp(segmentTabs);
//     await tester.pumpWidget(app);

//     // find segmentTabs by key
//     expect(find.byKey(segmentTabsKey), findsOneWidget);
//     // find the 'Tab1' text in segmentTabs
//     expect(find.text('Tab1'), findsOneWidget);
//     expect(find.byIcon(Icons.favorite), findsOneWidget);
//     expect(find.byWidget(tabList[2]), findsOneWidget);
//     expect(tabController.index, 0);
//     expect(tabController.previousIndex, 0);
//     await tester.tap(find.byWidget(tabList[2]));
//     await tester.pumpAndSettle();
//     expect(tabController.index, 2);
//     await tester.tap(find.byIcon(Icons.favorite));
//     await tester.pumpAndSettle();
//     expect(tabController.index, 1);
//     await tester.tap(find.text('Tab1'));
//     await tester.pumpAndSettle();
//     expect(tabController.index, 0);
//   });

//   testWidgets('GFSegmentTabs with on taps center selected tab', (tester) async {
//     final TabController controller =
//         TabController(length: 12, initialIndex: 0, vsync: tester);
//     final List<Widget> tabs = [
//       const Text(
//         'Tab_A',
//       ),
//       const Text(
//         'Tab_B',
//       ),
//       const Text(
//         'Tab_C',
//       ),
//       const Text(
//         'Tab_D',
//       ),
//       const Text(
//         'Tab_E',
//       ),
//       const Text(
//         'Tab_F',
//       ),
//       const Text(
//         'Tab_G',
//       ),
//       const Text(
//         'Tab_H',
//       ),
//       const Text(
//         'Tab_I',
//       ),
//       const Text(
//         'Tab_J',
//       ),
//       const Text(
//         'Tab_K',
//       ),
//       const Text(
//         'Tab_L',
//       ),
//     ];

//     final GFSegmentTabs segmentTabs = GFSegmentTabs(
//       key: segmentTabsKey,
//       tabController: controller,
//       length: tabs.length,
//       tabs: tabs,
//     );

//     final TestApp app = TestApp(segmentTabs);
//     await tester.pumpWidget(app);

//     // find segmentTabs by key
//     expect(find.byKey(segmentTabsKey), findsOneWidget);
//     // find the 'Tab_A' text in segmentTabs
//     expect(find.text('Tab_A'), findsOneWidget);
//     expect(controller, isNotNull);
//     expect(controller.index, 0);
//     expect(tester.getSize(find.byKey(segmentTabsKey)).width, equals(800.0));
//     // The center of the 'Tab_F' item is to the right of the TabBar's center
//     expect(tester.getCenter(find.text('Tab_F')).dx, greaterThan(301.0));
//     await tester.tap(find.text('Tab_F'));
//     await tester.pumpAndSettle();
//     expect(controller.index, 5);
//     // The center of the 'Tab_F' item is now at the TabBar's center
//     expect(tester.getCenter(find.text('Tab_F')).dx, closeTo(366.0, 1.0));
//   });

//   testWidgets('GFSegmentTabs can be constructed with properties',
//       (tester) async {
//     final TabController tabController =
//         TabController(length: 3, initialIndex: 0, vsync: tester);

//     final GFSegmentTabs segmentTabs = GFSegmentTabs(
//       key: segmentTabsKey,
//       tabController: tabController,
//       length: tabList.length,
//       tabs: tabList,
//       tabBarColor: Colors.blueGrey,
//       height: 66,
//       width: 244,
//       border: Border.all(color: Colors.teal),
//       borderRadius: BorderRadius.circular(5),
//       indicator: indicator,
//       indicatorWeight: 5,
//       indicatorPadding: const EdgeInsets.all(8),
//       indicatorColor: GFColors.WHITE,
//       indicatorSize: TabBarIndicatorSize.tab,
//       labelPadding: const EdgeInsets.all(8),
//       labelColor: Colors.lightGreen,
//       unselectedLabelColor: Colors.black,
//       labelStyle: const TextStyle(
//         fontWeight: FontWeight.w500,
//         fontSize: 16,
//       ),
//       unselectedLabelStyle: const TextStyle(
//         fontWeight: FontWeight.w500,
//         fontSize: 12,
//       ),
//     );

//     final TestApp app = TestApp(segmentTabs);
//     await tester.pumpWidget(app);

//     expect(app.segmentTabs.tabController, tabController);
//     expect(app.segmentTabs.length, tabList.length);
//     expect(app.segmentTabs.tabs, tabList);
//     expect(app.segmentTabs.tabBarColor, Colors.blueGrey);
//     expect(app.segmentTabs.height, 66);
//     expect(app.segmentTabs.width, 244);
//     expect(app.segmentTabs.border, Border.all(color: Colors.teal));
//     expect(app.segmentTabs.borderRadius, BorderRadius.circular(5));
//     expect(app.segmentTabs.indicator, indicator);
//     expect(app.segmentTabs.indicatorWeight, 5);
//     expect(app.segmentTabs.indicatorPadding, const EdgeInsets.all(8));
//     expect(app.segmentTabs.indicatorColor, GFColors.WHITE);
//     expect(app.segmentTabs.indicatorSize, TabBarIndicatorSize.tab);
//     expect(app.segmentTabs.labelPadding, const EdgeInsets.all(8));
//     expect(app.segmentTabs.labelColor, Colors.lightGreen);
//     expect(app.segmentTabs.unselectedLabelColor, Colors.black);
//     expect(
//         app.segmentTabs.labelStyle,
//         const TextStyle(
//           fontWeight: FontWeight.w500,
//           fontSize: 16,
//         ));
//     expect(
//         app.segmentTabs.unselectedLabelStyle,
//         const TextStyle(
//           fontWeight: FontWeight.w500,
//           fontSize: 12,
//         ));
//   });
// }

// class TestApp extends StatefulWidget {
//   const TestApp(this.segmentTabs);

//   final GFSegmentTabs segmentTabs;

//   @override
//   _TestAppState createState() => _TestAppState();
// }

// class _TestAppState extends State<TestApp> {
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         home: Scaffold(
//           appBar: AppBar(
//             title: const Text('Segment Tabs'),
//           ),
//           body: const Text('Body'),
//           bottomNavigationBar: widget.segmentTabs,
//         ),
//       );
// }
