import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pattern_dots/src/configurations.dart';
import 'package:pattern_dots/src/pattern_style.dart';

/// default cell builder
void defaultCellBuilder(CellConfiguration configuration) {
  late Paint paint;

  switch (configuration.lockStyle) {
    case PatternLockStyle.failed:
      paint = Paint()..color = const Color(0xFFF44336);
      break;
    case PatternLockStyle.normal:
      paint = Paint()..color = const Color(0xFF9E9E9E);
      break;
    case PatternLockStyle.success:
      paint = Paint()..color = const Color(0xFF4CAF50);
      break;
  }
  configuration.canvas.drawCircle(configuration.rect.center, 2, paint);
}

void defaultLineBuilder(LineConfiguration configuration) {
  late Paint paint;
  switch (configuration.lockStyle) {
    case PatternLockStyle.failed:
      paint = Paint()
        ..strokeWidth = 4
        ..color = const Color(0xFFF44336).withOpacity(0.3);
      break;
    case PatternLockStyle.normal:
      paint = Paint()
        ..strokeWidth = 4
        ..color = const Color(0xFF9E9E9E).withOpacity(0.3);
      break;
    case PatternLockStyle.success:
      paint = Paint()
        ..strokeWidth = 4
        ..color = const Color(0xFF4CAF50).withOpacity(0.3);
      break;
  }

  configuration.canvas.drawLine(configuration.start, configuration.end, paint);
}
