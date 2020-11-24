import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/cupertino.dart';

void main() {
  const color = Colors.teal;
  const bordercolor = Colors.black;
  const spacing = 1.0;
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
  double rating = 3;

  testWidgets('Basic GF Rating can be created.', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Material(
                    child: GFRating(
                  itemCount: itemcount,
                  inputDecorations: inputdecorations,
                  spacing: spacing,
                  value: rating,
                  margin: margin,
                  padding: padding,
                  size: size,
                  color: color,
                  borderColor: bordercolor,
                  onChanged: (value) {
                    setState(() {
                      rating = value;
                    });
                  },
                ))),
      ),
    );
  });

  testWidgets('GF Rating with icons.', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Material(
                    child: GFRating(
                  itemCount: itemcount,
                  size: size,
                  color: color,
                  filledIcon: filledicon,
                  value: rating,
                  onChanged: (value) {
                    setState(() {
                      rating = value;
                    });
                  },
                ))),
      ),
    );
  });

  testWidgets('GF Rating with half rating property.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Material(
                    child: GFRating(
                  itemCount: itemcount,
                  size: size,
                  color: color,
                  filledIcon: filledicon,
                  halfFilledIcon: halffilled,
                  allowHalfRating: allowhalfRating,
                  value: rating,
                  onChanged: (value) {
                    setState(() {
                      rating = value;
                    });
                  },
                ))),
      ),
    );
  });

  testWidgets('GF Rating using textformfield data input.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Material(
                    child: GFRating(
                  itemCount: itemcount,
                  size: size,
                  color: color,
                  filledIcon: filledicon,
                  controller: ratingController,
                  showTextForm: showtextForm,
                  value: rating,
                  onChanged: (value) {
                    setState(() {
                      rating = value;
                    });
                  },
                ))),
      ),
    );
  });

  testWidgets('Custom GF Rating using textformfield & icons.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Material(
                    child: GFRating(
                  itemCount: itemcount,
                  size: size,
                  color: color,
                  filledIcon: filledicon,
                  controller: customController,
                  suffixIcon: suffixicon,
                  showTextForm: showtextForm,
                  value: rating,
                  onChanged: (value) {
                    setState(() {
                      rating = value;
                    });
                  },
                ))),
      ),
    );
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
