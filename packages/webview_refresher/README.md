# Webview Refresher

bring pull to refresh feature to official webview plugin

## Install

```bash
flutter pub add webview_refresher
```

## Usage

```dart
  final controller = WebViewController();
  Completer<void>? _completer;

  Future onRefresh() {
    _completer = Completer<void>();
    return _completer!.future;
  }

  finishRefresh() {
    if (_completer?.isCompleted ?? false) {
      _completer?.complete();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.setNavigationDelegate(NavigationDelegate(
      onPageFinished: (url) {
        finishRefresh();
      },
      onWebResourceError: (error) {
        finishRefresh();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('demo'),
        actions: [
          IconButton(
            onPressed: () {
              controller.loadRequest(Uri.parse('https://www.zhihu.com/'));
            },
            icon: const Icon(Icons.play_arrow_rounded),
          ),
        ],
      ),
      body: WebviewRefresher(
        controller: controller,
        onRefresh: onRefresh,
      ),
    );
  }
```