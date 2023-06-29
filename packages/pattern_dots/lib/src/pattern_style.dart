// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pattern_dots/src/configurations.dart';

import 'painter/styles.dart';

/// Builder for Cell
typedef CellBuilder = void Function(CellConfiguration config);

/// Builder for Line
typedef LineBuilder = void Function(LineConfiguration config);
typedef CurrentFingerBuilder = void Function(FingerConfiguration config);

/// State of pattern lock
enum PatternLockStyle {
  /// failed state show the red dots
  failed,

  /// normal state.
  normal,

  /// success state.normally use grren dots
  success;
}

/// {@template PatternStyle}
/// PatternStyle
///
/// ```dart
/// PatternStyle(
///   data: PatternStyleData(),
///   child: PatternView(),
/// )
/// ```
/// {@endtemplate}
class PatternStyle extends InheritedWidget {
  /// {@macro PatternStyle}
  const PatternStyle({
    super.key,
    required super.child,
    required this.data,
  });

  /// the patternStyle configuration
  final PatternStyleData data;

  @override
  bool updateShouldNotify(PatternStyle oldWidget) => oldWidget.data != data;

  /// get PatternStyle configuration from [context]
  static PatternStyleData of(BuildContext context) {
    final style = context.dependOnInheritedWidgetOfExactType<PatternStyle>();
    return style?.data ?? PatternStyleData();
  }
}

/// {@template PatternStyleData}
/// PatternStyle Configuration
///
/// ```dart
/// PatternStyleData()
/// ```
/// {@endtemplate}
class PatternStyleData with Diagnosticable {
  /// original usage of [PatternStyleData]
  PatternStyleData.raw({
    required this.tapRange,
    this.cellBuilder = defaultCellBuilder,
    this.lineBuilder = defaultLineBuilder,
    required this.fingerBuilder,
    required this.lockStyle,
    required this.debugshowTapRange,
    required this.brightness,
  });

  /// {@macro PatternStyleData}
  factory PatternStyleData({
    double? tapRange,
    CellBuilder? cellBuilder,
    LineBuilder? lineBuilder,
    CurrentFingerBuilder? fingerBuilder,
    PatternLockStyle? lockStyle,
    bool debugshowTapRange = false,
    Brightness? brightness,
  }) {
    cellBuilder ??= defaultCellBuilder;
    lineBuilder ??= defaultLineBuilder;

    return PatternStyleData.raw(
      tapRange: tapRange ?? 16,
      cellBuilder: cellBuilder,
      lineBuilder: lineBuilder,
      fingerBuilder: fingerBuilder,
      lockStyle: lockStyle ?? PatternLockStyle.normal,
      debugshowTapRange: debugshowTapRange,
      brightness: brightness ?? Brightness.light,
    );
  }

  factory PatternStyleData.newAndroid() {
    return PatternStyleData(
      tapRange: 4,
      cellBuilder: defaultCellBuilder,
    );
  }

  /// tap range
  final double tapRange;

  /// when [cellBuilder] not null,
  ///
  /// [cellSize] will ignore
  final CellBuilder cellBuilder;

  /// render line
  final LineBuilder lineBuilder;

  /// render finger, default is [null]
  final CurrentFingerBuilder? fingerBuilder;

  /// show red dots & red line by defaults
  final PatternLockStyle lockStyle;

  /// show debug tap range
  final bool debugshowTapRange;

  /// brightness of widgets
  final Brightness brightness;

  /// copy properties
  PatternStyleData copyWith({
    double? width,
    double? tapRange,
    CellBuilder? cellBuilder,
    LineBuilder? lineBuilder,
    CurrentFingerBuilder? fingerBuilder,
    PatternLockStyle? lockStyle,
    bool? debugshowTapRange,
    Brightness? brightness,
  }) {
    return PatternStyleData.raw(
      tapRange: tapRange ?? this.tapRange,
      cellBuilder: cellBuilder ?? this.cellBuilder,
      lineBuilder: lineBuilder ?? this.lineBuilder,
      fingerBuilder: fingerBuilder ?? this.fingerBuilder,
      lockStyle: lockStyle ?? this.lockStyle,
      debugshowTapRange: debugshowTapRange ?? this.debugshowTapRange,
      brightness: brightness ?? this.brightness,
    );
  }

  @override
  bool operator ==(covariant PatternStyleData other) {
    if (identical(this, other)) return true;

    return other.tapRange == tapRange &&
        other.cellBuilder == cellBuilder &&
        other.lineBuilder == lineBuilder &&
        other.fingerBuilder == fingerBuilder &&
        other.lockStyle == lockStyle &&
        other.debugshowTapRange == debugshowTapRange &&
        other.brightness == brightness;
  }

  @override
  int get hashCode => Object.hashAll([
        tapRange,
        cellBuilder,
        lineBuilder,
        fingerBuilder,
        lockStyle,
        debugshowTapRange,
        brightness,
      ]);
}
