import 'package:android_os_build/android_os_build.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Android OS build',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'Android OS build'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final key = buildMapping.keys.elementAt(index);
          final value = buildMapping[key]!();
          return Row(
            children: [
              SizedBox(width: 128, child: Center(child: Text(key))),
              const SizedBox(height: 8, child: VerticalDivider()),
              Expanded(child: Text(value)),
            ],
          );
        },
        itemCount: buildMapping.length,
      ),
    );
  }

  final buildMapping = <String, String Function()>{
    'board': () => Build.board,
    'bootloader': () => Build.bootloader,
    'brand': () => Build.brand,
    'device': () => Build.device,
    'display': () => Build.display,
    'fingerprint': () => Build.fingerprint,
    'hardware': () => Build.hardware,
    'host': () => Build.host,
    'id': () => Build.id,
    'manufacturer': () => Build.manufacturer,
    'model': () => Build.model,
    'odmSku': () => Build.odmSku,
    'product': () => Build.product,
    'sku': () => Build.sku,
    'socManufacturer': () => Build.socManufacturer,
    'socModel': () => Build.socModel,
    'supported32BitAbis': () => Build.supported32BitAbis.join(','),
    'supported64BitAbis': () => Build.supported64BitAbis.join(','),
    'supportedAbis': () => Build.supportedAbis.join(','),
    'tags': () => Build.tags,
    'time': () => Build.time.toIso8601String(),
    'type': () => Build.type,
    'user': () => Build.user,
    'getRadioVersion': () => Build.getRadioVersion(),
    'getSerial': () => Build.getSerial(),
    'baseOs': () => Build.version.baseOs,
    'codename': () => Build.version.codename,
    'incremental': () => Build.version.incremental,
    'mediaPerformanceClass': () =>
        Build.version.mediaPerformanceClass.toString(),
    'previewSdkInt': () => Build.version.previewSdkInt.toString(),
    'release': () => Build.version.release,
    'releaseOrCodename': () => Build.version.releaseOrCodename ?? '',
    'releaseOrPreviewDisplay': () =>
        Build.version.releaseOrPreviewDisplay ?? '',
    'sdkInt': () => Build.version.sdkInt.toString(),
    'securityPatch': () => Build.version.securityPatch,
  };
}
