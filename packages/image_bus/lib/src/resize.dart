part of '../image_bus.dart';

Future<ui.Image> _resize(
    {required Uint8List data, int? maxWidth, int? maxHeight}) async {
  final codec = await ui.instantiateImageCodecWithSize(
    await ImmutableBuffer.fromUint8List(data),
    getTargetSize: (intrinsicWidth, intrinsicHeight) {
      if (maxWidth == null || maxHeight == null) {
        return ui.TargetImageSize(
          width: maxWidth,
          height: maxHeight,
        );
      }

      final aspectRatio = intrinsicWidth / intrinsicHeight;
      final maxRatio = maxWidth / maxHeight;
      if (aspectRatio < maxRatio) {
        return ui.TargetImageSize(
          width: null,
          height: maxHeight,
        );
      } else {
        return ui.TargetImageSize(
          width: maxWidth,
          height: null,
        );
      }
    },
  );
  final frame = await codec.getNextFrame();
  return frame.image;
}
