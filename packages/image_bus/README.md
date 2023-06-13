# image_bus

provider a convenience way to manipulate images 🖼️.

## Getting Started

```dart
final imageBytes = File("some_image.png").readAsBytesSync();
ImageBus(imageBytes).resize();
ImageBus(imageBytes).crop(0, 0, 100, 100);
```
