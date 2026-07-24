import 'package:android_os_build/src/build.dart';
import 'package:jni/jni.dart';

/// Converts nullable Java strings returned by Android build APIs.
extension JStringExt on JString? {
  /// Converts this [JString] to a Dart [String].
  ///
  /// Returns [Build.unknown] when this value is `null`.
  String toBuildString() =>
      this?.toDartString(releaseOriginal: true) ?? Build.unknown;
}
