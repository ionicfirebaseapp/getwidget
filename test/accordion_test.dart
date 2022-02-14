import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  testWidgets('GFAccordion can be created.', (tester) async {
    const GFAccordion accordion = GFAccordion(
      title: 'title bar',
      content: 'content body',
    );

    const TestApp app = TestApp(accordion);
    await tester.pumpWidget(app);

    expect(find.text('title bar'), findsOneWidget);
    expect(find.text('content body'), findsNothing);
    await tester.tap(find.text('title bar'));
    await tester.pump();
    expect(find.text('title bar'), findsOneWidget);
    expect(find.text('content body'), findsOneWidget);
  });

  testWidgets('GFAccordion can be constructed with child.', (tester) async {
    const GFAccordion accordion = GFAccordion(
      titleChild: Text('title bar'),
      contentChild: Text('content body'),
    );

    const TestApp app = TestApp(accordion);
    await tester.pumpWidget(app);

    expect(find.text('title bar'), findsOneWidget);
    expect(find.text('content body'), findsNothing);
    await tester.tap(find.text('title bar'));
    await tester.pump();
    expect(find.text('title bar'), findsOneWidget);
    expect(find.text('content body'), findsOneWidget);
  });

  testWidgets(
      'GFAccordion can be constructed with expanded and collapsed icons',
      (tester) async {
    const GFAccordion accordion = GFAccordion(
      titleChild: Text('title bar'),
      contentChild: Text('content body'),
      collapsedIcon: Icon(Icons.add),
      expandedIcon: Icon(Icons.remove),
    );

    const TestApp app = TestApp(accordion);
    await tester.pumpWidget(app);

    expect(find.text('title bar'), findsOneWidget);
    expect(find.text('content body'), findsNothing);
    expect(find.byIcon(Icons.add), findsOneWidget);
    await tester.tap(find.text('title bar'));
    await tester.pump();
    expect(find.text('title bar'), findsOneWidget);
    expect(find.text('content body'), findsOneWidget);
    expect(find.byIcon(Icons.remove), findsOneWidget);
  });

  testWidgets('GFAccordion can be constructed with show accordion',
      (tester) async {
    const GFAccordion accordion = GFAccordion(
      titleChild: Text('title bar'),
      contentChild: Text('content body'),
      showAccordion: true,
    );

    const TestApp app = TestApp(accordion);
    await tester.pumpWidget(app);

    expect(find.text('title bar'), findsOneWidget);
    expect(find.text('content body'), findsOneWidget);
  });

  testWidgets(
      'GFAccordion can be constructed with show button on toggle collapsed',
      (tester) async {
    bool showButton = false;

    final accordion = MaterialApp(
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => Material(
            child: GFAccordion(
              titleChild: Row(
                children: [
                  const Text('title bar'),
                  showButton
                      ? const GFButton(
                          onPressed: null,
                          text: 'Select one',
                        )
                      : Container(),
                ],
              ),
              contentChild: const Text('content body'),
              onToggleCollapsed: (value) {
                print('collapsed $value');
                setState(() {
                  showButton = value;
                });
              },
            ),
          ),
        ),
      ),
    );

    await tester.pumpWidget(accordion);

    expect(find.text('title bar'), findsOneWidget);
    expect(find.text('content body'), findsNothing);
    expect(find.text('Select one'), findsNothing);
    await tester.tap(find.text('title bar'));
    await tester.pump();
    expect(find.text('title bar'), findsOneWidget);
    expect(find.text('content body'), findsOneWidget);
    expect(find.text('Select one'), findsOneWidget);
  });

  testWidgets('GFAccordion can be constructed with show accordion',
      (tester) async {
    const GFAccordion accordion = GFAccordion(
      titleChild: Text('title bar'),
      contentChild: Text('content body'),
      showAccordion: true,
    );

    const TestApp app = TestApp(accordion);
    await tester.pumpWidget(app);

    expect(find.text('title bar'), findsOneWidget);
    expect(find.text('content body'), findsOneWidget);
  });

  testWidgets('GFAccordion with all properties.', (WidgetTester tester) async {
    final GFAccordion accordion = GFAccordion(
      title: 'title',
      content: 'content',
      titleChild: const Text('title bar'),
      contentChild: const Text('content body'),
      textStyle: const TextStyle(color: Colors.deepOrange, fontSize: 16),
      collapsedIcon: const Icon(Icons.ac_unit),
      expandedIcon: const Icon(Icons.baby_changing_station),
      collapsedTitleBackgroundColor: Colors.amber,
      expandedTitleBackgroundColor: Colors.greenAccent,
      contentBackgroundColor: Colors.tealAccent,
      titlePadding: const EdgeInsets.all(13),
      contentPadding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(5),
      titleBorder: Border.all(color: Colors.blueAccent, width: 1),
      contentBorder: Border.all(color: Colors.deepPurpleAccent, width: 1),
      titleBorderRadius: const BorderRadius.all(Radius.circular(2)),
      contentBorderRadius: const BorderRadius.all(Radius.circular(6)),
      showAccordion: true,
      onToggleCollapsed: (value) {
        print('collapsed $value');
      },
    );

    final TestApp app = TestApp(accordion);
    await tester.pumpWidget(app);

    expect(app.accordion.title, 'title');
    expect(app.accordion.content, 'content');
    expect(app.accordion.textStyle,
        const TextStyle(color: Colors.deepOrange, fontSize: 16));
    expect(app.accordion.collapsedTitleBackgroundColor, Colors.amber);
    expect(app.accordion.expandedTitleBackgroundColor, Colors.greenAccent);
    expect(app.accordion.contentBackgroundColor, Colors.tealAccent);
    expect(app.accordion.titlePadding, const EdgeInsets.all(13));
    expect(app.accordion.contentPadding, const EdgeInsets.all(16));
    expect(app.accordion.margin, const EdgeInsets.all(5));
    expect(
      app.accordion.titleBorder,
      Border.all(color: Colors.blueAccent, width: 1),
    );
    expect(app.accordion.contentBorder,
        Border.all(color: Colors.deepPurpleAccent, width: 1));
    expect(app.accordion.contentBorder,
        Border.all(color: Colors.deepPurpleAccent, width: 1));
    expect(app.accordion.titleBorderRadius,
        const BorderRadius.all(Radius.circular(2)));
    expect(app.accordion.contentBorderRadius,
        const BorderRadius.all(Radius.circular(6)));
    expect(app.accordion.showAccordion, isTrue);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.accordion);
  final GFAccordion accordion;
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.accordion,
            ],
          ),
        ),
      );
}
