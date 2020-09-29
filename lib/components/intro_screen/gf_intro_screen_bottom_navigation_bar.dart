import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFIntroScreenBottomNavigationBar extends StatelessWidget {
  const GFIntroScreenBottomNavigationBar({
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

  /// defines the currentIndex of [GFIntroScreen] slides, default value is 0
  final int currentIndex;

  /// defines the length of [GFIntroScreen] slides, default value is 0
  final int pageCount;

  /// defines [GFIntroScreenBottomNavigationBar], it takes any widget
  final Widget child;

  /// defines [GFIntroScreenBottomNavigationBar] height
  final double navigationBarHeight;

  /// defines [GFIntroScreenBottomNavigationBar] width
  final double navigationBarWidth;

  /// defines [GFIntroScreenBottomNavigationBar] padding
  final EdgeInsets navigationBarPadding;

  /// defines [GFIntroScreenBottomNavigationBar] margin
  final EdgeInsets navigationBarMargin;

  /// defines [GFIntroScreenBottomNavigationBar] color
  final dynamic navigationBarColor;

  /// defines the shape of [GFIntroScreenBottomNavigationBar]
  final ShapeBorder navigationBarShape;

  /// Called when the forward button is tapped
  final VoidCallback onForwardButtonTap;

  /// Called when the back button is tapped
  final VoidCallback onBackButtonTap;

  /// Called when the done button is tapped
  final VoidCallback onDoneTap;

  /// Called when the skip button is tapped
  final VoidCallback onSkipTap;

  /// defines the backButton widget
  final Widget backButton;

  /// defines the forwardButton widget
  final Widget forwardButton;

  /// defines the doneButton widget
  final Widget doneButton;

  /// defines the skipButton widget
  final Widget skipButton;

  /// defines the backButton text
  final String backButtonText;

  /// defines the forwardButton text
  final String forwardButtonText;

  /// defines the doneButton text
  final String doneButtonText;

  /// defines the skipButton text
  final String skipButtonText;

  /// defines the skipButton textStyle
  final TextStyle skipButtonTextStyle;

  /// defines the doneButton textStyle
  final TextStyle doneButtonTextStyle;

  /// defines the backButton textStyle
  final TextStyle backButtonTextStyle;

  /// defines the forwardButton textStyle
  final TextStyle forwardButtonTextStyle;

  /// on true state, displays [Divider], defaults to true
  final bool showDivider;

  /// on true state, displays buttons, defaults to true
  final bool showButton;

  /// on true state, displays pagination, defaults to true
  final bool showPagination;

  /// defines divider height
  final double dividerHeight;

  /// defines divider thickness
  final double dividerThickness;

  /// defines divider color
  final dynamic dividerColor;

  /// defines pagination shape
  final ShapeBorder dotShape;

  /// defines pagination inactive color
  final Color inActiveColor;

  /// defines pagination active color
  final Color activeColor;

  /// defines pagination height
  final double dotHeight;

  /// defines pagination width
  final double dotWidth;

  /// defines pagination in between space
  final EdgeInsets dotMargin;

  void onForwardButton() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  void onBackButton() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
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
                  child: child != null
                      ? Row(
                          children: [child],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            showButton
                                ? InkWell(
                                    child: currentIndex == 0
                                        ? skipButton ??
                                            Text(skipButtonText,
                                                style: skipButtonTextStyle)
                                        : backButton ??
                                            Text(backButtonText,
                                                style: backButtonTextStyle),
                                    onTap: currentIndex == 0
                                        ? onSkipTap
                                        : onBackButtonTap ?? onBackButton,
                                  )
                                : Container(),
                            showPagination
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: getDotsList(),
                                  )
                                : Container(),
                            showButton
                                ? InkWell(
                                    child: currentIndex == pageCount - 1
                                        ? doneButton ??
                                            Text(doneButtonText,
                                                style: doneButtonTextStyle)
                                        : forwardButton ??
                                            Text(forwardButtonText,
                                                style: forwardButtonTextStyle),
                                    onTap: currentIndex == pageCount - 1
                                        ? onDoneTap
                                        : onForwardButtonTap ?? onForwardButton,
                                  )
                                : Container(),
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
          shape: dotShape ??
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
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
