import 'package:flutter/material.dart';

import 'BottomLeftTriangularClipper.dart';
import 'TopRightTriangularClipper.dart';

/// ButtonEachTwoRightTriangularWithDivider.dart
class ButtonEachTwoRightTriangleWithDivider extends StatelessWidget {
  final Color bottomLeftTriangleBackgroundColor;
  final Color dividerColor;
  final double? height;
  final double? width;
  final Decoration? topRightTriangleDecoration;
  final void Function()? bottomLeftTriangleOnTap;
  final void Function()? topRightTriangleOnTap;

  const ButtonEachTwoRightTriangleWithDivider({
    Key? key,
    required this.bottomLeftTriangleBackgroundColor,
    required this.dividerColor,
    this.height,
    this.width,
    this.topRightTriangleDecoration,
    this.bottomLeftTriangleOnTap,
    this.topRightTriangleOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.transparent,
          height: height,
          width: width,
        ),
        GestureDetector(
          onTap: bottomLeftTriangleOnTap,
          child: Container(
            height: height,
            width: width,
            decoration: topRightTriangleDecoration,
            child: CustomPaint(
              painter: BottomLeftTriangularPainter(
                  bottomLeftTriangleBackgroundColor:
                  bottomLeftTriangleBackgroundColor,
                  dividerColor: dividerColor),
            ),
          ),
        ),
        Stack(
          children: [ClipPath( 
              clipper: TopRightTriangularClipper(),
              child: GestureDetector(
                onTap: topRightTriangleOnTap,
                child: Container(
                  height: height,
                  width: width,
                  decoration: topRightTriangleDecoration,
                ),
              )),
        ])
      ],
    );
  }
}