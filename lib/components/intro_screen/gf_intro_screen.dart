import 'package:flutter/material.dart';
import 'package:getwidget/components/intro_screen/gf__intro_bottom_navigation.dart';
import 'package:getwidget/components/intro_screen/gf_intro_slide.dart';

class GFIntroScreen extends StatefulWidget {
  @override
  _GFIntroScreenState createState() => _GFIntroScreenState();
}

class _GFIntroScreenState extends State<GFIntroScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int page = 0;

  @override
  void initState() {
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
              children: slides(),
            )),
            GFIntroBottomNavigation(
              onNext: () {
                if (mounted) {
                  setState(() {
                    page = _pageController.page.round() + 1;
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear);
                  });
                }
              },
              pagesCount: slides().length,
              pageNumber: page,
            )
          ],
        ),
      );

  List<Widget> slides() {
    final List<Widget> list = [];
    list.add(const GFIntroSlide(
      title: 'First',
      imageHeight: 200,
      imageWidth: 200,
      image: NetworkImage(
          'https://rukminim1.flixcart.com/image/832/832/kcc9q4w0/television/g/g/g/samsung-ua32t4010arxxl-ua32t4010arxxl-original-imafthw74azys6rp.jpeg?q=70'),
    ));
    list.add(const GFIntroSlide(
      title: 'Second',
      imageHeight: 200,
      imageWidth: 200,
      image: NetworkImage(
          'https://rukminim1.flixcart.com/image/832/832/kcc9q4w0/television/g/g/g/samsung-ua32t4010arxxl-ua32t4010arxxl-original-imafthw74azys6rp.jpeg?q=70'),
    ));
    list.add(const GFIntroSlide(
      title: 'Third',
      imageHeight: 200,
      imageWidth: 200,
      image: NetworkImage(
          'https://rukminim1.flixcart.com/image/832/832/kcc9q4w0/television/g/g/g/samsung-ua32t4010arxxl-ua32t4010arxxl-original-imafthw74azys6rp.jpeg?q=70'),
    ));
    list.add(const GFIntroSlide(
      title: 'Fourth',
      imageHeight: 200,
      imageWidth: 200,
      image: NetworkImage(
          'https://rukminim1.flixcart.com/image/832/832/kcc9q4w0/television/g/g/g/samsung-ua32t4010arxxl-ua32t4010arxxl-original-imafthw74azys6rp.jpeg?q=70'),
    ));
    list.add(const GFIntroSlide(
      title: 'Fifth',
      imageHeight: 200,
      imageWidth: 200,
      image: NetworkImage(
          'https://rukminim1.flixcart.com/image/832/832/kcc9q4w0/television/g/g/g/samsung-ua32t4010arxxl-ua32t4010arxxl-original-imafthw74azys6rp.jpeg?q=70'),
    ));
    return list;
  }
}
