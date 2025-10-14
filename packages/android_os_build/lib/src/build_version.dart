import 'package:android_os_build/generated/android_os_build.g.dart' as $p;

import 'build_version_codes.dart';
import 'util.dart';

/// Various version strings.
///
/// https://developer.android.com/reference/android/os/Build.VERSION
class BuildVersion {
  const BuildVersion();

  /// The base OS build the product is based on.
  ///
  /// Added in [API level 23](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)
  String get baseOs => $p.Build$VERSION.BASE_OS.toBuildString();

  /// The current development codename, or the string "REL" if this is a release build.
  String get codename => $p.Build$VERSION.CODENAME.toBuildString();

  /// The internal value used by the underlying source control to represent this build.
  String get incremental => $p.Build$VERSION.INCREMENTAL.toBuildString();

  /// The media performance class of the device or 0 if none.
  ///
  /// If this value is not 0, the device conforms to the media performance
  /// class definition of the SDK version of this value. This value never
  /// changes while a device is booted, but it may increase when the hardware
  /// manufacturer provides an OTA update.
  ///
  /// Possible non-zero values are defined in [BuildVersionCodes] starting
  /// with [BuildVersionCodes.r].
  ///
  /// Added in [API level 31](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)
  int get mediaPerformanceClass => $p.Build$VERSION.MEDIA_PERFORMANCE_CLASS;

  /// The developer preview revision of a prerelease SDK.
  ///
  /// When this value is nonzero, any new API added since the last officially
  /// published [sdkInt] is only guaranteed to be present on that specific
  /// preview revision. For example, an API `Activity.fooBar()` might be present
  /// in preview revision 1 but renamed or removed entirely in preview
  /// revision 2, which may cause an app attempting to call it to crash
  /// at runtime.
  ///
  /// Experimental apps targeting preview APIs should check this value for
  /// equality (`==`) with the preview SDK revision they were built for before
  /// using any prerelease platform APIs. Apps that detect a preview SDK
  /// revision other than the specific one they expect should fall back to
  /// using APIs from the previously published API level only to avoid
  /// unwanted runtime exceptions.
  ///
  /// Added in [API level 23](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)
  int get previewSdkInt => $p.Build$VERSION.PREVIEW_SDK_INT;

  /// The user-visible version string. E.g., "1.0" or "3.4b5" or "bananas".
  /// This field is an opaque string. Do not assume that its value has any
  /// particular structure or that values of RELEASE from different
  /// releases can be somehow ordered.
  String get release => $p.Build$VERSION.RELEASE.toBuildString();

  /// The version string. May be [release] or [codename] if not a final
  /// release build
  ///
  /// Added in [API level 30](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)
  String? get releaseOrCodename =>
      $p.Build$VERSION.RELEASE_OR_CODENAME.toBuildString();

  /// The version string we show to the user; may be [release] or a
  /// descriptive string if not a final release build.
  ///
  /// Added in [API level 33](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)
  String? get releaseOrPreviewDisplay =>
      $p.Build$VERSION.RELEASE_OR_PREVIEW_DISPLAY.toBuildString();

  /// The SDK version of the software currently running on this hardware device.
  /// This value never changes while a device is booted, but it may increase
  /// when the hardware manufacturer provides an OTA update.
  ///
  /// Possible values are defined in [BuildVersionCodes].
  int get sdkInt => $p.Build$VERSION.SDK_INT;

  int? get sdkIntFull {
    if (sdkInt < BuildVersionCodes.baklava.versionCode) {
      return null;
    }
    return $p.Build$VERSION.SDK_INT_FULL;
  }

  /// The user-visible security patch level.
  ///
  /// Added in [API level 23](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)
  String get securityPatch => $p.Build$VERSION.SECURITY_PATCH.toBuildString();
}
