import 'package:flutter/material.dart';
import 'package:ui_kit/components/slider/gf_slider.dart';


List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class GFSliderWithIndicator extends StatefulWidget {
  GFSliderWithIndicator({
    @required this.items,
    this.activeIndicator,
    this.passiveIndicator,
  });

  /// The widgets to be shown as sliders.
  final List items;
  final Color activeIndicator;
  final Color passiveIndicator;

  @override
  _GFSliderWithIndicatorState createState() => _GFSliderWithIndicatorState();
}

class _GFSliderWithIndicatorState extends State<GFSliderWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GFSlider(
        items: widget.items.map(
    (url) {
      return Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Image.network(
            url,
            fit: BoxFit.cover,
            width: 1000.0,
          ),
        ),
      );
    },
    ).toList(),
        autoPlay: true,
        enlargeMainPage: true,
        aspectRatio: 2.0,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(
          widget.items,
              (index, url) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? widget.activeIndicator == null ? Color.fromRGBO(0, 0, 0, 0.9) : widget.activeIndicator
                      : widget.passiveIndicator == null ? Color.fromRGBO(0, 0, 0, 0.4) : widget.passiveIndicator,
              ),
            );
          },
        ),
      ),
    ]);
  }
}