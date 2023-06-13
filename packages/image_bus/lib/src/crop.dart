part of '../image_bus.dart';

Future<ui.Image> _crop({
  required ui.Image image,
  required int x,
  required int y,
  required int width,
  required int height,
  Radius? radius,
}) {
  final rect = Rect.fromLTWH(
    x.toDouble(),
    y.toDouble(),
    width.toDouble(),
    height.toDouble(),
  );

  final dst = Rect.fromLTWH(
    0,
    0,
    width.toDouble(),
    height.toDouble(),
  );

  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder);
  if (radius != null) {
    canvas.clipRRect(RRect.fromLTRBR(0, 0, width / 1, height / 1, radius));
  }
  canvas.drawImageRect(image, rect, dst, ui.Paint());

  final picture = recorder.endRecording();
  try {
    return picture.toImage(width, height);
  } finally {
    picture.dispose();
  }
}
