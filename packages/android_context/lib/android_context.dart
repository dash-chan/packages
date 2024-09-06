import 'package:android_context/generated/android/content/pm/_package.dart';
import 'package:jni/jni.dart';

import 'generated/android/content/_package.dart';

/// android raw context jni object
///
/// from [Jni.getCurrentActivity]
JReference androidRawContext = Jni.getCurrentActivity();
final AndroidContext context =
    AndroidContext(Context.fromReference(androidRawContext));

class AndroidContext {
  const AndroidContext(this.rawContext);
  final Context rawContext;

  String packageName() {
    return rawContext.getPackageName()._cvt;
  }

  AppInfo get applicationInfo {
    return AppInfo(
      ApplicationInfo.fromReference(rawContext.getApplicationInfo().reference),
    );
  }
}

class AppInfo {
  const AppInfo(this.i);
  final ApplicationInfo i;

  dispose() => i.release();
}

extension on JString {
  String get _cvt => toDartString(releaseOriginal: true);
  String? get _cvtNullable {
    if (isNull) return null;
    return toDartString(releaseOriginal: true);
  }
}
