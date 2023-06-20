# image_bus

> this is a package, use with care.

provider a convenience way to manipulate images 🖼️.

## Getting Started

```dart
final imageBytes = File("some_image.png").readAsBytesSync();

final Size size = await ImageBus(imageBytes).size();
final Uint8List? resizeImageBytes = await ImageBus(imageBytes).resize(maxWidth: 1920, maxHeight: 1920);
final Uint8List? cropImageBytes = await ImageBus(imageBytes).crop(0, 0, 100, 100);
```
