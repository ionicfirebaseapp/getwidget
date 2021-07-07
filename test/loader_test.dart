import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  final Widget childWidget = Container(
    width: 111,
    height: 222,
  );

  const iconOne = Icon(Icons.directions_bike_sharp);
  const iconTwo = Icon(Icons.directions_car);
  const iconThree = Icon(Icons.directions_bus);

  const duration = Duration(milliseconds: 1000);

  const firstColor = Colors.teal;
  const secondColor = Colors.tealAccent;
  const thirdColor = Colors.tealAccent;

  const stroke = 4.0;

  debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

  testWidgets('GF Loader can be constructed', (tester) async {
    final GFLoader loader = GFLoader(
      loaderColorOne: firstColor,
      loaderColorTwo: secondColor,
      duration: duration,
      type: GFLoaderType.ios,
      loaderIconOne: iconOne,
      loaderstrokeWidth: stroke,
      size: GFSize.MEDIUM,
      child: childWidget,
    );

    final TestApp app = TestApp(loader);

    await tester.pumpWidget(app);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    await tester.pump(duration);

    expect(app.loader.child, childWidget);
    expect(app.loader.loaderIconOne, iconOne);
    expect(app.loader.loaderColorOne, firstColor);
    expect(app.loader.loaderstrokeWidth, stroke);
    expect(app.loader.size, GFSize.MEDIUM);

    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('Basic GF Loader can be constructed', (tester) async {
    const GFLoader loader = GFLoader();

    const TestApp app = TestApp(loader);

    await tester.pumpWidget(app);
  });

  testWidgets('GF Loader with icons can be constructed', (tester) async {
    const customType = GFLoaderType.custom;

    const GFLoader loader = GFLoader(
      type: customType,
      duration: duration,
      loaderIconOne: iconOne,
      loaderIconTwo: iconTwo,
      loaderIconThree: iconThree,
      loaderstrokeWidth: stroke,
    );

    const TestApp app = TestApp(loader);

    await tester.pumpWidget(app);

    await tester.pump(duration);

    expect(app.loader.type, customType);
    expect(app.loader.loaderIconOne, iconOne);
    expect(app.loader.loaderIconTwo, iconTwo);
    expect(app.loader.loaderIconThree, iconThree);
    expect(app.loader.loaderstrokeWidth, stroke);
  });

  testWidgets('GF Loader with square type can be constructed', (tester) async {
    const customType = GFLoaderType.square;

    const GFLoader loader = GFLoader(
      type: customType,
      duration: duration,
      loaderColorOne: firstColor,
      loaderColorTwo: secondColor,
      loaderColorThree: thirdColor,
      loaderstrokeWidth: stroke,
    );

    const TestApp app = TestApp(loader);

    await tester.pumpWidget(app);

    await tester.pump(duration);

    expect(app.loader.type, customType);
    expect(app.loader.loaderColorOne, firstColor);
    expect(app.loader.loaderColorTwo, secondColor);
    expect(app.loader.loaderColorThree, thirdColor);
    expect(app.loader.loaderstrokeWidth, stroke);
  });

  testWidgets('GF Loader with round type can be constructed', (tester) async {
    const customType = GFLoaderType.circle;

    const GFLoader loader = GFLoader(
      type: customType,
      duration: duration,
      loaderColorOne: firstColor,
      loaderColorTwo: secondColor,
      loaderColorThree: thirdColor,
      loaderstrokeWidth: stroke,
    );

    const TestApp app = TestApp(loader);

    await tester.pumpWidget(app);

    await tester.pump(duration);

    expect(app.loader.type, customType);
    expect(app.loader.loaderColorOne, firstColor);
    expect(app.loader.loaderColorTwo, secondColor);
    expect(app.loader.loaderColorThree, thirdColor);
    expect(app.loader.loaderstrokeWidth, stroke);
  });

  testWidgets('GF Loader with android type loader can be constructed',
      (tester) async {
    const customType = GFLoaderType.android;
    const color = AlwaysStoppedAnimation<Color>(Colors.green);

    const GFLoader loader =
        GFLoader(type: customType, androidLoaderColor: color);

    const TestApp app = TestApp(loader);

    await tester.pumpWidget(app);

    expect(app.loader.type, customType);
    expect(app.loader.androidLoaderColor, color);
  });

  testWidgets('GF Loader with custom loader can be constructed using child',
      (tester) async {
    const customType = GFLoaderType.custom;

    final GFLoader loader = GFLoader(type: customType, child: childWidget);

    final TestApp app = TestApp(loader);

    await tester.pumpWidget(app);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    await tester.pump(duration);

    expect(app.loader.child, childWidget);
    expect(app.loader.type, customType);
  });

  testWidgets('Custom GF Loader can be constructed with wrong type',
      (tester) async {
    const GFLoader loader = GFLoader(
      type: GFLoaderType.custom,
      loaderIconOne: iconOne,
    );

    const TestApp app = TestApp(loader);

    await tester.pumpWidget(app);
    expect(app.loader.type, GFLoaderType.custom, reason: 'custom icon');
    expect(app.loader.loaderIconOne, iconOne);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.loader);

  final GFLoader loader;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.loader,
            ],
          ),
        ),
      );
}
