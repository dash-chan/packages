import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pattern_dots/src/pattern_style.dart';
import 'dart:math' as math;

class PatternView extends StatefulWidget {
  const PatternView({
    super.key,
    this.matrixX = 3,
    this.matrixY = 3,
    this.state = PatternState.active,
    this.tapRange,
    required this.onStart,
    required this.onUpdate,
    required this.onEnd,
    required this.value,
  }) : assert(
          value.length <= (matrixX * matrixY),
          'value length must less than matrixX * matrixY',
        );

  /// pattern lock matrix X
  final int matrixX;

  /// pattern lock matrix Y
  final int matrixY;

  /// state of pattern
  final PatternState state;

  /// the tap range of each dots
  final double? tapRange;

  /// current pattern
  final List<int> value;

  /// on tap down
  final VoidCallback onStart;

  /// on update pattern
  final void Function(List<int> value) onUpdate;

  // on pattern end
  final void Function(List<int> value) onEnd;

  @override
  State<PatternView> createState() => _PatternViewState();
}

class _PatternViewState extends State<PatternView> {
  double get aspectRatio => widget.matrixX / widget.matrixY;
  final currentDot = ValueNotifier<Offset?>(null);

  void safeUpdate() {
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    currentDot.addListener(safeUpdate);
  }

  @override
  void dispose() {
    currentDot.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = PatternStyle.of(context);

    final currentTapRange = widget.tapRange ?? data.tapRange;

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: GestureDetector(
        onPanDown: (details) {
          widget.onStart();
          currentDot.value = details.localPosition;
        },
        onPanUpdate: (details) {
          currentDot.value = details.localPosition;
        },
        onPanEnd: (details) {
          currentDot.value = null;
          widget.onEnd(widget.value);
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (data.dotBuilder != null)
              Column(
                children: [
                  for (int y = 0; y < widget.matrixY; y++)
                    Expanded(
                      child: Row(
                        children: [
                          for (int x = 0; x < widget.matrixX; x++)
                            Expanded(
                              child: Center(
                                child: data.dotBuilder!.call(
                                  widget.value.contains(x + y * widget.matrixX)
                                      ? widget.state
                                      : PatternState.normal,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            CustomPaint(
              painter: PatternPainter(
                data.dotPainter,
                matrixX: widget.matrixX,
                matrixY: widget.matrixY,
                linePaint: data.linePaint,
                dots: widget.value,
                current: currentDot.value,
                tapRange: currentTapRange,
                updateIndex: (int index) async {
                  final result = List<int>.from(widget.value)..add(index);
                  await WidgetsBinding.instance.endOfFrame;
                  if (mounted) widget.onUpdate(result);
                },
                state: widget.state,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PatternPainter extends CustomPainter {
  PatternPainter(
    this.painter, {
    required this.matrixX,
    required this.matrixY,
    required this.dots,
    required this.linePaint,
    required this.current,
    required this.tapRange,
    required this.updateIndex,
    required this.state,
  });

  final PatternPainterCallback? painter;
  final Paint Function(PatternState state) linePaint;
  final int matrixX;
  final int matrixY;
  final List<int> dots;
  final Offset? current;
  final double tapRange;
  final void Function(int index) updateIndex;
  final PatternState state;

  @override
  void paint(Canvas canvas, Size size) {
    final cellWidth = size.width / matrixX;
    final cellHeight = size.height / matrixY;

    // draw dots
    for (var i = 0; i < matrixX; i++) {
      for (var j = 0; j < matrixY; j++) {
        final index = i + j * matrixX;
        final active = dots.contains(index);

        final offset = Offset(cellWidth * (i + 0.5), cellHeight * (j + 0.5));
        if (active) {
          painter?.call(state, canvas, offset);
        } else {
          painter?.call(PatternState.normal, canvas, offset);
        }

        if (current != null) {
          if (dots.isEmpty) {
            final mesureState = mesure(offset, current!, tapRange);
            if (mesureState) {
              updateIndex(index);
            }
          } else {
            if (!active) {
              final mesureState = mesure(offset, current!, tapRange);
              if (mesureState) {
                updateIndex(index);
              }
            }
          }

          if (dots.lastOrNull == index) {
            canvas.drawLine(
              offset,
              current!,
              linePaint(state),
            );
          }
        }
      }
    }

    // draw lines
    for (var i = 0; i < dots.length; i++) {
      final current = dots.elementAt(i);
      final last = (i - 1) >= 0 ? dots.elementAt(i - 1) : null;
      if (last == null) continue;
      if (dots.length <= 1) break;
      final offset = Offset(
        cellWidth * (current % matrixX + 0.5),
        cellHeight * (current ~/ matrixX + 0.5),
      );
      final lastoffset = Offset(
        cellWidth * (last % matrixX + 0.5),
        cellHeight * (last ~/ matrixX + 0.5),
      );

      canvas.drawLine(offset, lastoffset, linePaint(state));
    }
  }

  bool mesure(Offset dotOffset, Offset current, double range) {
    final offset = dotOffset - current;
    final length = math.sqrt(math.pow(offset.dx, 2) + math.pow(offset.dy, 2));
    return length <= range;
  }

  // final PatternPainterCallback painter;
  // final Paint Function(PatternState state) linePaint;
  // final int matrixX;
  // final int matrixY;
  // final List<int> dots;
  // final Offset? current;
  // final double tapRange;
  // final void Function(int index) updateIndex;
  // final bool error;
  // final bool success;
  @override
  bool shouldRepaint(PatternPainter oldDelegate) =>
      oldDelegate.current != current ||
      listEquals(oldDelegate.dots, dots) ||
      oldDelegate.matrixX != matrixX ||
      oldDelegate.matrixY != matrixY ||
      oldDelegate.tapRange != tapRange ||
      oldDelegate.state != state;

  @override
  bool shouldRebuildSemantics(PatternPainter oldDelegate) => false;
}
