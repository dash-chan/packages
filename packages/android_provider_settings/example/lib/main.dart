import 'package:android_provider_settings/android_provider_settings.dart';
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
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 25);
    const spacerSmall = SizedBox(height: 10);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Native Packages')),
        body: SingleChildScrollView(
          child: Container(
            padding: const .all(10),
            child: Column(
              children:
                  {
                        'accessibilityDisplayInversionEnabled': Settings
                            .secure
                            .accessibilityDisplayInversionEnabled,
                        'accessibilityEnabled':
                            Settings.secure.accessibilityEnabled,
                        'allowedGeolocationOrigins':
                            Settings.secure.allowedGeolocationOrigins,
                        'androidId': Settings.secure.androidId,
                        'defaultInputMethod': Settings.secure.defaultInputMethod,
                        'enabledAccessibilityServices': Settings.secure.enabledAccessibilityServices,
                        'enabledInputMethods': Settings.secure.enabledInputMethods,
                        'inputMethodSelectorVisibility': Settings.secure.inputMethodSelectorVisibility,
                        'rttCallingMode': Settings.secure.rttCallingMode,
                      }.entries
                      .map(
                        (e) => ListTile(
                          title: Text(e.key.toString()),
                          subtitle: Text(e.value.toString()),
                        ),
                      )
                      .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
