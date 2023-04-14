import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';

/// An app bar consists of a toolbar and potentially other widgets, such as a
/// [GFTabBar][TabBar] and a [FlexibleSpaceBar].
/// The GFAppBar displays the toolbar widgets, [leading], [title], and [actions],
/// above the [bottom] (if any). The [bottom] is usually used for a [TabBar].
class GFAppBar extends StatefulWidget implements PreferredSizeWidget {
  /// Creates a material design app bar.
  ///
  /// The arguments [primary], [toolbarOpacity], [bottomOpacity]
  /// and [automaticallyImplyLeading] must not be null. Additionally, if
  /// [elevation] is specified, it must be non-negative.
  ///
  /// If [backgroundColor], [elevation], [brightness], [iconTheme],
  /// [actionsIconTheme], or [textTheme] are null, then their GFAppBarTheme
  /// values will be used. If the corresponding GFAppBarTheme property is null,
  /// then the default specified in the property's documentation will be used.
  ///
  /// Typically used in the [Scaffold.appBar] property.
  GFAppBar({
    Key? key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.shape,
    this.backgroundColor,
    this.brightness,
    this.iconTheme,
    this.actionsIconTheme,
    this.textTheme,
    this.primary = true,
    this.centerTitle,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.searchBar = false,
    this.searchHintText = 'Search...',
    this.searchHintStyle = const TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
    this.searchTextStyle = const TextStyle(
      color: Colors.white,
    ),
    this.searchBarColorTheme = Colors.white,
    this.searchController,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
  })  : assert(elevation == null || elevation >= 0.0),
        preferredSize = Size.fromHeight(
          kToolbarHeight + (bottom?.preferredSize.height ?? 0),
        ),
        super(key: key);

  /// A widget to display before the [title].
  final Widget? leading;

  /// Controls whether we should try to imply the leading widget if null.
  ///
  /// If true and [leading] is null, automatically try to deduce what the leading
  /// widget should be. If false and [leading] is null, leading space is given to [title].
  /// If leading widget is not null, this parameter has no effect.
  final bool automaticallyImplyLeading;

  /// The primary widget displayed in the app bar.
  ///
  /// Typically a [Text] widget containing a description of the current contents
  /// of the app.
  final Widget? title;

  /// Widgets to display after the [title] widget.
  ///
  /// Typically these widgets are [IconButton]s representing common operations.
  /// For less common operations, consider using a [PopupMenuButton] as the
  /// last action.
  final List<Widget>? actions;

  /// This widget is stacked behind the toolbar and the tab bar. It's height will
  /// be the same as the app bar's overall height.
  ///
  /// A flexible space isn't actually flexible unless the [GFAppBar]'s container
  /// changes the [GFAppBar]'s size. A SliverGFAppBar in a [CustomScrollView]
  /// changes the [GFAppBar]'s height when scrolled.
  ///
  /// Typically a [FlexibleSpaceBar]. See [FlexibleSpaceBar] for details.
  final Widget? flexibleSpace;

  /// This widget appears across the bottom of the app bar.
  ///
  /// Typically a [TabBar]. Only widgets that implement [PreferredSizeWidget] can
  /// be used at the bottom of an app bar.
  ///
  /// See also:
  ///
  ///  * [PreferredSize], which can be used to give an arbitrary widget a preferred size.
  final PreferredSizeWidget? bottom;

  /// The z-coordinate at which to place this app bar relative to its parent.
  ///
  /// This controls the size of the shadow below the app bar.
  ///
  /// The value is non-negative.
  ///
  /// If this property is null, then [ThemeData.appBarTheme.elevation] is used,
  /// if that is also null, the default value is 4, the appropriate elevation
  /// for app bars.
  final double? elevation;

  /// The material's shape as well its shadow.
  ///
  /// A shadow is only displayed if the [elevation] is greater than
  /// zero.
  final ShapeBorder? shape;

  /// The color to use for the app bar's material. Typically this should be set
  /// along with [brightness], [iconTheme], [textTheme].
  ///
  /// If this property is null, then [ThemeData.appBarTheme.color] is used,
  /// if that is also null, then [ThemeData.primaryColor] is used.
  final Color? backgroundColor;

  /// The brightness of the app bar's material. Typically this is set along
  /// with [backgroundColor], [iconTheme], [textTheme].
  ///
  /// If this property is null, then [ThemeData.appBarTheme.brightness] is used,
  /// if that is also null, then the appBarTheme can be used to configure the
  /// appearance of AppBars. The appearance of Keyboards for TextFields now uses
  /// the overall theme's ThemeData.brightness and can also be customized with
  /// TextField.keyboardAppearance. The brightness of any color can be found with
  /// ThemeData.estimateBrightnessForColor.
  final Brightness? brightness;

  /// The color, opacity, and size to use for app bar icons. Typically this
  /// is set along with [backgroundColor], [brightness], [textTheme].
  ///
  /// If this property is null, then [ThemeData.appBarTheme.iconTheme] is used,
  /// if that is also null, then [ThemeData.primaryIconTheme] is used.
  final IconThemeData? iconTheme;

  /// The color, opacity, and size to use for the icons that appear in the app
  /// bar's [actions]. This should only be used when the [actions] should be
  /// themed differently than the icon that appears in the app bar's [leading]
  /// widget.
  ///
  /// If this property is null, then [ThemeData.appBarTheme.actionsIconTheme] is
  /// used, if that is also null, then this falls back to [iconTheme].
  final IconThemeData? actionsIconTheme;

  /// The typographic styles to use for text in the app bar. Typically this is
  /// set along with [brightness] [backgroundColor], [iconTheme].
  ///
  /// If this property is null, then [ThemeData.appBarTheme.textTheme] is used,
  /// if that is also null, then [ThemeData.primaryTextTheme] is used.
  final TextTheme? textTheme;

  /// Whether this app bar is being displayed at the top of the screen.
  ///
  /// If true, the app bar's toolbar elements and [bottom] widget will be
  /// padded on top by the height of the system status bar. The layout
  /// of the [flexibleSpace] is not affected by the [primary] property.
  final bool primary;

  /// Whether the title should be centered.
  ///
  /// Defaults to being adapted to the current [TargetPlatform].
  final bool? centerTitle;

  /// The spacing around [title] content on the horizontal axis. This spacing is
  /// applied even if there is no [leading] content or [actions]. If you want
  /// [title] to take all the space available, set this value to 0.0.
  ///
  /// Defaults to [NavigationToolbar.kMiddleSpacing].
  final double titleSpacing;

  /// How opaque the toolbar part of the app bar is.
  ///
  /// A value of 1.0 is fully opaque, and a value of 0.0 is fully transparent.
  ///
  /// Typically, this value is not changed from its default value (1.0). It is
  /// used by SliverGFAppBar to animate the opacity of the toolbar when the app
  /// bar is scrolled.
  final double toolbarOpacity;

  /// How opaque the bottom part of the app bar is.
  ///
  /// A value of 1.0 is fully opaque, and a value of 0.0 is fully transparent.
  ///
  /// Typically, this value is not changed from its default value (1.0). It is
  /// used by SliverGFAppBar to animate the opacity of the toolbar when the app
  /// bar is scrolled.
  final double bottomOpacity;

  /// A size whose height is the sum of [kToolbarHeight] and the [bottom] widget's
  /// preferred height.
  ///
  /// [Scaffold] uses this size to set its app bar's height.
  @override
  final Size preferredSize;

  /// If true, displays search bar in the title space
  final bool searchBar;

  /// It takes text to displays the search bar hint text
  final String searchHintText;

  /// It styles the [searchHintText]
  final TextStyle searchHintStyle;

  /// It styles the search text
  final TextStyle searchTextStyle;

  /// It defines the search bar icons color
  final Color searchBarColorTheme;

  /// {@macro flutter.widgets.editableText.onChanged}
  ///
  /// See also:
  ///
  ///  * inputFormatters, which are called before [onChanged]
  ///    runs and can validate and change ("format") the input value.
  ///  * onEditingComplete, [onSubmitted], [onSelectionChanged]:
  ///    which are more specialized input change notifications.
  final ValueChanged<String>? onChanged;

  /// {@macro flutter.widgets.editableText.onSubmitted}
  ///
  /// See also:
  ///
  ///  * [EditableText.onSubmitted] for an example of how to handle moving to
  ///    the next/previous field when using [TextInputAction.next] and
  ///    [TextInputAction.previous] for [TextInputAction].
  final ValueChanged<String>? onSubmitted;

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController].
  final TextEditingController? searchController;

  /// {@template flutter.material.textfield.onTap}
  /// Called for each distinct tap except for every second tap of a double tap.
  ///
  /// The text field builds a [GestureDetector] to handle input events like tap,
  /// to trigger focus requests, to move the caret, adjust the selection, etc.
  /// Handling some of those events by wrapping the text field with a competing
  /// GestureDetector is problematic.
  ///
  /// To unconditionally handle taps, without interfering with the text field's
  /// internal gesture detector, provide this callback.
  ///
  /// If the text field is created with enabled false, taps will not be
  /// recognized.
  ///
  /// To be notified when the text field gains or loses the focus, provide a
  /// focusNode and add a listener to that.
  ///
  /// To listen to arbitrary pointer events without competing with the
  /// text field's internal gesture detector, use a [Listener].
  /// {@endtemplate}
  final GestureTapCallback? onTap;

  bool _getEffectiveCenterTitle(ThemeData theme) {
    if (centerTitle != null) {
      return centerTitle!;
    }
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return false;
      case TargetPlatform.iOS:
        return actions == null || actions!.length < 2;
      default:
        return false;
    }
  }

  @override
  _GFAppBarState createState() => _GFAppBarState();
}

class _GFAppBarState extends State<GFAppBar> {
  static const double _defaultElevation = 4;
  Widget? searchBar;
  bool showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();

  void _handleDrawerButton() {
    Scaffold.of(context).openDrawer();
  }

  void _handleDrawerButtonEnd() {
    Scaffold.of(context).openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    assert(!widget.primary || debugCheckHasMediaQuery(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final ThemeData theme = Theme.of(context);
    final AppBarTheme appBarTheme = AppBarTheme.of(context);
    final ScaffoldState scaffold = Scaffold.of(context);
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool hasDrawer = scaffold.hasDrawer;
    final bool hasEndDrawer = scaffold.hasEndDrawer;
    final bool canPop = parentRoute?.canPop ?? false;
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    IconThemeData overallIconTheme =
        widget.iconTheme ?? appBarTheme.iconTheme ?? theme.primaryIconTheme;
    IconThemeData actionsIconTheme = widget.actionsIconTheme ??
        appBarTheme.actionsIconTheme ??
        overallIconTheme;
    TextStyle? centerStyle = widget.textTheme?.headlineSmall ??
        appBarTheme.titleTextStyle ??
        theme.primaryTextTheme.headlineSmall;
    TextStyle? sideStyle = widget.textTheme?.bodyLarge ??
        appBarTheme.toolbarTextStyle ??
        theme.primaryTextTheme.bodyLarge;

    if (widget.toolbarOpacity != 1.0) {
      final double opacity = const Interval(
        0.25,
        1,
        curve: Curves.fastOutSlowIn,
      ).transform(widget.toolbarOpacity);
      if (centerStyle?.color != null) {
        centerStyle = centerStyle!.copyWith(
          color: centerStyle.color!.withOpacity(opacity),
        );
      }
      if (sideStyle?.color != null) {
        sideStyle = sideStyle!.copyWith(
          color: sideStyle.color!.withOpacity(opacity),
        );
      }
      overallIconTheme = overallIconTheme.copyWith(
        opacity: opacity * (overallIconTheme.opacity ?? 1.0),
      );
      actionsIconTheme = actionsIconTheme.copyWith(
        opacity: opacity * (actionsIconTheme.opacity ?? 1.0),
      );
    }

    Widget? leading = widget.leading;
    if (leading == null && widget.automaticallyImplyLeading) {
      if (hasDrawer) {
        leading = IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _handleDrawerButton,
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      } else {
        if (canPop) {
          leading = useCloseButton ? const CloseButton() : const BackButton();
        }
      }
    }
    if (leading != null) {
      leading = ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: _kLeadingWidth),
        child: leading,
      );
    }

    Widget? title = widget.title;
    if (title != null && centerStyle != null) {
      bool? namesRoute;
      switch (theme.platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          namesRoute = true;
          break;
        case TargetPlatform.iOS:
          break;
        default:
          break;
      }
      title = DefaultTextStyle(
        style: centerStyle,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        child: Semantics(
          namesRoute: namesRoute,
          child: GFAppBarTitleBar(child: title),
          header: true,
        ),
      );
    }

    Widget? actions;
    if (widget.actions != null && widget.actions!.isNotEmpty) {
      actions = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widget.actions!,
      );
    } else if (hasEndDrawer) {
      actions = IconButton(
        icon: const Icon(Icons.menu),
        onPressed: _handleDrawerButtonEnd,
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    }

    // Allow the actions actions to have their own theme if necessary.
    if (actions != null) {
      actions = IconTheme.merge(
        data: actionsIconTheme,
        child: actions,
      );
    }

    if (showSearchBar) {
      searchBar = TextField(
        cursorColor: widget.searchBarColorTheme,
        style: widget.searchTextStyle,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: widget.searchBarColorTheme,
            size: 18,
          ),
          suffixIcon: GFIconButton(
            icon: Icon(
              Icons.close,
              color: widget.searchBarColorTheme,
              size: 20,
            ),
            type: GFButtonType.transparent,
            onPressed: () {
              widget.onSubmitted?.call('');
              final controller = widget.searchController ?? _searchController;
              setState(() {
                showSearchBar = !showSearchBar;
                controller.text = '';
              });
            },
          ),
          hintText: widget.searchHintText,
          hintStyle: widget.searchHintStyle,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: widget.searchBarColorTheme,
            ),
          ),
        ),
        onTap: widget.onTap,
        onChanged: widget.onChanged,
        controller: widget.searchController ?? _searchController,
        onSubmitted: widget.onSubmitted,
      );
    }

    if (!showSearchBar) {
      searchBar = ListTile(
        contentPadding: EdgeInsets.zero,
        title: title,
        trailing: GFIconButton(
          icon: Icon(
            Icons.search,
            color: widget.searchBarColorTheme,
            size: 20,
          ),
          type: GFButtonType.transparent,
          onPressed: () {
            setState(() {
              showSearchBar = true;
            });
          },
        ),
      );
    }

    final Widget toolbar = NavigationToolbar(
      leading: leading,
      middle: widget.searchBar ? searchBar : title,
      trailing: actions,
      centerMiddle: widget._getEffectiveCenterTitle(theme),
      middleSpacing: widget.titleSpacing,
    );

    // If the toolbar is allocated less than kToolbarHeight make it
    // appear to scroll upwards within its shrinking container.
    Widget appBar = ClipRect(
      child: CustomSingleChildLayout(
        delegate: const _ToolbarContainerLayout(),
        child: IconTheme.merge(
          data: overallIconTheme,
          child: DefaultTextStyle(
            style: sideStyle ?? const TextStyle(),
            child: toolbar,
          ),
        ),
      ),
    );
    if (widget.bottom != null) {
      appBar = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: kToolbarHeight),
              child: appBar,
            ),
          ),
          Opacity(
            opacity: const Interval(
              0.25,
              1,
              curve: Curves.fastOutSlowIn,
            ).transform(widget.bottomOpacity),
            child: widget.bottom,
          ),
        ],
      );
    }

    // The padding applies to the toolbar and tabBar, not the flexible space.
    if (widget.primary) {
      appBar = SafeArea(
        top: true,
        child: appBar,
      );
    }

    appBar = Align(
      alignment: Alignment.topCenter,
      child: appBar,
    );

    if (widget.flexibleSpace != null) {
      appBar = Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          widget.flexibleSpace!,
          appBar,
        ],
      );
    }

    final Brightness brightness = widget.brightness ?? theme.brightness;
    final SystemUiOverlayStyle overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return Semantics(
      container: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: Material(
          color: widget.backgroundColor ??
              appBarTheme.backgroundColor ??
              theme.primaryColor,
          elevation:
              widget.elevation ?? appBarTheme.elevation ?? _defaultElevation,
          shape: widget.shape,
          child: Semantics(
            explicitChildNodes: true,
            child: appBar,
          ),
        ),
      ),
    );
  }
}

const double _kLeadingWidth = kToolbarHeight;

class _ToolbarContainerLayout extends SingleChildLayoutDelegate {
  const _ToolbarContainerLayout();

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) =>
      constraints.tighten(
        height: kToolbarHeight,
      );

  @override
  Size getSize(BoxConstraints constraints) => Size(
        constraints.maxWidth,
        kToolbarHeight,
      );

  @override
  Offset getPositionForChild(Size size, Size childSize) =>
      Offset(0, size.height - childSize.height);

  @override
  bool shouldRelayout(_ToolbarContainerLayout oldDelegate) => false;
}

// Layout the GFAppBar's title with unconstrained height, vertically
// center it within its (NavigationToolbar) parent, and allow the
// parent to constrain the title's actual height.
class GFAppBarTitleBar extends SingleChildRenderObjectWidget {
  const GFAppBarTitleBar({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  RenderGFAppBarTitleBar createRenderObject(BuildContext context) =>
      RenderGFAppBarTitleBar(
        textDirection: Directionality.of(context),
      );

  @override
  void updateRenderObject(
      BuildContext context, RenderGFAppBarTitleBar renderObject) {
    renderObject.textDirection = Directionality.of(context);
  }
}

class RenderGFAppBarTitleBar extends RenderAligningShiftedBox {
  RenderGFAppBarTitleBar({
    RenderBox? child,
    TextDirection? textDirection,
  }) : super(
          child: child,
          alignment: Alignment.center,
          textDirection: textDirection,
        );

  @override
  void performLayout() {
    final BoxConstraints innerConstraints =
        constraints.copyWith(maxHeight: double.infinity);
    child?.layout(
      innerConstraints,
      parentUsesSize: true,
    );
    if (child != null) {
      size = constraints.constrain(child!.size);
    }
    alignChild();
  }
}
