import 'package:flutter/material.dart';

class BottomShadow extends BoxShadow {
  const BottomShadow({
    Color color: const Color.fromRGBO(0, 0, 0, 0.1),
    double blurRadius: 4.0,
    double spreadRadius: 0.0,
    Offset offset: const Offset(0.0, 2.0), // shadow direction: bottom right
  }) : super(
    color: color,
    blurRadius: blurRadius,
    spreadRadius: spreadRadius,
    offset: offset,
  );
}
