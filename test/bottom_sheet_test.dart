import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/cupertino.dart';

void main() {
  final Key bottomSheetKey = UniqueKey();
  final Key contentKey = UniqueKey();
  final GFBottomSheetController _controller = GFBottomSheetController();

  testWidgets('GFBottomSheet can be constructed', (tester) async {
    final GFBottomSheet bottomSheet = GFBottomSheet(
      key: bottomSheetKey,
      controller: _controller,
      stickyHeaderHeight: 70,
      stickyHeader: const GFListTile(
        avatar: GFAvatar(
          backgroundColor: Colors.amber,
        ),
        titleText: 'Header Title',
        subTitleText: '11 minutes ago',
      ),
      contentBody: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) => GFListTile(
              color: Colors.black12,
              avatar: const GFAvatar(
                backgroundColor: Colors.tealAccent,
                size: 20,
              ),
              subTitleText: 'Content Title',
              icon: GFButton(
                onPressed: () {},
                color: Colors.teal,
                child: const Text(
                  'Send',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const Text('Content'),
        ],
      ),
    );

    final TestApp app = TestApp(bottomSheet);
    await tester.pumpWidget(app);

    // find bottom sheet by key
    expect(find.byKey(bottomSheetKey), findsOneWidget);
    // find header tile text
    expect(find.text('Header Title'), findsOneWidget);
    // tap on header tile to open bottomSheet
    await tester.tap(find.text('Header Title'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 2));
    // find the content tile
    expect(find.text('Content Title'), findsNWidgets(3));
    // tap on header tile to close bottomSheet
    await tester.tap(find.text('Header Title'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 2));
    // try to find content finds nothing
    expect(find.text('Content Title'), findsNothing);
    // Swipe the header tile to open bottomSheet
    await tester.drag(find.text('Header Title'), const Offset(0, -4.6));
    await tester.pumpAndSettle();
    // find the content tile
    expect(find.text('Content Title'), findsNWidgets(3));
    // Swipe the header tile to close bottomSheet
    await tester.drag(find.text('Header Title'), const Offset(0, 6.5));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));
    // try to find content finds nothing
    expect(find.text('Content Title'), findsNothing);

    // Swipe the header tile to open bottomSheet
    await tester.drag(find.text('Header Title'), const Offset(0, -4.6));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));
    // find the content tile
    expect(find.text('Content Title'), findsNWidgets(3));
    // Swipe the content tile to close bottomSheet
    await tester.drag(find.text('Content'), const Offset(0, 6.5));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));
    // try to find content finds nothing
    expect(find.text('Content Title'), findsNothing);
  });

  testWidgets('GFBottomSheet can be constructed with footer', (tester) async {
    final GFBottomSheet bottomSheet = GFBottomSheet(
      key: bottomSheetKey,
      controller: _controller,
      stickyHeaderHeight: 70,
      stickyHeader: const GFListTile(
        avatar: GFAvatar(
          backgroundColor: Colors.amber,
        ),
        titleText: 'Header Title',
        subTitleText: '11 minutes ago',
      ),
      contentBody: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          const Text('Content GetWidget'),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
                'Get Widget is one of the largest Flutter open-source '
                'UI library for mobile or web apps. It has more than 1000+ pre-built reusable widgets.'),
          ),
        ],
      ),
      stickyFooterHeight: 60,
      stickyFooter: Container(
        alignment: AlignmentDirectional.center,
        width: 444,
        color: Colors.amber,
        child: const Text('Footer Title'),
      ),
    );

    final TestApp app = TestApp(bottomSheet);
    await tester.pumpWidget(app);

    // find bottom sheet by key
    expect(find.byKey(bottomSheetKey), findsOneWidget);
    // find header tile text
    expect(find.text('Header Title'), findsOneWidget);

    // Swipe the header tile to open bottomSheet
    await tester.drag(find.text('Header Title'), const Offset(0, -4.6));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));
    // find the content tile
    expect(find.text('Content GetWidget'), findsOneWidget);
    // find the footer title
    expect(find.text('Footer Title'), findsOneWidget);
    // Swipe the content tile to close bottomSheet
    await tester.drag(find.text('Footer Title'), const Offset(0, 5.3));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));
    // try to find content finds nothing
    expect(find.text('Content GetWidget'), findsNothing);
  });

  testWidgets('GFBottomSheet can be constructed with expandable content',
      (tester) async {
    final GFBottomSheet bottomSheet = GFBottomSheet(
      key: bottomSheetKey,
      controller: _controller,
      enableExpandableContent: true,
      stickyHeaderHeight: 70,
      stickyHeader: const GFListTile(
        avatar: GFAvatar(
          backgroundColor: Colors.amber,
        ),
        titleText: 'Header Title',
        subTitleText: '11 minutes ago',
      ),
      contentBody: ListView(
        key: contentKey,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          const Text('Content GetWidget'),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
                'Get Widget is one of the largest Flutter open-source '
                'UI library for mobile or web apps. It has more than 1000+ pre-built reusable widgets.'),
          ),
        ],
      ),
      stickyFooterHeight: 60,
      stickyFooter: Container(
        alignment: AlignmentDirectional.center,
        width: 444,
        color: Colors.amber,
        child: const Text('Footer Title'),
      ),
    );

    final TestApp app = TestApp(bottomSheet);
    await tester.pumpWidget(app);

    // find bottom sheet by key
    expect(find.byKey(bottomSheetKey), findsOneWidget);
    // find header tile text
    expect(find.text('Header Title'), findsOneWidget);
    // set enableExpandableContent = true
    expect(bottomSheet.enableExpandableContent, isTrue);
    // Swipe the header tile to open bottomSheet
    await tester.drag(find.text('Header Title'), const Offset(0, -4.6));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));
    // find the content tile
    expect(find.text('Content GetWidget'), findsOneWidget);
    // find the footer title
    expect(find.text('Footer Title'), findsOneWidget);
    // Swipe the content tile to close bottomSheet
    await tester.drag(find.text('Content GetWidget'), const Offset(0, 6.5));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));
    // try to find content finds nothing
    expect(find.text('Content GetWidget'), findsNothing);

    // Swipe the header tile to open bottomSheet
    await tester.drag(find.text('Header Title'), const Offset(0, -4.6));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));
    // find the content tile
    expect(find.text('Content GetWidget'), findsOneWidget);
    // find the footer title
    expect(find.text('Footer Title'), findsOneWidget);
    // drag up content body to expand
    await tester.drag(find.byKey(contentKey), const Offset(0, -22.9));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 5));
    // find content body
    expect(find.text('Content GetWidget'), findsOneWidget);

    // drag down content body to close the bottom sheet
    await tester.drag(find.byKey(contentKey), const Offset(0, 5.6));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 5));
    // try to find content body, finds nothing
    expect(find.text('Content GetWidget'), findsNothing);
  });

  testWidgets('GFBottomSheet with properties', (tester) async {
    final GFBottomSheet bottomSheet = GFBottomSheet(
      controller: _controller,
      enableExpandableContent: true,
      stickyHeaderHeight: 70,
      stickyHeader: const GFListTile(
        avatar: GFAvatar(
          backgroundColor: Colors.amber,
        ),
        titleText: 'Header Title',
        subTitleText: '11 minutes ago',
      ),
      contentBody: ListView(
        key: contentKey,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          const Text('Content GetWidget'),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
                'Get Widget is one of the largest Flutter open-source '
                'UI library for mobile or web apps. It has more than 1000+ pre-built reusable widgets.'),
          ),
        ],
      ),
      stickyFooterHeight: 60,
      stickyFooter: Container(
        alignment: AlignmentDirectional.center,
        width: 444,
        color: Colors.amber,
        child: const Text('Footer Title'),
      ),
      elevation: 5,
      minContentHeight: 150,
      maxContentHeight: 450,
      animationDuration: 1500,
    );

    final TestApp app = TestApp(bottomSheet);

    await tester.pumpWidget(app);
    expect(app.bottomSheet.controller, _controller);
    expect(app.bottomSheet.stickyHeaderHeight, 70);
    expect(app.bottomSheet.stickyFooterHeight, 60);
    expect(app.bottomSheet.enableExpandableContent, isTrue);
    expect(app.bottomSheet.elevation, 5);
    expect(app.bottomSheet.minContentHeight, 150);
    expect(app.bottomSheet.maxContentHeight, 450);
    expect(app.bottomSheet.animationDuration, 1500);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.bottomSheet);
  final GFBottomSheet bottomSheet;
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          bottomSheet: widget.bottomSheet,
        ),
      );
}
