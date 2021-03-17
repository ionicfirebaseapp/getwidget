import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

class StateMarker extends StatefulWidget {
  const StateMarker({Key? key, this.child}) : super(key: key);
  final Widget? child;
  @override
  StateMarkerState createState() => StateMarkerState();
}

class StateMarkerState extends State<StateMarker> {
  String? marker;
  @override
  Widget build(BuildContext context) {
    if (widget.child != null) {
      return widget.child!;
    }
    return Container();
  }
}

void main() {
  final Key bottomBarKey = UniqueKey();
  final Key introScreenKey = UniqueKey();
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  final int initialPage = _pageController.initialPage;
  final List<Widget> slideList = [
    Container(color: Colors.teal, child: const Text('Page 1')),
    Container(color: Colors.amber, child: const Text('Page 2')),
    Container(color: Colors.blueGrey, child: const Text('Page 3')),
    Container(color: Colors.orange, child: const Text('Page 4')),
  ];
  final textList = ['Page 1', 'Page 2', 'Page 3', 'Page 4'];
  final List<Widget> slide = [
    Container(color: Colors.teal, child: Text(textList[0])),
    Container(color: Colors.amber, child: Text(textList[1])),
    Container(color: Colors.blueGrey, child: Text(textList[2])),
    Container(color: Colors.orange, child: Text(textList[3])),
  ];
  String value = textList[0];

  testWidgets('Basic GFIntroScreen can be constructed', (tester) async {
    final GFIntroScreen introScreen = GFIntroScreen(
        key: introScreenKey,
        pageController: _pageController,
        currentIndex: initialPage,
        pageCount: slide.length,
        slides: slide.map((data) => StateMarker(child: data)).toList());

    StateMarkerState findStateMarkerState(String name) =>
        tester.state(find.widgetWithText(StateMarker, name));

    final TestApp app = TestApp(introScreen);
    await tester.pumpWidget(app);

    // find intro screen by key
    expect(find.byKey(introScreenKey), findsOneWidget);
    // find first screen text
    expect(find.text('Page 1'), findsOneWidget);

    TestGesture gesture =
        await tester.startGesture(tester.getCenter(find.text('Page 1')));
    await gesture.moveBy(const Offset(-600, 0));
    await tester.pump();
    expect(value, equals(textList[0]));
    findStateMarkerState(textList[1]).marker = 'marked';
    await gesture.up();
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    value = textList[_pageController.page!.toInt()];
    expect(value, equals(textList[1]));
    await tester.pumpWidget(app);
    expect(findStateMarkerState(textList[1]).marker, equals('marked'));

    // slide on to the third tab.
    gesture =
        await tester.startGesture(tester.getCenter(find.text(textList[1])));
    await gesture.moveBy(const Offset(-600, 0));
    await gesture.up();
    await tester.pump();
    expect(findStateMarkerState(textList[1]).marker, equals('marked'));
    await tester.pump(const Duration(seconds: 1));
    value = textList[_pageController.page!.toInt()];
    expect(value, equals(textList[2]));
    await tester.pumpWidget(app);
    expect(find.text(textList[1]), findsNothing);
    // slide back to the second tab.
    gesture =
        await tester.startGesture(tester.getCenter(find.text(textList[2])));
    await gesture.moveBy(const Offset(600, 0));
    await tester.pump();
    final StateMarkerState markerState = findStateMarkerState(textList[1]);
    expect(markerState.marker, isNull);
    markerState.marker = 'marked';
    await gesture.up();
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    value = textList[_pageController.page!.toInt()];
    expect(value, equals(textList[1]));
    await tester.pumpWidget(app);
    expect(findStateMarkerState(textList[1]).marker, equals('marked'));
  });

  testWidgets(
      'Basic GFIntroScreen can be constructed with GFIntroScreenBottomNavigationBar',
      (tester) async {
    final PageController _pageController = PageController(
      initialPage: 0,
    );
    final int initialPage = _pageController.initialPage;

    final GFIntroScreen introScreen = GFIntroScreen(
      key: introScreenKey,
      pageController: _pageController,
      currentIndex: initialPage,
      pageCount: slide.length,
      slides: slide.map((data) => StateMarker(child: data)).toList(),
      showIntroScreenBottomNavigationBar: true,
      introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
        key: bottomBarKey,
        pageController: _pageController,
        currentIndex: initialPage,
        pageCount: 4,
      ),
    );

    final TestApp app = TestApp(introScreen);
    await tester.pumpWidget(app);

    // find intro screen by key
    expect(find.byKey(bottomBarKey), findsOneWidget);
    // find intro screen by key
    expect(find.byKey(introScreenKey), findsOneWidget);
    // find first screen text
    expect(find.text('Page 1'), findsOneWidget);
    expect(find.byKey(bottomBarKey), findsOneWidget);
    expect(introScreen.showIntroScreenBottomNavigationBar, isTrue);
    expect(_pageController, isNotNull);
    expect(_pageController.initialPage, 0);
    expect(_pageController.page!.toInt(), 0);
    await tester.tap(find.text('NEXT'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(_pageController.page!.toInt(), 1);
    expect(find.text('Page 2'), findsOneWidget);
    await tester.tap(find.text('NEXT'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(_pageController.page!.toInt(), 2);
    expect(find.text('Page 3'), findsOneWidget);
    await tester.tap(find.text('BACK'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(_pageController.page!.toInt(), 1);
    expect(find.text('Page 2'), findsOneWidget);
  });

  testWidgets(
      'Basic GFIntroScreenBottomNavigationBar can be constructed with no pagination and custom button text',
      (tester) async {
    final PageController _pageController = PageController(
      initialPage: 0,
    );
    final int initialPage = _pageController.initialPage;

    final GFIntroScreen introScreen = GFIntroScreen(
      key: introScreenKey,
      pageController: _pageController,
      currentIndex: initialPage,
      pageCount: slide.length,
      slides: slide.map((data) => StateMarker(child: data)).toList(),
      showIntroScreenBottomNavigationBar: true,
      introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
        key: bottomBarKey,
        pageController: _pageController,
        currentIndex: initialPage,
        pageCount: 4,
        showPagination: false,
        forwardButtonText: 'go to next',
        backButtonText: 'back to previous',
        skipButtonText: 'skip to last',
        doneButtonText: 'done, start from first',
        onForwardButtonTap: () {
          _pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear);
        },
        onBackButtonTap: () {
          _pageController.previousPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear);
        },
        onSkipTap: () {
          _pageController.jumpToPage(3);
        },
        onDoneTap: () {
          _pageController.jumpToPage(0);
        },
        backButtonTextStyle: const TextStyle(fontSize: 12),
        doneButtonTextStyle: const TextStyle(fontSize: 12),
        forwardButtonTextStyle: const TextStyle(fontSize: 12),
        skipButtonTextStyle: const TextStyle(fontSize: 12),
      ),
    );

    final TestApp app = TestApp(introScreen);
    await tester.pumpWidget(app);

    // find intro screen by key
    expect(find.byKey(introScreenKey), findsOneWidget);
    // find first screen text
    expect(find.text('Page 1'), findsOneWidget);
    expect(find.byKey(bottomBarKey), findsOneWidget);
    expect(introScreen.showIntroScreenBottomNavigationBar, isTrue);
    expect(_pageController, isNotNull);
    // on first screen
    expect(_pageController.initialPage, 0);
    expect(_pageController.page!.toInt(), 0);
    // tap go to next, to go to second screen
    await tester.tap(find.text('go to next'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(_pageController.page!.toInt(), 1);
    // find second screen
    expect(find.text('Page 2'), findsOneWidget);
    // tap back to previous to go back to first screen
    await tester.tap(find.text('back to previous'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(_pageController.page!.toInt(), 0);
    // find first screen
    expect(find.text('Page 1'), findsOneWidget);
    // tap skip to last, to jump to last screen
    await tester.tap(find.text('skip to last'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(_pageController.page!.toInt(), 3);
    // find fourth screen
    expect(find.text('Page 4'), findsOneWidget);
    // tap done, start from first to jump to first screen
    await tester.tap(find.text('done, start from first'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(_pageController.page!.toInt(), 0);
    // find first screen
    expect(find.text('Page 1'), findsOneWidget);
  });

  testWidgets(
      'Basic GFIntroScreenBottomNavigationBar can be constructed with no pagination and custom button',
      (tester) async {
    final PageController _pageController = PageController(
      initialPage: 0,
    );
    final int initialPage = _pageController.initialPage;

    final GFIntroScreen introScreen = GFIntroScreen(
      key: introScreenKey,
      pageController: _pageController,
      currentIndex: initialPage,
      pageCount: slide.length,
      slides: slide.map((data) => StateMarker(child: data)).toList(),
      showIntroScreenBottomNavigationBar: true,
      introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
        key: bottomBarKey,
        pageController: _pageController,
        currentIndex: initialPage,
        pageCount: 4,
        showPagination: false,
        forwardButton: GFButton(
          onPressed: () {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear);
          },
          child: const Text('go to next'),
        ),
        backButton: GFButton(
          onPressed: () {
            _pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear);
          },
          child: const Text('back to previous'),
        ),
        skipButton: GFButton(
          onPressed: () {
            _pageController.jumpToPage(3);
          },
          child: const Text('skip to last'),
        ),
        doneButton: GFButton(
          onPressed: () {
            _pageController.jumpToPage(0);
          },
          child: const Text('done, start from first'),
        ),
      ),
    );

    final TestApp app = TestApp(introScreen);
    await tester.pumpWidget(app);

    // find intro screen by key
    expect(find.byKey(introScreenKey), findsOneWidget);
    // find first screen text
    expect(find.text('Page 1'), findsOneWidget);
    expect(find.byKey(bottomBarKey), findsOneWidget);
    expect(introScreen.showIntroScreenBottomNavigationBar, isTrue);
    expect(_pageController, isNotNull);
    // on first screen
    expect(_pageController.initialPage, 0);
    expect(_pageController.page!.toInt(), 0);
    // tap go to next, to go to second screen
    await tester.tap(find.text('go to next'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(_pageController.page!.toInt(), 1);
    // find second screen
    expect(find.text('Page 2'), findsOneWidget);
    // tap back to previous to go back to first screen
    await tester.tap(find.text('back to previous'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(_pageController.page!.toInt(), 0);
    // find first screen
    expect(find.text('Page 1'), findsOneWidget);
    // tap skip to last, to jump to last screen
    await tester.tap(find.text('skip to last'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(_pageController.page!.toInt(), 3);
    // find fourth screen
    expect(find.text('Page 4'), findsOneWidget);
    // tap done, start from first to jump to first screen
    await tester.tap(find.text('done, start from first'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(_pageController.page!.toInt(), 0);
    // find first screen
    expect(find.text('Page 1'), findsOneWidget);
  });

  testWidgets(
      'Basic GFIntroScreenBottomNavigationBar can be constructed with custom pagination and no buttons',
      (tester) async {
    final PageController _pageController = PageController(
      initialPage: 0,
    );
    final int initialPage = _pageController.initialPage;

    final GFIntroScreen introScreen = GFIntroScreen(
      key: introScreenKey,
      pageController: _pageController,
      currentIndex: initialPage,
      pageCount: slide.length,
      slides: slide.map((data) => StateMarker(child: data)).toList(),
      showIntroScreenBottomNavigationBar: true,
      introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
        key: bottomBarKey,
        pageController: _pageController,
        currentIndex: initialPage,
        pageCount: 4,
        showButton: false,
        dotHeight: 10,
        dotWidth: 16,
        dotShape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(5)),
        inactiveColor: Colors.black12,
        activeColor: Colors.black87,
        dotMargin: const EdgeInsets.symmetric(horizontal: 6),
      ),
    );

    final TestApp app = TestApp(introScreen);
    await tester.pumpWidget(app);

    // find intro screen by key
    expect(find.byKey(introScreenKey), findsOneWidget);
    // find first screen text
    expect(find.text('Page 1'), findsOneWidget);
    expect(find.byKey(bottomBarKey), findsOneWidget);
    expect(introScreen.showIntroScreenBottomNavigationBar, isTrue);
    expect(_pageController, isNotNull);
    // on first screen
    expect(_pageController.initialPage, 0);
    expect(_pageController.page!.toInt(), 0);
    expect(introScreen.currentIndex, _pageController.page!.toInt());
  });

  testWidgets(
      'Basic GFIntroScreenBottomNavigationBar can be constructed with custom child',
      (tester) async {
    final PageController _pageController = PageController(
      initialPage: 0,
    );
    final int initialPage = _pageController.initialPage;

    final GFIntroScreen introScreen = GFIntroScreen(
      key: introScreenKey,
      pageController: _pageController,
      currentIndex: initialPage,
      pageCount: slide.length,
      slides: slide.map((data) => StateMarker(child: data)).toList(),
      showIntroScreenBottomNavigationBar: true,
      introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
        key: bottomBarKey,
        pageController: _pageController,
        currentIndex: initialPage,
        pageCount: 4,
        child: const Text('bottom bar'),
      ),
    );

    final TestApp app = TestApp(introScreen);
    await tester.pumpWidget(app);

    // find intro screen by key
    expect(find.byKey(introScreenKey), findsOneWidget);
    // find first screen text
    expect(find.text('Page 1'), findsOneWidget);
    expect(find.byKey(bottomBarKey), findsOneWidget);
    // find first screen text
    expect(find.text('bottom bar'), findsOneWidget);
  });

  testWidgets(
      'Customized GFIntroScreenBottomNavigationBar can be constructed with properties',
      (tester) async {
    final PageController _pageController = PageController(
      initialPage: 0,
    );
    final int initialPage = _pageController.initialPage;

    final GFIntroScreen introScreen = GFIntroScreen(
      key: introScreenKey,
      pageController: _pageController,
      currentIndex: initialPage,
      pageCount: slide.length,
      slides: slide.map((data) => StateMarker(child: data)).toList(),
      showIntroScreenBottomNavigationBar: true,
      introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
        key: bottomBarKey,
        pageController: _pageController,
        currentIndex: initialPage,
        pageCount: 4,
        navigationBarHeight: 60,
        navigationBarWidth: 400,
        navigationBarMargin: const EdgeInsets.all(6),
        navigationBarPadding: const EdgeInsets.all(5),
        navigationBarShape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.teal, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        navigationBarColor: Colors.amber,
        showDivider: true,
        dividerHeight: 2,
        dividerThickness: 4,
        dividerColor: Colors.black,
        dotHeight: 10,
        dotWidth: 16,
        dotShape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(5)),
        inactiveColor: Colors.black12,
        activeColor: Colors.black87,
        dotMargin: const EdgeInsets.symmetric(horizontal: 6),
      ),
    );

    final TestApp app = TestApp(introScreen);
    await tester.pumpWidget(app);

    // find intro screen by key
    expect(find.byKey(bottomBarKey), findsOneWidget);
    expect(app.introScreen.pageController, _pageController);
    expect(app.introScreen.currentIndex, initialPage);
    expect(app.introScreen.pageCount, 4);
  });

  testWidgets('Customized GFIntroScreen can be constructed with properties',
      (tester) async {
    final GFIntroScreen introScreen = GFIntroScreen(
      key: introScreenKey,
      pageController: _pageController,
      currentIndex: initialPage,
      pageCount: slideList.length,
      slides: slideList,
      height: 500,
      width: 300,
      color: Colors.blueGrey,
      borderRadius: BorderRadius.circular(4),
      border: Border.all(color: Colors.blueGrey.shade700, width: 3),
    );

    final TestApp app = TestApp(introScreen);
    await tester.pumpWidget(app);

    // find introScreen by key
    expect(find.byKey(introScreenKey), findsOneWidget);
    // find first screen text
    expect(find.text('Page 1'), findsOneWidget);

    expect(app.introScreen.pageCount, 4);
    expect(app.introScreen.currentIndex, initialPage);
    expect(app.introScreen.height, 500);
    expect(app.introScreen.width, 300);
    expect(app.introScreen.color, Colors.blueGrey);
    expect(app.introScreen.borderRadius, BorderRadius.circular(4));
    expect(app.introScreen.border,
        Border.all(color: Colors.blueGrey.shade700, width: 3));
    expect(app.introScreen.showIntroScreenBottomNavigationBar, isFalse);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.introScreen);

  final GFIntroScreen introScreen;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: widget.introScreen,
        ),
      );
}
