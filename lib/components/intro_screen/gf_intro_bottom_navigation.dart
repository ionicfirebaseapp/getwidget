import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GFIntroBottomNavigation extends StatelessWidget {
  const GFIntroBottomNavigation({
    Key key,
    this.forwardButtonText = 'NEXT',
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
    this.backButtonText = 'BACK',
    this.onBackButtonTap,
    this.backButton,
    this.forwardButton,
    this.dotShape = BoxShape.circle,
    this.defaultColor,
    this.activeColor,
    this.dotHeight,
    this.dotWidth,
    this.dotMargin,
    this.backButtonTextStyle,
    this.forwardButtonTextStyle,
    this.onDoneTap,
    this.doneText = 'GO',
  }) : super(key: key);

  final String forwardButtonText;
  final int pageNumber;
  final VoidCallback onNext;

  final Widget child;
  final int pagesCount;
  final String backButtonText;
  final VoidCallback onBackButtonTap;
  final VoidCallback onDoneTap;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Widget backButton;
  final Widget forwardButton;
  final TextStyle backButtonTextStyle;
  final TextStyle forwardButtonTextStyle;
  final String doneText;

  final bool showDivider;
  final double dividerHeight;
  final double dividerThickness;
  final Color dividerColor;

  ///dot
  final BoxShape dotShape;
  final Color defaultColor;
  final Color activeColor;
  final double dotHeight;
  final double dotWidth;
  final EdgeInsets dotMargin;

  @override
  Widget build(BuildContext context) => Column(
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
                  child: backButton ??
                      Text(
                        backButtonText,
                        style: backButtonTextStyle ??
                            const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                      ),
              onTap: onBackButtonTap,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: getDotsList(),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
                child: forwardButton ??
                    Text(
                        pageNumber == pagesCount - 1
                            ? doneText
                            : forwardButtonText,
                        style: forwardButtonTextStyle ??
                            const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            )
                    ),
              onTap: pageNumber == pagesCount - 1 ? onDoneTap : onNext,
            ),
          ],
        ),
      )
    ],
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
