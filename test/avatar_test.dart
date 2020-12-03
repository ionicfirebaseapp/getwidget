import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/cupertino.dart';

void main() {
  final childWidget = Container(
    width: 60,
    height: 60,
  );
  const bgColor = Colors.teal;
  const fgColor = Colors.transparent;

  testWidgets('GFAvatar can be created', (tester) async {
    final GFAvatar avatar = GFAvatar(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        size: GFSize.MEDIUM,
        child: childWidget);
    final TestApp app = TestApp(avatar);
    await tester.pumpWidget(app);
    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.avatar.backgroundColor, bgColor);
    expect(app.avatar.foregroundColor, fgColor);
    expect(app.avatar.size, GFSize.MEDIUM);
    expect(app.avatar.child, childWidget);
  });

  testWidgets('GFAvatar with minRadius & maxRadius', (tester) async {
    const minRadius = 10.0;
    const maxRadius = 20.0;
    final GFAvatar avatar = GFAvatar(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        minRadius: minRadius,
        maxRadius: maxRadius,
        size: GFSize.MEDIUM,
        child: childWidget);
    final TestApp app = TestApp(avatar);
    await tester.pumpWidget(app);
    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.avatar.backgroundColor, bgColor);
    expect(app.avatar.foregroundColor, fgColor);
    expect(app.avatar.minRadius, minRadius);
    expect(app.avatar.maxRadius, maxRadius);
    expect(app.avatar.size, GFSize.MEDIUM);
    expect(app.avatar.child, childWidget);
  });

  testWidgets('Circular GFAvatar with bgImage', (tester) async {
    const bgImage = NetworkImage(
      'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
    );

    const GFAvatar avatar = GFAvatar(
      backgroundImage: bgImage,
      shape: GFAvatarShape.circle,
    );

    const TestApp app = TestApp(avatar);

    expect(app.avatar.backgroundImage, bgImage);
    expect(app.avatar.shape, GFAvatarShape.circle);
  });

  testWidgets('Square GFAvatar with bgImage', (tester) async {
    const bgImage = NetworkImage(
      'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
    );

    const GFAvatar avatar = GFAvatar(
      backgroundImage: bgImage,
      shape: GFAvatarShape.square,
    );

    const TestApp app = TestApp(avatar);

    expect(app.avatar.backgroundImage, bgImage);
    expect(app.avatar.shape, GFAvatarShape.square);
  });

  testWidgets('Standard shape GFAvatar with bgImage', (tester) async {
    const bgImage = NetworkImage(
      'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
    );

    const GFAvatar avatar = GFAvatar(
      backgroundImage: bgImage,
      shape: GFAvatarShape.standard,
    );

    const TestApp app = TestApp(avatar);

    expect(app.avatar.backgroundImage, bgImage);
    expect(app.avatar.shape, GFAvatarShape.standard);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.avatar);
  final GFAvatar avatar;
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.avatar,
            ],
          ),
        ),
      );
}
