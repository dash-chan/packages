import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class WebviewGestureRecognizer extends VerticalDragGestureRecognizer {
  WebviewGestureRecognizer({
    required this.offset,
    required this.scrollController,
    required this.context,
    super.debugOwner,
    super.allowedButtonsFilter,
  }) : super(
          supportedDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.trackpad,
          },
        );

  final ScrollController scrollController;
  final BuildContext context;
  final ValueNotifier<double> offset;

  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }

  Drag? _drag;

  @override
  GestureDragStartCallback? get onStart => (details) {
        if (offset.value <= 0) {
          _drag = scrollController.position.drag(details, () {
            _drag = null;
          });
        } else {
          _drag = null;
        }
      };

  @override
  GestureDragUpdateCallback? get onUpdate => (details) {
        if (details.delta.dy > 0) {
          _drag?.update(details);
        } else {
          _drag?.end(DragEndDetails(primaryVelocity: 0));
          _drag = null;
        }
      };

  @override
  GestureDragEndCallback? get onEnd => (details) {
        print(details);
        _drag?.end(details);
      };
}
