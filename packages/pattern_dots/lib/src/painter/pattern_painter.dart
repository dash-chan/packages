import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pattern_dots/src/configurations.dart';
import 'package:pattern_dots/src/pattern_style.dart';

import '../pattern_view.dart';

class PatternPainter extends CustomPainter {
  /// painter of pattern lock
  PatternPainter({
    required this.matrixX,
    required this.matrixY,
    required this.currentPoint,
    required this.queue,
    required this.cells,
    required this.style,
  });

  /// matrix X
  final int matrixX;

  /// maxtrix Y
  final int matrixY;

  /// cells matrix
  final List<List<Cell>> cells;

  /// cell queue
  final Queue<Cell> queue;

  /// finger move offset
  final Offset? currentPoint;

  /// patternStyle configuration
  final PatternStyleData style;

  Size _boxSize(Size size) => Size(size.width / matrixX, size.height / matrixY);

  @override
  void paint(Canvas canvas, Size size) {
    final box = _boxSize(size);
    for (var i = 0; i < matrixX; i++) {
      for (var j = 0; j < matrixY; j++) {
        final rect = _boxRect(i, j, box);
        if (currentPoint != null) {
          final currentCell = cells.of(i, j);
          bool tapped = currentCell.mesure(rect, currentPoint!, style.tapRange);
          if (tapped && !queue.contains(currentCell)) {
            queue.add(currentCell);
          }
        }

        if (queue.contains(Cell(i, j))) {
          style.cellBuilder(
            CellConfiguration(
              canvas: canvas,
              lockStyle: style.lockStyle,
              isSelect: true,
              rect: rect,
              brightness: style.brightness,
            ),
          );
        } else {
          style.cellBuilder(
            CellConfiguration(
              canvas: canvas,
              lockStyle: PatternLockStyle.normal,
              isSelect: false,
              rect: rect,
              brightness: style.brightness,
            ),
          );
        }

        _paintDebug(canvas, rect);
      }
    }

    _paintCurrent(canvas);
    _paintQueue(canvas, box);
    _paintQueueLast(canvas, box);
  }

  void _paintQueue(Canvas canvas, Size boxSize) {
    if (queue.length <= 1) return;
    for (var i = 1; i < queue.length; i++) {
      final current = queue.elementAt(i);
      final last = queue.elementAt(i - 1);

      style.lineBuilder(LineConfiguration(
        canvas: canvas,
        lockStyle: style.lockStyle,
        start: _boxRect(current.x, current.y, boxSize).center,
        end: _boxRect(last.x, last.y, boxSize).center,
        isOnPainting: false,
        brightness: style.brightness,
      ));
    }
  }

  void _paintQueueLast(Canvas canvas, Size boxSize) {
    if (queue.isEmpty) return;
    if (currentPoint == null) return;
    style.lineBuilder(LineConfiguration(
      canvas: canvas,
      lockStyle: style.lockStyle,
      start: _boxRect(queue.last.x, queue.last.y, boxSize).center,
      end: currentPoint!,
      isOnPainting: true,
      brightness: style.brightness,
    ));
  }

  void _paintCurrent(Canvas canvas) {
    if (currentPoint != null) {
      style.fingerBuilder?.call(FingerConfiguration(
        canvas: canvas,
        lockStyle: PatternLockStyle.normal,
        offset: currentPoint!,
      ));
    }
  }

  void _paintDebug(Canvas canvas, Rect rect) {
    if (style.debugshowTapRange) {
      canvas.drawCircle(rect.center, style.tapRange,
          Paint()..color = Colors.green.withOpacity(0.2));
    }
  }

  Rect _boxRect(int x, int y, Size size) {
    return Offset(
          size.width * x,
          size.height * y,
        ) &
        size;
  }

  @override
  bool shouldRepaint(PatternPainter oldDelegate) =>
      currentPoint != oldDelegate.currentPoint ||
      matrixX != oldDelegate.matrixX ||
      matrixY != oldDelegate.matrixY ||
      queue != oldDelegate.queue ||
      cells != oldDelegate.cells ||
      style != oldDelegate.style;

  @override
  bool shouldRebuildSemantics(PatternPainter oldDelegate) =>
      matrixX != oldDelegate.matrixX || matrixY != oldDelegate.matrixY;
}
