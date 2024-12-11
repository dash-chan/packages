import 'package:devision/src/tool_modal.dart';
import 'package:flutter/material.dart';

const kButtonSize = 32.0;

class DevisionFab extends StatefulWidget {
  const DevisionFab({super.key});

  @override
  State<DevisionFab> createState() => _DevisionFabState();
}

class _DevisionFabState extends State<DevisionFab>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController.unbounded(vsync: this);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Offset _offset = Offset.zero;

  bool _hasShowModal = false;

  @override
  Widget build(BuildContext context) {
    final windowSize = MediaQuery.sizeOf(context);
    final safeArea = MediaQuery.paddingOf(context);
    final cs = ColorScheme.fromSeed(seedColor: Colors.teal);
    return Positioned(
      top: _offset.dy,
      left: _offset.dx,
      child: AnimatedOpacity(
        opacity: _hasShowModal ? 0 : 1,
        duration: kThemeAnimationDuration,
        child: GestureDetector(
          onPanStart: (details) {},
          onPanEnd: (details) {
            _checkButton(windowSize, safeArea);
          },
          onPanUpdate: (details) {
            _offset = _offset + details.delta;
            setState(() {});
          },
          onTap: () async {
            if (_hasShowModal) return;
            _hasShowModal = true;
            setState(() {});
            await const ToolModal().show();
            _hasShowModal = false;
            setState(() {});
          },
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: cs.secondaryContainer,
            child: SizedBox.square(
              dimension: kButtonSize,
              child: Icon(
                Icons.code,
                color: cs.onSecondaryContainer,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _checkButton(Size windowSize, EdgeInsets safeArea) {
    final dx = _offset.dx;
    final dy = _offset.dy;

    Offset nextOffset = Offset(dx, dy);

    final minDx = -kButtonSize / 2 + safeArea.left;
    final maxDx = windowSize.width - kButtonSize / 2 - safeArea.right;
    final minDy = -kButtonSize / 2 + safeArea.top;
    final maxDy = windowSize.height - kButtonSize / 2 - safeArea.bottom;

    if (dx < minDx) {
      nextOffset = nextOffset.copyWith(dx: minDx);
    }
    if (dx > maxDx) {
      nextOffset = nextOffset.copyWith(dx: maxDx);
    }

    if (dy < minDy) {
      nextOffset = nextOffset.copyWith(dy: minDy);
    }

    if (dy > maxDy) {
      nextOffset = nextOffset.copyWith(dy: maxDy);
    }

    _offset = nextOffset;
    setState(() {});
  }
}

extension on Offset {
  Offset copyWith({
    double? dx,
    double? dy,
  }) {
    return Offset(dx ?? this.dx, dy ?? this.dy);
  }
}
