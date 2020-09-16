import 'package:flutter/material.dart';
import 'package:getwidget/components/intro_screen/gf__intro_bottom_navigation.dart';
import 'package:getwidget/components/intro_screen/gf_intro_bubble_slide.dart';
import 'package:getwidget/components/intro_screen/gf_intro_slide.dart';
import 'package:getwidget/types/gf_intro_type.dart';

class GFIntroScreen extends StatefulWidget {
  const GFIntroScreen(
      {Key key,
      this.slides,
      this.pageController,
      this.gfIntroBottomNavigation,
      this.type,
      this.color = Colors.white})
      : super(key: key);

  final List<Widget> slides;
  final GFIntroType type;
  final PageController pageController;
  final GFIntroBottomNavigation gfIntroBottomNavigation;
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
  Widget build(BuildContext context) => widget.type == GFIntroType.bubble
      ? buildBubbleType()
      : Center(
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
                    children: widget.slides ?? slides(),
                  ),
                )),
                widget.gfIntroBottomNavigation ??
                    GFIntroBottomNavigation(
                      onNext: () {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear);
                      },
                      pagesCount: widget.slides ?? slides().length,
                      pageNumber: page,
                    )
              ],
            ),
          ),
        );

  List<Widget> slides() {
    final List<Widget> list = [];
    list.add(const GFIntroSlide(
      backgroundColor: Colors.white,
      title: 'First',
      imageHeight: 100,
      imageWidth: 100,
      image: NetworkImage('https://www.gstatic.com/webp/gallery/3.jpg'),
    ));
    list.add(const GFIntroSlide(
      backgroundColor: Colors.yellow,
      title: 'Second',
      imageHeight: 200,
      imageWidth: 200,
      image: NetworkImage('https://www.gstatic.com/webp/gallery/1.jpg'),
    ));
    list.add(const GFIntroSlide(
      backgroundColor: Colors.brown,
      title: 'Third',
      imageHeight: 200,
      imageWidth: 200,
      image: NetworkImage('https://www.gstatic.com/webp/gallery/2.jpg'),
    ));
    list.add(const GFIntroSlide(
      backgroundColor: Colors.purple,
      title: 'Fourth',
      imageHeight: 200,
      imageWidth: 200,
      image: NetworkImage('https://www.gstatic.com/webp/gallery/3.jpg'),
    ));
    list.add(const GFIntroSlide(
      backgroundColor: Colors.orange,
      title: 'Fifth',
      imageHeight: 200,
      imageWidth: 200,
      image: NetworkImage('https://www.gstatic.com/webp/gallery/4.jpg'),
    ));
    return list;
  }

  Widget buildBubbleType() => SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: PageView(
            physics: const ScrollPhysics(),
            children: bubbleSlides(),
            controller: _pageController,
          ),
        ),
      );

  List<Widget> bubbleSlides() {
    final List<Widget> list = [];
    list.add(GFIntroBubbleSlide(
      onNext: () => nextSlider,
      alignment: Alignment.topLeft,
    ));
    list.add(GFIntroBubbleSlide(
      onNext: () => nextSlider,
      alignment: Alignment.topRight,
    ));
    return list;
  }

  // ignore: type_annotate_public_apis, always_declare_return_types
  nextSlider() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }
}
