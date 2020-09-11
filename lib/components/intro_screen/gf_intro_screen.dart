import 'package:flutter/material.dart';
import 'package:getwidget/components/intro_screen/gf__intro_bottom_navigation.dart';
import 'package:getwidget/components/intro_screen/gf_intro_slide.dart';
import 'package:getwidget/types/gf_intro_type.dart';

class GFIntroScreen extends StatefulWidget {
  const GFIntroScreen(
      {Key key,
      this.slides,
      this.pageController,
      this.gfIntroBottomNavigation,
      this.type})
      : super(key: key);

  final List<Widget> slides;
  final GFIntroType type;
  final PageController pageController;
  final GFIntroBottomNavigation gfIntroBottomNavigation;

  @override
  _GFIntroScreenState createState() => _GFIntroScreenState();
}

class _GFIntroScreenState extends State<GFIntroScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int page = 0;

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
            color: Colors.transparent,
            borderRadius: widget.type == GFIntroType.fullWidth
                ? BorderRadius.circular(0)
                : widget.type == GFIntroType.rounded
                    ? BorderRadius.circular(20)
                    : BorderRadius.zero,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: PageView(
                controller: _pageController,
                children: widget.slides ?? slides(),
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
      imageHeight: 200,
      imageWidth: 200,
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
}
