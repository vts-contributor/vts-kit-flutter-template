import 'dart:ui';

import 'package:flutter/material.dart';

class OpenSansTextStyle extends TextStyle {
  static const _font = 'OpenSans';
  static const _textColor = const Color(0xFF262626);
  /// Super is [TextStyle].
  ///
  /// fontFamily is [OpenSans] - Can not set fontFamily,
  ///
  /// fontSize [15] is default,
  ///
  /// color [_textColor] ([0xFF262626]) is default
  const OpenSansTextStyle({
    inherit: true,
    Color? color: _textColor,
    Color? backgroundColor,
    double? fontSize: 15,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    // String? fontFamily: FontRes.OpenSans,
    List<String>? fontFamilyFallback,
    String? package,
  }) : super(
    inherit: inherit,
    color: color,
    backgroundColor: backgroundColor,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    height: height,
    locale: locale,
    foreground: foreground,
    background: background,
    shadows: shadows,
    fontFeatures: fontFeatures,
    decoration: decoration,
    decorationColor: decorationColor,
    decorationStyle: decorationStyle,
    decorationThickness: decorationThickness,
    debugLabel: debugLabel,
    fontFamily: _font,
    fontFamilyFallback: fontFamilyFallback,
    package: package,
  );
}

