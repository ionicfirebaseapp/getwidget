import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/cupertino.dart';

void main() {
  final GFBottomSheetController _controller = GFBottomSheetController();
  const contentBody = Text('GetWidget');
  const header = Text('Header');
  const footer = Text('Footer');
  const minHeight = 100.0;
  const maxHeight = 400.0;
  const elevation = 0.0;
  const headerHeight = 50.0;
  const footerHeight = 50.0;
  const animationDuration = 1300;
  const enableExpandableContent = true;

  testWidgets('GFBottomSheet can be created.', (tester) async {
    final GFBottomSheet bottomSheet = GFBottomSheet(
      controller: _controller,
      contentBody: contentBody,
      stickyHeaderHeight: headerHeight,
      stickyHeader: header,
      minContentHeight: minHeight,
      maxContentHeight: maxHeight,
    );

    final TestApp app = TestApp(bottomSheet);

    await tester.pumpWidget(app);
    expect(app.bottomSheet.contentBody, contentBody);
    expect(app.bottomSheet.stickyHeaderHeight, headerHeight);
    expect(app.bottomSheet.stickyHeader, header);
    expect(app.bottomSheet.minContentHeight, minHeight);
    expect(app.bottomSheet.maxContentHeight, maxHeight);
  });

  testWidgets('GFBottomSheet with header & footer.', (tester) async {
    final GFBottomSheet bottomSheet = GFBottomSheet(
      controller: _controller,
      contentBody: contentBody,
      stickyHeaderHeight: headerHeight,
      stickyHeader: header,
      elevation: elevation,
      stickyFooterHeight: footerHeight,
      stickyFooter: footer,
      minContentHeight: minHeight,
      maxContentHeight: maxHeight,
    );

    final TestApp app = TestApp(bottomSheet);

    await tester.pumpWidget(app);
    expect(app.bottomSheet.contentBody, contentBody);
    expect(app.bottomSheet.stickyHeaderHeight, headerHeight);
    expect(app.bottomSheet.stickyHeader, header);
    expect(app.bottomSheet.elevation, elevation);
    expect(app.bottomSheet.stickyFooterHeight, footerHeight);
    expect(app.bottomSheet.stickyFooter, footer);
    expect(app.bottomSheet.minContentHeight, minHeight);
    expect(app.bottomSheet.maxContentHeight, maxHeight);
  });

  testWidgets('GFBottomSheet with expandable content property.',
      (tester) async {
    final GFBottomSheet bottomSheet = GFBottomSheet(
      controller: _controller,
      contentBody: contentBody,
      stickyHeaderHeight: headerHeight,
      stickyHeader: header,
      elevation: elevation,
      minContentHeight: minHeight,
      maxContentHeight: maxHeight,
      enableExpandableContent: enableExpandableContent,
    );

    final TestApp app = TestApp(bottomSheet);

    await tester.pumpWidget(app);
    expect(app.bottomSheet.contentBody, contentBody);
    expect(app.bottomSheet.stickyHeaderHeight, headerHeight);
    expect(app.bottomSheet.stickyHeader, header);
    expect(app.bottomSheet.elevation, elevation);
    expect(app.bottomSheet.minContentHeight, minHeight);
    expect(app.bottomSheet.maxContentHeight, maxHeight);
    expect(app.bottomSheet.enableExpandableContent, enableExpandableContent);
  });

  testWidgets('GFBottomSheet with animation duration.', (tester) async {
    final GFBottomSheet bottomSheet = GFBottomSheet(
      controller: _controller,
      contentBody: contentBody,
      stickyHeaderHeight: headerHeight,
      stickyHeader: header,
      elevation: elevation,
      minContentHeight: minHeight,
      maxContentHeight: maxHeight,
      animationDuration: animationDuration,
    );

    final TestApp app = TestApp(bottomSheet);

    await tester.pumpWidget(app);
    expect(app.bottomSheet.contentBody, contentBody);
    expect(app.bottomSheet.stickyHeaderHeight, headerHeight);
    expect(app.bottomSheet.stickyHeader, header);
    expect(app.bottomSheet.elevation, elevation);
    expect(app.bottomSheet.minContentHeight, minHeight);
    expect(app.bottomSheet.maxContentHeight, maxHeight);
    expect(app.bottomSheet.animationDuration, animationDuration);
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
