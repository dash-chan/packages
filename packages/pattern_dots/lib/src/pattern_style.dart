// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum PatternState {
  /// normal state, the dots is not selected
  normal,

  /// selected state, the dots is selected
  active,

  /// success state, the pattern is complete
  success,

  /// error state, the pattern is wrong
  error,
}

/// callback of draw dots
typedef PatternPainterCallback = void Function(
    PatternState state, Canvas canvas, Offset center);

/// pattern style
class PatternStyle extends InheritedWidget {
  const PatternStyle({
    super.key,
    required this.data,
    required super.child,
  });

  /// the patternStyle configuration
  final PatternStyleData data;

  @override
  bool updateShouldNotify(PatternStyle oldWidget) => oldWidget.data != data;

  /// get PatternStyle configuration from [context]
  static PatternStyleData of(BuildContext context) {
    final style = context.dependOnInheritedWidgetOfExactType<PatternStyle>();
    return style?.data ?? PatternStyleData.newAndroid();
  }
}

class PatternStyleData with Diagnosticable {
  /// original usage of [PatternStyleData]
  PatternStyleData.raw({
    required this.tapRange,
    required this.linePaint,
    required this.dotBuilder,
    required this.dotPainter,
  }) : assert(dotBuilder != null || dotPainter != null,
            'must set a dotBuilder or dotPainter');

  /// a PatternStyleData
  factory PatternStyleData({
    double? tapRange,
    Paint Function(PatternState state)? linePaint,
    Widget Function(PatternState state)? dotBuilder,
    PatternPainterCallback? dotPainter,
  }) {
    final defaultValue = PatternStyleData.newAndroid();
    tapRange ??= defaultValue.tapRange;
    linePaint ??= defaultValue.linePaint;
    dotBuilder ??= defaultValue.dotBuilder;
    dotPainter ??= defaultValue.dotPainter;

    return PatternStyleData.raw(
      tapRange: tapRange,
      linePaint: linePaint,
      dotBuilder: dotBuilder,
      dotPainter: dotPainter,
    );
  }

  /// a new android style pattern
  factory PatternStyleData.newAndroid() {
    Color stateColor(PatternState state) => switch (state) {
          PatternState.normal => const Color(0xFF9E9E9E),
          PatternState.active => const Color(0xFF9E9E9E),
          PatternState.success => const Color(0xFF4CAF50),
          PatternState.error => const Color(0xFFF44336),
        };

    return PatternStyleData.raw(
      tapRange: 4,
      linePaint: (state) => Paint()
        ..strokeWidth = 4
        ..color = stateColor(state).withOpacity(0.3),
      dotBuilder: null,
      dotPainter: (state, canvas, center) {
        canvas.drawCircle(center, 2, Paint()..color = stateColor(state));
      },
    );
  }

  /// the tap range of each dots
  final double tapRange;

  /// the [Paint] to draw line
  final Paint Function(PatternState state) linePaint;

  /// the [Widget] to draw dot
  final Widget Function(PatternState state)? dotBuilder;

  /// the [PatternPainterCallback] to draw dot
  final PatternPainterCallback? dotPainter;

  @override
  bool operator ==(covariant PatternStyleData other) {
    if (identical(this, other)) return true;

    return other.tapRange == tapRange &&
        other.linePaint == linePaint &&
        other.dotBuilder == dotBuilder &&
        other.dotPainter == dotPainter;
  }

  @override
  int get hashCode => Object.hash(tapRange, linePaint, dotBuilder, dotPainter);
}
