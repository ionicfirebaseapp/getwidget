import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFIntroScreen extends StatefulWidget {
  const GFIntroScreen(
      {Key key,
      @required this.slides,
      // this.type = GFIntroType.fullWidth,
      this.color = Colors.white,
        this.width,
        this.height,
        this.border,
        this.borderRadius,
        this.pageController,
        this.gfIntroBottomNavigation,
      })
      : super(key: key);

  /// if the type as [GFIntroType.fullWidth],[GFIntroType.half],[GFIntroType.rounded] use [GFIntroSlide]'s or customWidgets
  final List<Widget> slides;

  // /// type of [GFIntroType] which takes the type ie, fullWidth, half,rounded and bubble for the [GFIntroScreen]
  // final GFIntroType type;

  /// default controller for the [GFIntroScreen] component
  final PageController pageController;

  /// [GFIntroScreen] bottom navigation will be used as [GFIntroBottomNavigation] component
  final GFIntroBottomNavigation gfIntroBottomNavigation;

  /// background color of the [GFIntroScreen] component
  final Color color;

  final double height;

  final double width;

  final BorderRadius borderRadius;

  final Border border;

  @override
  _GFIntroScreenState createState() => _GFIntroScreenState();
}

class _GFIntroScreenState extends State<GFIntroScreen> {
  PageController _pageController;
  int page;
  List<Widget> pages;

  @override
  void initState() {
    _pageController = widget.pageController != null ? widget.pageController : PageController(initialPage: 0);
    page = _pageController.initialPage;
    if (widget.pageController != null) {
      _pageController = widget.pageController;
    }
    _pageController.addListener(() {
      if (mounted) {
        setState(() {
          page = _pageController.page.round();
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
            color: widget.color,
            borderRadius: widget.borderRadius,
            border: widget.border
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: ClipRRect(
                borderRadius: widget.borderRadius == null ? BorderRadius.circular(0) : widget.borderRadius,
                child: PageView(
                  controller: _pageController,
                  children: widget.slides,
                ),
              )),
              widget.gfIntroBottomNavigation ??
                  GFIntroBottomNavigation(
                    onForwardButtonTap: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    onBackButtonTap: () {
                      _pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    pagesCount: widget.slides.length,
                    pageNumber: page,
                    navigationBarShape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.blue, width: 4),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    navigationBarColor: GFColors.SECONDARY,
                  ),
            ],
          ),
        ),
      );
}
