import 'package:flutter/material.dart';

extension SizingExtensions on Widget {
  Expanded expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  Flexible flexible({int flex = 1}) => Flexible(flex: flex, child: this);

  FittedBox fittedBox({BoxFit fit = BoxFit.contain}) =>
      FittedBox(fit: fit, child: this);

  Padding symetricPadding({double horizontal = 0, double vertical = 0}) =>
      Padding(
          padding:
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          child: this);

  Padding paddingForOnly(
          {double top = 0,
          double bottom = 0,
          double left = 0,
          double right = 0}) =>
      Padding(
          padding: EdgeInsets.only(
              top: top, bottom: bottom, left: left, right: right),
          child: this);

  Center centerThis() => Center(child: this);
}
