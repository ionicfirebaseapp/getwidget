import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFIntroBottomNavigation extends StatelessWidget {
  const GFIntroBottomNavigation({
    Key key,
    this.pageNumber = 0,
    this.pagesCount = 0,
    this.child,

    this.navigationBarColor = GFColors.SUCCESS,
    this.navigationBarHeight = 50,
    this.navigationBarShape,
    this.navigationBarWidth,
    this.navigationBarPadding = const EdgeInsets.all(8),
    this.navigationBarMargin = const EdgeInsets.all(8),

    this.showDivider = true,
    this.dividerColor = Colors.white,
    this.dividerHeight = 1,
    this.dividerThickness = 2,

    this.dotShape = BoxShape.circle,
    this.inActiveColor,
    this.activeColor,
    this.dotHeight,
    this.dotWidth,
    this.dotMargin,

    this.backButton,
    this.forwardButton,
    this.doneButton,
    this.skipButton,
    this.onDoneTap,
    this.onForwardButtonTap,
    this.onBackButtonTap,
    this.onSkipTap,
    this.forwardButtonText = 'NEXT',
    this.backButtonText = 'BACK',
    this.doneButtonText = 'GO',
    this.skipButtonText = 'SKIP',
    this.skipButtonTextStyle = const TextStyle(color: Colors.black, fontSize: 16,),
    this.doneButtonTextStyle = const TextStyle(color: Colors.black, fontSize: 16,),
    this.backButtonTextStyle = const TextStyle(color: Colors.black, fontSize: 16,),
    this.forwardButtonTextStyle = const TextStyle(color: Colors.black, fontSize: 16,),
  }) : super(key: key);


  final int pageNumber;
  final int pagesCount;
  final Widget child;

  final double navigationBarHeight;
  final double navigationBarWidth;
  final EdgeInsets navigationBarPadding;
  final EdgeInsets navigationBarMargin;
  final dynamic navigationBarColor;
  /// defines the shape of [GFIntroBottomNavigation]
  final ShapeBorder navigationBarShape;

  final VoidCallback onForwardButtonTap;
  final VoidCallback onBackButtonTap;
  final VoidCallback onDoneTap;
  final VoidCallback onSkipTap;
  final Widget backButton;
  final Widget forwardButton;
  final Widget doneButton;
  final Widget skipButton;
  final String backButtonText;
  final String forwardButtonText;
  final String doneButtonText;
  final String skipButtonText;
  final TextStyle skipButtonTextStyle;
  final TextStyle doneButtonTextStyle;
  final TextStyle backButtonTextStyle;
  final TextStyle forwardButtonTextStyle;
  final bool showDivider;
  final double dividerHeight;
  final double dividerThickness;
  final Color dividerColor;
  final BoxShape dotShape;
  final Color inActiveColor;
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
      Material(
        child: Container(
          height: navigationBarHeight,
          width: navigationBarWidth,
          child: Material(
            shape: navigationBarShape,
            color: navigationBarColor,
            child: Container(
              padding: navigationBarPadding,
              margin: navigationBarMargin,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    child: pageNumber == 0 ? skipButton ?? Text(skipButtonText, style: skipButtonTextStyle) :
                      backButton ?? Text(backButtonText, style: backButtonTextStyle),
                    onTap: onBackButtonTap,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: getDotsList(),
                  ),
                  InkWell(
                    child: pageNumber == pagesCount - 1 ? doneButton ?? Text(doneButtonText, style: doneButtonTextStyle) :
                      forwardButton ?? Text(forwardButtonText, style: forwardButtonTextStyle),
                    onTap: pageNumber == pagesCount - 1 ? onDoneTap : onForwardButtonTap,
                  ),
                ],
              ),
            ),
          ),
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
              ? activeColor ?? GFColors.PRIMARY
              : inActiveColor ?? GFColors.LIGHT,
        ),
      ));
    }
    return list;
  }
}
