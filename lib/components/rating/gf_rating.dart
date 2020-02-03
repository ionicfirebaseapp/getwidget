import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class GFRating extends StatefulWidget {
  const GFRating({
    this.itemCount = 5,
    this.spacing = 0.0,
    this.rating = 0.0,
    this.defaultIcon,
    this.onRatingChanged,
    this.color,
    this.borderColor,
    this.itemSize = 25,
    this.filledIcon,
    this.halfFilledIcon,
    this.allowHalfRating = true,
    this.textFormRating = false,
    this.suffixIcon,
    this.ratingController,
    this.inputDecorations,
    this.margin,
    this.padding,
  }) : assert(rating != null);

  /// defines total number of rating items
  final int itemCount;

  /// defines the color of items
  final Color color;

  /// defines the border color of [halfFilledIcon]
  final Color borderColor;

  /// defines the size of items
  final double itemSize;

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
  final double rating;

  /// return current rating whenever rating is updated
  final RatingChangeCallback onRatingChanged;

  final bool textFormRating;

  final Widget suffixIcon;

  final TextEditingController ratingController;

  final InputDecoration inputDecorations;

  final EdgeInsets margin;

  final EdgeInsets padding;

  @override
  _GFRatingState createState() => _GFRatingState();
}

class _GFRatingState extends State<GFRating> {
  Widget buildRatingBar(BuildContext context, int index) {
    Widget icon;
    if (index >= widget.rating) {
      icon = widget.defaultIcon != null
          ? widget.defaultIcon
          : Icon(
              Icons.star_border,
              color: widget.borderColor ?? Theme.of(context).primaryColor,
              size: widget.itemSize,
            );
    } else if (!widget.textFormRating
        ? index > widget.rating - (widget.allowHalfRating ? 0.5 : 1.0) &&
            index < widget.rating
        : index + 1 == widget.rating + 0.5) {
      icon = widget.halfFilledIcon != null
          ? widget.halfFilledIcon
          : Icon(
              Icons.star_half,
              color: widget.color ?? Theme.of(context).primaryColor,
              size: widget.itemSize,
            );
    } else {
      icon = widget.filledIcon != null
          ? widget.filledIcon
          : Icon(
              Icons.star,
              color: widget.color ?? Theme.of(context).primaryColor,
              size: widget.itemSize,
            );
    }

    return GestureDetector(
      onTap: () {
        if (widget.onRatingChanged != null) {
          widget.onRatingChanged(index + 1.0);
        }
      },
      onHorizontalDragUpdate: (dragDetails) {
        RenderBox box = context.findRenderObject();
        var _pos = box.globalToLocal(dragDetails.globalPosition);
        var i = _pos.dx / widget.itemSize;
        var newRating = widget.allowHalfRating ? i : i.round().toDouble();
        if (newRating > widget.itemCount) {
          newRating = widget.itemCount.toDouble();
        }
        if (newRating < 0) {
          newRating = 0.0;
        }
        if (widget.onRatingChanged != null) {
          widget.onRatingChanged(newRating);
        }
      },
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) => widget.textFormRating
      ? Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              controller: widget.ratingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
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
