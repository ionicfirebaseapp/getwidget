// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:getwidget/getwidget.dart';
// import 'package:flutter/cupertino.dart';
//
// void main() {
//   final Key toggleKey = UniqueKey();
//
//   const enabledTextStyle = TextStyle(color: Colors.green);
//   const disabledTextStyle = TextStyle(color: Colors.red);
//
//   testWidgets('GFToggle without value', (tester) async {
//     // `GFToggle.value` null,
//     expect(
//           () => GFToggle(
//         value: null,
//         onChanged: (bool value) {},
//       ),
//       throwsAssertionError,
//     );
//   });
//
//   testWidgets('GFToggle can be constructed', (WidgetTester tester) async {
//     bool isSelected = false;
//
//     final toggle = Directionality(
//       textDirection: TextDirection.ltr,
//       child: StatefulBuilder(
//         builder: (BuildContext context, StateSetter setState) => Material(
//           child: Center(
//             child: GFToggle(
//               key: toggleKey,
//               value: isSelected,
//               onChanged: (value) {
//                 setState(() {
//                   isSelected = value;
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//
//     await tester.pumpWidget(toggle);
//
//     expect(isSelected, isFalse);
//     await tester.tap(find.byKey(toggleKey));
//     await tester.pump();
//     expect(isSelected, isTrue);
//   });
//
//   testWidgets('GFToggle can be constructed with enabled and disabled Text',
//           (tester) async {
//         bool isOn = false;
//
//         final toggle = Directionality(
//           textDirection: TextDirection.ltr,
//           child: StatefulBuilder(
//               builder: (BuildContext context, StateSetter setState) => Material(
//                 child: GFToggle(
//                   key: toggleKey,
//                   value: isOn,
//                   enabledText: 'ON',
//                   disabledText: 'OFF',
//                   onChanged: (value) {
//                     setState(() {
//                       isOn = value;
//                     });
//                   },
//                 ),
//               )),
//         );
//
//         // final TestApp app = TestApp(toggle);
//         await tester.pumpWidget(toggle);
//
//         // find toggle by key
//         expect(find.byKey(toggleKey), findsOneWidget);
//
//         // find text 'OFF'
//         expect(find.byWidgetPredicate((widget) {
//           if (widget is Text) {
//             final Text toggleWidget = widget;
//             if (toggleWidget.data != null) {
//               return toggleWidget.data.contains('OFF');
//             }
//             return toggleWidget.textSpan.toPlainText().contains('OFF');
//           }
//           return false;
//         }), findsOneWidget);
//
//         // tap on text 'OFF;
//         await tester.tap(find.byWidgetPredicate((widget) {
//           if (widget is Text) {
//             final Text toggleWidget = widget;
//             if (toggleWidget.data != null) {
//               return toggleWidget.data.contains('OFF');
//             }
//             return toggleWidget.textSpan.toPlainText().contains('OFF');
//           }
//           return false;
//         }));
//
//         // Rebuild the widget after the state has changed.
//         await tester.pump();
//
//         // find text 'ON'
//         expect(find.byWidgetPredicate((widget) {
//           if (widget is Text) {
//             final Text toggleWidget = widget;
//             if (toggleWidget.data != null) {
//               return toggleWidget.data.contains('ON');
//             }
//             return toggleWidget.textSpan.toPlainText().contains('ON');
//           }
//           return false;
//         }), findsOneWidget);
//
//         // tap on text 'ON'
//         await tester.tap(find.byWidgetPredicate((widget) {
//           if (widget is Text) {
//             final Text toggleWidget = widget;
//             if (toggleWidget.data != null) {
//               return toggleWidget.data.contains('ON');
//             }
//             return toggleWidget.textSpan.toPlainText().contains('ON');
//           }
//           return false;
//         }));
//
//         // Rebuild the widget after the state has changed.
//         await tester.pump(const Duration(milliseconds: 500));
//
//         // find text 'OFF'
//         expect(find.byWidgetPredicate((widget) {
//           if (widget is Text) {
//             final Text toggleWidget = widget;
//             if (toggleWidget.data != null) {
//               return toggleWidget.data.contains('OFF');
//             }
//             return toggleWidget.textSpan.toPlainText().contains('OFF');
//           }
//           return false;
//         }), findsOneWidget);
//       });
//
//   testWidgets('GFToggle with enabled and disabled color',
//           (WidgetTester tester) async {
//         bool isOn = false;
//
//         final toggle = Directionality(
//           textDirection: TextDirection.ltr,
//           child: StatefulBuilder(
//               builder: (BuildContext context, StateSetter setState) => Material(
//                 child: GFToggle(
//                   key: toggleKey,
//                   value: isOn,
//                   enabledText: 'ON',
//                   disabledText: 'OFF',
//                   disabledThumbColor: Colors.amber,
//                   disabledTrackColor: Colors.amberAccent,
//                   enabledThumbColor: Colors.teal,
//                   enabledTrackColor: Colors.tealAccent,
//                   boxShape: BoxShape.rectangle,
//                   borderRadius: const BorderRadius.all(Radius.circular(4)),
//                   onChanged: (value) {
//                     setState(() {
//                       isOn = value;
//                     });
//                   },
//                 ),
//               )),
//         );
//
//         // find toggle  key
//         await tester.pumpWidget(toggle);
//
//         // finds value false
//         expect(isOn, isFalse);
//
//         // find disabled color, finds one widget
//         expect(find.byWidgetPredicate((widget) {
//           if (widget is DecoratedBox) {
//             final DecoratedBox toggleWidget = widget;
//             if (toggleWidget.decoration != null) {
//               final BoxDecoration toggle = toggleWidget.decoration;
//               return toggle.color == Colors.amber;
//             }
//           }
//           return false;
//         }), findsOneWidget);
//
//         // finds enabled color, finds nothing
//         expect(find.byWidgetPredicate((widget) {
//           if (widget is DecoratedBox) {
//             final DecoratedBox toggleWidget = widget;
//             if (toggleWidget.decoration != null) {
//               final BoxDecoration toggle = toggleWidget.decoration;
//               return toggle.color == Colors.teal;
//             }
//           }
//           return false;
//         }), findsNothing);
//
//         // tap on text 'OFF'
//         await tester.tap(find.byWidgetPredicate((widget) {
//           if (widget is Text) {
//             final Text toggleWidget = widget;
//             if (toggleWidget.data != null) {
//               return toggleWidget.data.contains('OFF');
//             }
//             return toggleWidget.textSpan.toPlainText().contains('OFF');
//           }
//           return false;
//         }));
//
//         // Rebuild the widget after the state has changed.
//         await tester.pump();
//
//         // finds value true
//         expect(isOn, isTrue);
//
//         // finds enabled color, finds one widget
//         expect(find.byWidgetPredicate((widget) {
//           if (widget is DecoratedBox) {
//             final DecoratedBox toggleWidget = widget;
//             if (toggleWidget.decoration != null) {
//               final BoxDecoration toggle = toggleWidget.decoration;
//               return toggle.color == Colors.teal;
//             }
//           }
//           return false;
//         }), findsOneWidget);
//
//         // finds disabled color, finds nothing
//         expect(find.byWidgetPredicate((widget) {
//           if (widget is DecoratedBox) {
//             final DecoratedBox toggleWidget = widget;
//             if (toggleWidget.decoration != null) {
//               final BoxDecoration toggle = toggleWidget.decoration;
//               return toggle.color == Colors.amber;
//             }
//           }
//           return false;
//         }), findsNothing);
//       });
//
//   testWidgets('GFToggle with borderRadius and boxShape',
//           (WidgetTester tester) async {
//         bool isOn = false;
//
//         final toggle = Directionality(
//           textDirection: TextDirection.ltr,
//           child: StatefulBuilder(
//               builder: (BuildContext context, StateSetter setState) => Material(
//                 child: GFToggle(
//                   key: toggleKey,
//                   value: isOn,
//                   enabledText: 'ON',
//                   disabledText: 'OFF',
//                   disabledThumbColor: Colors.amber,
//                   disabledTrackColor: Colors.amberAccent,
//                   enabledThumbColor: Colors.teal,
//                   enabledTrackColor: Colors.tealAccent,
//                   boxShape: BoxShape.rectangle,
//                   borderRadius: const BorderRadius.all(Radius.circular(4)),
//                   onChanged: (value) {
//                     setState(() {
//                       isOn = value;
//                     });
//                   },
//                 ),
//               )),
//         );
//
//         // find toggle  key
//         await tester.pumpWidget(toggle);
//
//         // finds value false
//         expect(isOn, isFalse);
//
//         // find border radius, finds one widget
//         expect(find.byWidgetPredicate((widget) {
//           if (widget is DecoratedBox) {
//             final DecoratedBox toggleWidget = widget;
//             if (toggleWidget.decoration != null) {
//               final BoxDecoration toggle = toggleWidget.decoration;
//               return toggle.borderRadius ==
//                   const BorderRadius.all(Radius.circular(4));
//             }
//           }
//           return false;
//         }), findsOneWidget);
//
//         // find boxShape, rectangle
//         expect(find.byWidgetPredicate((widget) {
//           if (widget is PhysicalModel) {
//             final PhysicalModel toggleWidget = widget;
//             if (toggleWidget.shape != null) {
//               final PhysicalModel toggle = toggleWidget;
//               return toggle.shape == BoxShape.rectangle;
//             }
//           }
//           return false;
//         }), findsOneWidget);
//       });
//
//   testWidgets('GFToggle with enabled and disabled textStyle',
//           (WidgetTester tester) async {
//         bool isOn = false;
//
//         final toggle = Directionality(
//           textDirection: TextDirection.ltr,
//           child: StatefulBuilder(
//               builder: (BuildContext context, StateSetter setState) => Material(
//                 child: GFToggle(
//                   key: toggleKey,
//                   value: isOn,
//                   enabledText: 'ON',
//                   disabledText: 'OFF',
//                   enabledTextStyle: enabledTextStyle,
//                   disabledTextStyle: disabledTextStyle,
//                   disabledThumbColor: Colors.amber,
//                   disabledTrackColor: Colors.amberAccent,
//                   enabledThumbColor: Colors.teal,
//                   enabledTrackColor: Colors.tealAccent,
//                   boxShape: BoxShape.rectangle,
//                   borderRadius: const BorderRadius.all(Radius.circular(4)),
//                   onChanged: (value) {
//                     setState(() {
//                       isOn = value;
//                     });
//                   },
//                 ),
//               )),
//         );
//
//         // find toggle  key
//         await tester.pumpWidget(toggle);
//
//         // finds value false
//         expect(isOn, isFalse);
//
//         // find disabled text color
//         expect(find.byWidgetPredicate((widget) {
//           if (widget is Text) {
//             final Text toggleWidget = widget;
//             if (toggleWidget.data != null) {
//               return toggleWidget.style.color == disabledTextStyle.color;
//             }
//           }
//           return false;
//         }), findsOneWidget);
//
//         // find enabled text color
//         expect(find.byWidgetPredicate((widget) {
//           if (widget is Text) {
//             final Text toggleWidget = widget;
//             if (toggleWidget.data != null) {
//               return toggleWidget.style.color == enabledTextStyle.color;
//             }
//           }
//           return false;
//         }), findsNothing);
//
//         // tap on text 'OFF'
//         await tester.tap(find.byWidgetPredicate((widget) {
//           if (widget is Text) {
//             final Text toggleWidget = widget;
//             if (toggleWidget.data != null) {
//               return toggleWidget.data.contains('OFF');
//             }
//             return toggleWidget.textSpan.toPlainText().contains('OFF');
//           }
//           return false;
//         }));
//
//         // Rebuild the widget after the state has changed.
//         await tester.pump();
//
//         // find disabled text color
//         expect(find.byWidgetPredicate((widget) {
//           if (widget is Text) {
//             final Text toggleWidget = widget;
//             if (toggleWidget.data != null) {
//               return toggleWidget.style.color == disabledTextStyle.color;
//             }
//           }
//           return false;
//         }), findsNothing);
//
//         // find enabled text color
//         expect(find.byWidgetPredicate((widget) {
//           if (widget is Text) {
//             final Text toggleWidget = widget;
//             if (toggleWidget.data != null) {
//               return toggleWidget.style.color == enabledTextStyle.color;
//             }
//           }
//           return false;
//         }), findsOneWidget);
//       });
//
//   testWidgets('GFToggle with type ios', (WidgetTester tester) async {
//     bool isOn = false;
//
//     final toggle = Directionality(
//       textDirection: TextDirection.ltr,
//       child: StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) => Material(
//             child: GFToggle(
//               key: toggleKey,
//               value: isOn,
//               enabledText: 'ON',
//               disabledText: 'OFF',
//               type: GFToggleType.ios,
//               onChanged: (value) {
//                 setState(() {
//                   isOn = value;
//                 });
//               },
//             ),
//           )),
//     );
//
//     // find toggle  key
//     await tester.pumpWidget(toggle);
//
//     // finds value false
//     expect(isOn, isFalse);
//
//     // find toggle type, ios
//     expect(find.byWidgetPredicate((widget) {
//       if (widget is DecoratedBox) {
//         final DecoratedBox toggleWidget = widget;
//         if (toggleWidget != null) {
//           final BoxDecoration toggle = toggleWidget.decoration;
//           return toggle.shape == BoxShape.circle;
//         }
//       }
//       return false;
//     }), findsOneWidget);
//   });
//
//   testWidgets('GFToggle can be constructed with long duration',
//           (WidgetTester tester) async {
//         bool isSelected = false;
//
//         final toggle = Directionality(
//           textDirection: TextDirection.ltr,
//           child: StatefulBuilder(
//             builder: (BuildContext context, StateSetter setState) => Material(
//               child: Center(
//                 child: GFToggle(
//                   key: toggleKey,
//                   value: isSelected,
//                   onChanged: (value) {
//                     setState(() {
//                       isSelected = value;
//                     });
//                   },
//                   duration: const Duration(milliseconds: 800),
//                 ),
//               ),
//             ),
//           ),
//         );
//
//         await tester.pumpWidget(toggle);
//
//         expect(isSelected, isFalse);
//         await tester.tap(find.byKey(toggleKey));
//         await tester.pump();
//         expect(isSelected, isTrue);
//       });
//
//   testWidgets('GFToggle with all properties.', (WidgetTester tester) async {
//     bool isOn = false;
//
//     final GFToggle toggle = GFToggle(
//       key: toggleKey,
//       value: isOn,
//       enabledText: 'ON',
//       disabledText: 'OFF',
//       enabledTextStyle: enabledTextStyle,
//       disabledTextStyle: disabledTextStyle,
//       disabledThumbColor: Colors.amber,
//       disabledTrackColor: Colors.amberAccent,
//       enabledThumbColor: Colors.teal,
//       enabledTrackColor: Colors.tealAccent,
//       boxShape: BoxShape.rectangle,
//       borderRadius: const BorderRadius.all(Radius.circular(4)),
//       duration: const Duration(milliseconds: 400),
//       type: GFToggleType.ios,
//       onChanged: (value) {
//         isOn = value;
//       },
//     );
//
//     final TestApp app = TestApp(toggle);
//     await tester.pumpWidget(app);
//
//     expect(app.toggle.value, isOn);
//     expect(app.toggle.enabledText, 'ON');
//     expect(app.toggle.disabledText, 'OFF');
//     expect(app.toggle.enabledTextStyle, enabledTextStyle);
//     expect(app.toggle.disabledTextStyle, disabledTextStyle);
//     expect(app.toggle.enabledThumbColor, Colors.teal);
//     expect(app.toggle.enabledTrackColor, Colors.tealAccent);
//     expect(app.toggle.disabledThumbColor, Colors.amber);
//     expect(app.toggle.disabledTrackColor, Colors.amberAccent);
//     expect(app.toggle.boxShape, BoxShape.rectangle);
//     expect(app.toggle.borderRadius, const BorderRadius.all(Radius.circular(4)));
//     expect(app.toggle.duration, const Duration(milliseconds: 400));
//     expect(app.toggle.type, GFToggleType.ios);
//   });
// }
//
// class TestApp extends StatefulWidget {
//   const TestApp(this.toggle);
//   final GFToggle toggle;
//   @override
//   _TestAppState createState() => _TestAppState();
// }
//
// class _TestAppState extends State<TestApp> {
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//     home: Scaffold(
//       body: Column(
//         children: [
//           widget.toggle,
//         ],
//       ),
//     ),
//   );
// }
