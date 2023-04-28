import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_social_color.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/types/gf_social_type.dart';

class GFSocialButton extends StatelessWidget {
  /// Create buttons of all types. check out [GFIconButton] for icon buttons, and [GFBadge] for badges
  const GFSocialButton({
    Key? key,
    required this.onPressed,
    required this.type,
    required this.buttonType,
    this.elevation = 0.0,
    this.shape = GFButtonShape.standard,
    this.size = GFSize.MEDIUM,
    this.blockButton,
    this.fullWidthButton,
    this.onLongPress,
  }) : super(key: key);

  /// Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// The elevation for the button's [Material] when the button is [enabled] but not pressed.
  final double elevation;

  bool get enabled => onPressed != null;

  /// Button type of GFSocialButtonShape i.e, standard, pills, square, shadow, icons
  final GFButtonShape shape;

  /// size of [double] or [GFSize] i.e, 1.2, small, medium, large etc.
  final double size;

  /// type signify the social icon type [GFSocialType] ie, whatsapp, facebook etc.
  final GFSocialType type;

  /// type signify the type of social button [GFSocialButtonType] ie, solid, outlined etc.
  final GFSocialButtonType buttonType;

  /// on true state blockButton gives block size button
  final bool? blockButton;

  /// on true state full width Button gives full width button
  final bool? fullWidthButton;

  /// Called when the button is long-pressed.
  ///
  /// If this callback and [onPressed] are null, then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    Widget? icon;
    String? text;
    Color? color;
    final double imageSize = (size == GFSize.LARGE)
        ? 30
        : (size == GFSize.MEDIUM)
            ? 25
            : 20;
    switch (type) {
      case GFSocialType.whatsapp:
        icon = Image.asset(
          'icons/whatsapp.png',
          package: 'getwidget',
          height: imageSize,
          width: imageSize,
          color: (buttonType == GFSocialButtonType.outline ||
                  buttonType == GFSocialButtonType.outline2x ||
                  buttonType == GFSocialButtonType.transparent)
              ? GFSocialColors.WHATSAPP
              : Colors.white,
        );
        text = 'Whatsapp';
        color = GFSocialColors.WHATSAPP;
        break;
      case GFSocialType.facebook:
        icon = Image.asset(
          'icons/facebook.png',
          package: 'getwidget',
          height: imageSize,
          width: imageSize,
          color: (buttonType == GFSocialButtonType.outline ||
                  buttonType == GFSocialButtonType.outline2x ||
                  buttonType == GFSocialButtonType.transparent)
              ? GFSocialColors.FACEBOOK
              : Colors.white,
        );
        text = 'Facebook';
        color = GFSocialColors.FACEBOOK;
        break;
      case GFSocialType.twitter:
        icon = Image.asset(
          'icons/twitter.png',
          package: 'getwidget',
          height: imageSize,
          width: imageSize,
          color: (buttonType == GFSocialButtonType.outline ||
                  buttonType == GFSocialButtonType.outline2x ||
                  buttonType == GFSocialButtonType.transparent)
              ? GFSocialColors.TWITTER
              : Colors.white,
        );
        text = 'Twitter';
        color = GFSocialColors.TWITTER;
        break;
      case GFSocialType.google:
        icon = Image.asset(
          'icons/google.png',
          package: 'getwidget',
          height: imageSize,
          width: imageSize,
          color: (buttonType == GFSocialButtonType.outline ||
                  buttonType == GFSocialButtonType.outline2x ||
                  buttonType == GFSocialButtonType.transparent)
              ? GFSocialColors.GOOGLE
              : Colors.white,
        );
        text = 'Google';
        color = GFSocialColors.GOOGLE;
        break;
      case GFSocialType.youtube:
        icon = Image.asset(
          'icons/youtube.png',
          package: 'getwidget',
          height: imageSize,
          width: imageSize,
          color: (buttonType == GFSocialButtonType.outline ||
                  buttonType == GFSocialButtonType.outline2x ||
                  buttonType == GFSocialButtonType.transparent)
              ? GFSocialColors.YOUTUBE
              : Colors.white,
        );
        text = 'Youtube';
        color = GFSocialColors.YOUTUBE;
        break;
      case GFSocialType.dribble:
        icon = Image.asset(
          'icons/dribble.png',
          package: 'getwidget',
          height: imageSize,
          width: imageSize,
          color: (buttonType == GFSocialButtonType.outline ||
                  buttonType == GFSocialButtonType.outline2x ||
                  buttonType == GFSocialButtonType.transparent)
              ? GFSocialColors.DRIBBLE
              : Colors.white,
        );
        text = 'Dribble';
        color = GFSocialColors.DRIBBLE;
        break;
      case GFSocialType.linkedin:
        icon = Image.asset(
          'icons/linkedin.png',
          package: 'getwidget',
          height: imageSize,
          width: imageSize,
          color: (buttonType == GFSocialButtonType.outline ||
                  buttonType == GFSocialButtonType.outline2x ||
                  buttonType == GFSocialButtonType.transparent)
              ? GFSocialColors.LINKEDIN
              : Colors.white,
        );
        text = 'Linkedin';
        color = GFSocialColors.LINKEDIN;
        break;
      case GFSocialType.pinterest:
        icon = Image.asset(
          'icons/pinterest.png',
          package: 'getwidget',
          height: imageSize,
          width: imageSize,
          color: (buttonType == GFSocialButtonType.outline ||
                  buttonType == GFSocialButtonType.outline2x ||
                  buttonType == GFSocialButtonType.transparent)
              ? GFSocialColors.PININTEREST
              : Colors.white,
        );
        text = 'Pinterest';
        color = GFSocialColors.PININTEREST;
        break;
      case GFSocialType.slack:
        icon = Image.asset(
          'icons/slack.png',
          package: 'getwidget',
          height: imageSize,
          width: imageSize,
          color: (buttonType == GFSocialButtonType.outline ||
                  buttonType == GFSocialButtonType.outline2x ||
                  buttonType == GFSocialButtonType.transparent)
              ? GFSocialColors.SLACK
              : Colors.white,
        );
        text = 'Slack';
        color = GFSocialColors.SLACK;
        break;
      case GFSocialType.line:
        icon = Image.asset(
          'icons/line.png',
          package: 'getwidget',
          height: imageSize,
          width: imageSize,
          color: (buttonType == GFSocialButtonType.outline ||
                  buttonType == GFSocialButtonType.outline2x ||
                  buttonType == GFSocialButtonType.transparent)
              ? GFSocialColors.LINE
              : Colors.white,
        );
        text = 'Line';
        color = GFSocialColors.LINE;
        break;
      case GFSocialType.wechat:
        icon = Image.asset(
          'icons/wechat.png',
          package: 'getwidget',
          height: imageSize,
          width: imageSize,
          color: (buttonType == GFSocialButtonType.outline ||
                  buttonType == GFSocialButtonType.outline2x ||
                  buttonType == GFSocialButtonType.transparent)
              ? GFSocialColors.WECHAT
              : Colors.white,
        );
        text = 'WeChat';
        color = GFSocialColors.WECHAT;
        break;
    }

    switch (buttonType) {
      case GFSocialButtonType.solid:
        return socialButtonSolid(icon, text, color);
      case GFSocialButtonType.outline:
        return socialButtonOutlined(icon, text, color);
      case GFSocialButtonType.outline2x:
        return socialButtonOutlined2x(icon, text, color);
      case GFSocialButtonType.transparent:
        return socialButtonTransparent(icon, text, color);
      case GFSocialButtonType.icon:
        return socialButtonIcon(icon, color);
    }
  }

  Widget socialButtonSolid(Widget? icon, String? text, Color color) => GFButton(
        onPressed: onPressed,
        elevation: elevation,
        shape: shape,
        size: size,
        text: text,
        blockButton: blockButton,
        fullWidthButton: fullWidthButton,
        onLongPress: onLongPress,
        icon: icon,
        color: color,
      );

  Widget socialButtonOutlined(Widget? icon, String? text, Color color) =>
      GFButton(
        onPressed: () {},
        type: GFButtonType.outline,
        shape: shape,
        size: size,
        text: text,
        blockButton: blockButton,
        fullWidthButton: fullWidthButton,
        onLongPress: onLongPress,
        icon: icon,
        color: color,
        boxShadow: const BoxShadow(
          color: Colors.black,
          blurRadius: 10, // soften the shadow
          spreadRadius: 7, //extend the shadow
          offset: Offset(
            5, // Move to right 10  horizontally
            5, // Move to bottom 5 Vertically
          ),
        ),
      );

  Widget socialButtonOutlined2x(Widget icon, String text, Color color) =>
      GFButton(
        onPressed: () {},
        type: GFButtonType.outline2x,
        shape: shape,
        size: size,
        text: text,
        blockButton: blockButton,
        fullWidthButton: fullWidthButton,
        onLongPress: onLongPress,
        icon: icon,
        color: color,
        boxShadow: const BoxShadow(
          color: Colors.black,
          blurRadius: 10, // soften the shadow
          spreadRadius: 7, //extend the shadow
          offset: Offset(
            5, // Move to right 10  horizontally
            5, // Move to bottom 5 Vertically
          ),
        ),
      );

  Widget socialButtonTransparent(Widget icon, String text, Color color) =>
      GFButton(
        onPressed: () {},
        type: GFButtonType.transparent,
        shape: shape,
        size: size,
        text: text,
        blockButton: blockButton,
        fullWidthButton: fullWidthButton,
        onLongPress: onLongPress,
        icon: icon,
        color: color,
        boxShadow: const BoxShadow(
          color: Colors.black,
          blurRadius: 10, // soften the shadow
          spreadRadius: 7, //extend the shadow
          offset: Offset(
            5, // Move to right 10  horizontally
            5, // Move to bottom 5 Vertically
          ),
        ),
      );

  Widget socialButtonIcon(Widget? icon, Color color) => Material(
        shape: RoundedRectangleBorder(
          borderRadius: shape == GFButtonShape.pills
              ? BorderRadius.circular(50)
              : BorderRadius.circular(0),
        ),
        elevation: elevation,
        child: GFIconButton(
          onPressed: () {},
          icon: icon!,
          color: color,
          size: size,
          type: GFButtonType.solid,
          shape: shape == GFButtonShape.standard
              ? GFIconButtonShape.standard
              : shape == GFButtonShape.pills
                  ? GFIconButtonShape.circle
                  : GFIconButtonShape.square,
        ),
      );
}
