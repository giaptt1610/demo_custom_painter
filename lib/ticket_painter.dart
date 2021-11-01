import 'dart:ui';
import 'dart:math' show pi;
import 'package:flutter/material.dart';

class TicketPainter extends CustomPainter {
  final Color background;
  final double leftSide;
  final double notchRadius;
  final double dashLen;
  final double dashSpacing;

  TicketPainter({
    this.leftSide = 100.0,
    this.notchRadius = 15.0,
    this.background = Colors.blue,
    this.dashLen = 6.0,
    this.dashSpacing = 3.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final ticketPaint = Paint()..color = background;

    final bound = Rect.fromLTRB(0, 0, size.width, size.height);
    final p1 = bound.topLeft;
    final p2 = bound.bottomLeft;
    final p3 = Offset(p2.dx + leftSide - notchRadius, p2.dy);
    final p4 = bound.bottomRight;
    final p5 = bound.topRight;
    final p6 = Offset(p1.dx + leftSide - notchRadius, p1.dy);

    final circleBot = Rect.fromCircle(center: p3, radius: notchRadius);
    final circleTop = Rect.fromCircle(center: p6, radius: notchRadius);

    final path = Path()
      ..lineTo(p2.dx, p2.dy)
      ..lineTo(p3.dx - notchRadius, p3.dy)
      ..arcTo(circleBot, pi, pi, false)
      ..lineTo(p4.dx, p4.dy)
      ..lineTo(p5.dx, p5.dy)
      ..lineTo(p6.dx + notchRadius, p6.dy)
      ..arcTo(circleTop, 0, pi, false)
      ..lineTo(p1.dx, p1.dy);
    canvas.drawPath(path, ticketPaint);
    _drawDashLine(canvas, Offset(p6.dx, p6.dy + notchRadius),
        Offset(p3.dx, p3.dy - notchRadius));
  }

  void _drawDashLine(Canvas canvas, Offset startPoint, Offset endPoint) {
    assert(startPoint.dx == endPoint.dx || startPoint.dy == endPoint.dy);
    final paint = Paint()
      ..strokeWidth = 2.0
      ..color = Colors.black12;

    if (startPoint.dx == endPoint.dx) {
      double _dy = startPoint.dy;
      while (_dy < endPoint.dy) {
        canvas.drawLine(Offset(startPoint.dx, _dy),
            Offset(startPoint.dx, _dy + dashLen), paint);
        _dy = _dy + dashLen + dashSpacing;
      }
    } else if (startPoint.dy == endPoint.dy) {}
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
