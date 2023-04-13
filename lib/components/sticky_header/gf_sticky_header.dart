import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/getwidget.dart';

class GFStickyHeader extends MultiChildRenderObjectWidget {
  /// GF Sticky Header will the stick header at top when content is being scrolled.
  /// Place this widget inside a [ListView], [GridView], [CustomScrollView], [SingleChildScrollView] or similar.
  GFStickyHeader(
      {Key? key,
      required this.stickyContent,
      required this.content,
      this.direction = Axis.vertical,
      this.enableHeaderOverlap = false,
      this.callback,
      this.stickyContentPosition = GFPosition.start})
      : super(
            key: key,
            children: stickyContentPosition == GFPosition.start &&
                    direction == Axis.horizontal
                ? [stickyContent, content]
                : stickyContentPosition == GFPosition.start &&
                        direction == Axis.vertical
                    ? [content, stickyContent]
                    : [content, stickyContent]);

  /// widget can be used to define [stickyContent].
  final Widget stickyContent;

  /// widget can be used to define [content].
  final Widget content;

  /// On state true, the [stickyContent] will overlap the [content].
  /// Only works when direction is [Axis.vertical]. Default set to false.
  final bool enableHeaderOverlap;

  /// [GFPosition] allows to [stickyContentPosition] to stick at top in [Axis.vertical] and stick at start in [Axis.horizontal]
  /// Defaults to [GFPosition.start]
  final GFPosition stickyContentPosition;

  /// Allows to add custom stickyHeader stuck offset value
  final RenderGFStickyHeaderCallback? callback;

  ///  [direction] allows children to align in vertical / horizontal way
  ///  Defaults to [Axis.vertical]
  final Axis direction;

  @override
  RenderGFStickyHeader createRenderObject(BuildContext context) {
    final scrollable = Scrollable.of(context);
    return RenderGFStickyHeader(
      direction: direction,
      scrollable: scrollable,
      enableHeaderOverlap: enableHeaderOverlap,
      callback: callback,
      stickyContentPosition: stickyContentPosition,
    );
  }
}
