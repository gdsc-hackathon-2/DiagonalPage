import 'package:flutter/material.dart';

/// bottom_left_triangular_clipper.dart
class BottomLeftTriangularPainter extends CustomPainter {
  final Color dividerColor;
  final Color bottomLeftTriangleBackgroundColor;

  const BottomLeftTriangularPainter({
    required this.dividerColor,
    required this.bottomLeftTriangleBackgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final bottomLeftTrianglePath = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(0, 0);

    final dividerPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, size.height);

    final bottomLeftTrianglePaint = Paint()
      ..color = bottomLeftTriangleBackgroundColor
      ..style = PaintingStyle.fill;

    final dividerPaint = Paint()
      ..color = dividerColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawPath(bottomLeftTrianglePath, bottomLeftTrianglePaint);
    canvas.drawPath(dividerPath, dividerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
