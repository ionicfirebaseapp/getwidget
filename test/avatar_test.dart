import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';
// import 'package:image_test_utils/image_test_utils.dart';
import 'package:flutter/cupertino.dart';
// import 'package:network_image_mock/network_image_mock.dart';

// Widget makeTestableWidget() => Container(
//       decoration:const BoxDecoration(
//           image: DecorationImage(
//               image:  NetworkImage(
//                   "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"),
//               fit: BoxFit.cover)),
//     );

Future<void> main() async {
  final childWidget = Container(
    width: 60,
    height: 60,
  );

  final bgcolor = Colors.teal;
  final fgcolor = Colors.transparent;
  const minradius = 10.0;
  const maxradius = 20.0;

  debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

//     final avatarUrl = await provideMockedNetworkImages((WidgetTester tester) async {
//             await tester.pumpWidget(
//        Container(
//   decoration: BoxDecoration(
//       image: DecorationImage(image: NetworkImage("https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"),
//       fit: BoxFit.cover)
//     ),
// ),

//       );
//     });

  testWidgets('GF Avatar can be created', (tester) async {
    final GFAvatar avatar = GFAvatar(
        backgroundColor: bgcolor,
        // backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"),
        // backgroundImage: AssetImage(
        //   'lib/assets/avatar5.png',
        // ),
        // backgroundImage: url,
        foregroundColor: fgcolor,
        minRadius: minradius,
        maxRadius: maxradius,
        size: GFSize.MEDIUM,
        shape: GFAvatarShape.circle,
        child: childWidget);

    final TestApp app = TestApp(avatar);

    await tester.pumpWidget(app);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);

    // final url = await provideMockedNetworkImages(() async {
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Image.network("https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"),
    //     ),
    //   );
    // });

    expect(app.avatar.child, childWidget);
    expect(app.avatar.size, GFSize.MEDIUM);

    debugDefaultTargetPlatformOverride = null;
  });

  //  testWidgets(
  //   'should properly mock Image.network and not crash',
  //   (WidgetTester tester) async {
  //    final url = mockNetworkImagesFor(() => tester.pumpWidget(makeTestableWidget()));
  //   },
  // );

  testWidgets('Basic GF Avatar can be created', (tester) async {
    const GFAvatar avatar = GFAvatar();

    const TestApp app =  TestApp(avatar);

    await tester.pumpWidget(app);
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
