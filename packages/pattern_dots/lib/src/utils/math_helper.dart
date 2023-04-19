import 'dart:math' as math;

import 'package:flutter/widgets.dart';

/// compute length between two dots
double offsetsLength(Offset a, Offset b) {
  return math.sqrt(math.pow((a.dx - b.dx), 2) + math.pow((a.dy - b.dy), 2));
}
