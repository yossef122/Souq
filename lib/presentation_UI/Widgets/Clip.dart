import 'package:flutter/material.dart';

class ClipperPathBuilder extends CustomClipper<Path> {
  @override
  double DxOfOffset;
  double DyOfOffset;
  double radius;

  ClipperPathBuilder({
    required this.DxOfOffset,
    required this.DyOfOffset,
    required this.radius,
  });

  Path getClip(Size size) {
    Path path = Path();
    path.addOval(Rect.fromCircle(
        center: Offset(DxOfOffset, DyOfOffset), radius: radius));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
