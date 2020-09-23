import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

typedef Widget StickyHeaderWidgetBuilder(
    BuildContext context, double stuckAmount);

/// Sticky Header Builder Widget.
///
/// The same as [StickyHeader] but instead of supplying a Header view, you supply a [builder] that
/// constructs the header with the appropriate stickyness.
///
/// Place this widget inside a [ListView], [GridView], [CustomScrollView], [SingleChildScrollView] or similar.
///
class GFStickyHeaderBuilder extends StatefulWidget {
  /// Constructs a new [GFStickyHeaderBuilder] widget.
  const GFStickyHeaderBuilder({
    Key key,
    @required this.stickyContentBuilder,
    @required this.content,
    this.direction = Axis.vertical,
    this.enableHeaderOverlap = false,
    this.callback,
    this.stickyContentPosition = GFPosition.start,
  })  : assert(direction != null),
        super(key: key);

  /// widget can be used to define [stickyContentBuilder].
  final StickyHeaderWidgetBuilder stickyContentBuilder;


  /// widget can be used to define [content].
  final Widget content;

  /// On state true, the [stickyContent] will overlap the [content].
  /// Default value is false.
  final bool enableHeaderOverlap;

  /// [GFPosition] allows to [stickyContentPosition] to stick at top in [Axis.vertical] and stick at start in [Axis.horizontal]
  /// Defaults to [GFPosition.start]
  final GFPosition stickyContentPosition;

  /// Optional callback with stickyness value. If you think you need this, then you might want to
  /// consider using [StickyHeaderBuilder] instead.
  final RenderGFStickyHeaderCallback callback;

  ///  [direction] allows children to align in vertical / horizontal way
  ///  Defaults to [Axis.vertical]
  final Axis direction;


  @override
  _GFStickyHeaderBuilderState createState() => _GFStickyHeaderBuilderState();
}

class _GFStickyHeaderBuilderState extends State<GFStickyHeaderBuilder> {
  double _stuckAmount;

  @override
  Widget build(BuildContext context) => GFStickyHeader(
        enableHeaderOverlap: widget.enableHeaderOverlap,
        direction: widget.direction,
        stickyContentPosition: widget.stickyContentPosition,
        stickyContent: LayoutBuilder(
          builder: (context, _) => widget.stickyContentBuilder(context, _stuckAmount ?? 0.0),
        ),
        content: widget.content,
        callback: (double stuckAmount) {
          if (_stuckAmount != stuckAmount) {
            _stuckAmount = stuckAmount;
            WidgetsBinding.instance.endOfFrame.then((_) {
              if (mounted) {
                setState(() {});
              }
            });
          }
        },
      );
}
