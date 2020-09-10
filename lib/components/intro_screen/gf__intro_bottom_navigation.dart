import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';

class GFIntroBottomNavigation extends StatelessWidget {
  const GFIntroBottomNavigation(
      {Key key,
      this.rightText = 'NEXT',
      this.pageNumber = 0,
      this.onNext,
      this.showDivider = true,
      this.dividerColor = Colors.grey,
      this.dividerHeight = 1,
      this.dividerThickness = 0.0,
      this.child,
      this.padding = const EdgeInsets.all(8),
      this.margin = const EdgeInsets.all(8),
      this.pagesCount = 4,
      this.skipText = 'SKIP',
      this.onSkipTap,
      this.skipWidget,
      this.nextWidget,
      this.pageCount = 1})
      : super(key: key);

  final String rightText;
  final int pageNumber;
  final VoidCallback onNext;
  final bool showDivider;
  final double dividerHeight;
  final double dividerThickness;
  final Color dividerColor;
  final Widget child;
  final int pagesCount;
  final String skipText;
  final VoidCallback onSkipTap;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Widget skipWidget;
  final Widget nextWidget;
  final int pageCount;

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            showDivider
                ? Divider(
                    height: dividerHeight,
                    thickness: dividerThickness,
                    color: dividerColor,
                  )
                : Container(),
            Container(
              padding: padding,
              margin: margin,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 8,
                          left: 24,
                          right: 32,
                        ),
                        child: skipWidget ?? Text(skipText)),
                    onTap: onSkipTap,
                  ),
                  SizedBox(
                    height: 40,
                    width: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: pageCount,
                      itemBuilder: (context, index) => Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: pageCount == 0
                              ? const Color(0xff3adecb)
                              : const Color(0xffd3d3d3),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 8, left: 32, right: 24),
                      child: nextWidget ?? Text(rightText),
                    ),
                    onTap: onNext,
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
