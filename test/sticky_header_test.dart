import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  // testWidgets('GFStickyHeader can be constructed', (tester) async {
  //   const itemCount = 12;
  //
  //   final stickyHeader = Directionality(
  //     textDirection: TextDirection.ltr,
  //     child: ListView.builder(
  //       itemCount: itemCount,
  //       itemBuilder: (BuildContext context, int index) => GFStickyHeader(
  //           stickyContent: Container(
  //             alignment: AlignmentDirectional.center,
  //             height: 50,
  //             color: Colors.teal.shade200,
  //             child: Text(
  //               'Header tile $index',
  //             ),
  //           ),
  //           content: Container(
  //               color: Colors.blueGrey.shade200,
  //               height: 111,
  //               child: Text('List tile $index'))),
  //     ),
  //   );
  //
  //   final TestApp app = TestApp(stickyHeader);
  //   await tester.pumpWidget(app);
  //
  //   // displays first 3 index
  //
  //   // expect(find.text('Header tile 1'), findsOneWidget);
  //   // expect(find.text('List tile 1'), findsOneWidget);
  //   //
  //   // expect(find.text('Header tile 2'), findsOneWidget);
  //   // expect(find.text('List tile 2'), findsOneWidget);
  //   //
  //   // expect(find.text('Header tile 3'), findsOneWidget);
  //   // expect(find.text('List tile 3'), findsOneWidget);
  //   //
  //   // expect(find.text('Header tile 4'), findsNothing);
  //   // expect(find.text('List tile 4'), findsNothing);
  //
  //   // scroll ups first index and display index 4
  //
  //   TestGesture gesture =
  //       await tester.startGesture(tester.getCenter(find.text('List tile 1')));
  //   await gesture.moveBy(const Offset(600, -330));
  //   await tester.pump();
  //
  //   // expect(find.text('Header tile 1'), findsNothing);
  //   // expect(find.text('List tile 1'), findsNothing);
  //   //
  //   // expect(find.text('Header tile 4'), findsOneWidget);
  //   // expect(find.text('List tile 4'), findsOneWidget);
  //   //
  //   // await gesture.up();
  //   // await tester.pump();
  //   // await tester.pump(const Duration(seconds: 1));
  //   //
  //   // await tester.pumpWidget(app);
  //   //
  //   // expect(find.text('Header tile 5'), findsOneWidget);
  //   // expect(find.text('List tile 5'), findsOneWidget);
  //
  //   // scroll ups third index and display index 6
  //
  //   gesture =
  //       await tester.startGesture(tester.getCenter(find.text('List tile 5')));
  //   await gesture.moveBy(const Offset(600, -330));
  //   await tester.pump();
  //
  //   // expect(find.text('Header tile 3'), findsNothing);
  //   // expect(find.text('List tile 3'), findsNothing);
  //   //
  //   // expect(find.text('Header tile 6'), findsOneWidget);
  //   // expect(find.text('List tile 6'), findsOneWidget);
  //   //
  //   // await gesture.up();
  //   // await tester.pump();
  //   // await tester.pump(const Duration(seconds: 1));
  //   //
  //   // await tester.pumpWidget(app);
  //   //
  //   // expect(find.text('Header tile 7'), findsOneWidget);
  //   // expect(find.text('List tile 7'), findsOneWidget);
  //   //
  //   // expect(find.text('Header tile 8'), findsNothing);
  //   // expect(find.text('List tile 8'), findsNothing);
  // });
  //
  // testWidgets('GFStickyHeader horizontal can be constructed', (tester) async {
  //   const itemCount = 12;
  //
  //   final stickyHeader = Directionality(
  //     textDirection: TextDirection.ltr,
  //     child: ListView.builder(
  //       itemCount: itemCount,
  //       itemBuilder: (BuildContext context, int index) => GFStickyHeader(
  //           enableHeaderOverlap: true,
  //           direction: Axis.horizontal,
  //           // stickyContentPosition: GFPosition.end,
  //           stickyContent: Container(
  //             alignment: AlignmentDirectional.center,
  //             height: 50,
  //             color: Colors.teal.shade200,
  //             child: Text(
  //               'Header tile $index',
  //             ),
  //           ),
  //           content: Container(
  //               alignment: AlignmentDirectional.center,
  //               height: 111,
  //               color: Colors.blueGrey.shade200,
  //               child: Text('List tile $index'))),
  //     ),
  //   );
  //
  //   final TestApp app = TestApp(stickyHeader);
  //   await tester.pumpWidget(app);
  //
  //   // displays first 6 index
  //
  //   // expect(find.text('Header tile 1'), findsOneWidget);
  //   // expect(find.text('List tile 1'), findsOneWidget);
  //   //
  //   // expect(find.text('Header tile 2'), findsOneWidget);
  //   // expect(find.text('List tile 2'), findsOneWidget);
  //   //
  //   // expect(find.text('Header tile 3'), findsOneWidget);
  //   // expect(find.text('List tile 3'), findsOneWidget);
  //   //
  //   // expect(find.text('Header tile 6'), findsNothing);
  //   // expect(find.text('List tile 6'), findsNothing);
  //
  //   // scroll ups first index and display index 4
  //
  //   TestGesture gesture =
  //       await tester.startGesture(tester.getCenter(find.text('List tile 3')));
  //   await gesture.moveBy(const Offset(600, -330));
  //   await tester.pump();
  //
  //   // expect(find.text('Header tile 1'), findsNothing);
  //   // expect(find.text('List tile 1'), findsNothing);
  //   //
  //   // expect(find.text('Header tile 6'), findsOneWidget);
  //   // expect(find.text('List tile 6'), findsOneWidget);
  //
  //   await gesture.up();
  //   await tester.pump();
  //   await tester.pump(const Duration(seconds: 1));
  //
  //   await tester.pumpWidget(app);
  //
  //   // scroll ups seventh index and display index 11
  //
  //   gesture =
  //       await tester.startGesture(tester.getCenter(find.text('List tile 7')));
  //   await gesture.moveBy(const Offset(600, -330));
  //   await tester.pump();
  //
  //   // expect(find.text('Header tile 3'), findsNothing);
  //   // expect(find.text('List tile 3'), findsNothing);
  //   //
  //   // expect(find.text('Header tile 10'), findsOneWidget);
  //   // expect(find.text('List tile 10'), findsOneWidget);
  //   //
  //   // await gesture.up();
  //   // await tester.pump();
  //   // await tester.pump(const Duration(seconds: 1));
  //   //
  //   // await tester.pumpWidget(app);
  //   //
  //   // expect(find.text('Header tile 11'), findsOneWidget);
  //   // expect(find.text('List tile 11'), findsOneWidget);
  // });

  // testWidgets('GFStickyHeader can be constructed with properties',
  //     (tester) async {
  //   final GFStickyHeader stickyHeader = GFStickyHeader(
  //       enableHeaderOverlap: true,
  //       direction: Axis.horizontal,
  //       stickyContentPosition: GFPosition.end,
  //       stickyContent: Container(
  //         alignment: AlignmentDirectional.center,
  //         height: 50,
  //         color: Colors.teal.shade200,
  //         child: const Text(
  //           'Header tile',
  //         ),
  //       ),
  //       content: Container(
  //           alignment: AlignmentDirectional.center,
  //           height: 111,
  //           color: Colors.blueGrey.shade200,
  //           child: const Text('List tile')));
  //
  //   final Tester app = Tester(stickyHeader);
  //   await tester.pumpWidget(app);
  //
  //   expect(find.text('Header tile'), findsOneWidget);
  //   expect(find.text('List tile'), findsOneWidget);
  //
  //   expect(stickyHeader.enableHeaderOverlap, isTrue);
  //   expect(stickyHeader.direction, Axis.horizontal);
  //   expect(stickyHeader.stickyContentPosition, GFPosition.end);
  // });

  testWidgets('GFStickyHeaderBuilder can be constructed with properties',
      (tester) async {
    final stickyHeader = Directionality(
      textDirection: TextDirection.ltr,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: 12,
        itemBuilder: (context, index) => GFStickyHeaderBuilder(
          // direction: Axis.horizontal,
          // enableHeaderOverlap: true,
          // stickyContentPosition: GFPosition.end,
          stickyContentBuilder: (BuildContext context, double stuckValue) {
            stuckValue = 1.0 - stuckValue.clamp(0.0, 1.0);
            return Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.5,
              color: Color.lerp(Colors.teal[100], Colors.teal[600], stuckValue),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Image #$index',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Offstage(
                    offstage: stuckValue <= 0.0,
                    child: Opacity(
                      opacity: stuckValue,
                      child: IconButton(
                        icon: const Icon(Icons.image, color: Colors.white),
                        // ignore: deprecated_member_use
                        onPressed: () => ScaffoldMessenger.of(context)
                            .showSnackBar(
                                SnackBar(content: Text('Favorite #$index'))),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          content: Container(
            height: 200,
            width: MediaQuery.of(context).size.width * 0.5,
            color: Colors.teal,
            child: const Text('Content tile'),
          ),
        ),
      ),
    );

    final TestApp app = TestApp(stickyHeader);
    await tester.pumpWidget(app);
  });
}

class Tester extends StatefulWidget {
  const Tester(this.stickyHeader);

  final Widget stickyHeader;

  @override
  _TesterState createState() => _TesterState();
}

class _TesterState extends State<Tester> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(body: SingleChildScrollView(child: widget.stickyHeader)),
      );
}

class TestApp extends StatefulWidget {
  const TestApp(this.stickyHeader);

  final Widget stickyHeader;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(body: widget.stickyHeader),
      );
}
