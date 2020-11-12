import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFIntroScreenBottomNavigationBar extends StatefulWidget {
  const GFIntroScreenBottomNavigationBar({
    Key key,
    @required this.pageController,
    @required this.currentIndex,
    @required this.pageCount,
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
    this.inactiveColor = GFColors.DANGER,
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
  final Color navigationBarColor;

  /// defines the shape of [GFIntroScreenBottomNavigationBar]
  final ShapeBorder navigationBarShape;

  /// Called when the [forwardButtonText]  is tapped
  final VoidCallback onForwardButtonTap;

  /// Called when the [backButtonText] is tapped
  final VoidCallback onBackButtonTap;

  /// Called when the [doneButtonText] is tapped
  final VoidCallback onDoneTap;

  /// Called when the [skipButtonText] is tapped
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
  final Color dividerColor;

  /// defines pagination shape
  final ShapeBorder dotShape;

  /// defines pagination inactive color
  final Color inactiveColor;

  /// defines pagination active color
  final Color activeColor;

  /// defines pagination height
  final double dotHeight;

  /// defines pagination width
  final double dotWidth;

  /// defines pagination in between space
  final EdgeInsets dotMargin;

  @override
  _GFIntroScreenBottomNavigationBarState createState() =>
      _GFIntroScreenBottomNavigationBarState();
}

class _GFIntroScreenBottomNavigationBarState
    extends State<GFIntroScreenBottomNavigationBar> {
  PageController _pageController;
  int currentIndex;
  List<Widget> pages;

  @override
  void initState() {
    _pageController = widget.pageController;
    currentIndex = _pageController.initialPage;
    if (widget.pageController != null) {
      _pageController = widget.pageController;
    }
    _pageController.addListener(() {
      if (mounted) {
        setState(() {
          currentIndex = _pageController.page.round();
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    if (_pageController != null) {
      _pageController.dispose();
    }
    super.dispose();
  }

  void onForwardButton() {
    widget.pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  void onBackButton() {
    widget.pageController.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          widget.showDivider
              ? Divider(
                  height: widget.dividerHeight,
                  thickness: widget.dividerThickness,
                  color: widget.dividerColor,
                )
              : Container(),
          Container(
            height: widget.navigationBarHeight,
            width: widget.navigationBarWidth,
            child: Material(
              shape: widget.navigationBarShape,
              color: widget.navigationBarColor,
              child: Container(
                padding: widget.navigationBarPadding,
                margin: widget.navigationBarMargin,
                child: widget.child != null
                    ? Row(
                        children: [widget.child],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          widget.showButton
                              ? InkWell(
                                  child: currentIndex == 0
                                      ? widget.skipButton ??
                                          Text(widget.skipButtonText,
                                              style: widget.skipButtonTextStyle)
                                      : widget.backButton ??
                                          Text(widget.backButtonText,
                                              style:
                                                  widget.backButtonTextStyle),
                                  onTap: currentIndex == 0
                                      ? widget.onSkipTap
                                      : widget.onBackButtonTap ?? onBackButton,
                                )
                              : Container(),
                          widget.showPagination
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: getDotsList(),
                                )
                              : Container(),
                          widget.showButton
                              ? InkWell(
                                  child: currentIndex == widget.pageCount - 1
                                      ? widget.doneButton ??
                                          Text(widget.doneButtonText,
                                              style: widget.doneButtonTextStyle)
                                      : widget.forwardButton ??
                                          Text(widget.forwardButtonText,
                                              style: widget
                                                  .forwardButtonTextStyle),
                                  onTap: currentIndex == widget.pageCount - 1
                                      ? widget.onDoneTap
                                      : widget.onForwardButtonTap ??
                                          onForwardButton,
                                )
                              : Container(),
                        ],
                      ),
              ),
            ),
          )
        ],
      );

  List<Widget> getDotsList() {
    final List<Widget> list = [];
    for (int i = 0; i < widget.pageCount; i++) {
      list.add(Container(
        margin: widget.dotMargin,
        child: Material(
          shape: widget.dotShape ??
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          color: currentIndex == i ? widget.activeColor : widget.inactiveColor,
          child: Container(
            width: widget.dotWidth,
            height: widget.dotHeight,
          ),
        ),
      ));
    }
    return list;
  }
}
