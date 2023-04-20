// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class _Configuration {
  const _Configuration({
    required this.canvas,
    required this.isError,
  });
  final Canvas canvas;
  final bool isError;
}

class CellConfiguration extends _Configuration {
  CellConfiguration({
    required super.canvas,
    required super.isError,
    required this.isSelect,
    required this.rect,
    required this.brightness,
  });

  final bool isSelect;
  final Rect rect;
  final Brightness brightness;
}

class LineConfiguration extends _Configuration {
  LineConfiguration({
    required super.canvas,
    required super.isError,
    required this.start,
    required this.end,
    required this.isOnPainting,
    required this.brightness,
  });
  final Offset start;
  final Offset end;
  final bool isOnPainting;
  final Brightness brightness;
}

class FingerConfiguration extends _Configuration {
  FingerConfiguration({
    required super.canvas,
    required super.isError,
    required this.offset,
  });

  final Offset offset;
}
