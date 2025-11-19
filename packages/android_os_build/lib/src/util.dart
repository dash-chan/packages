import 'package:android_os_build/src/build.dart';
import 'package:jni/jni.dart';

/// Extension methods for [JString?].
extension JStringExt on JString? {
  /// convert [JString] to String, or return [Build.unknown] if null.
  String toBuildString() =>
      this?.toDartString(releaseOriginal: true) ?? Build.unknown;
}
