package com.dash.aps_example

import android.content.pm.PackageManager
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    fun aaa(): Unit {
        context.packageManager.getInstalledPackages(0)

        context.packageManager.getInstalledPackages(PackageManager.PackageInfoFlags.of(0))
    }
}
