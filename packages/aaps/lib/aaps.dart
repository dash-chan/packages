// ignore_for_file: public_member_api_docs, sort_constructors_first
library aaps;

import 'package:flutter/foundation.dart';
import 'package:jni/jni.dart';

import 'generated_android.g.dart';

PackageManager? _packageManager;
PackageManager get packageManager {
  if (_packageManager == null) {
    final Context context = Context.fromReference(Jni.getCurrentActivity());
    _packageManager = context.getPackageManager();
  }
  return _packageManager!;
}

JList<PackageInfo> getAppList(int a) {
  final result = packageManager.getInstalledPackages(0);
  int index = 0;
  for (var i in result) {
    i.packageName.toDartString(releaseOriginal: true);
    i.firstInstallTime;
    i.lastUpdateTime;
    i.versionName.toDartString(releaseOriginal: true);
    final app = i.applicationInfo;
    app.flags;
    // app.loadLabel(packageManager).toString();
    // app.release();
    final name = packageManager.getApplicationLabel(app).toString();
    // if (name.isEmpty || name == 'null') {
    print(
        (packageManager.getApplicationLabel(app).toString(), app.packageName));
    // }

    index++;
  }

  return result;
}

Future<JList<PackageInfo>> getAppListAsync() async {
  return compute(getAppList, 0);
}
