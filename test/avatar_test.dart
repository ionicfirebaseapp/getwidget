import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/cupertino.dart';

void main() {
  final childWidget = Container(
    width: 60,
    height: 60,
  );
  final bgcolor = Colors.teal;
  final fgcolor = Colors.transparent;

  testWidgets('GF Avatar can be created', (tester) async {
    final GFAvatar avatar = GFAvatar(
        backgroundColor: bgcolor,
        foregroundColor: fgcolor,
        size: GFSize.MEDIUM,
        child: childWidget);
    final TestApp app = TestApp(avatar);
    await tester.pumpWidget(app);
    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.avatar.backgroundColor, bgcolor);
    expect(app.avatar.foregroundColor, fgcolor);
    expect(app.avatar.size, GFSize.MEDIUM);
    expect(app.avatar.child, childWidget);
  });

  testWidgets('GF Avatar with minradius & maxradius', (tester) async {
    const minradius = 10.0;
    const maxradius = 20.0;
    final GFAvatar avatar = GFAvatar(
        backgroundColor: bgcolor,
        foregroundColor: fgcolor,
        minRadius: minradius,
        maxRadius: maxradius,
        size: GFSize.MEDIUM,
        child: childWidget);
    final TestApp app = TestApp(avatar);
    await tester.pumpWidget(app);
    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.avatar.backgroundColor, bgcolor);
    expect(app.avatar.foregroundColor, fgcolor);
    expect(app.avatar.minRadius, minradius);
    expect(app.avatar.maxRadius, maxradius);
    expect(app.avatar.size, GFSize.MEDIUM);
    expect(app.avatar.child, childWidget);
  });

  testWidgets('Circular GF Avatar with bgImage', (tester) async {
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

  testWidgets('Square GF Avatar with bgImage', (tester) async {
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

  testWidgets('Standard shape GF Avatar with bgImage', (tester) async {
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
