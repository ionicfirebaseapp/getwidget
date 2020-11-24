import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/cupertino.dart';

void main() {
  final GFBottomSheetController _controller = GFBottomSheetController();
  const contentbody = Text('GetWidget');
  const header = Text('Header');
  const footer = Text('Footer');
  const minheight = 100.0;
  const maxheight = 400.0;
  const elevation = 0.0;
  const headerHeight = 50.0;
  const footerHeight = 50.0;
  const animationduration = 1300;
  const enableexpandablecontent = true;

  testWidgets('GF Bottomsheet can be created.', (tester) async {
    final GFBottomSheet bottomsheet = GFBottomSheet(
      controller: _controller,
      contentBody: contentbody,
      stickyHeaderHeight: headerHeight,
      stickyHeader: header,
      minContentHeight: minheight,
      maxContentHeight: maxheight,
    );

    final TestApp app = TestApp(bottomsheet);

    await tester.pumpWidget(app);
    expect(app.bottomsheet.contentBody, contentbody);
    expect(app.bottomsheet.stickyHeaderHeight, headerHeight);
    expect(app.bottomsheet.stickyHeader, header);
    expect(app.bottomsheet.minContentHeight, minheight);
    expect(app.bottomsheet.maxContentHeight, maxheight);
  });

  testWidgets('GF Bottomsheet with header & footer.', (tester) async {
    final GFBottomSheet bottomsheet = GFBottomSheet(
      controller: _controller,
      contentBody: contentbody,
      stickyHeaderHeight: headerHeight,
      stickyHeader: header,
      elevation: elevation,
      stickyFooterHeight: footerHeight,
      stickyFooter: footer,
      minContentHeight: minheight,
      maxContentHeight: maxheight,
    );

    final TestApp app = TestApp(bottomsheet);

    await tester.pumpWidget(app);
    expect(app.bottomsheet.contentBody, contentbody);
    expect(app.bottomsheet.stickyHeaderHeight, headerHeight);
    expect(app.bottomsheet.stickyHeader, header);
    expect(app.bottomsheet.elevation, elevation);
    expect(app.bottomsheet.stickyFooterHeight, footerHeight);
    expect(app.bottomsheet.stickyFooter, footer);
    expect(app.bottomsheet.minContentHeight, minheight);
    expect(app.bottomsheet.maxContentHeight, maxheight);
  });

  testWidgets('GF Bottomsheet with expandable content property.',
      (tester) async {
    final GFBottomSheet bottomsheet = GFBottomSheet(
      controller: _controller,
      contentBody: contentbody,
      stickyHeaderHeight: headerHeight,
      stickyHeader: header,
      elevation: elevation,
      minContentHeight: minheight,
      maxContentHeight: maxheight,
      enableExpandableContent: enableexpandablecontent,
    );

    final TestApp app = TestApp(bottomsheet);

    await tester.pumpWidget(app);
    expect(app.bottomsheet.contentBody, contentbody);
    expect(app.bottomsheet.stickyHeaderHeight, headerHeight);
    expect(app.bottomsheet.stickyHeader, header);
    expect(app.bottomsheet.elevation, elevation);
    expect(app.bottomsheet.minContentHeight, minheight);
    expect(app.bottomsheet.maxContentHeight, maxheight);
    expect(app.bottomsheet.enableExpandableContent, enableexpandablecontent);
  });

  testWidgets('GF Bottomsheet with animation duration.', (tester) async {
    final GFBottomSheet bottomsheet = GFBottomSheet(
      controller: _controller,
      contentBody: contentbody,
      stickyHeaderHeight: headerHeight,
      stickyHeader: header,
      elevation: elevation,
      minContentHeight: minheight,
      maxContentHeight: maxheight,
      animationDuration: animationduration,
    );

    final TestApp app = TestApp(bottomsheet);

    await tester.pumpWidget(app);
    expect(app.bottomsheet.contentBody, contentbody);
    expect(app.bottomsheet.stickyHeaderHeight, headerHeight);
    expect(app.bottomsheet.stickyHeader, header);
    expect(app.bottomsheet.elevation, elevation);
    expect(app.bottomsheet.minContentHeight, minheight);
    expect(app.bottomsheet.maxContentHeight, maxheight);
    expect(app.bottomsheet.animationDuration, animationduration);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.bottomsheet);
  final GFBottomSheet bottomsheet;
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          bottomSheet: widget.bottomsheet,
        ),
      );
}
