import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

Widget wrap({required Widget child}) => MediaQuery(
      data: const MediaQueryData(),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Material(child: child),
      ),
    );

void main() {
  final UniqueKey checkboxlistileKey = UniqueKey();
  const bool isChecked = false;
  testWidgets('GFCheckboxListTile can be constructed Function call Null',
      (tester) async {
    final GFCheckboxListTile checkboxListTile = GFCheckboxListTile(
      key: checkboxlistileKey,
      onChanged: null,
      value: isChecked,
    );

    final TestApp app = TestApp(checkboxListTile);
    await tester.pumpWidget(app);
    await tester.pump();
    expect(find.byKey(checkboxlistileKey), findsOneWidget);
    expect(app.checkboxListTile.onChanged, null);
  });

  testWidgets('CheckboxListTile can autofocus unless disabled', (tester) async {
    final GlobalKey childKey = GlobalKey();
    final checkboxListTile = Directionality(
      textDirection: TextDirection.ltr,
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => Material(
                child: GFCheckboxListTile(
                  value: true,
                  onChanged: (_) {},
                  title: Text('Hello', key: childKey),
                  autofocus: false,
                ),
              )),
    );
    await tester.pumpWidget(checkboxListTile);
    await tester.pump();
    expect(Focus.maybeOf(childKey.currentContext!)!.hasPrimaryFocus, isFalse);
  });

  testWidgets('CheckboxListTile can autofocus is True', (tester) async {
    final GlobalKey childKey = GlobalKey();
    final checkboxListTile = Directionality(
      textDirection: TextDirection.ltr,
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => Material(
                child: GFCheckboxListTile(
                  value: true,
                  onChanged: (_) {},
                  title: Text('Hello', key: childKey),
                  autofocus: true,
                ),
              )),
    );
    await tester.pumpWidget(checkboxListTile);
    await tester.pump();
    expect(Focus.maybeOf(childKey.currentContext!)!.hasPrimaryFocus, isTrue);
  });

  testWidgets('CheckboxListTile values test', (WidgetTester tester) async {
    bool _value = false;

    await tester.pumpWidget(
      Material(
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => wrap(
            child: GFCheckboxListTile(
              title: const Text('Title'),
              value: _value,
              onChanged: (bool value) {
                setState(() {
                  _value = value;
                });
              },
            ),
          ),
        ),
      ),
    );

    expect(tester.widget<GFCheckbox>(find.byType(GFCheckbox)).value, false);

    // Tap the checkbox when value is disabled.
    await tester.tap(find.byType(GFCheckbox));
    await tester.pumpAndSettle();
    expect(_value, true);

    await tester.tap(find.byType(GFCheckbox));
    await tester.pumpAndSettle();
    expect(_value, false);

    // Tap the listTile when value is disabled.
    await tester.tap(find.byType(GFListTile));
    await tester.pumpAndSettle();
    expect(_value, true);

    await tester.tap(find.byType(GFListTile));
    await tester.pumpAndSettle();
    expect(_value, false);
  });

  testWidgets('CheckboxListTile selected item text Color',
      (WidgetTester tester) async {
    const Color colors = Color(0xff00ff00);

    Widget buildFrame({Color? colors, Color? toggleableActiveColor}) =>
        MaterialApp(
          theme: ThemeData.light().copyWith(
            switchTheme: SwitchThemeData(
              thumbColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return null;
                }
                if (states.contains(MaterialState.selected)) {
                  return toggleableActiveColor;
                }
                return null;
              }),
              trackColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return null;
                }
                if (states.contains(MaterialState.selected)) {
                  return toggleableActiveColor;
                }
                return null;
              }),
            ),
            radioTheme: RadioThemeData(
              fillColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return null;
                }
                if (states.contains(MaterialState.selected)) {
                  return toggleableActiveColor;
                }
                return null;
              }),
            ),
            checkboxTheme: CheckboxThemeData(
              fillColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return null;
                }
                if (states.contains(MaterialState.selected)) {
                  return toggleableActiveColor;
                }
                return null;
              }),
            ),
          ),
          home: Scaffold(
            body: Center(
              child: GFCheckboxListTile(
                color: colors,
                selected: true,
                title: const Text('title'),
                value: true,
                onChanged: (bool? value) {},
              ),
            ),
          ),
        );

    Color? textColor(String text) =>
        tester.renderObject<RenderParagraph>(find.text(text)).text.style?.color;

    await tester.pumpWidget(buildFrame(toggleableActiveColor: colors));
    print(textColor('title'));
    expect(textColor('title'), const Color(0xdd000000));
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.checkboxListTile);

  final GFCheckboxListTile checkboxListTile;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.checkboxListTile,
            ],
          ),
        ),
      );
}
