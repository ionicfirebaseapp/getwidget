import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  final childWidget = Container(
    width: 100,
    height: 100,
  );
  const color = Colors.teal;
  const padding = EdgeInsets.all(5);
  const margin = EdgeInsets.all(5);
  const boxFit = BoxFit.cover;
  const bgImage = NetworkImage(
    'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
  );

  testWidgets('GF Image can be created.', (tester) async {
    final GFImageOverlay image = GFImageOverlay(
        image: bgImage,
        color: color,
        padding: padding,
        boxFit: boxFit,
        margin: margin,
        child: childWidget);

    final TestApp app = TestApp(image);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.image.image, bgImage);
    expect(app.image.color, color);
    expect(app.image.padding, padding);
    expect(app.image.boxFit, boxFit);
    expect(app.image.margin, margin);
    expect(app.image.child, childWidget);
  });

  testWidgets('GF Image with border & border radius.', (tester) async {
    final borderRadius = BorderRadius.circular(10);
    final border = Border.all(color: Colors.red);

    final GFImageOverlay image = GFImageOverlay(
      image: bgImage,
      color: color,
      border: border,
      borderRadius: borderRadius,
      padding: padding,
      margin: margin,
    );

    final TestApp app = TestApp(image);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.image.image, bgImage);
    expect(app.image.color, color);
    expect(app.image.border, border);
    expect(app.image.borderRadius, borderRadius);
    expect(app.image.padding, padding);
    expect(app.image.margin, margin);
  });

  testWidgets('GF Image with child icon.', (tester) async {
    const content = Icon(Icons.car_rental);

    const GFImageOverlay image = GFImageOverlay(
      image: bgImage,
      color: color,
      child: content,
    );
    const TestApp app = TestApp(image);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.image.image, bgImage);
    expect(app.image.color, color);
    expect(app.image.child, content);
  });

  testWidgets('GF Image with circular shape', (tester) async {
    const shape = BoxShape.circle;

    const GFImageOverlay image = GFImageOverlay(
      image: bgImage,
      shape: shape,
    );

    const TestApp app = TestApp(image);

    expect(app.image.image, bgImage);
    expect(app.image.shape, shape);
  });

  testWidgets('GF Image with image overlay', (tester) async {
    const colorFilter = ColorFilter.mode(Colors.black26, BlendMode.colorBurn);

    const GFImageOverlay image = GFImageOverlay(
      image: bgImage,
      colorFilter: colorFilter,
    );

    const TestApp app = TestApp(image);

    expect(app.image.image, bgImage);
    expect(app.image.colorFilter, colorFilter);
  });

  testWidgets('GF Image with alignment of child widget', (tester) async {
    const alignment = Alignment.bottomCenter;

    const GFImageOverlay image = GFImageOverlay(
      image: bgImage,
      alignment: alignment,
    );

    const TestApp app = TestApp(image);

    expect(app.image.image, bgImage);
    expect(app.image.alignment, alignment);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.image);
  final GFImageOverlay image;
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.image,
            ],
          ),
        ),
      );
}
