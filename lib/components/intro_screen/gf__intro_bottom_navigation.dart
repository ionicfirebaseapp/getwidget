import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GFIntroBottomNavigation extends StatelessWidget {
  const GFIntroBottomNavigation({
    Key key,
    this.rightText = 'NEXT',
    this.pageNumber = 0,
    this.onNext,
    this.showDivider = true,
    this.dividerColor = Colors.grey,
    this.dividerHeight = 1,
    this.dividerThickness = 0.0,
    this.child,
    this.padding = const EdgeInsets.all(8),
    this.margin = const EdgeInsets.all(8),
    this.pagesCount = 0,
    this.skipText = 'SKIP',
    this.onSkipTap,
    this.skipWidget,
    this.rightWidget,
    this.dotShape = BoxShape.rectangle,
    this.defaultColor,
    this.activeColor,
    this.dotHeight,
    this.dotWidth,
    this.dotMargin,
    this.skipStyle,
    this.rightStyle,
    this.onDoneTap,
    this.doneText = 'GO',
  }) : super(key: key);

  final String rightText;
  final int pageNumber;
  final VoidCallback onNext;
  final bool showDivider;
  final double dividerHeight;
  final double dividerThickness;
  final Color dividerColor;
  final Widget child;
  final int pagesCount;
  final String skipText;
  final VoidCallback onSkipTap;
  final VoidCallback onDoneTap;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Widget skipWidget;
  final Widget rightWidget;
  final TextStyle skipStyle;
  final TextStyle rightStyle;
  final String doneText;

  ///dot
  final BoxShape dotShape;
  final Color defaultColor;
  final Color activeColor;
  final double dotHeight;
  final double dotWidth;
  final EdgeInsets dotMargin;

  @override
  Widget build(BuildContext context) => Container(
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              showDivider
                  ? Divider(
                      height: dividerHeight,
                      thickness: dividerThickness,
                      color: dividerColor,
                    )
                  : Container(),
              Container(
                padding: padding,
                margin: margin,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                            left: 24,
                            right: 32,
                          ),
                          child: skipWidget ??
                              Text(
                                skipText,
                                style: skipStyle ??
                                    const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                              )),
                      onTap: onSkipTap,
                    ),
                    Expanded(
                      child: Container(
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: getDotsList(),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8, left: 32, right: 24),
                        child: rightWidget ??
                            Text(
                                pageNumber == pagesCount - 1
                                    ? doneText
                                    : rightText,
                                style: rightStyle ??
                                    const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    )),
                      ),
                      onTap: pageNumber == pagesCount - 1 ? onDoneTap : onNext,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );

  List<Widget> getDotsList() {
    final List<Widget> list = [];
    for (int i = 0; i < pagesCount; i++) {
      list.add(Container(
        width: dotWidth ?? 12,
        height: dotHeight ?? 12,
        margin: dotMargin ?? const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          shape: dotShape,
          color: pageNumber == i
              ? activeColor ?? Colors.blue
              : defaultColor ?? Colors.grey.withOpacity(0.5),
        ),
      ));
    }
    return list;
  }
}
