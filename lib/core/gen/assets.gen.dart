// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_arm.svg
  SvgGenImage get icArm => const SvgGenImage('assets/icons/ic_arm.svg');

  /// File path: assets/icons/ic_arrow.svg
  SvgGenImage get icArrow => const SvgGenImage('assets/icons/ic_arrow.svg');

  /// File path: assets/icons/ic_dots.svg
  SvgGenImage get icDots => const SvgGenImage('assets/icons/ic_dots.svg');

  /// File path: assets/icons/ic_dropdown.svg
  SvgGenImage get icDropdown =>
      const SvgGenImage('assets/icons/ic_dropdown.svg');

  /// File path: assets/icons/ic_indicator.svg
  SvgGenImage get icIndicator =>
      const SvgGenImage('assets/icons/ic_indicator.svg');

  /// File path: assets/icons/ic_leg.svg
  SvgGenImage get icLeg => const SvgGenImage('assets/icons/ic_leg.svg');

  /// File path: assets/icons/ic_mood.svg
  SvgGenImage get icMood => const SvgGenImage('assets/icons/ic_mood.svg');

  /// File path: assets/icons/ic_moon.svg
  SvgGenImage get icMoon => const SvgGenImage('assets/icons/ic_moon.svg');

  /// File path: assets/icons/ic_notification.svg
  SvgGenImage get icNotification =>
      const SvgGenImage('assets/icons/ic_notification.svg');

  /// File path: assets/icons/ic_nutrition.svg
  SvgGenImage get icNutrition =>
      const SvgGenImage('assets/icons/ic_nutrition.svg');

  /// File path: assets/icons/ic_plan.svg
  SvgGenImage get icPlan => const SvgGenImage('assets/icons/ic_plan.svg');

  /// File path: assets/icons/ic_profile.svg
  SvgGenImage get icProfile => const SvgGenImage('assets/icons/ic_profile.svg');

  /// File path: assets/icons/mood_calm.svg
  SvgGenImage get moodCalm => const SvgGenImage('assets/icons/mood_calm.svg');

  /// File path: assets/icons/mood_content.svg
  SvgGenImage get moodContent =>
      const SvgGenImage('assets/icons/mood_content.svg');

  /// File path: assets/icons/mood_happy.svg
  SvgGenImage get moodHappy => const SvgGenImage('assets/icons/mood_happy.svg');

  /// File path: assets/icons/mood_peaceful.svg
  SvgGenImage get moodPeaceful =>
      const SvgGenImage('assets/icons/mood_peaceful.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    icArm,
    icArrow,
    icDots,
    icDropdown,
    icIndicator,
    icLeg,
    icMood,
    icMoon,
    icNotification,
    icNutrition,
    icPlan,
    icProfile,
    moodCalm,
    moodContent,
    moodHappy,
    moodPeaceful,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
