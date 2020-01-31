import 'package:flutter/material.dart';

typedef void RatingChangeCallback(double rating);

class GFRating extends StatelessWidget {
  GFRating({
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
  }) {
    assert(this.rating != null);
  }

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
  final IconData filledIcon;

  /// defines the items when half-filled
  final IconData halfFilledIcon;

  /// defines the default items, when having filledIcon && halfFilledIcon
  final IconData defaultIcon;

  /// defines the space between items
  final double spacing;

  /// defines the rating value
  final double rating;

  /// return current rating whenever rating is updated
  final RatingChangeCallback onRatingChanged;

  Widget buildRatingBar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        defaultIcon != null ? defaultIcon : Icons.star_border,
        color: borderColor ?? Theme.of(context).primaryColor,
        size: itemSize,
      );
    } else if (index > rating - (allowHalfRating ? 0.5 : 1.0) &&
        index < rating) {
      icon = Icon(
        halfFilledIcon != null ? halfFilledIcon : Icons.star_half,
        color: color ?? Theme.of(context).primaryColor,
        size: itemSize,
      );
    } else {
      icon = Icon(
        filledIcon != null ? filledIcon : Icons.star,
        color: color ?? Theme.of(context).primaryColor,
        size: itemSize,
      );
    }

    return GestureDetector(
      onTap: () {
        if (onRatingChanged != null) onRatingChanged(index + 1.0);
      },
//      onHorizontalDragStart: ,
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: Wrap(
            alignment: WrapAlignment.center,
            spacing: spacing,
            children: List.generate(
                itemCount, (index) => buildRatingBar(context, index))),
      );
}
