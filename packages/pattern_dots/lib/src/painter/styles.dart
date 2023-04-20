import 'dart:ui';

import 'package:pattern_dots/src/configurations.dart';

/// default cell builder
void defaultCellBuilder(CellConfiguration configuration) {
  late Paint paint;
  if (configuration.isError) {
    paint = Paint()..color = const Color(0xFFF44336);
  } else {
    paint = Paint()..color = const Color(0xFF9E9E9E);
  }
  configuration.canvas.drawCircle(configuration.rect.center, 2, paint);
}

void defaultLineBuilder(LineConfiguration configuration) {
  late Paint paint;

  if (configuration.isError) {
    paint = Paint()
      ..strokeWidth = 4
      ..color = const Color(0xFFF44336).withOpacity(0.3);
  } else {
    paint = Paint()
      ..strokeWidth = 4
      ..color = const Color(0xFF9E9E9E).withOpacity(0.3);
  }
  configuration.canvas.drawLine(configuration.start, configuration.end, paint);
}
