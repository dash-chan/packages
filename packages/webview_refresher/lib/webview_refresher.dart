library webview_refresher;

import 'package:flutter/cupertino.dart' hide RefreshCallback;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_refresher/src/gesture_recognizer.dart';

class WebviewRefresher extends StatefulWidget {
  const WebviewRefresher({
    super.key,
    this.controller,
    this.scrollController,
    this.gestureRecognizers = const <Factory<OneSequenceGestureRecognizer>>{},
    this.onRefresh,
  });

  final WebViewController? controller;
  final ScrollController? scrollController;
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers;
  final RefreshCallback? onRefresh;

  @override
  State<WebviewRefresher> createState() => _WebviewRefresherState();
}

class _WebviewRefresherState extends State<WebviewRefresher> {
  late WebViewController _controller = widget.controller ?? WebViewController();
  late ScrollController _scrollController =
      widget.scrollController ?? ScrollController();
  final _currentOffset = ValueNotifier<double>(0);

  @override
  void initState() {
    super.initState();
    _controller.setOnScrollPositionChange((change) {
      _currentOffset.value = change.y;
    });
  }

  @override
  void didUpdateWidget(covariant WebviewRefresher oldWidget) {
    final oldController = oldWidget.controller;
    if (oldController != null && oldController != _controller) {
      _controller = oldController;
    }
    final oldScrollController = oldWidget.scrollController;
    if (oldScrollController != null &&
        oldScrollController != _scrollController) {
      _scrollController = oldScrollController;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    _currentOffset.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return switch (defaultTargetPlatform) {
      TargetPlatform.android => _buildAndroid(),
      TargetPlatform.iOS => _buildIos(),
      _ => _buildDefault(),
    };
  }

  Widget _buildAndroid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return RefreshIndicator(
          onRefresh: () async {
            await widget.onRefresh?.call();
          },
          notificationPredicate: (notification) {
            if (widget.onRefresh == null) return false;
            return notification.depth == 0;
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            child: SizedBox(
              height: constraints.maxHeight,
              child: WebViewWidget(
                controller: _controller,
                gestureRecognizers: {
                  Factory(() => WebviewGestureRecognizer(
                        scrollController: _scrollController,
                        context: context,
                        offset: _currentOffset,
                      )),
                  ...widget.gestureRecognizers,
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildIos() {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        CupertinoSliverRefreshControl(onRefresh: widget.onRefresh),
        SliverFillRemaining(
          hasScrollBody: true,
          child: WebViewWidget(
            controller: _controller,
            gestureRecognizers: {
              Factory(() => WebviewGestureRecognizer(
                    scrollController: _scrollController,
                    context: context,
                    offset: _currentOffset,
                  )),
              ...widget.gestureRecognizers,
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDefault() {
    return WebViewWidget(
      controller: _controller,
    );
  }
}
