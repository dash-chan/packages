import 'package:jni/jni.dart';

extension JStringExt on JString? {
  /// convert [JString] to String, or return null if null.
  String? toNullableString() => this?.toDartString(releaseOriginal: true);
}

JObject contentResolver() {
  return Jni.androidApplicationContext.use((o) {
    return o.jClass
        .instanceMethodId(
          'getContentResolver',
          '()Landroid/content/ContentResolver;',
        )
        .call(o, JObject.type, []);
  });
}