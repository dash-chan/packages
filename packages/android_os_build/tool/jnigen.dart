import 'dart:io';

import 'package:jnigen/jnigen.dart';

void main(List<String> args) {
  final packageRoot = Platform.script.resolve('../');

  generateJniBindings(
    Config(
      androidSdkConfig: AndroidSdkConfig(
        addGradleDeps: true,
        androidExample: 'example/',
      ),
      summarizerOptions: SummarizerOptions(backend: SummarizerBackend.asm),
      outputConfig: OutputConfig(
        dartConfig: DartCodeOutputConfig(
          path: packageRoot.resolve('lib/generated/android_os_build.g.dart'),
          structure: OutputStructure.singleFile,
        ),
      ),
      classes: [
        'android.os.Build'
      ],
    ),
  );
}
