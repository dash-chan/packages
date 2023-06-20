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

  /// resize image to [ui.Image]
  Future<UIImage> resizeImage({int? maxWidth, int? maxHeight}) async {
    return UIImage(
      await _resize(
        data: data,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      ),
    );
  }

  /// resize image to bytes
  Future<Uint8List?> resize({int? maxWidth, int? maxHeight}) async {
    return (await resizeImage(maxWidth: maxWidth, maxHeight: maxHeight))
        .bytes();
  }

  /// crop image to [ui.Image]
  Future<UIImage> cropImage(int x, int y, int width, int height,
      {Radius? radius}) async {
    return UIImage(await _crop(
      image: await decodeImageFromList(data),
      x: x,
      y: y,
      width: width,
      height: height,
      radius: radius,
    ));
  }

  /// crop image to bytes [Uint8List]
  Future<Uint8List?> crop(int x, int y, int width, int height,
      {Radius? radius}) async {
    return (await cropImage(x, y, width, height, radius: radius)).bytes();
  }
}

/// a wrapper of dart:ui [ui.Image]
class UIImage {
  UIImage(this.img);

  /// image data
  final ui.Image img;

  /// convert a img to bytes with [format]
  ///
  /// default convert to a png image
  Future<Uint8List?> bytes(
      [ui.ImageByteFormat format = ui.ImageByteFormat.png]) async {
    try {
      final byteData = await img.toByteData(format: format);
      if (byteData == null) return null;
      return byteData.buffer.asUint8List();
    } catch (e) {
      return null;
    }
  }
}
