import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:getwidget/getwidget.dart';

class GFStickyHeader extends MultiChildRenderObjectWidget {
  GFStickyHeader({
    Key key,
    @required this.stickyContent,
    @required this.content,
    this.direction = Axis.vertical,
    this.enableHeaderOverlap = false,
    this.callback,
    this.stickyContentPosition = GFPosition.start
  }) : assert(direction != null),
        super(key: key, children: stickyContentPosition == GFPosition.start ? [stickyContent, content] : [content, stickyContent]
      );


  /// widget can be used to define [stickyContent].
  final Widget stickyContent;

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
  RenderGFStickyHeader createRenderObject(BuildContext context) {
    final scrollable = Scrollable.of(context);
    assert(scrollable != null);
    return RenderGFStickyHeader(
      direction: direction,
      scrollable: scrollable,
      enableHeaderOverlap: enableHeaderOverlap,
      callback: callback,
        stickyContentPosition: stickyContentPosition,
    );
  }
}




