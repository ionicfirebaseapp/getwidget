import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/cupertino.dart';

void main() {
  const color = Colors.teal;
  const bordercolor = Colors.black;
  const spacing = 1.0;
  const value = 2.0;
  const itemcount = 5;
  const size = GFSize.MEDIUM;
  const filledicon = Icon(Icons.star);
  const halffilled = Icon(Icons.star_border);
  const allowhalfRating = true;
  const showtextForm = false;
  const suffixicon = Icon(Icons.face_outlined);
  const margin = EdgeInsets.symmetric(vertical: 16);
  const padding = EdgeInsets.symmetric(horizontal: 16);
  const inputdecorations = InputDecoration(
      icon: Icon(Icons.face_outlined),
      labelText: 'Hi',
      labelStyle: TextStyle(fontSize: 14, color: Colors.black));
  final ratingController = TextEditingController();
  final customController = TextEditingController();

  testWidgets('GF Rating can be created.', (tester) async {
    const GFRating rating = GFRating(
      itemCount: itemcount,
      inputDecorations: inputdecorations,
      spacing: spacing,
      value: value,
      margin: margin,
      padding: padding,
      size: size,
      color: color,
      borderColor: bordercolor,
    );

    const TestApp app = TestApp(rating);

    await tester.pumpWidget(app);
    expect(app.rating.itemCount, itemcount);
    expect(app.rating.inputDecorations, inputdecorations);
    expect(app.rating.spacing, spacing);
    expect(app.rating.value, value);
    expect(app.rating.margin, margin);
    expect(app.rating.padding, padding);
    expect(app.rating.size, size);
    expect(app.rating.color, color);
    expect(app.rating.borderColor, bordercolor);
  });

  testWidgets('GF Rating with icons.', (tester) async {
    const GFRating rating = GFRating(
      itemCount: itemcount,
      size: size,
      color: color,
      filledIcon: filledicon,
    );

    const TestApp app = TestApp(rating);

    await tester.pumpWidget(app);
    expect(app.rating.itemCount, itemcount);
    expect(app.rating.size, size);
    expect(app.rating.color, color);
    expect(app.rating.filledIcon, filledicon);
  });

  testWidgets('GF Rating with half rating property.', (tester) async {
    const GFRating rating = GFRating(
      itemCount: itemcount,
      size: size,
      color: color,
      filledIcon: filledicon,
      halfFilledIcon: halffilled,
      allowHalfRating: allowhalfRating,
    );

    const TestApp app = TestApp(rating);

    await tester.pumpWidget(app);
    expect(app.rating.itemCount, itemcount);
    expect(app.rating.size, size);
    expect(app.rating.color, color);
    expect(app.rating.filledIcon, filledicon);
    expect(app.rating.halfFilledIcon, halffilled);
    expect(app.rating.allowHalfRating, allowhalfRating);
  });

  testWidgets('GF Rating using textformfield data input.', (tester) async {
    final GFRating rating = GFRating(
      itemCount: itemcount,
      size: size,
      color: color,
      filledIcon: filledicon,
      controller: ratingController,
      showTextForm: showtextForm,
    );

    final TestApp app = TestApp(rating);

    await tester.pumpWidget(app);
    expect(app.rating.itemCount, itemcount);
    expect(app.rating.size, size);
    expect(app.rating.color, color);
    expect(app.rating.filledIcon, filledicon);
    expect(app.rating.controller, ratingController);
    expect(app.rating.showTextForm, showtextForm);
  });

  testWidgets('Custom GF Rating using textformfield & icons.', (tester) async {
    final GFRating rating = GFRating(
      itemCount: itemcount,
      size: size,
      color: color,
      filledIcon: filledicon,
      controller: customController,
      suffixIcon: suffixicon,
      showTextForm: showtextForm,
    );

    final TestApp app = TestApp(rating);

    await tester.pumpWidget(app);
    expect(app.rating.itemCount, itemcount);
    expect(app.rating.size, size);
    expect(app.rating.color, color);
    expect(app.rating.filledIcon, filledicon);
    expect(app.rating.controller, customController);
    expect(app.rating.suffixIcon, suffixicon);
    expect(app.rating.showTextForm, showtextForm);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.rating);
  final GFRating rating;
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.rating,
            ],
          ),
        ),
      );
}
