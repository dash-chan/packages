import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_refresher/webview_refresher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webview Refresher Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = WebViewController();
  Completer<void>? _completer;

  Future onRefresh() async {
    _completer = Completer<void>();
    if (await controller.currentUrl() == null) {
      await forward();
    } else {
      await controller.reload();
    }
    await _completer!.future;
  }

  finishRefresh() {
    if (_completer == null) return;
    if (!_completer!.isCompleted) {
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

  Future<void> forward() async {
    await controller.loadRequest(Uri.parse('https://www.flutter.cn/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Webview Refresher Demo'),
        actions: [
          IconButton(
            onPressed: forward,
            icon: const Icon(Icons.play_arrow_rounded),
          ),
        ],
      ),
      body: WebviewRefresher(controller: controller, onRefresh: onRefresh),
    );
  }
}
