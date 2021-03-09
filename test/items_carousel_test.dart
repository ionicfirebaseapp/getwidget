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
//   final Key carouselKey = UniqueKey();
//   final List<String> textList = <String>[
//     'AAAAAA',
//     'BBBBBB',
//     'CCCCCC',
//     'DDDDDD',
//     'EEEEEE'
//   ];
//   final List<Widget> itemList = [
//     Text(textList[0]),
//     Text(textList[1]),
//     Text(textList[2]),
//     Text(textList[3]),
//     Text(textList[4])
//   ];

//   testWidgets('GFItemsCarousel without items list', (tester) async {
//     // `GFItemsCarousel.children` null, `GFItemsCarousel.rowCount` null
//     expect(
//       () => GFItemsCarousel(
//         rowCount: null,
//         children: null,
//       ),
//       throwsAssertionError,
//     );
//   });

//   testWidgets('GFItemsCarousel can be constructed', (tester) async {
//     final GFItemsCarousel carousel = GFItemsCarousel(
//       key: carouselKey,
//       rowCount: 3,
//       children: itemList.map((text) => StateMarker(child: text)).toList(),
//     );

//     StateMarkerState findStateMarkerState(String name) =>
//         tester.state(find.widgetWithText(StateMarker, name));

//     final TestApp app = TestApp(carousel);
//     await tester.pumpWidget(app);

//     // find carousel by key
//     expect(find.byKey(carouselKey), findsOneWidget);
//     // find the 'AAAAAA', 'BBBBBB' and 'CCCCCC' text in carousel
//     expect(find.text('AAAAAA'), findsOneWidget);
//     expect(find.text('BBBBBB'), findsOneWidget);
//     expect(find.text('CCCCCC'), findsOneWidget);

//     // slide to the second slide.

//     TestGesture gesture =
//         await tester.startGesture(tester.getCenter(find.text('AAAAAA')));
//     await gesture.moveBy(const Offset(-600, 0));
//     await tester.pump();
//     findStateMarkerState(textList[1]).marker = 'marked';
//     await gesture.up();
//     await tester.pump();
//     await tester.pump(const Duration(seconds: 1));
//     // find the 'CCCCCC', 'DDDDDD' and 'EEEEEE'  text in carousel
//     expect(find.text('DDDDDD'), findsOneWidget);
//     expect(find.text('EEEEEE'), findsOneWidget);
//     expect(find.text('CCCCCC'), findsOneWidget);
//     await tester.pumpWidget(app);
//     expect(findStateMarkerState(textList[1]).marker, equals('marked'));

//     // slide back to the first slide.
//     gesture =
//         await tester.startGesture(tester.getCenter(find.text(textList[2])));
//     await gesture.moveBy(const Offset(600, 0));
//     await tester.pump();
//     final StateMarkerState markerState = findStateMarkerState(textList[1]);
//     markerState.marker = 'marked';
//     await gesture.up();
//     await tester.pump();
//     await tester.pump(const Duration(seconds: 1));
//     // find the 'AAAAAA', 'BBBBBB' and 'CCCCCC' text in carousel
//     expect(find.text('AAAAAA'), findsOneWidget);
//     expect(find.text('BBBBBB'), findsOneWidget);
//     expect(find.text('CCCCCC'), findsOneWidget);
//     await tester.pumpWidget(app);
//     expect(findStateMarkerState(textList[1]).marker, equals('marked'));
//   });
// }

// class TestApp extends StatefulWidget {
//   const TestApp(this.carousel);

//   final GFItemsCarousel carousel;

//   @override
//   _TestAppState createState() => _TestAppState();
// }

// class _TestAppState extends State<TestApp> {
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         home: Scaffold(
//           body: Column(
//             children: [
//               widget.carousel,
//             ],
//           ),
//         ),
//       );
// }
