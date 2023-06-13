import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_bus/image_bus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  Uint8List? crop;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('image test'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(32),
        children: [
          Image.asset('assets/1.jpg', height: 100),
          if (crop != null)
            Center(
              child: DecoratedBox(
                decoration: BoxDecoration(border: Border.all()),
                child: Image.memory(crop!),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final bytes = await PlatformAssetBundle().load('assets/1.jpg');
          final data = bytes.buffer.asUint8List();
          final result = await ImageBus(data).resize(1920, 1920);
          setState(() {
            crop = result;
          });
        },
      ),
    );
  }
}
