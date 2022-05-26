import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'decorations.dart';
import 'texts.dart';

class FlattenCard extends Container {
  /// super is [Container].
  ///
  /// color [Colors.white] is default,
  ///
  /// boxShadow [BottomShadow] is default,
  ///
  /// No elevation attribute
  FlattenCard({
    Key? key,
    Alignment? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    FlattenCardDecoration? decoration: const FlattenCardDecoration(),
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Widget? child,
    Clip clipBehavior: Clip.none,
  }) : super(
          key: key,
          alignment: alignment,
          padding: padding,
          color: color,
          decoration: decoration,
          foregroundDecoration: foregroundDecoration,
          margin: margin,
          transform: transform,
          transformAlignment: transformAlignment,
          child: child,
          clipBehavior: clipBehavior,
        );
}

class FlattenAppBar extends AppBar {
  /// super is [Container].
  ///
  /// toolbarHeight [45] is default,
  ///
  /// boxShadow [BottomShadow] is default,
  ///
  /// leadingWidth [25] is default,
  ///
  /// No elevation attribute
  FlattenAppBar({
    Key? key,
    Widget? leading,
    bool automaticallyImplyLeading = true,
    Widget? title,
    List<Widget>? actions,
    Widget? flexibleSpace,
    PreferredSizeWidget? bottom,
    Color? shadowColor,
    ShapeBorder? shape,
    Color? backgroundColor,
    Color? foregroundColor,
    Brightness? brightness,
    IconThemeData? iconTheme,
    IconThemeData? actionsIconTheme,
    TextTheme? textTheme,
    bool primary = true,
    bool? centerTitle,
    bool excludeHeaderSemantics = false,
    double? titleSpacing,
    double toolbarOpacity = 1.0,
    double bottomOpacity = 1.0,
    double? toolbarHeight = 45,
    double? leadingWidth,
    bool? backwardsCompatibility,
    TextStyle? toolbarTextStyle,
    TextStyle? titleTextStyle,
    SystemUiOverlayStyle? systemOverlayStyle,
  }) : super(
            key: key,
            leading: leading,
            automaticallyImplyLeading: automaticallyImplyLeading,
            title: title,
            actions: actions,
            flexibleSpace: flexibleSpace,
            bottom: bottom,
            elevation: 0,
            shadowColor: shadowColor,
            shape: shape,
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            brightness: brightness,
            iconTheme: iconTheme,
            actionsIconTheme: actionsIconTheme,
            textTheme: textTheme,
            primary: primary,
            centerTitle: centerTitle,
            excludeHeaderSemantics: excludeHeaderSemantics,
            titleSpacing: titleSpacing,
            toolbarOpacity: toolbarOpacity,
            bottomOpacity: bottomOpacity,
            toolbarHeight: toolbarHeight,
            leadingWidth: 25,
            backwardsCompatibility: backwardsCompatibility,
            toolbarTextStyle: toolbarTextStyle,
            titleTextStyle: titleTextStyle,
            systemOverlayStyle: systemOverlayStyle);
}

class OpenSansText extends Text {
  /// super is [Text].
  ///
  /// textStyle [OpenSansTextStyle] is default,
  const OpenSansText(
    String data, {
    Key? key,
    TextStyle? style: const OpenSansTextStyle(),
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
  }) : super(
          data,
          key: key,
          style: style,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
        );
}

class TextHeader extends Text {
  /// super is [Text].
  ///
  /// textStyle [OpenSansTextStyle] is default,
  ///
  /// fontWeight [FontWeight.bold] is default,
  const TextHeader(
    String data, {
    Key? key,
    TextStyle? style: const OpenSansTextStyle(fontWeight: FontWeight.bold),
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
  }) : super(
          data,
          key: key,
          style: style,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
        );
}
