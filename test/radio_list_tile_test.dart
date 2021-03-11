import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

Widget wrap({Widget? child}) => MediaQuery(
      data: const MediaQueryData(),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Material(child: child),
      ),
    );

void main() {
  final UniqueKey radioKey = UniqueKey();
  const int groupValue = 0;
  testWidgets('GFRadioListTile can be constructed Function call Null',
      (tester) async {
    final GFRadioListTile radioListTile = GFRadioListTile(
      key: radioKey,
      onChanged: null,
      value: 2,
      groupValue: groupValue,
      toggleable: false,
    );

    final TestApp app = TestApp(radioListTile);
    await tester.pumpWidget(app);
    await tester.pump();
    expect(find.byKey(radioKey), findsOneWidget);
    expect(app.radioListTile.onChanged, null);
    expect(
      app.radioListTile.value,
      2,
    );
  });

  testWidgets('GFRadioListTile can be constructed Function call Null',
      (tester) async {
    final GFRadioListTile radioListTile = GFRadioListTile(
      key: radioKey,
      onChanged: null,
      value: 2,
      groupValue: groupValue,
      toggleable: false,
    );

    final TestApp app = TestApp(radioListTile);
    await tester.pumpWidget(app);
    await tester.pump();
    expect(find.byKey(radioKey), findsOneWidget);
    expect(app.radioListTile.onChanged, null);
    expect(
      app.radioListTile.value,
      2,
    );
  });

  testWidgets('GFRadioListTile should initialize according to groupValue',
      (WidgetTester tester) async {
    final List<int> values = <int>[0, 1, 2];
    int groupValue = 0;
    final Type radioListTileType = const GFRadioListTile<int>(
      value: 0,
      groupValue: 0,
      onChanged: null,
    ).runtimeType;

    List<GFRadioListTile<int>> generatedRadioListTiles;
    List<GFRadioListTile<int>> findTiles() => find
        .byType(radioListTileType)
        .evaluate()
        .map<Widget>((Element element) => element.widget)
        .cast<GFRadioListTile<int>>()
        .toList();

    Widget buildFrame() => wrap(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Scaffold(
              body: ListView.builder(
                itemCount: values.length,
                itemBuilder: (BuildContext context, int index) =>
                    GFRadioListTile<int>(
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value;
                    });
                  },
                  value: values[index],
                  title: Text(values[index].toString()),
                ),
              ),
            ),
          ),
        );

    await tester.pumpWidget(buildFrame());
    generatedRadioListTiles = findTiles();

    // first RadioButton is True then other option false
    print(generatedRadioListTiles[0].checked);
    print(generatedRadioListTiles[1].checked);
    print(generatedRadioListTiles[2].checked);
    print('*************');
    expect(generatedRadioListTiles[0].checked, equals(true));
    expect(generatedRadioListTiles[1].checked, equals(false));
    expect(generatedRadioListTiles[2].checked, equals(false));

    // Second RadioButton is True then other option false
    groupValue = 1;
    await tester.pumpWidget(buildFrame());
    generatedRadioListTiles = findTiles();
    print(generatedRadioListTiles[0].checked);
    print(generatedRadioListTiles[1].checked);
    print(generatedRadioListTiles[2].checked);
    print('*************');

    expect(generatedRadioListTiles[0].checked, equals(false));
    expect(generatedRadioListTiles[1].checked, equals(true));
    expect(generatedRadioListTiles[2].checked, equals(false));

    // third RadioButton is True then other option false
    groupValue = 2;
    await tester.pumpWidget(buildFrame());
    generatedRadioListTiles = findTiles();
    print(generatedRadioListTiles[0].checked);
    print(generatedRadioListTiles[1].checked);
    print(generatedRadioListTiles[2].checked);
    print('*************');

    expect(generatedRadioListTiles[0].checked, equals(false));
    expect(generatedRadioListTiles[1].checked, equals(false));
    expect(generatedRadioListTiles[2].checked, equals(true));
  });

  testWidgets('GFRadioListTile simple control test',
      (WidgetTester tester) async {
    final Key key = UniqueKey();
    final Key titleKey = UniqueKey();
    final List<dynamic> log = <dynamic>[];

    await tester.pumpWidget(
      wrap(
        child: GFRadioListTile<int>(
          key: key,
          value: 1,
          groupValue: 2,
          onChanged: log.add,
          title: Text('Title', key: titleKey),
        ),
      ),
    );

    await tester.tap(find.byKey(key));

    expect(log, equals(<int>[1]));
    log.clear();

    await tester.pumpWidget(
      wrap(
        child: GFRadioListTile<int>(
          key: key,
          value: 1,
          groupValue: 1,
          onChanged: log.add,
          // activeColor: Colors.green[500],
          title: Text('Title', key: titleKey),
        ),
      ),
    );

    await tester.tap(find.byKey(key));

    expect(log, isEmpty);

    await tester.pumpWidget(
      wrap(
        child: GFRadioListTile<int>(
          key: key,
          value: 1,
          groupValue: 2,
          onChanged: null,
          title: Text('Title', key: titleKey),
        ),
      ),
    );

    await tester.tap(find.byKey(key));

    expect(log, isEmpty);

    await tester.pumpWidget(
      wrap(
        child: GFRadioListTile<int>(
          key: key,
          value: 1,
          groupValue: 2,
          onChanged: log.add,
          title: Text('Title', key: titleKey),
        ),
      ),
    );

    await tester.tap(find.byKey(titleKey));

    expect(log, equals(<int>[1]));
  });

  testWidgets('GFRadioListTile control tests', (WidgetTester tester) async {
    final List<int> values = <int>[0, 1, 2];
    int groupValue = 0;

    final List<dynamic> log = <dynamic>[];

    Widget buildFrame() => wrap(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Scaffold(
              body: ListView.builder(
                itemCount: values.length,
                itemBuilder: (BuildContext context, int index) =>
                    GFRadioListTile<int>(
                  groupValue: groupValue,
                  onChanged: (value) {
                    log.add(value);
                    setState(() {
                      groupValue = value;
                    });
                  },
                  value: values[index],
                  title: Text(values[index].toString()),
                ),
              ),
            ),
          ),
        );

    // Tests for tapping between [Radio] and [ListTile]
    await tester.pumpWidget(buildFrame());
    await tester.tap(find.text('0'));
    log.add('-');
    print(log);
    await tester.tap(find.text('1'));
    await tester.tap(find.text('2'));
    print(log);
    // expect(log, equals(<dynamic>['-', 1, 2]
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.radioListTile);

  final GFRadioListTile radioListTile;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.radioListTile,
            ],
          ),
        ),
      );
}
