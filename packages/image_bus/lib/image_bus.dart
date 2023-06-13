library image_bus;

import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'src/resize.dart';
part 'src/crop.dart';

class ImageBus {
  /// {@template imageBus.startup}
  /// A a convenience wrapper of Flutter image decode apis
  /// {@endtemplate}
  ImageBus(this.data);

  /// {@macro imageBus.startup}
  /// may cause [FileSystemException]
  factory ImageBus.fromFile(File file) => ImageBus(file.readAsBytesSync());

  /// the bytes of image
  final Uint8List data;

  /// get image size
  Future<Size> size() async {
    ui.ImageDescriptor descriptor = await ui.ImageDescriptor.encoded(
        await ImmutableBuffer.fromUint8List(data));
    try {
      return Size(descriptor.width.toDouble(), descriptor.height.toDouble());
    } finally {
      descriptor.dispose();
    }
  }

  /// resize image
  Future<Uint8List?> resize(int? maxWidth, int? maxHeight) =>
      _resize(data: data, maxWidth: maxWidth, maxHeight: maxHeight);

  /// crop image
  Future<Uint8List?> crop(int x, int y, int width, int height,
      {Radius? radius}) async {
    final image = await _crop(
      image: await decodeImageFromList(data),
      x: x,
      y: y,
      width: width,
      height: height,
      radius: radius,
    );

    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) return null;
    return byteData.buffer.asUint8List();
  }
}
