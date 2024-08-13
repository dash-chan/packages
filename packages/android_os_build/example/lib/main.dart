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
    'board': () => AndroidBuild.board,
    'bootloader': () => AndroidBuild.bootloader,
    'brand': () => AndroidBuild.brand,
    'device': () => AndroidBuild.device,
    'display': () => AndroidBuild.display,
    'fingerprint': () => AndroidBuild.fingerprint,
    'hardware': () => AndroidBuild.hardware,
    'host': () => AndroidBuild.host,
    'id': () => AndroidBuild.id,
    'manufacturer': () => AndroidBuild.manufacturer,
    'model': () => AndroidBuild.model,
    'odmSku': () => AndroidBuild.odmSku,
    'product': () => AndroidBuild.product,
    'sku': () => AndroidBuild.sku,
    'socManufacturer': () => AndroidBuild.socManufacturer,
    'socModel': () => AndroidBuild.socModel,
    'supported32BitAbis': () => AndroidBuild.supported32BitAbis.join(','),
    'supported64BitAbis': () => AndroidBuild.supported64BitAbis.join(','),
    'supportedAbis': () => AndroidBuild.supportedAbis.join(','),
    'tags': () => AndroidBuild.tags,
    'time': () => AndroidBuild.time.toIso8601String(),
    'type': () => AndroidBuild.type,
    'user': () => AndroidBuild.user,
    'getRadioVersion': () => AndroidBuild.getRadioVersion(),
    'getSerial': () => AndroidBuild.getSerial(),
    'baseOs': () => AndroidBuild.version.baseOs,
    'codename': () => AndroidBuild.version.codename,
    'incremental': () => AndroidBuild.version.incremental,
    'mediaPerformanceClass': () =>
        AndroidBuild.version.mediaPerformanceClass.toString(),
    'previewSdkInt': () => AndroidBuild.version.previewSdkInt.toString(),
    'release': () => AndroidBuild.version.release,
    'releaseOrCodename': () => AndroidBuild.version.releaseOrCodename ?? '',
    'releaseOrPreviewDisplay': () =>
        AndroidBuild.version.releaseOrPreviewDisplay ?? '',
    'sdkInt': () => AndroidBuild.version.sdkInt.toString(),
    'securityPatch': () => AndroidBuild.version.securityPatch,
  };
}
