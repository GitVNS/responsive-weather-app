import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.9);
    path.cubicTo(size.width * 0.25, size.height * 0.75, size.width * 0.75,
        size.height, size.width, size.height * 0.9);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.9);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
