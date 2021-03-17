import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  final Key tabBarViewKey = UniqueKey();
  final List<String> tabs = <String>[
    'AAAAAA',
    'BBBBBB',
    'CCCCCC',
    'DDDDDD',
    'EEEEEE'
  ];
  final List<Widget> tabList = [
    Text(tabs[0]),
    Text(tabs[1]),
    Text(tabs[2]),
    Text(tabs[3]),
    Text(tabs[4])
  ];

  testWidgets('GFTabBarView can be constructed', (tester) async {
    final TabController tabController =
        TabController(length: 3, initialIndex: 0, vsync: tester);

    final GFTabBarView tabBarView =
        GFTabBarView(controller: tabController, children: [
      Container(
        child: const Text('aaa'),
      ),
      Container(
        child: const Text('bbb'),
      ),
      Container(
        child: const Text('ccc'),
      ),
    ]);

    final TestApp app = TestApp(tabBarView);
    await tester.pumpWidget(app);

    expect(find.text('aaa'), findsOneWidget);
    expect(find.text('bbb'), findsNothing);

    Offset point = tester.getCenter(find.text('aaa'));
    await tester.dragFrom(point, const Offset(-600, 0));
    await tester.pump();
    expect(find.text('bbb'), findsOneWidget);

    point = tester.getCenter(find.text('bbb'));
    await tester.dragFrom(point, const Offset(-600, 0));
    await tester.pump();
    expect(find.text('ccc'), findsOneWidget);

    point = tester.getCenter(find.text('ccc'));
    await tester.dragFrom(point, const Offset(600, 0));
    await tester.pump();
    expect(find.text('bbb'), findsOneWidget);
  });

  testWidgets('GFTabBarView can be constructed with properties',
      (tester) async {
    final TabController tabController =
        TabController(length: tabList.length, initialIndex: 0, vsync: tester);

    final GFTabBarView tabBarView = GFTabBarView(
      key: tabBarViewKey,
      controller: tabController,
      children: tabList,
      height: 345,
    );

    final TestApp app = TestApp(tabBarView);
    await tester.pumpWidget(app);

    expect(app.tabBarView.controller, tabController);
    expect(app.tabBarView.children, tabList);
    expect(app.tabBarView.height, 345);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.tabBarView);

  final GFTabBarView tabBarView;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('TabBarView'),
          ),
          body: widget.tabBarView,
        ),
      );
}
