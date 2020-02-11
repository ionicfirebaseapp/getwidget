import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class GFDrawerHeaderPictures extends StatelessWidget {
  const GFDrawerHeaderPictures({
    Key key,
    this.currentAccountPicture,
    this.otherAccountsPictures,
    this.closeButton,
  }) : super(key: key);

  /// A widget placed in the upper-left corner that represents the current
  /// user's account. Normally a [CircleAvatar].
  final Widget currentAccountPicture;

  /// A list of widgets that represent the current user's other accounts.
  /// Up to three of these widgets will be arranged in a row in the header's
  /// upper-right corner. Normally a list of [CircleAvatar] widgets.
  final List<Widget> otherAccountsPictures;

  /// widget onTap drawer get closed
  final Widget closeButton;

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          closeButton == null
              ? GFIconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  type: GFButtonType.transparent,
                )
              : closeButton,
          PositionedDirectional(
            top: 0,
            end: 0,
            child: Row(
              children: (otherAccountsPictures ?? <Widget>[])
                  .take(3)
                  .map<Widget>((Widget picture) => Padding(
                        padding: const EdgeInsetsDirectional.only(start: 8),
                        child: Semantics(
                          container: true,
                          child: Container(
                            padding: const EdgeInsets.only(left: 8, bottom: 8),
                            width: 48,
                            height: 48,
                            child: picture,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Positioned(
            top: 40,
            child: Semantics(
              explicitChildNodes: true,
              child: SizedBox(
                width: 72,
                height: 72,
                child: currentAccountPicture,
              ),
            ),
          ),
        ],
      );
}

/// A material design [Drawer] header that identifies the app's user.
///
/// Requires one of its ancestors to be a [Material] widget.
///
class GFDrawerHeader extends StatefulWidget {
  /// Creates a material design drawer header.
  ///
  /// Requires one of its ancestors to be a [Material] widget.
  const GFDrawerHeader({
    Key key,
    this.decoration,
    this.margin = const EdgeInsets.only(bottom: 8),
    this.currentAccountPicture,
    this.otherAccountsPictures,
    this.child,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.fastOutSlowIn,
    this.closeButton,
  }) : super(key: key);

  /// The header's background. If decoration is null then a [BoxDecoration]
  /// with its background color set to the current theme's primaryColor is used.
  final Decoration decoration;

  /// The margin around the drawer header.
  final EdgeInsetsGeometry margin;

  /// A widget placed in the upper-left corner that represents the current
  /// user's account. Normally a [CircleAvatar].
  final Widget currentAccountPicture;

  /// A list of widgets that represent the current user's other accounts.
  /// Up to three of these widgets will be arranged in a row in the header's
  /// upper-right corner. Normally a list of [CircleAvatar] widgets.
  final List<Widget> otherAccountsPictures;

  /// A widget to be placed inside the drawer header, inset by the padding.
  ///
  /// This widget will be sized to the size of the header. To position the child
  /// precisely, consider using an [Align] or [Center] widget.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// The duration for animations of the [decoration].
  final Duration duration;

  /// The curve for animations of the [decoration].
  final Curve curve;

  /// widget onTap drawer get closed
  final Widget closeButton;

  @override
  _GFDrawerHeaderState createState() => _GFDrawerHeaderState();
}

class _GFDrawerHeaderState extends State<GFDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Semantics(
      container: true,
      label: MaterialLocalizations.of(context).signedInLabel,
      child: Container(
        height: statusBarHeight + 185.0,
        decoration: widget.decoration ??
            BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
        margin: widget.margin,
        padding: const EdgeInsetsDirectional.only(top: 16, start: 16),
        child: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: GFDrawerHeaderPictures(
                    currentAccountPicture: widget.currentAccountPicture,
                    otherAccountsPictures: widget.otherAccountsPictures,
                    closeButton: widget.closeButton,
                  ),
                ),
              ),
              AnimatedContainer(
                padding: const EdgeInsets.only(bottom: 16),
                duration: widget.duration,
                curve: widget.curve,
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
