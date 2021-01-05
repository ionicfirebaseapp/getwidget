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
  final Key carouselKey = UniqueKey();
  final List<String> textList = <String>[
    'AAAAAA',
    'BBBBBB',
    'CCCCCC',
    'DDDDDD',
    'EEEEEE'
  ];
  final List<Widget> itemList = [
    Text(textList[0]),
    Text(textList[1]),
    Text(textList[2]),
    Text(textList[3]),
    Text(textList[4])
  ];

  testWidgets('GFCarousel without items list', (tester) async {
    // `GFCarousel.items` null
    expect(
      () => GFCarousel(
        items: null,
      ),
      throwsAssertionError,
    );
  });

  testWidgets('GFCarousel can be constructed', (tester) async {
    String value = textList[0];
    int changedIndex;

    final GFCarousel carousel = GFCarousel(
      key: carouselKey,
      items: itemList.map((text) => StateMarker(child: text)).toList(),
      onPageChanged: (index) {
        changedIndex = index;
        print('inr $index $changedIndex');
      },
    );

    StateMarkerState findStateMarkerState(String name) =>
        tester.state(find.widgetWithText(StateMarker, name));

    final TestApp app = TestApp(carousel);
    await tester.pumpWidget(app);

    // find carousel by key
    expect(find.byKey(carouselKey), findsOneWidget);
    // find the 'AAAAAA' text in carousel
    expect(find.text('AAAAAA'), findsOneWidget);

    TestGesture gesture =
        await tester.startGesture(tester.getCenter(find.text('AAAAAA')));
    await gesture.moveBy(const Offset(-600, 0));
    await tester.pump();
    expect(value, equals(textList[0]));
    findStateMarkerState(textList[1]).marker = 'marked';
    await gesture.up();
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    value = textList[changedIndex];
    expect(value, equals(textList[1]));
    await tester.pumpWidget(app);
    expect(findStateMarkerState(textList[1]).marker, equals('marked'));

    // slide on to the third slide.
    gesture =
        await tester.startGesture(tester.getCenter(find.text(textList[1])));
    await gesture.moveBy(const Offset(-600, 0));
    await gesture.up();
    await tester.pump();
    expect(findStateMarkerState(textList[1]).marker, equals('marked'));
    await tester.pump(const Duration(seconds: 1));
    value = textList[changedIndex];
    expect(value, equals(textList[2]));
    await tester.pumpWidget(app);
    expect(find.text(textList[2]), findsOneWidget);
    // slide back to the second slide.
    gesture =
        await tester.startGesture(tester.getCenter(find.text(textList[2])));
    await gesture.moveBy(const Offset(600, 0));
    await tester.pump();
    final StateMarkerState markerState = findStateMarkerState(textList[1]);
    markerState.marker = 'marked';
    await gesture.up();
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    value = textList[changedIndex];
    expect(value, equals(textList[1]));
    await tester.pumpWidget(app);
    expect(findStateMarkerState(textList[1]).marker, equals('marked'));
  });

  testWidgets('GFCarousel can be constructed with properties', (tester) async {
    final GFCarousel carousel = GFCarousel(
      key: carouselKey,
      initialPage: 1,
      items: itemList.map((text) => text).toList(),
      height: 333,
      autoPlay: true,
      enlargeMainPage: true,
      pagination: true,
      pagerSize: 16,
      activeIndicator: Colors.tealAccent,
      passiveIndicator: Colors.teal,
      viewportFraction: 1.0,
      aspectRatio: 2,
      autoPlayInterval: const Duration(seconds: 6),
      autoPlayAnimationDuration: const Duration(milliseconds: 1600),
      autoPlayCurve: Curves.fastLinearToSlowEaseIn,
    );

    final TestApp app = TestApp(carousel);
    await tester.pumpWidget(app);

    expect(app.carousel.items, itemList);
    expect(app.carousel.initialPage, 1);
    expect(app.carousel.height, 333);
    expect(app.carousel.autoPlay, isTrue);
    expect(app.carousel.enlargeMainPage, isTrue);
    expect(app.carousel.reverse, isFalse);
    expect(app.carousel.enableInfiniteScroll, isTrue);
    expect(app.carousel.pagination, isTrue);
    expect(app.carousel.pagerSize, 16);
    expect(app.carousel.activeIndicator, Colors.tealAccent);
    expect(app.carousel.passiveIndicator, Colors.teal);
    expect(app.carousel.viewportFraction, 1);
    expect(app.carousel.aspectRatio, 2);
    expect(app.carousel.autoPlayInterval, const Duration(seconds: 6));
    expect(app.carousel.autoPlayAnimationDuration,
        const Duration(milliseconds: 1600));
    expect(app.carousel.autoPlayCurve, Curves.fastLinearToSlowEaseIn);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.carousel);

  final GFCarousel carousel;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.carousel,
            ],
          ),
        ),
      );
}
