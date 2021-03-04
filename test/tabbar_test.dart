import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  final Key tabBarKey = UniqueKey();

  final List<Widget> tabList = [
    const Text(
      'Tab1',
    ),
    const Tab(
      icon: Icon(Icons.favorite),
    ),
    const Tab(
      icon: Icon(Icons.directions_railway),
      child: Text(
        'Tab3',
      ),
    ),
  ];

  final indicator = BoxDecoration(
      color: Colors.teal,
      border: Border.all(color: Colors.tealAccent, width: 2));
  const tabBarShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24), topRight: Radius.circular(24)));

  testWidgets('GFTabBar without length, isScrollable', (tester) async {
    // `GFTabBar.length` null or `GFTabBar.isScrollable` null, `GFTabBar.tabs` null and `GFTabBar.controller` null
    expect(
      () => GFTabBar(
        tabs: null,
        controller: null,
        length: null,
        isScrollable: null,
      ),
      throwsAssertionError,
    );
  });

  testWidgets('GFTabBar can be constructed', (tester) async {
    final TabController tabController =
        TabController(length: 3, initialIndex: 0, vsync: tester);

    final GFTabBar tabBar = GFTabBar(
      key: tabBarKey,
      controller: tabController,
      length: tabList.length,
      tabs: tabList,
    );

    final TestApp app = TestApp(tabBar);
    await tester.pumpWidget(app);

    // find tabBar by key
    expect(find.byKey(tabBarKey), findsOneWidget);
    // find the 'Tab1' text in tabBar
    expect(find.text('Tab1'), findsOneWidget);

    expect(tabController, isNotNull);
    expect(tabController.index, 0);
    expect(tabController.previousIndex, 0);
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();
    expect(tabController.indexIsChanging, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tabController.index, 1);
    expect(tabController.previousIndex, 0);
    expect(tabController.indexIsChanging, false);
    await tester.tap(find.byWidget(tabList[2]));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(tabController.index, 2);
    expect(tabController.previousIndex, 1);
    await tester.tap(find.text('Tab1'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(tabController.index, 0);
    expect(tabController.previousIndex, 2);
  });

  testWidgets('GFTabBar with scrollable taps selected tab', (tester) async {
    final TabController tabController =
        TabController(length: 3, initialIndex: 0, vsync: tester);

    final GFTabBar tabBar = GFTabBar(
      key: tabBarKey,
      controller: tabController,
      length: tabList.length,
      tabs: tabList,
      isScrollable: true,
    );

    final TestApp app = TestApp(tabBar);
    await tester.pumpWidget(app);

    // find tabBar by key
    expect(find.byKey(tabBarKey), findsOneWidget);
    // find the 'Tab1' text in tabBar
    expect(app.tabBar.isScrollable, isTrue);
    expect(find.text('Tab1'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byWidget(tabList[2]), findsOneWidget);
    expect(tabController.index, 0);
    expect(tabController.previousIndex, 0);
    await tester.tap(find.byWidget(tabList[2]));
    await tester.pumpAndSettle();
    expect(tabController.index, 2);
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pumpAndSettle();
    expect(tabController.index, 1);
    await tester.tap(find.text('Tab1'));
    await tester.pumpAndSettle();
    expect(tabController.index, 0);
  });

  testWidgets('GFTabBar with scrollable taps center selected tab',
      (tester) async {
    final TabController controller =
        TabController(length: 12, initialIndex: 0, vsync: tester);
    final List<Widget> tabs = [
      const Text(
        'Tab_A',
      ),
      const Text(
        'Tab_B',
      ),
      const Text(
        'Tab_C',
      ),
      const Text(
        'Tab_D',
      ),
      const Text(
        'Tab_E',
      ),
      const Text(
        'Tab_F',
      ),
      const Text(
        'Tab_G',
      ),
      const Text(
        'Tab_H',
      ),
      const Text(
        'Tab_I',
      ),
      const Text(
        'Tab_J',
      ),
      const Text(
        'Tab_K',
      ),
      const Text(
        'Tab_L',
      ),
    ];

    final GFTabBar tabBar = GFTabBar(
      key: tabBarKey,
      controller: controller,
      length: tabs.length,
      tabs: tabs,
      isScrollable: true,
    );

    final TestApp app = TestApp(tabBar);
    await tester.pumpWidget(app);

    // find tabBar by key
    expect(find.byKey(tabBarKey), findsOneWidget);
    // find the 'Tab_A' text in tabBar
    expect(app.tabBar.isScrollable, isTrue);
    expect(find.text('Tab_A'), findsOneWidget);
    expect(controller, isNotNull);
    expect(controller.index, 0);
    expect(tester.getSize(find.byKey(tabBarKey)).width, equals(800.0));
    // The center of the 'Tab_F' item is to the right of the TabBar's center
    expect(tester.getCenter(find.text('Tab_F')).dx, greaterThan(401.0));
    await tester.tap(find.text('Tab_F'));
    await tester.pumpAndSettle();
    expect(controller.index, 5);
    // The center of the 'Tab_F' item is now at the TabBar's center
    expect(tester.getCenter(find.text('Tab_F')).dx, closeTo(400.0, 1.0));
  });

  testWidgets('GFTabBar can be scrolled independent of the selection',
      (tester) async {
    final TabController controller =
        TabController(length: 12, initialIndex: 0, vsync: tester);
    final List<Widget> tabs = [
      const Text(
        'TabA',
      ),
      const Text(
        'TabB',
      ),
      const Text(
        'TabC',
      ),
      const Text(
        'TabD',
      ),
      const Text(
        'TabE',
      ),
      const Text(
        'TabF',
      ),
      const Text(
        'TabG',
      ),
      const Text(
        'TabH',
      ),
      const Text(
        'TabI',
      ),
      const Text(
        'TabJ',
      ),
      const Text(
        'TabK',
      ),
      const Text(
        'TabL',
      ),
    ];

    final GFTabBar tabBar = GFTabBar(
      key: tabBarKey,
      controller: controller,
      length: tabs.length,
      tabs: tabs,
      isScrollable: true,
    );

    final TestApp app = TestApp(tabBar);
    await tester.pumpWidget(app);

    // find tabBar by key
    expect(find.byKey(tabBarKey), findsOneWidget);
    // find the 'Tab_A' text in tabBar
    expect(app.tabBar.isScrollable, isTrue);
    expect(find.text('TabA'), findsOneWidget);
    expect(controller, isNotNull);
    expect(controller.index, 0);
    // Fling-scroll the TabBar to the left
    expect(tester.getCenter(find.text('TabH')).dx, lessThan(700.0));
    await tester.fling(find.byKey(tabBarKey), const Offset(-200, 0), 10000);
    await tester.pump();
    await tester
        .pump(const Duration(seconds: 1)); // finish the scroll animation
    expect(tester.getCenter(find.text('TabH')).dx, lessThan(500.0));
    // Scrolling the TabBar doesn't change the selection
    expect(controller.index, 0);
  });

  testWidgets('GFTabBar can be constructed with properties', (tester) async {
    final TabController tabController =
        TabController(length: 3, initialIndex: 0, vsync: tester);

    final GFTabBar tabBar = GFTabBar(
      key: tabBarKey,
      controller: tabController,
      length: tabList.length,
      tabs: tabList,
      tabBarColor: Colors.blueGrey,
      tabBarHeight: 66,
      isScrollable: false,
      shape: tabBarShape,
      indicator: indicator,
      indicatorWeight: 5,
      indicatorPadding: const EdgeInsets.all(8),
      indicatorColor: GFColors.WHITE,
      indicatorSize: TabBarIndicatorSize.tab,
      labelPadding: const EdgeInsets.all(8),
      labelColor: Colors.lightGreen,
      unselectedLabelColor: Colors.black,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
    );

    final TestApp app = TestApp(tabBar);
    await tester.pumpWidget(app);

    expect(app.tabBar.controller, tabController);
    expect(app.tabBar.length, tabList.length);
    expect(app.tabBar.tabs, tabList);
    expect(app.tabBar.tabBarColor, Colors.blueGrey);
    expect(app.tabBar.tabBarHeight, 66);
    expect(app.tabBar.isScrollable, isFalse);
    expect(app.tabBar.shape, tabBarShape);
    expect(app.tabBar.indicator, indicator);
    expect(app.tabBar.indicatorWeight, 5);
    expect(app.tabBar.indicatorPadding, const EdgeInsets.all(8));
    expect(app.tabBar.indicatorColor, GFColors.WHITE);
    expect(app.tabBar.indicatorSize, TabBarIndicatorSize.tab);
    expect(app.tabBar.labelPadding, const EdgeInsets.all(8));
    expect(app.tabBar.labelColor, Colors.lightGreen);
    expect(app.tabBar.unselectedLabelColor, Colors.black);
    expect(
        app.tabBar.labelStyle,
        const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ));
    expect(
        app.tabBar.unselectedLabelStyle,
        const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ));
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.tabBar);

  final GFTabBar tabBar;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('TabBar'),
          ),
          body: const Text('Body'),
          bottomNavigationBar: widget.tabBar,
        ),
      );
}
