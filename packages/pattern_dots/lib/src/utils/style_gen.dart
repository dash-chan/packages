// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class RectStyleGen {
  void paint(Canvas canvas, Offset offset);
}

abstract class LineStyleGen {
  void paint(Canvas canvas, Offset start, Offset end);
}

class RangeLineStyleGen extends LineStyleGen {
  RangeLineStyleGen({
    required this.color,
    this.style = PaintingStyle.fill,
    this.width = 4,
    this.cap = StrokeCap.round,
  });
  final Color color;
  final PaintingStyle style;
  final double width;
  final StrokeCap cap;

  @override
  void paint(Canvas canvas, Offset start, Offset end) {
    canvas.drawLine(
      start,
      end,
      Paint()
        ..color = color
        ..style = style
        ..strokeWidth = width
        ..strokeCap = cap,
    );
  }
}

class CircleGen extends RectStyleGen {
  CircleGen({
    required this.radius,
    required this.color,
    this.strokeWidth = 1,
    this.style = PaintingStyle.stroke,
  });
  final double radius;
  final Color color;
  final double strokeWidth;
  final PaintingStyle style;

  @override
  void paint(Canvas canvas, Offset offset) {
    canvas.drawCircle(
      offset,
      radius,
      Paint()
        ..color = color
        ..strokeWidth = strokeWidth
        ..style = style,
    );
  }
}

class ShapeGen extends RectStyleGen {
  ShapeGen({
    required this.width,
    required this.height,
    required this.shape,
    this.backgroundColor,
  });
  final ShapeBorder shape;
  final double width;
  final double height;
  final Color? backgroundColor;
  @override
  void paint(Canvas canvas, Offset offset) {
    if (backgroundColor != null) {
      shape.paintInterior(
        canvas,
        Rect.fromCenter(center: offset, width: width, height: height),
        Paint()..color = backgroundColor!,
      );
    }
    shape.paint(
      canvas,
      Rect.fromCenter(center: offset, width: width, height: height),
    );
  }
}
