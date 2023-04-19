import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/generated/builds.g.dart',
  dartOptions: DartOptions(),
  kotlinOut:
      'android/src/main/kotlin/dev/laihz/android_build/generated/buildApi.g.kt',
  kotlinOptions: KotlinOptions(
    package: 'dev.laihz.android_builds.generated',
  ),
))
@HostApi()
abstract class BuildApi {
  /// The name of the underlying board, like "goldfish".
  String board();

  /// The system bootloader version number.
  String bootloader();

  /// The consumer-visible brand with which the product/hardware will be associated, if any.
  String brand();

  /// The name of the industrial design.
  String device();

  /// A build ID string meant for displaying to the user
  String display();

  /// A string that uniquely identifies this build. Do not attempt to parse this value.
  String fingerprint();

  /// The name of the hardware (from the kernel command line or /proc).
  String hardware();

  ///
  String host();

  /// Either a changelist number, or a label like "M4-rc20".
  String id();

  /// The manufacturer of the product/hardware.
  String manufacturer();

  /// The end-user-visible name for the end product.
  String model();

  /// The SKU of the device as set by the original design manufacturer (ODM).
  ///
  /// This is a runtime-initialized property set during startup to configure
  /// device services. If no value is set, this is reported as UNKNOWN.
  ///
  /// The ODM SKU may have multiple variants for the same system SKU in case
  ///  a manufacturer produces variants of the same design. For example,
  /// the same build may be released with variations in physical keyboard
  /// and/or display hardware, each with a different ODM SKU.
  String odmSku();

  /// The name of the overall product.
  String product();

  /// Gets the hardware serial number, if available.
  ///
  String? getSerial();

  /// The SKU of the hardware (from the kernel command line).
  ///
  ///The SKU is reported by the bootloader to configure system software features.
  ///If no value is supplied by the bootloader, this is reported as UNKNOWN.
  String? sku();

  /// The manufacturer of the device's primary system-on-chip.
  String? socManufacturer();

  /// The model name of the device's primary system-on-chip.
  String? socModel();

  /// An ordered list of 32 bit ABIs supported by this device.
  /// The most preferred ABI is the first element in the list.
  List<String> supportedAbis(ABIFilter filter);

  /// Comma-separated tags describing the build, like "unsigned,debug".
  String tags();

  /// The time at which the build was produced, given in milliseconds since the UNIX epoch.
  int time();

  /// The type of build, like "user" or "eng".
  String type();

  ///
  String user();

  /// Get build information about partitions that have a separate
  /// fingerprint defined. The list includes partitions that are
  /// suitable candidates for over-the-air updates. This is not
  /// an exhaustive list of partitions on the device.
  List<Partition> getFingerprintedPartitions();

  /// Returns the version string for the radio firmware.
  /// May return null (if, for instance, the radio is not currently on).
  String radioVersion();
}

class Partition {
  const Partition(this.buildTimeMillis, this.fingerprint);
  final int buildTimeMillis;
  final String fingerprint;
}

enum ABIFilter {
  all,
  u32,
  u64,
}
