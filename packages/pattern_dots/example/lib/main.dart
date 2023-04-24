import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pattern_dots/pattern_dots.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
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
  PatternLockStyle _lockStyle = PatternLockStyle.normal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: PatternStyle(
          data: PatternStyleData(
            tapRange: 24,
          ),
          child: PatternView(
            lockStyle: _lockStyle,
            matrixY: 4,
            onTapDown: () {
              _lockStyle = PatternLockStyle.normal;
              setState(() {});
            },
            onComplete: (cells) {
              bool same = listEquals(cells, [0, 4, 5, 8]);
              _lockStyle =
                  same ? PatternLockStyle.success : PatternLockStyle.failed;
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
