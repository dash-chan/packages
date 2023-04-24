// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:pattern_dots/src/painter/pattern_painter.dart';
import 'package:pattern_dots/src/pattern_style.dart';
import 'package:pattern_dots/src/utils/math_helper.dart';

typedef NativeCellCallback = Function(Queue<Cell> cells);
typedef CellCallback = Function(List<int> cells);

class PatternView extends StatefulWidget {
  const PatternView({
    super.key,
    this.matrixX = 3,
    this.matrixY = 3,
    this.tapRange,
    this.lockStyle = PatternLockStyle.normal,
    this.debugshowTapRange,
    this.onTapDown,
    this.onCell,
    this.onComplete,
  });

  /// pattern lock matrix X
  final int matrixX;

  /// pattern lock matrix Y
  final int matrixY;

  /// the tap range of each dots
  final double? tapRange;

  ///
  final PatternLockStyle lockStyle;
  final bool? debugshowTapRange;
  final VoidCallback? onTapDown;
  final NativeCellCallback? onCell;
  final CellCallback? onComplete;

  @override
  State<PatternView> createState() => _PatternViewState();
}

class _PatternViewState extends State<PatternView> {
  double get aspectRatio => widget.matrixX / widget.matrixY;
  late List<List<Cell>> cells;
  final _queque = Queue<Cell>();

  Offset? _currentHand;

  @override
  void initState() {
    super.initState();
    initCells();
  }

  @override
  void didUpdateWidget(PatternView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.matrixX != widget.matrixX ||
        oldWidget.matrixY != widget.matrixY) {
      clearHistory();
    }
    initCells();
  }

  @override
  void dispose() {
    clearHistory();
    super.dispose();
  }

  /// setup cells
  ///
  /// its a x*y matrix
  initCells() {
    cells = Cell.cells(widget.matrixX, widget.matrixY);
  }

  clearHistory() {
    _queque.clear();
  }

  _update() {
    setState(() {
      // update widget
    });
  }

  @override
  Widget build(BuildContext context) {
    final styleData = PatternStyle.of(context).copyWith(
      tapRange: widget.tapRange,
      lockStyle: widget.lockStyle,
      debugshowTapRange: widget.debugshowTapRange,
    );
    return GestureDetector(
      onPanDown: (d) {
        _queque.clear();
        _currentHand ??= d.localPosition;
        widget.onTapDown?.call();
        _update();
      },
      onPanUpdate: (d) {
        if (_currentHand != null) {
          _currentHand = _currentHand! + d.delta;
        }
        _update();
      },
      onPanEnd: (d) {
        _currentHand = null;
        _update();
        widget.onCell?.call(_queque);
        widget.onComplete
            ?.call(_queque.map((e) => e.indexOf(widget.matrixX)).toList());
      },
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: CustomPaint(
          painter: PatternPainter(
            currentPoint: _currentHand,
            queue: _queque,
            cells: cells,
            matrixX: widget.matrixX,
            matrixY: widget.matrixY,
            style: styleData,
          ),
        ),
      ),
    );
  }
}

class Cell {
  const Cell(this.x, this.y);
  static const zero = Cell(0, 0);

  final int x;
  final int y;
  static List<List<Cell>> cells(int matrixX, int matrixY) {
    return List.generate(
      matrixY,
      (i) => List.generate(matrixX, (j) => Cell(i, j)),
    );
  }

  /// * [rect] of box
  /// * tap [point]
  /// * [size] bwtween [point] & [rect]'s center
  bool mesure(Rect rect, Offset point, double size) {
    return offsetsLength(rect.center, point) < size;
  }

  int indexOf(int matrixX) {
    return matrixX * y + x;
  }

  @override
  bool operator ==(covariant Cell other) {
    if (identical(this, other)) return true;

    return other.x == x && other.y == y;
  }

  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() {
    return 'Cell($x,$y)';
  }
}

extension CellMatrixExt on List<List<Cell>> {
  Cell of(int x, int y) {
    return this[x][y];
  }
}
