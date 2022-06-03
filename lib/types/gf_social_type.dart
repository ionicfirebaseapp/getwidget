enum GFSocialType {
  facebook,
  whatsapp,
  twitter,
  google,
  dribble,
  linkedin,
  youtube,
  slack,
  pinterest,
  wechat,
  line,
}

enum GFSocialButtonType {
  /// Default type is [GFSocialButtonType.solid], used to fill with color for widget
  solid,

  /// Type [GFSocialButtonType.outline], used for widget with outline border and fill color with Colors.transparent
  outline,

  /// Type [GFSocialButtonType.outline2x], used for widget with outline2x border and border.width = 2.0 and fill color with Colors.transparent
  outline2x,

  /// Type [GFSocialButtonType.transparent], used for widget with fill color with Colors.transparent
  transparent,

  /// Type [GFSocialButtonType.icon], used for widget with just icon filled in square container
  icon,
}
