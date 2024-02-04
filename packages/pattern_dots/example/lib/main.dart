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
  // PatternLockStyle _lockStyle = PatternLockStyle.normal;
  final passPattern = [0, 1, 2, 3, 4];
  List<int> patterns = [];
  PatternState state = PatternState.active;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: PatternStyle(
          data: PatternStyleData(
            tapRange: 24,
            linePaint: (state) => Paint()
              ..strokeWidth = 2
              ..color = switch (state) {
                PatternState.normal => Colors.grey,
                PatternState.active => Colors.blue,
                PatternState.success => Colors.green,
                PatternState.error => Colors.red,
              }
              ..style = PaintingStyle.stroke,
            dotBuilder: (state) {
              final color = switch (state) {
                PatternState.normal => Colors.grey,
                PatternState.active => Colors.blue,
                PatternState.success => Colors.green,
                PatternState.error => Colors.red,
              };
              return Container(
                width: 12,
                height: 12,
                decoration: ShapeDecoration(
                  shape: const CircleBorder(),
                  color: color,
                ),
              );
            },
            dotPainter: (state, canvas, center) {},
            // linePaint: (state) {
            //   final color = switch (state) {
            //     PatternState.normal => Colors.grey,
            //     PatternState.active => Colors.blue,
            //     PatternState.success => Colors.green,
            //     PatternState.error => Colors.red,
            //   };
            //   return Paint()
            //     ..color = color
            //     ..strokeWidth = 4;
            // },
            // dotPainter: (state, canvas, center) {
            //   final color = switch (state) {
            //     PatternState.normal => Colors.grey,
            //     PatternState.active => Colors.blue,
            //     PatternState.success => Colors.green,
            //     PatternState.error => Colors.red,
            //   };
            //   canvas.drawCircle(center, 4, Paint()..color = color);
            // },
          ),
          child: PatternView(
            matrixX: 4,
            matrixY: 6,
            state: state,
            value: patterns,
            onStart: () {
              state = PatternState.active;
              patterns = [];
              setState(() {});
            },
            onUpdate: (value) {
              patterns = value;
              setState(() {});
            },
            onEnd: (value) {
              patterns = value;
              if (listEquals(passPattern, patterns)) {
                state = PatternState.success;
              } else {
                state = PatternState.error;
              }
              setState(() {});
            },

            // lockStyle: _lockStyle,
            // onTapDown: () {
            //   _lockStyle = PatternLockStyle.normal;
            //   setState(() {});
            // },
            // onUpdate: (current, selected) {
            //   print(selected);
            // },
            // onComplete: (cells, clear) {
            //   bool same = listEquals(cells, [0, 4, 5, 8]);
            //   _lockStyle =
            //       same ? PatternLockStyle.success : PatternLockStyle.failed;
            //   setState(() {});
            //   clear();
            // },
          ),
        ),
      ),
    );
  }
}
