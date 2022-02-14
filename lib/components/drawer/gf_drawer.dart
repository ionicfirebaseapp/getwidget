import 'package:flutter/material.dart';

/// The possible alignments of a [GFDrawer].
enum GFDrawerAlignment {
  /// Denotes that the [GFDrawer] is at the start side of the [Scaffold].
  ///
  /// This corresponds to the left side when the text direction is left-to-right
  /// and the right side when the text direction is right-to-left.
  start,

  /// Denotes that the [GFDrawer] is at the end side of the [Scaffold].
  ///
  /// This corresponds to the right side when the text direction is left-to-right
  /// and the left side when the text direction is right-to-left.
  end,
}

// Mobile:
// Width = Screen width − 56 dp
// Maximum width: 320dp
// Maximum width applies only when using a left nav. When using a right nav,
// the panel can cover the full width of the screen.

// Desktop/Tablet:
// Maximum width for a left nav is 400dp.
// The right nav can vary depending on content.

const double _kWidth = 304;
// const double _kEdgeDragWidth = 20.0;
// const double _kMinFlingVelocity = 365.0;
// const Duration _kBaseSettleDuration = Duration(milliseconds: 246);

/// A material design panel that slides in horizontally from the edge of a
/// [Scaffold] to show navigation links in an application.
///
/// GFDrawers are typically used with the [Scaffold.drawer] property. The child of
/// the drawer is usually a [ListView] whose first child is a GFDrawerHeader
/// that displays status information about the current user. The remaining
/// drawer children are often constructed with [ListTile]s, often concluding
/// with an [AboutListTile].
///
/// The [AppBar] automatically displays an appropriate [IconButton] to show the
/// [GFDrawer] when a [GFDrawer] is available in the [Scaffold]. The [Scaffold]
/// automatically handles the edge-swipe gesture to show the drawer.
///
/// This example shows how to create a [Scaffold] that contains an [AppBar] and
/// a [GFDrawer]. A user taps the "menu" icon in the [AppBar] to open the
/// [GFDrawer]. The [GFDrawer] displays four items: A header and three menu items.
/// The [GFDrawer] displays the four items using a [ListView], which allows the
/// user to scroll through the items if need be.
///
class GFDrawer extends StatelessWidget {
  /// Creates a material design drawer.
  /// Typically used in the [Scaffold.drawer] property.
  /// The [elevation] must be non-negative.
  const GFDrawer({
    Key? key,
    this.elevation = 16.0,
    this.child,
    this.semanticLabel,
    this.backgroundImage,
    this.colorFilter,
    this.gradient,
    this.color,
  })  : assert(elevation >= 0.0),
        super(key: key);

  /// The z-coordinate at which to place this drawer relative to its parent.
  ///
  /// This controls the size of the shadow below the drawer.
  ///
  /// Defaults to 16, the appropriate elevation for drawers. The value is
  /// always non-negative.
  final double elevation;

  /// The widget below this widget in the tree.
  ///
  /// Typically a [SliverList].
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;

  /// The semantic label of the dialog used by accessibility frameworks to
  /// announce screen transitions when the drawer is opened and closed.
  ///
  /// If this label is not provided, it will default to
  /// [MaterialLocalizations.drawerLabel].
  ///
  /// See also:
  ///
  ///  * SemanticsConfiguration.namesRoute, for a description of how this
  ///    value is used.
  final String? semanticLabel;

  /// Background image can be added to the [GFDrawer].
  final ImageProvider? backgroundImage;

  /// A composited layer that applies a color filter to its children.
  final ColorFilter? colorFilter;

  ///  Gradient can be used for transforming gradient shaders without
  ///  applying the same transform to the entire canvas.
  final Gradient? gradient;

  /// Defines the background color of the drawer
  final Color? color;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    String? label = semanticLabel;
    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
        label = semanticLabel;
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        label = semanticLabel ?? MaterialLocalizations.of(context).drawerLabel;
        break;
      default:
        break;
    }
    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: label,
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(width: _kWidth),
        child: Material(
          elevation: elevation,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              gradient: gradient,
              image: backgroundImage != null
                  ? DecorationImage(
                      image: backgroundImage!,
                      fit: BoxFit.cover,
                      colorFilter: colorFilter,
                    )
                  : null,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
