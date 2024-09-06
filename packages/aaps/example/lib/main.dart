import 'package:aaps/aaps.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int cost = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Native Packages'),
        ),
        body: Center(
          child: Text('cost $cost ms'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final watch = Stopwatch()..start();
            final a = await getAppListAsync();
            // for (var i in a) {
            //   i.packageName.toDartString(releaseOriginal: true);
            //   i.firstInstallTime;
            //   i.lastUpdateTime;
            //   i.versionName.toDartString(releaseOriginal: true);
            //   final app = i.applicationInfo;
            //   app.flags;
            //   app.loadLabel(packageManager).toString();
            //   app.release();
            // }
            watch.stop();
            print(a.length);
            a.release();
            setState(() {
              cost = watch.elapsed.inMilliseconds;
            });
          },
        ),
      ),
    );
  }
}
