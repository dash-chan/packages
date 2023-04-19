// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef CellBuilder = void Function(
  Canvas canvas,
  Rect rect,
  bool isError,
  bool isSelect,
);
typedef LineBuilder = void Function(
  Canvas canvas,
  Offset start,
  Offset end,
  bool isOnPainting,
  bool isError,
);
typedef CurrentFingerBuilder = void Function(Canvas canvas, Offset offset);

class PatternStyle extends InheritedWidget {
  const PatternStyle({
    super.key,
    required super.child,
    required this.data,
  });

  final PatternStyleData data;

  @override
  bool updateShouldNotify(PatternStyle oldWidget) => oldWidget.data != data;

  static PatternStyleData of(BuildContext context) {
    final style = context.dependOnInheritedWidgetOfExactType<PatternStyle>();
    return style?.data ?? PatternStyleData();
  }
}

void defaultCellBuilder(Canvas canvas, Rect rect, bool isError, bool isSelect) {
  late Paint paint;
  if (isError) {
    paint = Paint()..color = const Color(0xFFF44336);
  } else {
    paint = Paint()..color = const Color(0xFF9E9E9E);
  }
  canvas.drawCircle(rect.center, 2, paint);
}

void defaultLineBuilder(
    Canvas canvas, Offset start, Offset end, bool isOnPainting, bool isError) {
  late Paint paint;

  if (isError) {
    paint = Paint()
      ..strokeWidth = 4
      ..color = const Color(0xFFF44336).withOpacity(0.3);
  } else {
    paint = Paint()
      ..strokeWidth = 4
      ..color = const Color(0xFF9E9E9E).withOpacity(0.3);
  }
  canvas.drawLine(start, end, paint);
}

class PatternStyleData with Diagnosticable {
  PatternStyleData.raw({
    required this.width,
    required this.tapRange,
    this.cellBuilder = defaultCellBuilder,
    this.lineBuilder = defaultLineBuilder,
    required this.fingerBuilder,
    required this.isError,
    required this.debugshowTapRange,
  });
  factory PatternStyleData({
    double? width,
    double? tapRange,
    CellBuilder? cellBuilder,
    LineBuilder? lineBuilder,
    CurrentFingerBuilder? fingerBuilder,
    bool? isError,
    bool debugshowTapRange = false,
  }) {
    cellBuilder ??= defaultCellBuilder;
    lineBuilder ??= defaultLineBuilder;

    return PatternStyleData.raw(
      width: width ?? 1,
      tapRange: tapRange ?? 16,
      cellBuilder: cellBuilder,
      lineBuilder: lineBuilder,
      fingerBuilder: fingerBuilder,
      isError: isError ?? false,
      debugshowTapRange: debugshowTapRange,
    );
  }

  /// [width] of each line
  final double width;
  final double tapRange;

  /// when [cellBuilder] not null,
  ///
  /// [cellSize] will ignore
  final CellBuilder cellBuilder;

  final LineBuilder lineBuilder;

  final CurrentFingerBuilder? fingerBuilder;

  final bool isError;

  final bool debugshowTapRange;

  PatternStyleData copyWith({
    double? width,
    double? tapRange,
    CellBuilder? cellBuilder,
    LineBuilder? lineBuilder,
    CurrentFingerBuilder? fingerBuilder,
    bool? isError,
    bool? debugshowTapRange,
  }) {
    return PatternStyleData.raw(
      width: width ?? this.width,
      tapRange: tapRange ?? this.tapRange,
      cellBuilder: cellBuilder ?? this.cellBuilder,
      lineBuilder: lineBuilder ?? this.lineBuilder,
      fingerBuilder: fingerBuilder ?? this.fingerBuilder,
      isError: isError ?? this.isError,
      debugshowTapRange: debugshowTapRange ?? this.debugshowTapRange,
    );
  }

  @override
  bool operator ==(covariant PatternStyleData other) {
    if (identical(this, other)) return true;

    return other.width == width &&
        other.tapRange == tapRange &&
        other.cellBuilder == cellBuilder &&
        other.lineBuilder == lineBuilder &&
        other.fingerBuilder == fingerBuilder &&
        other.isError == isError &&
        other.debugshowTapRange == debugshowTapRange;
  }

  @override
  int get hashCode => Object.hashAll([
        width,
        tapRange,
        cellBuilder,
        lineBuilder,
        fingerBuilder,
        debugshowTapRange,
      ]);
}
