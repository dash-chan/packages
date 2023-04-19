import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pattern_dots/src/pattern_style.dart';

import 'pattern_view.dart';

class PatternPainter extends CustomPainter {
  PatternPainter({
    required this.matrixX,
    required this.matrixY,
    required this.currentPoint,
    required this.queue,
    required this.cells,
    required this.style,
  });
  final int matrixX;
  final int matrixY;
  final List<List<Cell>> cells;
  final Queue<Cell> queue;
  final Offset? currentPoint;
  final PatternStyleData style;

  Size boxSize(Size size) => Size(size.width / matrixX, size.height / matrixY);

  @override
  void paint(Canvas canvas, Size size) {
    final box = boxSize(size);
    for (var i = 0; i < matrixX; i++) {
      for (var j = 0; j < matrixY; j++) {
        final rect = boxRect(i, j, box);
        if (currentPoint != null) {
          final currentCell = cells.of(i, j);
          bool tapped = currentCell.mesure(rect, currentPoint!, style.tapRange);
          if (tapped && !queue.contains(currentCell)) {
            queue.add(currentCell);
          }
        }

        if (queue.contains(Cell(i, j))) {
          style.cellBuilder(canvas, rect, style.isError, true);
        } else {
          style.cellBuilder(canvas, rect, false, false);
        }

        paintDebug(canvas, rect);
      }
    }

    paintCurrent(canvas);
    paintQueue(canvas, box);
    paintQueueLast(canvas, box);
  }

  void paintQueue(Canvas canvas, Size boxSize) {
    if (queue.length <= 1) return;
    for (var i = 1; i < queue.length; i++) {
      final current = queue.elementAt(i);
      final last = queue.elementAt(i - 1);

      style.lineBuilder(
        canvas,
        boxRect(current.x, current.y, boxSize).center,
        boxRect(last.x, last.y, boxSize).center,
        false,
        style.isError,
      );
    }
  }

  void paintQueueLast(Canvas canvas, Size boxSize) {
    if (queue.isEmpty) return;
    if (currentPoint == null) return;
    style.lineBuilder(
      canvas,
      currentPoint!,
      boxRect(queue.last.x, queue.last.y, boxSize).center,
      true,
      style.isError,
    );
  }

  int currentDot(int x, int y) => matrixX * y + x;

  void paintCurrent(Canvas canvas) {
    if (currentPoint != null) {
      style.fingerBuilder?.call(canvas, currentPoint!);
    }
  }

  void paintDebug(Canvas canvas, Rect rect) {
    if (style.debugshowTapRange) {
      canvas.drawCircle(rect.center, style.tapRange,
          Paint()..color = Colors.green.withOpacity(0.2));
    }
  }

  Rect boxRect(int x, int y, Size size) {
    return Offset(
          size.width * x,
          size.height * y,
        ) &
        size;
  }

  @override
  bool shouldRepaint(PatternPainter oldDelegate) =>
      matrixX != oldDelegate.matrixX ||
      matrixY != oldDelegate.matrixY ||
      currentPoint != oldDelegate.currentPoint;

  @override
  bool shouldRebuildSemantics(PatternPainter oldDelegate) => false;
}
