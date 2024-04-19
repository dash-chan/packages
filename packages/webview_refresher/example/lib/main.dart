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
      title: 'App',
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
    await controller.reload();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          finishRefresh();
        },
      ),
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
      body: WebviewRefresher(controller: controller, onRefresh: onRefresh),
    );
  }
}
