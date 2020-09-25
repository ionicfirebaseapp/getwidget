import 'package:flutter/material.dart';
import 'package:getwidget/components/intro_screen/gf_intro_bottom_navigation.dart';
import 'package:getwidget/components/intro_screen/gf_intro_slide.dart';
import 'package:getwidget/types/gf_intro_type.dart';

class GFIntroScreen extends StatefulWidget {
  const GFIntroScreen(
      {Key key,
      this.slides,
      this.pageController,
      this.gfIntroBottomNavigation,
      this.type = GFIntroType.fullWidth,
      this.color = Colors.white
      })
      : super(key: key);

  /// if the type as [GFIntroType.fullWidth],[GFIntroType.half],[GFIntroType.rounded] use [GFIntroSlide]'s or customWidgets
  final List<Widget> slides;

  /// type of [GFIntroType] which takes the type ie, fullWidth, half,rounded and bubble for the [GFIntroScreen]
  final GFIntroType type;

  /// default controller for the [GFIntroScreen] component
  final PageController pageController;

  /// [GFIntroScreen] bottom navigation will be used as [GFIntroBottomNavigation] component
  final GFIntroBottomNavigation gfIntroBottomNavigation;

  /// background color of the [GFIntroScreen] component
  final Color color;

  @override
  _GFIntroScreenState createState() => _GFIntroScreenState();
}

class _GFIntroScreenState extends State<GFIntroScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int page = 0;
  List<Widget> pages;

  @override
  void initState() {
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
          width: widget.type == GFIntroType.fullWidth
              ? MediaQuery.of(context).size.width
              : MediaQuery.of(context).size.width * 0.885,
          height: widget.type != GFIntroType.fullWidth
              ? MediaQuery.of(context).size.height / 2
              : MediaQuery.of(context).size.height,
          margin: widget.type != GFIntroType.fullWidth
              ? const EdgeInsets.only(left: 20, right: 20)
              : const EdgeInsets.only(left: 0, right: 0),
          padding: widget.type == GFIntroType.fullWidth
              ? const EdgeInsets.all(0)
              : const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: widget.type == GFIntroType.fullWidth
                ? BorderRadius.circular(0)
                : widget.type == GFIntroType.rounded
                    ? BorderRadius.circular(24)
                    : BorderRadius.zero,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: ClipRRect(
                borderRadius: widget.type == GFIntroType.rounded
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))
                    : BorderRadius.zero,
                child: PageView(
                  controller: _pageController,
                  children: widget.slides,
                ),
              )),
              widget.gfIntroBottomNavigation ??
                  GFIntroBottomNavigation(
                    onNext: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    pagesCount: widget.slides.length,
                    pageNumber: page,
                  )
            ],
          ),
        ),
      );
}
