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
                    pageController: _pageController,
                    pageCount: widget.slides.length,
                    currentIndex: page,
                    // child: Text('dfghj'),

                    // onForwardButtonTap: () {
                    //   print('fffffff');
                    //   // _pageController.nextPage(
                    //   //     duration: const Duration(milliseconds: 500),
                    //   //     curve: Curves.linear);
                    // },
                    // onBackButtonTap: () {
                    //   print('kkkkkkkkk');
                    //   // _pageController.previousPage(
                    //   //     duration: const Duration(milliseconds: 500),
                    //   //     curve: Curves.linear);
                    // },
                    // onDoneTap: (){
                    //   print('done');
                    // },
                    // onSkipTap: (){
                    //   print('skip');
                    // },
                    // backButtonTextStyle: TextStyle(
                    //   fontSize: 12
                    // ),
                    
                    // backButton: GFButton(onPressed: null, child: Text('back'),),
                    // forwardButton: GFButton(onPressed: null, child: Text('next'),),
                    // skipButton: GFButton(onPressed: null, child: Text('skip'),),
                    // doneButton: GFButton(onPressed: null, child: Text('done'),),

                    // backButtonText: 'bbbb',
                    // forwardButtonText: 'ffffff',
                    // skipButtonText: 'ssssss',
                    // doneButtonText: 'ddddddd',
                    
                    // navigationBarHeight: 100,
                    // navigationBarWidth: 300,
                    // navigationBarMargin: EdgeInsets.all(20),
                    // navigationBarPadding: EdgeInsets.all(20),
                    // navigationBarShape: RoundedRectangleBorder(
                    //   side: const BorderSide(color: Colors.blue, width: 4),
                    //   borderRadius: BorderRadius.circular(50),
                    // ),
                    // navigationBarColor: GFColors.SECONDARY,
                    //
                    // showDivider: true,
                    // dividerHeight: 2,
                    // dividerThickness: 13,
                    // dividerColor: GFColors.ALT,
                    //
                    // dotHeight: 10,
                    // dotWidth: 16,
                    // dotShape: RoundedRectangleBorder(
                    //   side: BorderSide(color: Colors.red, width: 2),
                    //     borderRadius: BorderRadius.circular(5)
                    // ),
                    // inActiveColor: GFColors.DARK,
                    // activeColor: GFColors.DANGER,
                    // dotMargin: EdgeInsets.symmetric(horizontal: 6),
                    //
                    // showButton: false,
                    // showPagination: true,
                  ),
            ],
          ),
        ),
      );
}
