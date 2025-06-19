import 'package:android_util_log/android_util_log.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Android Log')),
        body: ListView(
          children: [
            Text('[TAG] is loggable: ${Log.isLoggable('TAG', Log.info)}'),
            FilledButton(
              onPressed: () {
                Log.i('TAG', 'INFO_MESSAGE');
              },
              child: Text('INFO'),
            ),
            FilledButton(
              onPressed: () {
                print(Log.w('TAG', 'WARN_MESSAGE'));
              },
              child: Text('WARN'),
            ),
          ],
        ),
      ),
    );
  }
}
