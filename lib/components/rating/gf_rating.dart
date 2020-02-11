import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

typedef RatingChangeCallback = void Function(double rating);

class GFRating extends StatefulWidget {
  const GFRating({
    this.itemCount = 5,
    this.spacing = 0.0,
    this.value = 0.0,
    this.defaultIcon,
    this.onChanged,
    this.color,
    this.borderColor,
    this.size = GFSize.MEDIUM,
    this.filledIcon,
    this.halfFilledIcon,
    this.allowHalfRating = true,
    this.showTextForm = false,
    this.suffixIcon,
    this.controller,
    this.inputDecorations,
    this.margin = const EdgeInsets.symmetric(vertical: 16),
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  }) : assert(value != null);

  /// defines total number of rating items
  final int itemCount;

  /// defines the color of items
  final Color color;

  /// defines the border color of [halfFilledIcon]
  final Color borderColor;

  /// defines the size of items. GFSize can be used for size variations like small. medium. large
  final double size;

  /// if true, allow half rating of items. Default it will be in true state
  final bool allowHalfRating;

  /// defines the items when filled
  final Widget filledIcon;

  /// defines the items when half-filled
  final Widget halfFilledIcon;

  /// defines the default items, when having filledIcon && halfFilledIcon
  final Widget defaultIcon;

  /// defines the space between items
  final double spacing;

  /// defines the rating value
  final double value;

  /// return current rating whenever rating is updated
  final RatingChangeCallback onChanged;

  /// if true, shows rating [TextFormField] with the rating bar, that allows the user input to show rating
  final bool showTextForm;

  /// defines the design and funtion of rating [TextFormField]'s suffix icon
  final Widget suffixIcon;

  /// controls the [TextField] Controller of rating [TextFormField]
  final TextEditingController controller;

  /// defines the [InputDecoration] of rating [TextFormField]
  final InputDecoration inputDecorations;

  /// defines the margin of rating [TextFormField]
  final EdgeInsets margin;

  /// defines the padding of rating [TextFormField]
  final EdgeInsets padding;

  @override
  _GFRatingState createState() => _GFRatingState();
}

class _GFRatingState extends State<GFRating> {
  Widget buildRatingBar(BuildContext context, int index) {
    Widget icon;
    if (index >= widget.value) {
      icon = widget.defaultIcon ??
          Icon(
            Icons.star_border,
            color: widget.borderColor ?? Theme.of(context).primaryColor,
            size: widget.size,
          );
    } else if (!widget.showTextForm
        ? index > widget.value - (widget.allowHalfRating ? 0.5 : 1.0) &&
            index < widget.value
        : index + 1 == widget.value + 0.5) {
      icon = widget.halfFilledIcon ??
          Icon(
            Icons.star_half,
            color: widget.color ?? Theme.of(context).primaryColor,
            size: widget.size,
          );
    } else {
      icon = widget.filledIcon ??
          Icon(
            Icons.star,
            color: widget.color ?? Theme.of(context).primaryColor,
            size: widget.size,
          );
    }

    return GestureDetector(
      onTap: () {
        if (widget.onChanged != null) {
          widget.onChanged(index + 1.0);
        }
      },
      onHorizontalDragUpdate: (dragDetails) {
        final RenderBox box = context.findRenderObject();
        final _pos = box.globalToLocal(dragDetails.globalPosition);
        final i = _pos.dx / widget.size;
        var newRating = widget.allowHalfRating ? i : i.round().toDouble();
        if (newRating > widget.itemCount) {
          newRating = widget.itemCount.toDouble();
        }
        if (newRating < 0) {
          newRating = 0.0;
        }
        if (widget.onChanged != null) {
          widget.onChanged(newRating);
        }
      },
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) => widget.showTextForm
      ? Column(children: <Widget>[
          Container(
            margin: widget.margin,
            padding: widget.padding,
            child: TextFormField(
              controller: widget.controller,
              keyboardType: TextInputType.number,
              decoration: widget.inputDecorations ??
                  InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter rating',
                    labelText: 'Enter rating',
                    suffixIcon: widget.suffixIcon,
                  ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: widget.spacing,
              children: List.generate(
                widget.itemCount,
                (index) => buildRatingBar(context, index),
              ),
            ),
          )
        ])
      : Material(
          color: Colors.transparent,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: widget.spacing,
            children: List.generate(
              widget.itemCount,
              (index) => buildRatingBar(context, index),
            ),
          ),
        );
}
