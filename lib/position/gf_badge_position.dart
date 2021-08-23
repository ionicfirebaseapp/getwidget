/// [GFBadgePosition] is used to position the badges to top start, top bottom,
/// bottom start or bottom end of the icon button
/// See GFIconBadge

class GFBadgePosition {
  const GFBadgePosition({this.top, this.end, this.bottom, this.start});

  factory GFBadgePosition.topStart({double top = -5, double start = -10}) =>
      GFBadgePosition(top: top, start: start);

  factory GFBadgePosition.topEnd({double top = -8, double end = -10}) =>
      GFBadgePosition(top: top, end: end);

  factory GFBadgePosition.bottomEnd({double bottom = -8, double end = -10}) =>
      GFBadgePosition(bottom: bottom, end: end);

  factory GFBadgePosition.bottomStart(
          {double bottom = -8, double start = -10}) =>
      GFBadgePosition(bottom: bottom, start: start);

  /// defines the position of badge
  final double? top;

  /// defines the position of badge
  final double? end;

  /// defines the position of badge
  final double? start;

  /// defines the position of badge
  final double? bottom;
}
