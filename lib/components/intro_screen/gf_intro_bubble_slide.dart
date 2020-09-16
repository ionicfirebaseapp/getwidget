import 'package:flutter/material.dart';

import 'custom_clipper.dart';

class GFIntroBubbleSlide extends StatelessWidget {
  const GFIntroBubbleSlide(
      {Key key,
      this.onNext,
      this.onNextTitle = 'Ok next',
      this.child,
      this.alignment,
      this.color = Colors.blue})
      : super(key: key);

  final Function onNext;
  final String onNextTitle;
  final Widget child;
  final Color color;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          Align(
            alignment: alignment ?? Alignment.topCenter,
            child: ClipOval(
              clipper: MyCustomClipper(alignment: alignment),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                padding: const EdgeInsets.only(left:16,right: 16, top: 24, bottom: 24),
                color: color.withOpacity(0.5),
                child: child ??
                    RawMaterialButton(
                        child: Text(onNextTitle), onPressed: onNext),
              ),
            ),
          ),
        ],
      );
}
