import 'package:flutter/material.dart';

/// top_right_triangular_clipper.dart
class TopRightTriangularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final topRightTrianglePath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, 0);

    return topRightTrianglePath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}