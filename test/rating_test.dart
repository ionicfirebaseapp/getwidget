import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/cupertino.dart';

void main() {
  final Key ratingKey = UniqueKey();
  final Key buttonKey = UniqueKey();

  const filledIcon = Icon(Icons.favorite);
  const defaultIcon = Icon(Icons.favorite_border);

  testWidgets('GFRating without value', (tester) async {
    // `GFRating.value` null, `GFRating.onChanged` null
    expect(
      () => GFRating(
        value: null,
        onChanged: null,
      ),
      throwsAssertionError,
    );
  });

  testWidgets('GFRating can be constructed', (tester) async {
    double _rating = 4;

    final rating = Directionality(
      textDirection: TextDirection.ltr,
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => GFRating(
                key: ratingKey,
                value: _rating,
                onChanged: (value) {
                  print('value $value');
                  setState(() {
                    _rating = value;
                  });
                },
              )),
    );

    await tester.pumpWidget(rating);

    // find rating by key
    expect(find.byKey(ratingKey), findsOneWidget);
    expect(find.byIcon(Icons.star), findsNWidgets(4));
    expect(find.byIcon(Icons.star_border), findsNWidgets(1));
    await tester.tap(find.byIcon(Icons.star_border));
    await tester.pump();
    expect(find.byIcon(Icons.star), findsNWidgets(5));
    expect(find.byIcon(Icons.star_border), findsNothing);
    await tester.tap(find.byIcon(Icons.star).first);
    await tester.pump();
    expect(find.byIcon(Icons.star), findsNWidgets(1));
    expect(find.byIcon(Icons.star_border), findsNWidgets(4));
  });

  testWidgets('GFRating with icons.', (WidgetTester tester) async {
    double _rating = 1;

    final rating = Directionality(
      textDirection: TextDirection.ltr,
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => GFRating(
                key: ratingKey,
                value: _rating,
                defaultIcon: defaultIcon,
                filledIcon: filledIcon,
                onChanged: (value) {
                  print('value $value');
                  setState(() {
                    _rating = value;
                  });
                },
              )),
    );

    await tester.pumpWidget(rating);

    // find rating by key
    expect(find.byKey(ratingKey), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsNWidgets(1));
    expect(find.byIcon(Icons.favorite_border), findsNWidgets(4));
    await tester.tap(find.byIcon(Icons.favorite_border).last);
    await tester.pump();
    expect(find.byIcon(Icons.favorite), findsNWidgets(5));
    expect(find.byIcon(Icons.favorite_border), findsNothing);
    await tester.tap(find.byIcon(Icons.favorite).first);
    await tester.pump();
    expect(find.byIcon(Icons.favorite), findsNWidgets(1));
    expect(find.byIcon(Icons.favorite_border), findsNWidgets(4));
  });

  testWidgets('GFRating with half rating property on dragging.',
      (WidgetTester tester) async {
    double _rating = 3;

    final rating = GFRating(
      key: ratingKey,
      value: _rating,
      allowHalfRating: true,
      onChanged: (value) {
        _rating = value;
      },
    );

    final TestApp app = TestApp(rating);
    await tester.pumpWidget(app);

    // find rating by key
    expect(find.byKey(ratingKey), findsOneWidget);
    expect(find.byIcon(Icons.star), findsNWidgets(3));
    expect(find.byIcon(Icons.star_border), findsNWidgets(2));
    // Swipe the item to rate 5 star
    await tester.drag(find.byKey(ratingKey), const Offset(158.1, 45.1));
    await tester.pump();
    await tester.pump(const Duration(seconds: 2));
    // find rating 5 star
    expect(_rating, 5);
  });

  testWidgets('GF Rating using textFormField data input.',
      (WidgetTester tester) async {
    final _ratingController = TextEditingController();
    double _rating = 3.5;
    _ratingController.text = '3.5';

    final rating = MaterialApp(
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => Material(
            child: GFRating(
              key: ratingKey,
              value: _rating,
              controller: _ratingController,
              showTextForm: true,
              suffixIcon: GFButton(
                key: buttonKey,
                type: GFButtonType.transparent,
                onPressed: () {
                  setState(() {
                    _rating = double.parse(_ratingController.text ?? '0.0');
                  });
                },
                child: const Text('Rate'),
              ),
              onChanged: null,
            ),
          ),
        ),
      ),
    );

    await tester.pumpWidget(rating);

    // find rating by key
    expect(find.byKey(ratingKey), findsOneWidget);
    expect(find.byIcon(Icons.star), findsNWidgets(3));
    expect(find.byIcon(Icons.star_half), findsNWidgets(1));
    expect(find.byIcon(Icons.star_border), findsNWidgets(1));
    await tester.tap(find.byType(TextFormField));
    await tester.pump();
    await tester.enterText(find.byWidget(rating), '4.5');
    expect(find.text('4.5'), findsOneWidget);
    await tester.tap(find.byType(GFButton));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.byIcon(Icons.star), findsNWidgets(4));
    expect(find.byIcon(Icons.star_half), findsNWidgets(1));
    expect(find.byIcon(Icons.star_border), findsNothing);
  });

  testWidgets('GFRating with all properties.', (WidgetTester tester) async {
    double _rating = 3;

    final GFRating rating = GFRating(
      key: ratingKey,
      value: _rating,
      itemCount: 6,
      spacing: 6,
      color: GFColors.ALT,
      borderColor: GFColors.DARK,
      size: GFSize.LARGE,
      allowHalfRating: false,
      showTextForm: false,
      onChanged: (value) {
        _rating = value;
      },
    );

    final TestApp app = TestApp(rating);
    await tester.pumpWidget(app);

    expect(app.rating.value, _rating);
    expect(app.rating.itemCount, 6);
    expect(app.rating.spacing, 6);
    expect(app.rating.color, GFColors.ALT);
    expect(app.rating.borderColor, GFColors.DARK);
    expect(app.rating.size, GFSize.LARGE);
    expect(app.rating.allowHalfRating, isFalse);
    expect(app.rating.showTextForm, isFalse);
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
