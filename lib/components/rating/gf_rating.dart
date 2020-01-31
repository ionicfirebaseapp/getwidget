import 'package:flutter/material.dart';

typedef void RatingChangeCallback(double rating);

class GFRating extends StatelessWidget {

  GFRating({
    this.itemCount = 5,
    this.spacing=0.0,
    this.rating = 0.0,
    this.defaultIcon,
    this.onRatingChanged,
    this.color,
    this.borderColor,
    this.iconSize = 25,
    this.filledIcon,
    this.halfFilledIcon,
    this.allowHalfRating = true,
  }) {
    assert(this.rating != null);
  }

  final int itemCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;
  final Color borderColor;
  final double iconSize;
  final bool allowHalfRating;
  final IconData filledIcon;
  final IconData halfFilledIcon;
  final IconData defaultIcon; //this is needed only when having fullRatedIconData && halfRatedIconData
  final double spacing;


  Widget buildRatingBar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        defaultIcon != null ? defaultIcon : Icons.star_border,
        color: borderColor ?? Theme.of(context).primaryColor,
        size: iconSize,
      );
    } else if (index > rating - (allowHalfRating ? 0.5 : 1.0) &&
        index < rating) {
      icon = Icon(
        halfFilledIcon != null ? halfFilledIcon : Icons.star_half,
        color: color ?? Theme.of(context).primaryColor,
        size: iconSize,
      );
    } else {
      icon = Icon(
        filledIcon != null ? filledIcon : Icons.star,
        color: color ?? Theme.of(context).primaryColor,
        size: iconSize,
      );
    }

    return GestureDetector(
      onTap: () {
        if (onRatingChanged != null) onRatingChanged(index + 1.0);
      },
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