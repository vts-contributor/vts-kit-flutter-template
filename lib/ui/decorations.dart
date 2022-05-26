import 'package:flutter/material.dart';

import 'shadows.dart';

class FlattenCardDecoration extends BoxDecoration {
  const FlattenCardDecoration({
    Color? color: Colors.white,
    DecorationImage? image,
    BoxBorder? border,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow: const [const BottomShadow()],
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape shape: BoxShape.rectangle,
  }) : super(
          color: color,
          image: image,
          border: border,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
          gradient: gradient,
          backgroundBlendMode: backgroundBlendMode,
          shape: shape,
        );
}

class StrokeWithCornerDecoration extends BoxDecoration {
  const StrokeWithCornerDecoration({
    Color? color,
    DecorationImage? image,
    BoxBorder? border: const Border.fromBorderSide(
      BorderSide(color: Color(0xFFE0E0E0), width: 1),
    ),
    BorderRadius? borderRadius: const BorderRadius.all(Radius.circular(5)),
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape shape: BoxShape.rectangle,
  }) : super(
          color: color,
          image: image,
          border: border,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
          gradient: gradient,
          backgroundBlendMode: backgroundBlendMode,
          shape: shape,
        );
}
