import 'dart:math';

import 'package:flutter/material.dart';

class DottedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final double radius;

  DottedBorderPainter({
    this.color = Colors.white,
    this.strokeWidth = 1.0,
    this.dashWidth = 4.0,
    this.dashSpace = 4.0,
    this.radius =
        28.0, // Default radius for a 60x60 container with some padding
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final effectiveRadius = radius - strokeWidth / 2;

    final path = Path();
    final double circumference = 2 * pi * effectiveRadius;
    final int dashCount = (circumference / (dashWidth + dashSpace)).floor();

    for (int i = 0; i < dashCount; i++) {
      final double startAngle = (2 * pi / dashCount) * i;
      final double endAngle = startAngle + (dashWidth / effectiveRadius);
      path.addArc(
        Rect.fromCircle(
          center: Offset(centerX, centerY),
          radius: effectiveRadius,
        ),
        startAngle,
        (dashWidth / effectiveRadius),
      );
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
