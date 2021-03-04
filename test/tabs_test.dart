import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

class StateMarker extends StatefulWidget {
  const StateMarker({Key key, this.child}) : super(key: key);
  final Widget child;
  @override
  StateMarkerState createState() => StateMarkerState();
}

class StateMarkerState extends State<StateMarker> {
  String marker;
  @override
  Widget build(BuildContext context) {
    if (widget.child != null) {
      return widget.child;
    }
    return Container();
  }
}

void main() {
  final Key tabsKey = UniqueKey();
  final Key tabBarViewKey = UniqueKey();

  final indicator = BoxDecoration(
      color: Colors.teal,
      border: Border.all(color: Colors.tealAccent, width: 2));
  const tabsShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24), topRight: Radius.circular(24)));

  testWidgets('GFTabs without length, isScrollable', (tester) async {
    // `GFTabs.length` null or `GFTabs.isScrollable` null or `GFTabs.initialIndex` null, `GFTabs.controller` null,
    // `GFTabs.tabBarView` null, `GFTabs.tabs` null
    expect(
      () => GFTabs(
        controller: null,
        length: null,
        tabs: null,
        initialIndex: null,
        tabBarView: null,
        isScrollable: null,
      ),
      throwsAssertionError,
    );
  });

  testWidgets('GFTabs can be constructed', (tester) async {
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
    final List<String> bodyText = <String>['AAAAAA', 'BBBBBB', 'CCCCCC'];
    final List<Widget> tabViewList = [
      Text(bodyText[0]),
      Text(bodyText[1]),
      Text(bodyText[2])
    ];
    final TabController tabController =
        TabController(length: tabList.length, vsync: tester);

    final GFTabs tabs = GFTabs(
      key: tabsKey,
      initialIndex: 0,
      controller: tabController,
      length: tabList.length,
      tabs: tabList,
      tabBarView: GFTabBarView(
          controller: tabController,
          children:
              tabViewList.map((text) => StateMarker(child: text)).toList()),
    );

    final TestApp app = TestApp(tabs);
    await tester.pumpWidget(app);

    // find tabs by key
    expect(find.byKey(tabsKey), findsOneWidget);
    // find the 'Tab1' text in tabs
    expect(find.text('Tab1'), findsOneWidget);

    expect(tabController, isNotNull);
    expect(tabController.index, 0);
    expect(tabController.previousIndex, 0);
    expect(bodyText[tabController.index], 'AAAAAA');
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();
    expect(tabController.indexIsChanging, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tabController.index, 1);
    expect(bodyText[tabController.index], 'BBBBBB');
    expect(tabController.previousIndex, 0);
    expect(tabController.indexIsChanging, false);
    await tester.tap(find.byWidget(tabList[2]));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(tabController.index, 2);
    expect(bodyText[tabController.index], 'CCCCCC');
    expect(tabController.previousIndex, 1);
    await tester.tap(find.text('Tab1'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(tabController.index, 0);
    expect(tabController.previousIndex, 2);
  });

  testWidgets('GFTabs with scrollable taps selected tab', (tester) async {
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
    final List<String> bodyText = <String>['AAAAAA', 'BBBBBB', 'CCCCCC'];
    final List<Widget> tabViewList = [
      Text(bodyText[0]),
      Text(bodyText[1]),
      Text(bodyText[2])
    ];
    final TabController tabController =
        TabController(length: tabList.length, initialIndex: 0, vsync: tester);

    final GFTabs tabs = GFTabs(
      key: tabsKey,
      controller: tabController,
      length: tabList.length,
      tabs: tabList,
      isScrollable: true,
      tabBarView: GFTabBarView(
          controller: tabController,
          children:
              tabViewList.map((text) => StateMarker(child: text)).toList()),
    );

    final TestApp app = TestApp(tabs);
    await tester.pumpWidget(app);

    // find tabs by key
    expect(find.byKey(tabsKey), findsOneWidget);
    // find the 'Tab1' text in tabs
    expect(app.tabs.isScrollable, isTrue);
    expect(find.text('Tab1'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byWidget(tabList[2]), findsOneWidget);
    expect(tabController.index, 0);
    expect(bodyText[tabController.index], 'AAAAAA');
    expect(tabController.previousIndex, 0);
    await tester.tap(find.byWidget(tabList[2]));
    await tester.pumpAndSettle();
    expect(tabController.index, 2);
    expect(bodyText[tabController.index], 'CCCCCC');
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pumpAndSettle();
    expect(tabController.index, 1);
    expect(bodyText[tabController.index], 'BBBBBB');
    await tester.tap(find.text('Tab1'));
    await tester.pumpAndSettle();
    expect(tabController.index, 0);
  });

  testWidgets('GFTabs with scrollable taps center selected tab',
      (tester) async {
    final List<Widget> tabList = [
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
    final List<String> bodyText = <String>[
      'AAAAAA',
      'BBBBBB',
      'CCCCCC',
      'DDDDDD',
      'EEEEEE',
      'FFFFFF',
      'GGGGGG',
      'HHHHHH',
      'IIIIII',
      'JJJJJJ',
      'KKKKKK',
      'LLLLLL'
    ];
    final List<Widget> tabViewList = [
      Text(bodyText[0]),
      Text(bodyText[1]),
      Text(bodyText[2]),
      Text(bodyText[3]),
      Text(bodyText[4]),
      Text(bodyText[5]),
      Text(bodyText[6]),
      Text(bodyText[7]),
      Text(bodyText[8]),
      Text(bodyText[9]),
      Text(bodyText[10]),
      Text(bodyText[11])
    ];
    final TabController tabController =
        TabController(length: tabList.length, initialIndex: 0, vsync: tester);

    final GFTabs tabs = GFTabs(
      key: tabsKey,
      controller: tabController,
      length: tabList.length,
      tabs: tabList,
      isScrollable: true,
      tabBarView: GFTabBarView(
          controller: tabController,
          children:
              tabViewList.map((text) => StateMarker(child: text)).toList()),
    );

    final TestApp app = TestApp(tabs);
    await tester.pumpWidget(app);

    // find tabs by key
    expect(find.byKey(tabsKey), findsOneWidget);
    // find the 'Tab_A' text in tabs
    expect(app.tabs.isScrollable, isTrue);
    expect(find.text('Tab_A'), findsOneWidget);
    expect(tabController, isNotNull);
    expect(tabController.index, 0);
    expect(bodyText[tabController.index], 'AAAAAA');
    expect(tester.getSize(find.byKey(tabsKey)).width, equals(800.0));
    // The center of the 'Tab_F' item is to the right of the TabBar's center
    expect(tester.getCenter(find.text('Tab_F')).dx, greaterThan(401.0));
    await tester.tap(find.text('Tab_F'));
    await tester.pumpAndSettle();
    expect(tabController.index, 5);
    expect(bodyText[tabController.index], 'FFFFFF');
    // The center of the 'Tab_F' item is now at the TabBar's center
    expect(tester.getCenter(find.text('Tab_F')).dx, closeTo(400.0, 1.0));
  });

  testWidgets('GFTabs can be scrolled independent of the selection',
      (tester) async {
    final List<Widget> tabList = [
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
    final List<String> bodyText = <String>[
      'AAAAAA',
      'BBBBBB',
      'CCCCCC',
      'DDDDDD',
      'EEEEEE',
      'FFFFFF',
      'GGGGGG',
      'HHHHHH',
      'IIIIII',
      'JJJJJJ',
      'KKKKKK',
      'LLLLLL'
    ];
    final List<Widget> tabViewList = [
      Text(bodyText[0]),
      Text(bodyText[1]),
      Text(bodyText[2]),
      Text(bodyText[3]),
      Text(bodyText[4]),
      Text(bodyText[5]),
      Text(bodyText[6]),
      Text(bodyText[7]),
      Text(bodyText[8]),
      Text(bodyText[9]),
      Text(bodyText[10]),
      Text(bodyText[11])
    ];
    final TabController tabController =
        TabController(length: tabList.length, initialIndex: 0, vsync: tester);

    final GFTabs tabs = GFTabs(
      key: tabsKey,
      isScrollable: true,
      controller: tabController,
      length: tabList.length,
      tabs: tabList,
      tabBarView: GFTabBarView(
        controller: tabController,
          children:
              tabViewList.map((text) => StateMarker(child: text)).toList()),
    );

    final TestApp app = TestApp(tabs);
    await tester.pumpWidget(app);

    // find tabs by key
    expect(find.byKey(tabsKey), findsOneWidget);
    // find the 'Tab_A' text in tabs
    expect(app.tabs.isScrollable, isTrue);
    expect(find.text('TabA'), findsOneWidget);
    expect(tabController, isNotNull);
    expect(tabController.index, 0);
    expect(bodyText[tabController.index], 'AAAAAA');
    // Fling-scroll the TabBar to the left
    expect(tester.getCenter(find.text('TabH')).dx, lessThan(700.0));
    await tester.fling(find.byType(TabBar), const Offset(-200, 0), 10000);
    await tester.pump();
    await tester
        .pump(const Duration(seconds: 1)); // finish the scroll animation
    expect(tester.getCenter(find.text('TabH')).dx, lessThan(500.0));
    // Scrolling the TabBar doesn't change the selection
    expect(tabController.index, 0);
    expect(bodyText[tabController.index], 'AAAAAA');
  });

  testWidgets('GFTabs can be constructed', (tester) async {
    final List<Widget> tabBarList = [
      const Text('TabA'),
      const Text('TabB'),
      const Text('TabC'),
      const Text('TabD'),
      const Text('TabE')
    ];
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
    final TabController tabController =
        TabController(length: tabList.length, initialIndex: 0, vsync: tester);
    final String value = tabs[0];

    final GFTabs tab = GFTabs(
      key: tabsKey,
      height: 960,
      controller: tabController,
      length: tabs.length,
      tabs: tabBarList,
      tabBarView: GFTabBarView(
          controller: tabController,
          key: tabBarViewKey,
          children: tabList.map((text) => StateMarker(child: text)).toList()),
    );

    StateMarkerState findStateMarkerState(String name) =>
        tester.state(find.widgetWithText(StateMarker, name));

    final TestApp app = TestApp(tab);
    await tester.pumpWidget(app);

    // find tabBarView by key
    expect(find.byKey(tabBarViewKey), findsOneWidget);
    // find the 'AAAAAA' text in tabBarView
    expect(find.text('AAAAAA'), findsOneWidget);

    final TestGesture gesture =
        await tester.startGesture(tester.getCenter(find.text('AAAAAA')));
    await gesture.moveBy(const Offset(-600, 0));
    await tester.pump();
    expect(value, equals(tabs[0]));
    findStateMarkerState(tabs[1]).marker = 'marked';
    await gesture.up();
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
  });

  testWidgets('GFTabs can be constructed with properties', (tester) async {
    final List<Widget> tabList = [
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
    ];
    final List<String> tabText = <String>[
      'AAAAAA',
      'BBBBBB',
      'CCCCCC',
      'DDDDDD',
      'EEEEEE'
    ];
    final List<Widget> tabViewList = [
      Text(tabText[0]),
      Text(tabText[1]),
      Text(tabText[2]),
      Text(tabText[3]),
      Text(tabText[4])
    ];
    final TabController tabController =
        TabController(length: tabList.length, initialIndex: 0, vsync: tester);

    final GFTabs tabs = GFTabs(
      key: tabsKey,
      controller: tabController,
      length: tabList.length,
      tabs: tabList,
      tabBarView: GFTabBarView(
        controller: tabController,
          children:
              tabViewList.map((text) => StateMarker(child: text)).toList()),
      tabBarColor: Colors.blueGrey,
      tabBarHeight: 66,
      height: 345,
      isScrollable: false,
      shape: tabsShape,
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

    final TestApp app = TestApp(tabs);
    await tester.pumpWidget(app);

    expect(app.tabs.controller, tabController);
    expect(app.tabs.length, tabList.length);
    expect(app.tabs.tabs, tabList);
    expect(app.tabs.controller, tabController);
    // expect(app.tabs.tabBarView, GFTabBarView(
    //     children: tabViewList.map((text) =>  StateMarker(
    //         child: text
    //     )).toList()
    // ),);
    expect(app.tabs.height, 345);
    expect(app.tabs.tabBarColor, Colors.blueGrey);
    expect(app.tabs.tabBarHeight, 66);
    expect(app.tabs.isScrollable, isFalse);
    expect(app.tabs.shape, tabsShape);
    expect(app.tabs.indicator, indicator);
    expect(app.tabs.indicatorWeight, 5);
    expect(app.tabs.indicatorPadding, const EdgeInsets.all(8));
    expect(app.tabs.indicatorColor, GFColors.WHITE);
    expect(app.tabs.indicatorSize, TabBarIndicatorSize.tab);
    expect(app.tabs.labelPadding, const EdgeInsets.all(8));
    expect(app.tabs.labelColor, Colors.lightGreen);
    expect(app.tabs.unselectedLabelColor, Colors.black);
    expect(
        app.tabs.labelStyle,
        const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ));
    expect(
        app.tabs.unselectedLabelStyle,
        const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ));
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.tabs);

  final GFTabs tabs;

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
            body: widget.tabs),
      );
}
