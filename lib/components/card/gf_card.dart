import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

/// A material design card. A card has slightly rounded corners and a shadow.
///
/// A card is a sheet of [Material] used to represent some related information,
/// for example an album, a geographical location, a meal, contact details, etc.
class GFCard extends StatelessWidget {
  /// Creates a material design card.
  ///
  /// The [elevation] must be null or non-negative. The [borderOnForeground]
  /// must not be null.
  const GFCard(
      {Key key,
      this.color,
      this.elevation,
      this.shape,
      this.borderOnForeground = true,
      this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      this.margin,
      this.clipBehavior,
      this.semanticContainer,
      this.title,
      this.content,
      this.image,
      this.buttonBar,
      this.imageOverlay,
      this.titlePosition,
      this.borderRadius,
      this.border,
      this.boxFit,
      this.colorFilter,
      this.height,
      this.gradient})
      : assert(elevation == null || elevation >= 0.0),
        assert(borderOnForeground != null),
        assert(
            color == null || gradient == null,
            'Cannot provide both a color and a decoration\n'
            'The color argument is just a shorthand for "decoration: new BoxDecoration(color: color)".'),
        super(key: key);

  /// defines the card's height
  final double height;

  /// [GFPosition] titlePosition helps to set titlebar at top of card
  final GFPosition titlePosition;

  /// The card's background color.
  final Color color;

  /// The z-coordinate at which to place this card. This controls the size of the shadow below the card.
  final double elevation;

  /// The shape of the card's [Material].
  final ShapeBorder shape;

  /// Whether to paint the [shape] border in front of the child.
  final bool borderOnForeground;

  /// If this property is null then [ThemeData.cardTheme.clipBehavior] is used.
  final Clip clipBehavior;

  /// The empty space that surrounds the card. Defines the card's outer [Container.margin].
  final EdgeInsetsGeometry margin;

  /// The empty space that surrounds the card. Defines the card's outer [Container.padding]..
  final EdgeInsetsGeometry padding;

  /// Whether this widget represents a single semantic container, or if false
  /// a collection of individual semantic nodes.
  final bool semanticContainer;

  /// The title to display inside the GFTitleBar. see GFTitleBar
  final GFListTile title;

  /// widget can be used to define content
  final Widget content;

  /// image widget can be used
  final Image image;

  /// overlay image [GFImageOverlay] widget can be used
  /// to display image with shaded overlay
  final ImageProvider imageOverlay;

  /// widget can be used to define buttons bar, see [GFButtonBar]
  final GFButtonBar buttonBar;

  /// How the image should be inscribed into the box.
  /// The default is [BoxFit.scaleDown] if centerSlice is null, and
  /// [BoxFit.fill] if centerSlice is not null.
  /// [boxFit] for only [GFImageOverlay]
  final BoxFit boxFit;

  /// A color filter to apply to the image before painting it.
  final ColorFilter colorFilter;

  /// The corners of this [GFCard] are rounded by this [BorderRadius].
  final BorderRadiusGeometry borderRadius;

  /// A border to draw above the [GFCard].
  final Border border;

  /// defines the gradient background
  final LinearGradient gradient;

  static const double _defaultElevation = 1;
  static const Clip _defaultClipBehavior = Clip.none;

  @override
  Widget build(BuildContext context) {
    final CardTheme cardTheme = CardTheme.of(context);

    final Widget cardChild = Column(
      children: <Widget>[
        titlePosition == GFPosition.start
            ? title ?? Container()
            : image != null
                ? ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(4)),
                    child: image,
                  )
                : Container(),
        titlePosition == GFPosition.start
            ? image ?? Container()
            : title ?? Container(),
        Padding(
          padding: padding,
          child: content ?? Container(),
        ),
        buttonBar ?? Container(),
      ],
    );

    final Widget overlayImage = GFImageOverlay(
      width: MediaQuery.of(context).size.width,
      child: cardChild,
      color: color ?? cardTheme.color ?? Theme.of(context).cardColor,
      image: imageOverlay,
      boxFit: boxFit,
      colorFilter: colorFilter,
      border: border,
      borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(4)),
    );

    return Container(
      height: height,
      margin: margin ?? cardTheme.margin ?? const EdgeInsets.all(16),
      decoration: gradient != null
          ? BoxDecoration(
              gradient: gradient,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            )
          : null,
      child: gradient == null
          ? Material(
              type: MaterialType.card,
              color: color ?? cardTheme.color ?? Theme.of(context).cardColor,
              elevation: elevation ?? cardTheme.elevation ?? _defaultElevation,
              shape: shape ??
                  cardTheme.shape ??
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
              borderOnForeground: borderOnForeground,
              clipBehavior: clipBehavior ??
                  cardTheme.clipBehavior ??
                  _defaultClipBehavior,
              child: imageOverlay == null ? cardChild : overlayImage,
            )
          : imageOverlay == null ? cardChild : overlayImage,
    );
  }
}
