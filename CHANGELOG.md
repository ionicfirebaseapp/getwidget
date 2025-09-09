# Changelog

## [7.0.0] - 2025-09-09

### 🚀 Features
- Extended color options in the colors folder ([#367](https://github.com/ionicfirebaseapp/getwidget/pull/367)).
- Improved code formatting and readability in `GFCard` widget ([#368](https://github.com/ionicfirebaseapp/getwidget/pull/368)).
- Set appropriate default hint values for `GfFormField` hint texts ([#350](https://github.com/ionicfirebaseapp/getwidget/pull/350)).

### 🐛 Bug Fixes
- Fixed spelling of 'accordion' and anchor link for documentation in README ([#349](https://github.com/ionicfirebaseapp/getwidget/pull/349)).
- Fixed: `enableFeedback` can't be null ([#364](https://github.com/ionicfirebaseapp/getwidget/pull/364)).
- Fixed direct reference to `CardThemeData` for Flutter version compatibility ([#366](https://github.com/ionicfirebaseapp/getwidget/pull/366)).
- Fixed build issues on Flutter 3.35.0 ([#371](https://github.com/ionicfirebaseapp/getwidget/pull/371)).
- Fixed color for social color Pinterest.

### 🔨 Refactors
- Removed deprecated lint hints ([#341](https://github.com/ionicfirebaseapp/getwidget/pull/341)).
- Multiple PR merges resolving conflicts and improving stability ([#373](https://github.com/ionicfirebaseapp/getwidget/pull/373), [#374](https://github.com/ionicfirebaseapp/getwidget/pull/374), [#372](https://github.com/ionicfirebaseapp/getwidget/pull/372), [#375](https://github.com/ionicfirebaseapp/getwidget/pull/375)).

### 🛠 Compatibility
- Upgrade compatibility with Flutter 3.29.0 and 3.35.0 ([#363](https://github.com/ionicfirebaseapp/getwidget/pull/363), [#371](https://github.com/ionicfirebaseapp/getwidget/pull/371)).

### ⚠️ Breaking Changes
- Please review the merged PRs and migration guides for any breaking changes impacting the upgrade from v6.x.x to v7.0.0.

---

**See the [GitHub Pull Requests](https://github.com/ionicfirebaseapp/getwidget/pulls?state=closed&sort=updated&direction=desc) and [Commits](https://github.com/ionicfirebaseapp/getwidget/commits?per_page=10&sort=author-date) for more details.**

## 6.0.0 - 2025-02-25

- Upgrade compatibility with Flutter 3.29.0

## 5.0.0 - 2024-12-18

- Change type from CardTheme to CardThemeData in response to breaking change in flutter 3.27.

## 4.0.0 - 2023-08-24

- Added padding and margin properties for gf_search_bar
- Added drag option for circular progress bar in gf_progress_bar
- Replaced topbar with content parameter in gf_alert
- Fixed social buttons assets issue
- Fixed alignment issue for gf_toggle text
- Fixed shadow issue for gf_list_tile when no color passed
- Updated Readme

## 3.1.1 - 2023-04-14

- Code formatted for better score

## 3.1.0 - 2023-04-14

- Added drag functionality for Linear progress bar
- Added validation in multiselect widget, GF-CheckBox, GF-Radio, GF-DropDown
- GF-Alert design updated and made it more customizable
- Fixed text crop issue in GF-Toggle
- Added the async function for search query
- Mouse support for GF-Carousel

## 3.0.1 - 2022-06-02

### Added

- Fixed analysis warnings

## 3.0.0 - 2022-06-02

### Added

- Support for flutter 3
- Basic form widgets

## 2.1.1 - 2022-06-02

### Fixed

- Fallback to flutter 2.* because of version issues
- Next release will support flutter 3

## 2.1.0 - 2022-05-30

### Fixed

- Migrated to Flutter 3.0.0.
- Option for adding preselected values in MultiSelect dropdown widget.
- WidgetBinding instances null check issue fixed.
- GFTextField migrated to null nullsafety and now enabled.
- New GFTextField widgets added : GFTextFieldRounded, GFTextFieldSquared, GFTextFieldPill.
- Added Prefix Icon option for GFTextField widgets.

## 2.0.5 - 2022-02-21

### Fixed

- Added GFDrawer Header centerAlign option
- Added border for GFCarousel
- Added divider height option for GFTypography
- Added font weight option for GFTypography
- Added width parameter for GFTabBar


## 2.0.4 - 2021-08-23

### Fixed

- GFCarousal pagination issue fixed.
- GFIconBadge icon issue fixed.
- GFToast issue fixed.

## 2.0.3 - 2021-06-29

### Fixed

- GFCard issue fixed.

## 2.0.2 - 2021-05-10

### Fixed

- couple of Null Safety related issues.
- GFcarousel issues resolved.

## 2.0.1-nullsafety.4 - 2021-03-17

### Added

- Added test cases.

## 2.0.0-nullsafety.3 - 2021-03-09

### Added

- Added nullsafety.

## 1.2.4 - 2020-11-12

### Fixed

- [GFProgressBar] issue.
- [GFBottomSheet] minor issue.
- [GFIconButton] wrong touch issue. #195
- [GFDropdown] minor issue.
- [GFCarousel] issue. #185
- Many more minor improvements.

### Added

- Test cases added for couple of components
  - GFLoader
  - GFTypography

## 1.2.2 - 2020-10-02

### Fixed

- [GFButton] width related issue.
- [GFRadio] minor issue.
- [GFRadioListTile] selection issue
- [GFCheckbox] minor issue.
- [GFCheckboxListTile] selection issue
- Many more minor improvements.

### Added

- few new compoenents added
  - GFBottomSheet
  - GFIntroScreen
  - GFAnimation
  - GFBorder
  - GFStickyHeader

## 1.1.3 - 2020-07-30

### Fixed

- [GFAppBar] clear button does not fire onChanged #149
- [GFCarousel] initialPage Not Honored if Page Indicators Enabled. #144
- [GFCarousel] timer of the autoPlay is not disposed #143
- [GFCarousel] active page indicator is not being updated without "onPageChanged" #139
- [GFTabBar] Docs say about isScrollable which is not supported #132

### Added

- couple of compoenents (WIP)
  - GFCheckboxTile
  - GFRadioTile

## 1.1.1 - 2020-06-26

### Added

- added new components
  - GFCheckbox
  - GFRadio

### Update

- Changed name to GetWidget

### Fixed

- Many minor issues fixed

## 1.0.11 - 2020-03-11

### Fixed

- Resolved issues.

## 1.0.10 - 2020-03-11

### Fixed

- Few minor fixes

## 1.0.9 - 2020-03-02

### Fixed

- Few minor fixes

### Added

- added new component
  - GFShimmer

## 1.0.8 - 2020-02-18

### Fixed

- Hot reload in GFButton

### Added

- added new component
  - GFProgressBar

## 1.0.7 - 2020-02-11

### Fixed

- GFLoader - import issue fixed

### Added

- added new component
  - GFFloatingWidget

## 1.0.5 - 2020-02-07

### Fixed

- GFRating - minor issue fixed

### Added

- added new component
  - GFLoader

## 1.0.4 - 2020-02-04

### Fixed

- GFSearchBar - minor issue fixed

### Added

- added new component
  - GFRating

## 1.0.3 - 2020-01-30

### Fixed

- GFToggle - minor issue fixed

### Added

- added few new components
  - GFAccordian
  - GFAlert
  - GFSearchBar
  - GFDrawer
  - GFAppBar

## 1.0.2 - 2020-01-23

### Fixed

- import issue fixed.

## 1.0.1 - 2020-01-22

### Added

- added few new components
  - GFToast
  - GFFloatingWidget
  - GFToggle

## 1.0.0 - 2020-01-20

### Added

- Stable version release
- code refectoring
- this release includes following stable components
  - GFAvatar
  - GFButton
  - GFIconButton
  - GFButtonBar
  - GFBadge
  - GFButtonBadge
  - GFIconBadge
  - GFCard
  - GFCarousel
  - GFImageOverlay
  - GFListTile
  - GFTabs
  - GFTypography

## 1.0.0-dev.9 - 2020-01-17

### Added

- Added library exports for commonly used files.

## 1.0.0-dev.8 - 2020-01-16

### Fixed

- ListTile re-implemeted.

## 1.0.0-dev.3 - 2020-01-15

### Fixed

- ListTile issue.

## 1.0.0-dev.1 - 2020-01-14

### Fixed

- Warnings and Hints

## 0.0.1-pre.3 - 2020-01-14

### Fixed

- Warnings and Hints

### Added

- Changelog and Description

## 0.0.1-pre.2 - 2020-01-14

### Fixed

- Warnings and Hints

## 0.0.1-pre.1 - 2020-01-13

### Added

- initial release with buttons, badge, card, list tile, avatar and many more components.
