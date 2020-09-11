import 'package:flutter/material.dart';
import 'package:getwidget/components/intro_screen/gf__intro_bottom_navigation.dart';
import 'package:getwidget/components/intro_screen/gf_intro_slide.dart';

class GFIntroScreen extends StatefulWidget {
  const GFIntroScreen(
      {Key key, this.slides, this.pageController, this.gfIntroBottomNavigation})
      : super(key: key);

  final List<Widget> slides;
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
  Widget build(BuildContext context) => Container(
        child: Column(
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
