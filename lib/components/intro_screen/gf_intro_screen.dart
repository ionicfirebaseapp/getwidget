import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFIntroScreen extends StatefulWidget {
  const GFIntroScreen({
    Key key,
    @required this.pageController,
    @required this.slides,
    this.color,
    this.width,
    this.height,
    this.borderRadius,
    this.border,
    this.gfIntroBottomNavigation,
    this.showIntroBottomNavigation = true,
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

  ///
  final List<Widget> slides;

  /// default controller for the [GFIntroScreen] component
  final PageController pageController;

  /// background color of the [GFIntroScreen] component
  final Color color;

  final double height;

  final double width;

  final BorderRadius borderRadius;

  final Border border;

  /// [GFIntroScreen] bottom navigation will be used as [GFIntroBottomNavigation] component
  final GFIntroBottomNavigation gfIntroBottomNavigation;

  final bool showIntroBottomNavigation;




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

  @override
  _GFIntroScreenState createState() => _GFIntroScreenState();
}

class _GFIntroScreenState extends State<GFIntroScreen> {
  PageController _pageController;
  int currentIndex;
  List<Widget> pages;

  @override
  void initState() {
    _pageController = widget.pageController != null
        ? widget.pageController
        : PageController(initialPage: 0);
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
  Widget build(BuildContext context) => Center(
    child: Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
        border: widget.border ?? Border.all(width: 0),
        color: widget.color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: PageView(
              controller: _pageController,
              children: widget.slides,
            ),
          ),
          widget.showIntroBottomNavigation ? widget.gfIntroBottomNavigation ??
              GFIntroBottomNavigation(
                pageController: _pageController,
                pageCount: widget.slides.length,
                currentIndex: currentIndex,
                child: widget.child,
                navigationBarColor: widget.navigationBarColor,
                navigationBarHeight: widget.navigationBarHeight,
                navigationBarShape: widget.navigationBarWidth,
                navigationBarWidth,
                navigationBarPadding = const EdgeInsets.all(8),
                navigationBarMargin = const EdgeInsets.all(8),
                showDivider = true,
                dividerColor = Colors.white,
                dividerHeight = 1,
                dividerThickness = 2,
                dotShape,
                inActiveColor = GFColors.LIGHT,
                activeColor = GFColors.PRIMARY,
                dotHeight = 12,
                dotWidth = 12,
                dotMargin = const EdgeInsets.symmetric(horizontal: 2),
                backButton,
                forwardButton,
                doneButton,
                skipButton,
                onDoneTap,
                onForwardButtonTap,
                onBackButtonTap,
                onSkipTap,
                forwardButtonText = 'NEXT',
                backButtonText = 'BACK',
                doneButtonText = 'GO',
                skipButtonText = 'SKIP',
                skipButtonTextStyle = const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                doneButtonTextStyle = const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                backButtonTextStyle = const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                forwardButtonTextStyle = const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                showButton = true,
                showPagination = true,
              ) : Container(),
        ],
      ),
    ),
  );
}
