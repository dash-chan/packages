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
  return packageManager.getInstalledPackages(0);
}

Future<JList<PackageInfo>> getAppListAsync() async {
  return compute(getAppList, 0);
}
