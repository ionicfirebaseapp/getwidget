import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFIntroBottomNavigation extends StatelessWidget {
  const GFIntroBottomNavigation({
    Key key,
    this.pageController,
    this.currentIndex = 0,
    this.pageCount = 0,
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
    this.dotShape,
    this.inActiveColor = GFColors.LIGHT,
    this.activeColor = GFColors.PRIMARY,
    this.dotHeight = 12,
    this.dotWidth = 12,
    this.dotMargin = const EdgeInsets.symmetric(horizontal: 2),
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
    this.skipButtonTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    this.doneButtonTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    this.backButtonTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    this.forwardButtonTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    this.showButton = true,
    this.showPagination = true,
  }) : super(key: key);

  /// default controller for the [GFIntroScreen] component
  final PageController pageController;

  final int currentIndex;
  final int pageCount;
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
  final bool showButton;
  final bool showPagination;

  final double dividerHeight;
  final double dividerThickness;
  final dynamic dividerColor;

  final ShapeBorder dotShape;
  final Color inActiveColor;
  final Color activeColor;
  final double dotHeight;
  final double dotWidth;
  final EdgeInsets dotMargin;

  void onForwardButton() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear
    );
  }

  void onBackButton() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear
    );
  }

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
                  child: child != null ? Row(
                    children: [
                      child
                    ],
                  ) : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      showButton ? InkWell(
                        child: currentIndex == 0
                            ? skipButton ??
                                Text(skipButtonText, style: skipButtonTextStyle)
                            : backButton ??
                                Text(backButtonText,
                                    style: backButtonTextStyle),
                        onTap: currentIndex == 0 ? onSkipTap : onBackButtonTap ?? onBackButton,
                      ) : Container(),
                      showPagination ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: getDotsList(),
                      ) : Container(),
                      showButton ? InkWell(
                        child: currentIndex == pageCount - 1
                            ? doneButton ??
                                Text(doneButtonText, style: doneButtonTextStyle)
                            : forwardButton ??
                                Text(forwardButtonText,
                                    style: forwardButtonTextStyle),
                        onTap: currentIndex == pageCount - 1
                            ? onDoneTap
                            : onForwardButtonTap ?? onForwardButton,
                      ) : Container(),
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
    for (int i = 0; i < pageCount; i++) {
      list.add(Container(
        margin: dotMargin,
        child: Material(
          shape: dotShape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          color: currentIndex == i ? activeColor : inActiveColor,
          child: Container(
            width: dotWidth,
            height: dotHeight,
          ),
        ),
      ));
    }
    return list;
  }
}
