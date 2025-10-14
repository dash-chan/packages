import 'package:android_os_build/generated/android_os_build.g.dart' as $p;
import 'package:jni/jni.dart';

import 'build_version.dart';
import 'build_version_codes.dart';
import 'util.dart';

/// Information about the current build, extracted from system properties.
///
/// https://developer.android.com/reference/android/os/Build
abstract final class Build {
  /// Build tag for logging
  static const tag = 'Build';

  /// Value used for when a build property is unknown.
  ///
  /// same as [android.os.Build#UNKNOWN](https://developer.android.com/reference/android/os/Build#UNKNOWN)
  static const unknown = 'unknown';

  /// The name of the underlying board, like "goldfish".
  static String get board => $p.Build.BOARD.toBuildString();

  /// The system bootloader version number.
  static String get bootloader => $p.Build.BOOTLOADER.toBuildString();

  /// The consumer-visible brand with which the product/hardware will
  /// be associated, if any.
  static String get brand => $p.Build.BRAND.toBuildString();

  /// The name of the industrial design.
  static String get device => $p.Build.DEVICE.toBuildString();

  /// A build ID string meant for displaying to the user
  static String get display => $p.Build.DISPLAY.toBuildString();

  /// A string that uniquely identifies this build.
  static String get fingerprint => $p.Build.FINGERPRINT.toBuildString();

  /// The name of the hardware (from the kernel command line or /proc).
  static String get hardware => $p.Build.HARDWARE.toBuildString();

  static String get host => $p.Build.HOST.toBuildString();

  /// Either a changelist number, or a label like "M4-rc20".
  static String get id => $p.Build.ID.toBuildString();

  /// The manufacturer of the product/hardware.
  static String get manufacturer => $p.Build.MANUFACTURER.toBuildString();

  /// The end-user-visible name for the end product.
  static String get model => $p.Build.MODEL.toBuildString();

  /// The SKU of the device as set by the original design manufacturer (ODM).
  ///
  /// This is a runtime-initialized property set during startup to configure
  /// device services. If no value is set, this is reported as [Build.unknown].
  ///
  /// The ODM SKU may have multiple variants for the same system SKU in case
  /// a manufacturer produces variants of the same design. For example,
  /// the same build may be released with variations in physical keyboard
  /// and/or display hardware, each with a different ODM SKU.
  ///
  /// Added in [API level 31](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)
  static String get odmSku {
    if (version.sdkInt < BuildVersionCodes.s.versionCode) {
      return unknown;
    }

    return $p.Build.ODM_SKU.toBuildString();
  }

  /// The name of the overall product.
  static String get product => $p.Build.PRODUCT.toBuildString();

  /// The SKU of the hardware (from the kernel command line).
  ///
  /// The SKU is reported by the bootloader to configure
  /// system software features. If no value is supplied by the bootloader,
  /// this is reported as [unknown].
  ///
  /// Added in [API level 31](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)
  static String get sku {
    if (version.sdkInt < BuildVersionCodes.s.versionCode) {
      return unknown;
    }

    return $p.Build.SKU.toBuildString();
  }

  /// The manufacturer of the device's primary system-on-chip.
  ///
  /// Added in [API level 31](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)
  static String get socManufacturer {
    if (version.sdkInt < BuildVersionCodes.s.versionCode) {
      return unknown;
    }

    return $p.Build.SOC_MANUFACTURER.toBuildString();
  }

  /// The model name of the device's primary system-on-chip.
  ///
  /// Added in [API level 31](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)
  static String get socModel {
    if (version.sdkInt < BuildVersionCodes.s.versionCode) {
      return unknown;
    }

    return $p.Build.SOC_MODEL.toBuildString();
  }

  /// An ordered list of **32 bit** ABIs supported by this device.
  /// The most preferred ABI is the first element in the list.
  /// See [supportedAbis] and [supported64BitAbis].
  static List<String> get supported32BitAbis =>
      $p.Build.SUPPORTED_32_BIT_ABIS?.use((i) => i
          .map((e) => e?.toDartString(releaseOriginal: true))
          .nonNulls
          .toList()) ??
      [];

  /// An ordered list of **64 bit** ABIs supported by this device.
  /// The most preferred ABI is the first element in the list.
  /// See [supportedAbis] and [supported32BitAbis].
  static List<String> get supported64BitAbis =>
      $p.Build.SUPPORTED_64_BIT_ABIS?.use((i) => i
          .map((e) => e?.toDartString(releaseOriginal: true))
          .nonNulls
          .toList()) ??
      [];

  /// An ordered list of ABIs supported by this device.
  /// The most preferred ABI is the first element in the list.
  /// See [supported32BitAbis] and [supported64BitAbis].
  static List<String> get supportedAbis =>
      $p.Build.SUPPORTED_ABIS?.use((i) => i
          .map((e) => e?.toDartString(releaseOriginal: true))
          .nonNulls
          .toList()) ??
      [];

  /// Comma-separated tags describing the build, like "unsigned,debug".
  static String get tags => $p.Build.TAGS.toBuildString();

  /// The time at which the build was produced, given in milliseconds
  /// since the UNIX epoch.
  static DateTime get time =>
      DateTime.fromMillisecondsSinceEpoch($p.Build.TIME);

  /// The type of build, like "user" or "eng".
  static String get type => $p.Build.TYPE.toBuildString();

  static String get user => $p.Build.USER.toBuildString();

  /// Various version strings.
  static const version = BuildVersion();

  /// Returns the version string for the radio firmware.
  /// May return null (if, for instance, the radio is not currently on).
  static String getRadioVersion() => $p.Build.getRadioVersion().toBuildString();

  /// Gets the hardware serial number, if available.
  ///
  /// Starting with API level 29, persistent device identifiers are guarded
  /// behind additional restrictions, and apps are recommended to use
  /// resettable identifiers (see [Best practices for unique identifiers](https://developer.android.com/training/articles/user-data-ids)).
  /// This method can be invoked if one of the following requirements is met:
  ///
  /// * If the calling app has been granted the READ_PRIVILEGED_PHONE_STATE
  /// permission; this is a privileged permission that can only be granted to
  /// apps preloaded on the device.
  /// * If the calling app has carrier privileges
  /// (see [`TelephonyManager.hasCarrierPrivileges()`](https://developer.android.com/reference/android/telephony/TelephonyManager#hasCarrierPrivileges()))
  /// on any active subscription.
  /// * If the calling app is the default SMS role holder
  /// (see [`RoleManager.isRoleHeld(String)`](https://developer.android.com/reference/android/app/role/RoleManager#isRoleHeld(java.lang.String))).
  /// * If the calling app is the device owner of a fully-managed device,
  /// a profile owner of an organization-owned device, or their delegates
  /// (see [`DevicePolicyManager.getEnrollmentSpecificId()`](https://developer.android.com/reference/android/app/admin/DevicePolicyManager#getEnrollmentSpecificId())).
  ///
  /// If the calling app does not meet one of these requirements then this
  /// method will behave as follows:
  ///
  /// * If the calling app's target SDK is API level 28 or lower and the app
  /// has the READ_PHONE_STATE permission then [unknown] is returned.
  /// * If the calling app's target SDK is API level 28 or lower and the app
  /// does not have the READ_PHONE_STATE permission, or if the calling app is
  /// targeting API level 29 or higher, then a SecurityException is thrown.
  ///
  /// Requires android.Manifest.permission.READ_PRIVILEGED_PHONE_STATE
  ///
  /// Added in [API level 26](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)
  static String getSerial() {
    if (version.sdkInt < BuildVersionCodes.oMr1.versionCode) {
      return unknown;
    }

    try {
      return $p.Build.getSerial().toBuildString();
    } catch (e) {
      return unknown;
    }
  }

  /// The status of the backported fix for a known issue on this device.
  ///
  /// [id] The id of the known issue to check.
  ///
  /// Added in [API level 36.1](https://developer.android.com/topic/libraries/support-library/revisions)
  static BackportedFixStatus getBackportedFixStatus(int id) {
    final fullSdk = Build.version.sdkIntFull;
    if (fullSdk == null) return BackportedFixStatus.unknown;

    return switch ($p.Build.getBackportedFixStatus(id)) {
      $p.Build.BACKPORTED_FIX_STATUS_NOT_APPLICABLE =>
        BackportedFixStatus.applicable,
      $p.Build.BACKPORTED_FIX_STATUS_NOT_FIXED => BackportedFixStatus.notFix,
      $p.Build.BACKPORTED_FIX_STATUS_UNKNOWN => BackportedFixStatus.unknown,
      _ => BackportedFixStatus.unknown,
    };
  }

  /// Get build information about partitions that have a separate fingerprint
  ///  defined. The list includes partitions that are suitable candidates for
  /// over-the-air updates. This is not an exhaustive list of partitions on
  /// the device.
  ///
  /// Added in [API level 29](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)
  static List<Partition> getFingerprintedPartitions() {
    if (version.sdkInt < BuildVersionCodes.oMr1.versionCode) {
      return [];
    } else {
      return $p.Build.getFingerprintedPartitions()?.use((partitions) {
            return [
              for (final p in partitions.nonNulls)
                Partition._(
                  buildTimeMillis: p.getBuildTimeMillis(),
                  fingerprint:
                      p.getFingerprint()?.toDartString(releaseOriginal: true),
                  name: p.getName()?.toDartString(releaseOriginal: true),
                )
            ];
          }) ??
          [];
    }
  }

  /// Obtain the major version encoded in a VERSION_CODES_FULL value. This value is guaranteed to be non-negative.
  int? getMajorSdkVersion(int sdkIntFull) {
    if (version.sdkInt >= BuildVersionCodes.baklava.versionCode) {
      return null;
    }
    return $p.Build.getMajorSdkVersion(sdkIntFull);
  }

  /// Obtain the minor version encoded in a VERSION_CODES_FULL value. This value is guaranteed to be non-negative.
  int? getMinorSdkVersion(int sdkIntFull) {
    if (version.sdkInt >= BuildVersionCodes.baklava.versionCode) {
      return null;
    }
    return $p.Build.getMinorSdkVersion(sdkIntFull);
  }
}

/// Build information for a particular device partition.
class Partition {
  Partition._({
    required this.buildTimeMillis,
    required this.fingerprint,
    required this.name,
  });

  /// The time (ms since epoch), at which this partition was built, see [Build.time].
  final int buildTimeMillis;

  /// The build fingerprint of this partition, see [Build.fingerprint].
  final String? fingerprint;

  /// The name of this partition, e.g. "system", or "vendor"
  final String? name;

  /// The name identifying the system partition.
  static const partitionNameSystem = 'system';
}

enum BackportedFixStatus {
  /// The known issue is fixed on this device.
  fixed($p.Build.BACKPORTED_FIX_STATUS_FIXED),

  /// The known issue is not applicable to this device.
  ///
  /// For example if the issue only affects a specific brand,
  ///  devices from other brands would report not applicable.
  applicable($p.Build.BACKPORTED_FIX_STATUS_NOT_APPLICABLE),

  /// The known issue is not fixed on this device.
  notFix($p.Build.BACKPORTED_FIX_STATUS_NOT_FIXED),

  /// The status of the known issue on this device is not known.
  unknown($p.Build.BACKPORTED_FIX_STATUS_UNKNOWN),
  ;

  const BackportedFixStatus(this.rawValue);

  final int rawValue;
}
