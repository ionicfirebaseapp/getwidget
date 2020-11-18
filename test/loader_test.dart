import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {

  final childWidget = Container(
    width: 111,
    height: 222,
  );

  final iconOne = Icon(Icons.directions_bike_sharp);
  final iconTwo = Icon(Icons.directions_car);
  final iconThree = Icon(Icons.directions_bus);

  final duration = Duration(milliseconds: 1000);

  final firstColor = Colors.teal;
  final secondColor = Colors.tealAccent;
  final thirdColor = Colors.tealAccent.shade400;

  final stroke = 4.0;

  debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

  // testWidgets('Asserts.', (tester) async {
  //   expect(
  //         () => GFLoader(
  //
  //     ),
  //     throwsAssertionError,
  //   );
  //
  //   expect(
  //         () => GFLoader(
  //
  //     ),
  //     throwsAssertionError,
  //   );
  // });

  testWidgets('GF Loader can be constructed', (tester) async {

    final GFLoader loader = GFLoader(
        loaderColorOne: firstColor,
        loaderColorTwo: secondColor,
        duration: duration,
        type: GFLoaderType.ios,
        loaderIconOne : iconOne,
        // androidLoaderColor : Colors.amber,
        loaderstrokeWidth: stroke,
        size: GFSize.MEDIUM,
        child : childWidget
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

    final GFLoader loader = GFLoader(

    );

    final TestApp app = TestApp(loader);

    await tester.pumpWidget(app);

  });

  testWidgets('GF Loader with icons can be constructed', (tester) async {

    final customType = GFLoaderType.custom;

    final GFLoader loader = GFLoader(
      type: customType,
      duration: duration,
      loaderIconOne : iconOne,
      loaderIconTwo: iconTwo,
      loaderIconThree: iconThree,
      loaderstrokeWidth: stroke,
    );

    final TestApp app = TestApp(loader);

    await tester.pumpWidget(app);

    await tester.pump(duration);

    expect(app.loader.type, customType);
    expect(app.loader.loaderIconOne, iconOne);
    expect(app.loader.loaderIconTwo, iconTwo);
    expect(app.loader.loaderIconThree, iconThree);
    expect(app.loader.loaderstrokeWidth, stroke);

  });


  // testWidgets('Asserts.', (tester) async {
  //   // when type is null
  //
  //   expect(() => GFLoader(
  //     type: null,
  //     loaderIconOne : iconOne,
  //     loaderIconTwo: iconTwo,
  //     loaderIconThree: iconThree,
  //   ),
  //     throwsAssertionError,
  //   );
  // });

  testWidgets('GF Loader with square type can be constructed', (tester) async {

    final customType = GFLoaderType.square;

    final GFLoader loader = GFLoader(
      type: customType,
      duration: duration,
      loaderColorOne: firstColor,
      loaderColorTwo: secondColor,
      loaderColorThree: thirdColor,
      loaderstrokeWidth: stroke,
    );

    final TestApp app = TestApp(loader);

    await tester.pumpWidget(app);

    await tester.pump(duration);

    expect(app.loader.type, customType);
    expect(app.loader.loaderColorOne, firstColor);
    expect(app.loader.loaderColorTwo, secondColor);
    expect(app.loader.loaderColorThree, thirdColor);
    expect(app.loader.loaderstrokeWidth, stroke);

  });

  testWidgets('GF Loader with round type can be constructed', (tester) async {

    final customType = GFLoaderType.circle;

    final GFLoader loader = GFLoader(
      type: customType,
      duration: duration,
      loaderColorOne: firstColor,
      loaderColorTwo: secondColor,
      loaderColorThree: thirdColor,
      loaderstrokeWidth: stroke,
    );

    final TestApp app = TestApp(loader);

    await tester.pumpWidget(app);

    await tester.pump(duration);

    expect(app.loader.type, customType);
    expect(app.loader.loaderColorOne, firstColor);
    expect(app.loader.loaderColorTwo, secondColor);
    expect(app.loader.loaderColorThree, thirdColor);
    expect(app.loader.loaderstrokeWidth, stroke);

  });

  testWidgets('GF Loader with android type loader can be constructed', (tester) async {

    final customType = GFLoaderType.android;
    final color = AlwaysStoppedAnimation<Color>(Colors.green);

    final GFLoader loader = GFLoader(
        type: customType,
        androidLoaderColor : color
    );

    final TestApp app = TestApp(loader);

    await tester.pumpWidget(app);

    expect(app.loader.type, customType);
    expect(app.loader.androidLoaderColor, color);

  });


  // testWidgets('Asserts.', (tester) async {
  //   // when type is null
  //
  //   // expect(() => GFLoader(
  //   //   type: null,
  //   //   loaderIconOne : iconOne,
  //   //   loaderIconTwo: iconTwo,
  //   //   loaderIconThree: iconThree,
  //   // ),
  //   //   throwsAssertionError,
  //   //
  //   // );
  //
  //   final GFLoader loader = GFLoader(
  //       type: null,
  //     loaderIconOne : iconOne,
  //     loaderIconTwo: iconTwo,
  //     loaderIconThree: iconThree,
  //   );
  //
  //   final TestApp app = TestApp(loader);
  //
  //   await tester.pumpWidget(app);
  //
  //   expect(
  //     tester.takeException(),
  //     isA<FlutterError>().having(
  //           (error) => error.message,
  //       'message',
  //       'Type should be custom for icons loader to display',
  //     ),
  //   );
  // });

  testWidgets('GF Loader with custom loader can be constructed using child', (tester) async {

    final customType = GFLoaderType.custom;

    final GFLoader loader = GFLoader(
        type: customType,
        child : childWidget
    );

    final TestApp app = TestApp(loader);

    await tester.pumpWidget(app);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    await tester.pump(duration);

    expect(app.loader.child, childWidget);
    expect(app.loader.type, customType);

  });

}

class TestApp extends StatefulWidget {
  final GFLoader loader;

  TestApp(this.loader);

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            widget.loader,
          ],
        ),
      ),
    );
  }
}
