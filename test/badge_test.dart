// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:getwidget/getwidget.dart';

// void main() {
//   const text = '1';
//   const textStyle = TextStyle(fontSize: 14, color: Colors.black);
//   const size = GFSize.SMALL;
//   const textColor = GFColors.INFO;
//   const color = Colors.amber;
//   const border =
//       BorderSide(color: Colors.tealAccent, width: 1, style: BorderStyle.solid);
//   const shape = RoundedRectangleBorder(
//       side: BorderSide(color: Colors.pink, width: 2, style: BorderStyle.solid),
//       borderRadius: BorderRadius.zero);
//   const childWidget = Text('hey');

//   testWidgets('GF Badge without shape', (tester) async {
//     // `GFBadge.shape` null.
//     expect(
//       () => GFBadge(
//         shape: null,
//       ),
//       throwsAssertionError,
//     );
//   });

//   testWidgets('GF Badge can be constructed', (tester) async {
//     const GFBadge badge = GFBadge(
//       text: text,
//       textStyle: textStyle,
//       size: size,
//     );

//     const TestApp app = TestApp(badge);

//     await tester.pumpWidget(app);

//     expect(find.text('1'), findsOneWidget);

//     expect(app.badge.text, text);
//     expect(app.badge.textStyle, textStyle);
//     expect(app.badge.size, size);

//     await tester.pumpWidget(app);
//   });

//   testWidgets('GF Badge with color and textColor', (tester) async {
//     const GFBadge badge = GFBadge(
//       text: text,
//       size: size,
//       textColor: textColor,
//       color: color,
//     );

//     const TestApp app = TestApp(badge);

//     await tester.pumpWidget(app);

//     expect(find.text('1'), findsOneWidget);

//     expect(app.badge.text, text);
//     expect(app.badge.size, size);
//     expect(app.badge.textColor, textColor);
//     expect(app.badge.color, color);

//     await tester.pumpWidget(app);
//   });

//   testWidgets(
//       'GF Badge with GFBadgeShape like circle, standard, square and pills',
//       (tester) async {
//     const GFBadge badge = GFBadge(
//       text: text,
//       size: size,
//       textColor: textColor,
//       color: color,
//       shape: GFBadgeShape.circle,
//     );

//     const TestApp app = TestApp(badge);

//     await tester.pumpWidget(app);

//     expect(find.text('1'), findsOneWidget);

//     expect(app.badge.text, text);
//     expect(app.badge.size, size);
//     expect(app.badge.textColor, textColor);
//     expect(app.badge.color, color);
//     expect(app.badge.shape, GFBadgeShape.circle);

//     await tester.pumpWidget(app);
//   });

//   testWidgets('GF Badge with custom border and shape', (tester) async {
//     const GFBadge badge = GFBadge(
//       text: text,
//       size: size,
//       textColor: textColor,
//       color: color,
//       borderShape: shape,
//       border: border,
//     );

//     const TestApp app = TestApp(badge);

//     await tester.pumpWidget(app);

//     expect(find.text('1'), findsOneWidget);

//     expect(app.badge.text, text);
//     expect(app.badge.size, size);
//     expect(app.badge.textColor, textColor);
//     expect(app.badge.color, color);
//     expect(app.badge.borderShape, shape);
//     expect(app.badge.border, border);

//     await tester.pumpWidget(app);
//   });

//   testWidgets('GF Badge with custom child', (tester) async {
//     const GFBadge badge = GFBadge(
//       child: childWidget,
//       size: size,
//     );

//     const TestApp app = TestApp(badge);

//     await tester.pumpWidget(app);

//     expect(find.text('hey'), findsOneWidget);

//     expect(app.badge.child, childWidget);

//     await tester.pumpWidget(app);
//   });
// }

// class TestApp extends StatefulWidget {
//   const TestApp(this.badge);

//   final GFBadge badge;

//   @override
//   _TestAppState createState() => _TestAppState();
// }

// class _TestAppState extends State<TestApp> {
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         home: Scaffold(
//           body: Column(
//             children: [
//               widget.badge,
//             ],
//           ),
//         ),
//       );
// }
