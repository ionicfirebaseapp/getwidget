import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  final childWidget = Container(
    width: 111,
    height: 222,
  );
  const firstColor = Colors.teal;
  const secondColor = Colors.tealAccent;

  const count = 5;
  const duration = Duration(milliseconds: 3000);

  final gradient = LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.centerLeft,
    stops: const <double>[0, 0.3, 0.6, 0.9, 1],
    colors: [
      Colors.teal[100],
      Colors.teal[200],
      Colors.teal[300],
      Colors.teal[400],
      Colors.teal[500],
    ],
  );

  testWidgets('GF Shimmer without child', (tester) async {
    // `GFShimmer.type` null.
    expect(
      () => GFShimmer(child: null),
      throwsAssertionError,
    );
  });

  testWidgets('GF Shimmer can be constructed', (tester) async {
    // final childWidget = Icon(Icons.directions_bike_sharp, size: 45,);

    final GFShimmer shimmer = GFShimmer(
      child: childWidget,
      mainColor: firstColor,
      secondaryColor: secondColor,
      shimmerEffectCount: count,
      duration: duration,
    );

    final TestApp app = TestApp(shimmer);

    await tester.pumpWidget(app);
    await tester.pump(duration);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
  });

  testWidgets('GF Shimmer can be constructed withh icon widget',
      (tester) async {
    const GFShimmer shimmer = GFShimmer(
      child: Icon(
        Icons.directions_bike_sharp,
        size: 45,
      ),
      mainColor: firstColor,
      secondaryColor: secondColor,
      shimmerEffectCount: count,
    );

    const TestApp app = TestApp(shimmer);

    await tester.pumpWidget(app);

    expect(find.byIcon(Icons.directions_bike_sharp), findsOneWidget);
  });

  test('should emit the right values for shimmerEffectCount', () async {
    final GFShimmer shimmer = GFShimmer(
      child: childWidget,
      mainColor: firstColor,
      secondaryColor: secondColor,
      shimmerEffectCount: count,
    );
    expect(shimmer.shimmerEffectCount, count);
  });

  test('GF Shimmer with gradient', () async {
    final GFShimmer shimmer = GFShimmer(
      child: childWidget,
      mainColor: firstColor,
      secondaryColor: secondColor,
      shimmerEffectCount: count,
      showGradient: true,
      gradient: gradient,
    );
    expect(shimmer.showGradient, isTrue);
    expect(shimmer.gradient, gradient);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.shimmer);

  final GFShimmer shimmer;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.shimmer,
            ],
          ),
        ),
      );
}
