import 'package:android_os_build/generated/android_os_build.g.dart' as $p;

import 'build_version_codes.dart';
import 'build_version_codes_full.dart';
import 'util.dart';

/// Information about the Android version running on this device.
///
/// https://developer.android.com/reference/android/os/Build.VERSION
class BuildVersion {
  /// Creates an accessor for the current Android version information.
  const BuildVersion();

  /// The base OS build the product is based on.
  ///
  /// Available from
  /// [API level 23](https://developer.android.com/about/versions).
  String get baseOs => $p.Build$VERSION.BASE_OS.toBuildString();

  /// The current development codename.
  ///
  /// Returns `REL` for a release build.
  String get codename => $p.Build$VERSION.CODENAME.toBuildString();

  /// The source-control value that represents this build.
  ///
  /// For example, this may be a Perforce changelist number or a Git hash.
  String get incremental => $p.Build$VERSION.INCREMENTAL.toBuildString();

  /// The media performance class of the device, or `0` if none.
  ///
  /// If this value is not `0`, the device conforms to the media performance
  /// class definition of the SDK version of this value. This value never
  /// changes while a device is booted, but it may increase when the hardware
  /// manufacturer provides an OTA update.
  ///
  /// Possible non-zero values are defined in [BuildVersionCodes] starting
  /// with [BuildVersionCodes.r].
  ///
  /// Available from
  /// [API level 31](https://developer.android.com/about/versions).
  int get mediaPerformanceClass => $p.Build$VERSION.MEDIA_PERFORMANCE_CLASS;

  /// The developer preview revision of a prerelease SDK.
  ///
  /// This value is always `0` on production platform builds and devices.
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
  /// Available from
  /// [API level 23](https://developer.android.com/about/versions).
  int get previewSdkInt => $p.Build$VERSION.PREVIEW_SDK_INT;

  /// The user-visible version string, such as `1.0`, `3.4b5`, or `bananas`.
  ///
  /// This field is an opaque string. Do not assume that its value has any
  /// particular structure or that [release] values from different releases
  /// can be ordered.
  String get release => $p.Build$VERSION.RELEASE.toBuildString();

  /// The version string. May be [release] or [codename] if not a final
  /// release build.
  ///
  /// Available from
  /// [API level 30](https://developer.android.com/about/versions).
  String? get releaseOrCodename =>
      $p.Build$VERSION.RELEASE_OR_CODENAME.toBuildString();

  /// The version string shown to the user.
  ///
  /// This may be [release] or a descriptive string on a non-final release
  /// build.
  ///
  /// Available from
  /// [API level 33](https://developer.android.com/about/versions).
  String? get releaseOrPreviewDisplay =>
      $p.Build$VERSION.RELEASE_OR_PREVIEW_DISPLAY.toBuildString();

  /// The major SDK version of the software running on this device.
  ///
  /// This value never changes while a device is booted, but it may increase
  /// when the hardware manufacturer provides an OTA update.
  ///
  /// This value records the major Android version. Use [sdkIntFull] when the
  /// minor Android version must also be considered.
  ///
  /// Possible values are defined in [BuildVersionCodes].
  int get sdkInt => $p.Build$VERSION.SDK_INT;

  /// The major and minor SDK version of the software running on this device.
  ///
  /// This value never changes while a device is booted, but it may increase
  /// when the hardware manufacturer provides an OTA update.
  ///
  /// [sdkInt] increases for each major Android release. Android may also have
  /// minor releases where [sdkInt] remains unchanged. Minor releases can add
  /// APIs and have stricter backward-compatibility guarantees than major
  /// releases. This full version increases for every release.
  ///
  /// Returns `null` before API level 36, where full SDK version codes are not
  /// available.
  ///
  /// Possible values are defined in [BuildVersionCodesFull].
  int? get sdkIntFull {
    if (sdkInt < BuildVersionCodes.baklava.versionCode) {
      return null;
    }
    return $p.Build$VERSION.SDK_INT_FULL;
  }

  /// The user-visible security patch level.
  ///
  /// This value represents the date when the device most recently applied a
  /// security patch.
  ///
  /// Available from
  /// [API level 23](https://developer.android.com/about/versions).
  String get securityPatch => $p.Build$VERSION.SECURITY_PATCH.toBuildString();
}
