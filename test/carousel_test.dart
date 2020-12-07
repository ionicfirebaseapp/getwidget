import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_test_utils/image_test_utils.dart';

void main() {
  final Widget childWidget = Container(
    width: 11,
    height: 22,
  );
  const duration = Duration(milliseconds: 1000);

  const List<String> imageList = [
    'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg',
    'https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg',
    'https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg',
    'https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg',
    'https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg'
  ];

  testWidgets('GF Carousel basic', (tester) async {
    const GFCarousel carousel = GFCarousel(
      autoPlayInterval: duration,
    );
    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    await tester.pump(duration);
  });

  // testWidgets('GFCarousel Test', (tester) async {
  //   await provideMockedNetworkImages(() async {
  //     await tester.pumpWidget(
  //       MaterialApp(
  //         home: Material(
  //           child: GFItemsCarousel(
  //             rowCount: 3,
  //             children: imageList.map(
  //               (url) {
  //                 return Container(
  //                   // margin: EdgeInsets.all(5.0),
  //                   child: ClipRRect(
  //                     // borderRadius: BorderRadius.all(Radius.circular(5.0)),
  //                     child: Image.network(url),
  //                   ),
  //                 );
  //               },
  //             ).toList(),
  //           ),
  //         ),
  //       ),
  //     );
  //     // debugDefaultTargetPlatformOverride = null;
  //   });
  // });

  testWidgets('GF Carousel image test', (WidgetTester tester) async {
    await provideMockedNetworkImages(() async {
      /// Now we can pump NetworkImages without crashing our tests. Yay!
      await tester.pumpWidget(
        MaterialApp(
          home: Image.network(
              'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg'),
        ),
      );

      /// No crashes.
    });
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
              Expanded(
                child: widget.carousel,
              )
            ],
          ),
        ),
      );
}
