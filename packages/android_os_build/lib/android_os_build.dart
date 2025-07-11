library;

import 'package:jni/jni.dart';

import 'generated/android_os_build.g.dart' as $p;

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

/// Enumeration of the currently known SDK version codes. These are the values
/// that can be found in [BuildVersion.sdkInt]. Version numbers increment monotonically
/// with each official platform release.
///
/// https://developer.android.com/reference/android/os/Build.VERSION_CODES
enum BuildVersionCodes {
  /// The original, first, version of Android.  Yay!
  ///
  /// Released publicly as Android 1.0 in September 2008.
  base($p.Build$VERSION_CODES.BASE),

  /// First Android update.
  ///
  /// Released publicly as Android 1.1 in February 2009.
  base_1_1($p.Build$VERSION_CODES.BASE_1_1),

  /// C.
  ///
  /// Released publicly as Android 1.5 in April 2009.
  cupcake($p.Build$VERSION_CODES.CUPCAKE),

  /// D.
  ///
  /// Released publicly as Android 1.6 in September 2009.
  /// Applications targeting this or a later release will get these
  /// new changes in behavior:
  ///
  /// * They must explicitly request the
  /// [android.Manifest.permission#WRITE_EXTERNAL_STORAGE](https://developer.android.com/reference/android/Manifest.permission#WRITE_EXTERNAL_STORAGE)
  /// permission to be able to modify the contents of the SD card.
  /// (Apps targeting earlier versions will always request the permission.)
  /// * They must explicitly request the
  /// [android.Manifest.permission#READ_PHONE_STATE](https://developer.android.com/reference/android/Manifest.permission#READ_PHONE_STATE)
  /// permission to be able to be able to retrieve phone state info.
  /// (Apps targeting earlier versions will always request the permission.)
  /// * They are assumed to support different screen densities and
  /// sizes.  (Apps targeting earlier versions are assumed to only support
  /// medium density normal size screens unless otherwise indicated).
  /// They can still explicitly specify screen support either way with the
  /// supports-screens manifest tag.
  /// * [android.widget.TabHost](https://developer.android.com/reference/android/widget/TabHost) will use the new dark tab
  /// background design.
  ///
  donut($p.Build$VERSION_CODES.DONUT),

  /// E.
  ///
  /// Released publicly as Android 2.0 in October 2009.
  /// Applications targeting this or a later release will get these
  /// new changes in behavior:
  ///
  /// * The [Service.onStartCommand](https://developer.android.com/reference/android/app/Service#onStartCommand(android.content.Intent,%20int,%20int))
  /// function will return the new
  /// [Service.START_STICKY](https://developer.android.com/reference/android/app/Service#START_STICKY)
  /// behavior instead of the old compatibility [Service.START_STICKY_COMPATIBILITY](https://developer.android.com/reference/android/app/Service#START_STICKY_COMPATIBILITY).
  /// * The [Activity](https://developer.android.com/reference/android/app/Activity) class will now execute back
  /// key presses on the key up instead of key down, to be able to detect
  /// canceled presses from virtual keys.
  /// * The [TabWidget](https://developer.android.com/reference/android/widget/TabWidget) class will use a new color scheme
  /// for tabs. In the new scheme, the foreground tab has a medium gray background
  /// the background tabs have a dark gray background.
  ///
  eclair($p.Build$VERSION_CODES.ECLAIR),

  /// E incremental update.
  ///
  /// Released publicly as Android 2.0.1 in December 2009.
  @Deprecated('use eclair_0_1')
  eclair01($p.Build$VERSION_CODES.ECLAIR_0_1),

  /// E incremental update.
  ///
  /// Released publicly as Android 2.0.1 in December 2009.
  eclair_0_1($p.Build$VERSION_CODES.ECLAIR_0_1),

  /// E MR1.
  ///
  /// Released publicly as Android 2.1 in January 2010.
  eclairMr1($p.Build$VERSION_CODES.ECLAIR_MR1),

  /// F.
  ///
  /// Released publicly as Android 2.2 in May 2010.
  froyo($p.Build$VERSION_CODES.FROYO),

  /// G.
  ///
  /// Released publicly as Android 2.3 in December 2010.
  /// Applications targeting this or a later release will get these
  /// new changes in behavior:
  ///
  /// * The application's notification icons will be shown on the new
  /// dark status bar background, so must be visible in this situation.
  ///
  gingerbread($p.Build$VERSION_CODES.GINGERBREAD),

  /// G MR1.
  ///
  /// Released publicly as Android 2.3.3 in February 2011.
  gingerbreadMr1($p.Build$VERSION_CODES.GINGERBREAD_MR1),

  /// H.
  ///
  /// Released publicly as Android 3.0 in February 2011.
  /// Applications targeting this or a later release will get these
  /// new changes in behavior:
  ///
  /// * The default theme for applications is now dark holographic:
  /// [R.style.Theme_Holo](https://developer.android.com/reference/android/R.style#Theme_Holo).
  /// * On large screen devices that do not have a physical menu
  /// button, the soft (compatibility) menu is disabled.
  /// * The activity lifecycle has changed slightly as per
  /// [Activity](https://developer.android.com/reference/android/app/Activity).
  /// * An application will crash if it does not call through
  /// to the super implementation of its
  /// [Activity.onPause()](https://developer.android.com/reference/android/app/Activity#onPause()) method.
  /// * When an application requires a permission to access one of
  /// its components (activity, receiver, service, provider), this
  /// permission is no longer enforced when the application wants to
  /// access its own component.  This means it can require a permission
  /// on a component that it does not itself hold and still access that
  /// component.
  /// * [Context.getSharedPreferences](https://developer.android.com/reference/android/content/Context#getSharedPreferences(java.lang.String,%20int)) will not automatically reload
  /// the preferences if they have changed on storage, unless
  /// [Context.MODE_MULTI_PROCESS](https://developer.android.com/reference/android/content/Context#MODE_MULTI_PROCESS) is used.
  /// * [ViewGroup.setMotionEventSplittingEnabled](https://developer.android.com/reference/android/view/ViewGroup#setMotionEventSplittingEnabled(boolean))
  /// will default to true.
  /// * [LayoutParams.FLAG_SPLIT_TOUCH](https://developer.android.com/reference/android/view/WindowManager.LayoutParams#FLAG_SPLIT_TOUCH)
  /// is enabled by default on windows.
  /// * [PopupWindow.isSplitTouchEnabled()](https://developer.android.com/reference/android/widget/PopupWindow#isSplitTouchEnabled()) will return true by default.
  /// * [GridView](https://developer.android.com/reference/android/widget/GridView) and [ListView](https://developer.android.com/reference/android/widget/ListView)
  /// will use [View.setActivated](https://developer.android.com/reference/android/view/View#setActivated(boolean))
  /// for selected items if they do not implement [Checkable](https://developer.android.com/reference/android/widget/Checkable).
  /// * [Scroller](https://developer.android.com/reference/android/widget/Scroller) will be constructed with
  /// "flywheel" behavior enabled by default.
  ///
  honeycomb($p.Build$VERSION_CODES.HONEYCOMB),

  /// H MR1.
  ///
  /// Released publicly as Android 3.1 in May 2011.
  honeycombMr1($p.Build$VERSION_CODES.HONEYCOMB_MR1),

  /// H MR2.
  ///
  /// Released publicly as Android 3.2 in July 2011.
  /// Update to Honeycomb MR1 to support 7 inch tablets, improve
  /// screen compatibility mode, etc.
  ///
  /// As of this version, applications that don't say whether they
  /// support XLARGE screens will be assumed to do so only if they target
  /// [honeycomb] or later; it had been [gingerbread] or
  /// later.  Applications that don't support a screen size at least as
  /// large as the current screen will provide the user with a UI to
  /// switch them in to screen size compatibility mode.
  ///
  /// This version introduces new screen size resource qualifiers
  /// based on the screen size in dp: see
  /// [Configuration.screenWidthDp](https://developer.android.com/reference/android/content/res/Configuration#screenWidthDp),
  /// [Configuration.screenHeightDp](https://developer.android.com/reference/android/content/res/Configuration#screenHeightDp), and
  /// [Configuration.smallestScreenWidthDp](https://developer.android.com/reference/android/content/res/Configuration#smallestScreenWidthDp).
  /// Supplying these in &lt;supports-screens&gt; as per
  /// [ApplicationInfo.requiresSmallestWidthDp](https://developer.android.com/reference/android/content/pm/ApplicationInfo#requiresSmallestWidthDp),
  /// [ApplicationInfo.compatibleWidthLimitDp](https://developer.android.com/reference/android/content/pm/ApplicationInfo#compatibleWidthLimitDp), and
  /// [ApplicationInfo.largestWidthLimitDp](https://developer.android.com/reference/android/content/pm/ApplicationInfo#largestWidthLimitDp) is
  /// preferred over the older screen size buckets and for older devices
  /// the appropriate buckets will be inferred from them.
  ///
  /// Applications targeting this or a later release will get these
  /// new changes in behavior:
  ///
  /// *New [PackageManager.FEATURE_SCREEN_PORTRAIT](https://developer.android.com/reference/android/content/pm/PackageManager#FEATURE_SCREEN_PORTRAIT)
  /// and [PackageManager.FEATURE_SCREEN_LANDSCAPE](https://developer.android.com/reference/android/content/pm/PackageManager#FEATURE_SCREEN_LANDSCAPE)
  /// features were introduced in this release.  Applications that target
  /// previous platform versions are assumed to require both portrait and
  /// landscape support in the device; when targeting Honeycomb MR1 or
  /// greater the application is responsible for specifying any specific
  /// orientation it requires.
  /// *[AsyncTask](https://developer.android.com/reference/android/os/AsyncTask) will use the serial executor
  /// by default when calling [AsyncTask.execute(Params)](https://developer.android.com/reference/android/os/AsyncTask#execute(Params[])).
  /// *[ActivityInfo.configChanges](https://developer.android.com/reference/android/content/pm/ActivityInfo#configChanges) will have the
  /// [ActivityInfo.CONFIG_SCREEN_SIZE](https://developer.android.com/reference/android/content/pm/ActivityInfo#CONFIG_SCREEN_SIZE) and
  /// [ActivityInfo.CONFIG_SMALLEST_SCREEN_SIZE](https://developer.android.com/reference/android/content/pm/ActivityInfo#CONFIG_SMALLEST_SCREEN_SIZE)
  /// bits set; these need to be cleared for older applications because
  /// some developers have done absolute comparisons against this value
  /// instead of correctly masking the bits they are interested in.
  ///
  honeycombMr2($p.Build$VERSION_CODES.HONEYCOMB_MR2),

  /// I.
  ///
  /// Released publicly as Android 4.0 in October 2011.
  /// Applications targeting this or a later release will get these
  /// new changes in behavior:
  ///
  /// * For devices without a dedicated menu key, the software compatibility
  /// menu key will not be shown even on phones.  By targeting Ice Cream Sandwich
  /// or later, your UI must always have its own menu UI affordance if needed,
  /// on both tablets and phones.  The ActionBar will take care of this for you.
  /// * 2d drawing hardware acceleration is now turned on by default.
  /// You can use
  /// {android.R.attr#hardwareAccelerated android:hardwareAccelerated}
  /// to turn it off if needed, although this is strongly discouraged since
  /// it will result in poor performance on larger screen devices.
  /// * The default theme for applications is now the "device default" theme:
  ///      {android.R.style#Theme_DeviceDefault}. This may be the
  ///      holo dark theme or a different dark theme defined by the specific device.
  ///      The {android.R.style#Theme_Holo} family must not be modified
  ///      for a device to be considered compatible. Applications that explicitly
  ///      request a theme from the Holo family will be guaranteed that these themes
  ///      will not change character within the same platform version. Applications
  ///      that wish to blend in with the device should use a theme from the
  ///      {android.R.style#Theme_DeviceDefault} family.
  /// * Managed cursors can now throw an exception if you directly close
  /// the cursor yourself without stopping the management of it; previously failures
  /// would be silently ignored.
  /// * The fadingEdge attribute on views will be ignored (fading edges is no
  /// longer a standard part of the UI).  A new requiresFadingEdge attribute allows
  /// applications to still force fading edges on for special cases.
  /// * {android.content.Context#bindService Context.bindService()}
  /// will not automatically add in {android.content.Context#BIND_WAIVE_PRIORITY}.
  /// * App Widgets will have standard padding automatically added around
  /// them, rather than relying on the padding being baked into the widget itself.
  /// * An exception will be thrown if you try to change the type of a
  /// window after it has been added to the window manager.  Previously this
  /// would result in random incorrect behavior.
  /// * {android.view.animation.AnimationSet} will parse out
  /// the duration, fillBefore, fillAfter, repeatMode, and startOffset
  /// XML attributes that are defined.
  /// * {android.app.ActionBar#setHomeButtonEnabled
  /// ActionBar.setHomeButtonEnabled()} is false by default.
  ///
  iceCreamSandwich($p.Build$VERSION_CODES.ICE_CREAM_SANDWICH),

  /// I MR1.
  ///
  /// Released publicly as Android 4.03 in December 2011.
  iceCreamSandwichMr1($p.Build$VERSION_CODES.ICE_CREAM_SANDWICH_MR1),

  /// J.
  ///
  /// Released publicly as Android 4.1 in July 2012.
  /// Applications targeting this or a later release will get these
  /// new changes in behavior:
  ///
  /// * You must explicitly request the {android.Manifest.permission#READ_CALL_LOG}
  /// and/or {android.Manifest.permission#WRITE_CALL_LOG} permissions;
  /// access to the call log is no longer implicitly provided through
  /// {android.Manifest.permission#READ_CONTACTS} and
  /// {android.Manifest.permission#WRITE_CONTACTS}.
  /// * {android.widget.RemoteViews} will throw an exception if
  /// setting an onClick handler for views being generated by a
  /// {android.widget.RemoteViewsService} for a collection container;
  /// previously this just resulted in a warning log message.
  /// * New {android.app.ActionBar} policy for embedded tabs:
  /// embedded tabs are now always stacked in the action bar when in portrait
  /// mode, regardless of the size of the screen.
  /// * {android.webkit.WebSettings#setAllowFileAccessFromFileURLs(boolean)
  /// WebSettings.setAllowFileAccessFromFileURLs} and
  /// {android.webkit.WebSettings#setAllowUniversalAccessFromFileURLs(boolean)
  /// WebSettings.setAllowUniversalAccessFromFileURLs} default to false.
  /// * Calls to {android.content.pm.PackageManager#setComponentEnabledSetting
  /// PackageManager.setComponentEnabledSetting} will now throw an
  /// IllegalArgumentException if the given component class name does not
  /// exist in the application's manifest.
  /// * {NfcAdapter.setNdefPushMessage},
  /// {NfcAdapter.setNdefPushMessageCallback} and
  /// {NfcAdapter.setOnNdefPushCompleteCallback} will throw
  /// IllegalStateException if called after the Activity has been destroyed.
  /// * Accessibility services must require the new
  /// {android.Manifest.permission#BIND_ACCESSIBILITY_SERVICE} permission or
  /// they will not be available for use.
  /// * {android.accessibilityservice.AccessibilityServiceInfo#FLAG_INCLUDE_NOT_IMPORTANT_VIEWS
  /// AccessibilityServiceInfo.FLAG_INCLUDE_NOT_IMPORTANT_VIEWS} must be set
  /// for unimportant views to be included in queries.
  ///
  jellyBean($p.Build$VERSION_CODES.JELLY_BEAN),

  /// J MR1.
  ///
  /// Released publicly as Android 4.2 in November 2012.
  /// Applications targeting this or a later release will get these
  /// new changes in behavior:
  ///
  /// *Content Providers: The default value of {android:exported} is now
  /// {false}. See
  /// <a href="{@docRoot}guide/topics/manifest/provider-element.html#exported">
  /// the android:exported section</a> in the provider documentation for more details.
  /// *{android.view.View#getLayoutDirection() View.getLayoutDirection()}
  /// can return different values than {android.view.View#LAYOUT_DIRECTION_LTR}
  /// based on the locale etc.
  /// * {android.webkit.WebView#addJavascriptInterface(Object, String)
  /// WebView.addJavascriptInterface} requires explicit annotations on methods
  /// for them to be accessible from Javascript.
  ///
  jellyBeanMr1($p.Build$VERSION_CODES.JELLY_BEAN_MR1),

  /// J MR2.
  ///
  /// Released publicly as Android 4.3 in July 2013.
  jellyBeanMr2($p.Build$VERSION_CODES.JELLY_BEAN_MR2),

  /// K.
  ///
  /// Released publicly as Android 4.4 in October 2013.
  /// Applications targeting this or a later release will get these
  /// new changes in behavior. For more information about this release, see the
  /// <a href="/about/versions/kitkat/">Android KitKat overview</a>.
  ///
  /// * The default result of
  /// {android.preference.PreferenceActivity#isValidFragment(String)
  /// PreferenceActivity.isValueFragment} becomes false instead of true.
  /// * In {android.webkit.WebView}, apps targeting earlier versions will have
  /// JS URLs evaluated directly and any result of the evaluation will not replace
  /// the current page content.  Apps targetting KITKAT or later that load a JS URL will
  /// have the result of that URL replace the content of the current page
  /// * {android.app.AlarmManager#set AlarmManager.set} becomes interpreted as
  /// an inexact value, to give the system more flexibility in scheduling alarms.
  /// * {android.content.Context#getSharedPreferences(String, int)
  /// Context.getSharedPreferences} no longer allows a null name.
  /// * {android.widget.RelativeLayout} changes to compute wrapped content
  /// margins correctly.
  /// * {android.app.ActionBar}'s window content overlay is allowed to be
  /// drawn.
  /// *The {android.Manifest.permission#READ_EXTERNAL_STORAGE}
  /// permission is now always enforced.
  /// *Access to package-specific external storage directories belonging
  /// to the calling app no longer requires the
  /// {android.Manifest.permission#READ_EXTERNAL_STORAGE} or
  /// {android.Manifest.permission#WRITE_EXTERNAL_STORAGE}
  /// permissions.
  ///
  kitkat($p.Build$VERSION_CODES.KITKAT),

  /// K for watches.
  ///
  /// Released publicly as Android 4.4W in June 2014.
  /// Applications targeting this or a later release will get these
  /// new changes in behavior:
  ///
  /// *{android.app.AlertDialog} might not have a default background if the theme does
  /// not specify one.
  ///
  kitkatWatch($p.Build$VERSION_CODES.KITKAT_WATCH),

  /// L.
  ///
  /// Released publicly as Android 5.0 in November 2014.
  /// Applications targeting this or a later release will get these
  /// new changes in behavior.  For more information about this release, see the
  /// <a href="/about/versions/lollipop/">Android Lollipop overview</a>.
  ///
  /// * {android.content.Context#bindService Context.bindService} now
  /// requires an explicit Intent, and will throw an exception if given an implicit
  /// Intent.
  /// * {android.app.Notification.Builder Notification.Builder} will
  /// not have the colors of their various notification elements adjusted to better
  /// match the new material design look.
  /// * {android.os.Message} will validate that a message is not currently
  /// in use when it is recycled.
  /// * Hardware accelerated drawing in windows will be enabled automatically
  /// in most places.
  /// * {android.widget.Spinner} throws an exception if attaching an
  /// adapter with more than one item type.
  /// * If the app is a launcher, the launcher will be available to the user
  /// even when they are using corporate profiles (which requires that the app
  /// use {android.content.pm.LauncherApps} to correctly populate its
  /// apps UI).
  /// * Calling {android.app.Service#stopForeground Service.stopForeground}
  /// with removeNotification false will modify the still posted notification so that
  /// it is no longer forced to be ongoing.
  /// * A {android.service.dreams.DreamService} must require the
  /// {android.Manifest.permission#BIND_DREAM_SERVICE} permission to be usable.
  ///
  lollipop($p.Build$VERSION_CODES.LOLLIPOP),

  /// L MR1.
  ///
  /// Released publicly as Android 5.1 in March 2015.
  /// For more information about this release, see the
  /// <a href="/about/versions/android-5.1">Android 5.1 APIs</a>.
  lollipopMr1($p.Build$VERSION_CODES.LOLLIPOP_MR1),

  /// M.
  ///
  /// Released publicly as Android 6.0 in October 2015.
  /// Applications targeting this or a later release will get these
  /// new changes in behavior. For more information about this release, see the
  /// <a href="/about/versions/marshmallow/">Android 6.0 Marshmallow overview</a>.
  ///
  /// * Runtime permissions.  Dangerous permissions are no longer granted at
  /// install time, but must be requested by the application at runtime through
  /// {android.app.Activity#requestPermissions}.
  /// * Bluetooth and Wi-Fi scanning now requires holding the location permission.
  /// * {android.app.AlarmManager#setTimeZone AlarmManager.setTimeZone} will fail if
  /// the given timezone is non-Olson.
  /// * Activity transitions will only return shared
  /// elements mapped in the returned view hierarchy back to the calling activity.
  /// * {android.view.View} allows a number of behaviors that may break
  /// existing apps: Canvas throws an exception if restore() is called too many times,
  /// widgets may return a hint size when returning UNSPECIFIED measure specs, and it
  /// will respect the attributes {android.R.attr#foreground},
  /// {android.R.attr#foregroundGravity}, {android.R.attr#foregroundTint}, and
  /// {android.R.attr#foregroundTintMode}.
  /// * {android.view.MotionEvent#getButtonState MotionEvent.getButtonState}
  /// will no longer report {android.view.MotionEvent#BUTTON_PRIMARY}
  /// and {android.view.MotionEvent#BUTTON_SECONDARY} as synonyms for
  /// {android.view.MotionEvent#BUTTON_STYLUS_PRIMARY} and
  /// {android.view.MotionEvent#BUTTON_STYLUS_SECONDARY}.
  /// * {android.widget.ScrollView} now respects the layout param margins
  /// when measuring.
  ///
  m($p.Build$VERSION_CODES.M),

  /// N.
  ///
  /// Released publicly as Android 7.0 in August 2016.
  /// Applications targeting this or a later release will get these
  /// new changes in behavior. For more information about this release, see
  /// the <a href="/about/versions/nougat/">Android Nougat overview</a>.
  ///
  /// * {android.app.DownloadManager.Request#setAllowedNetworkTypes
  /// DownloadManager.Request.setAllowedNetworkTypes}
  /// will disable "allow over metered" when specifying only
  /// {android.app.DownloadManager.Request#NETWORK_WIFI}.
  /// * {android.app.DownloadManager} no longer allows access to raw
  /// file paths.
  /// * {android.app.Notification.Builder#setShowWhen
  /// Notification.Builder.setShowWhen}
  /// must be called explicitly to have the time shown, and various other changes in
  /// {android.app.Notification.Builder Notification.Builder} to how notifications
  /// are shown.
  /// *{android.content.Context#MODE_WORLD_READABLE} and
  /// {android.content.Context#MODE_WORLD_WRITEABLE} are no longer supported.
  /// *{android.os.FileUriExposedException} will be thrown to applications.
  /// *Applications will see global drag and drops as per
  /// {android.view.View#DRAG_FLAG_GLOBAL}.
  /// *{android.webkit.WebView#evaluateJavascript WebView.evaluateJavascript}
  /// will not persist state from an empty WebView.
  /// *{android.animation.AnimatorSet} will not ignore calls to end() before
  /// start().
  /// *{android.app.AlarmManager#cancel(android.app.PendingIntent)
  /// AlarmManager.cancel} will throw a NullPointerException if given a null operation.
  /// *{android.app.FragmentManager} will ensure fragments have been created
  /// before being placed on the back stack.
  /// *{android.app.FragmentManager} restores fragments in
  /// {android.app.Fragment#onCreate Fragment.onCreate} rather than after the
  /// method returns.
  /// *{android.R.attr#resizeableActivity} defaults to true.
  /// *{android.graphics.drawable.AnimatedVectorDrawable} throws exceptions when
  /// opening invalid VectorDrawable animations.
  /// *{android.view.ViewGroup.MarginLayoutParams} will no longer be dropped
  /// when converting between some types of layout params (such as
  /// {android.widget.LinearLayout.LayoutParams LinearLayout.LayoutParams} to
  /// {android.widget.RelativeLayout.LayoutParams RelativeLayout.LayoutParams}).
  /// *Your application processes will not be killed when the device density changes.
  /// *Drag and drop. After a view receives the
  /// {android.view.DragEvent#ACTION_DRAG_ENTERED} event, when the drag shadow moves into
  /// a descendant view that can accept the data, the view receives the
  /// {android.view.DragEvent#ACTION_DRAG_EXITED} event and won’t receive
  /// {android.view.DragEvent#ACTION_DRAG_LOCATION} and
  /// {android.view.DragEvent#ACTION_DROP} events while the drag shadow is within that
  /// descendant view, even if the descendant view returns <code>false</code> from its handler
  /// for these events.
  ///
  n($p.Build$VERSION_CODES.N),

  /// N MR1.
  ///
  /// Released publicly as Android 7.1 in October 2016.
  /// For more information about this release, see
  /// <a href="/about/versions/nougat/android-7.1">Android 7.1 for
  /// Developers</a>.
  nMr1($p.Build$VERSION_CODES.N_MR1),

  /// O.
  ///
  /// Released publicly as Android 8.0 in August 2017.
  /// Applications targeting this or a later release will get these
  /// new changes in behavior. For more information about this release, see
  /// the <a href="/about/versions/oreo/">Android Oreo overview</a>.
  ///
  /// *<a href="{@docRoot}about/versions/oreo/background.html">Background execution limits</a>
  /// are applied to the application.
  /// *The behavior of AccountManager's
  /// {android.accounts.AccountManager#getAccountsByType},
  /// {android.accounts.AccountManager#getAccountsByTypeAndFeatures}, and
  /// {android.accounts.AccountManager#hasFeatures} has changed as documented there.
  /// *{android.app.ActivityManager.RunningAppProcessInfo#IMPORTANCE_PERCEPTIBLE_PRE_26}
  /// is now returned as
  /// {android.app.ActivityManager.RunningAppProcessInfo#IMPORTANCE_PERCEPTIBLE}.
  /// *The {android.app.NotificationManager} now requires the use of notification
  /// channels.
  /// *Changes to the strict mode that are set in
  /// {Application#onCreate Application.onCreate} will no longer be clobbered after
  /// that function returns.
  /// *A shared library apk with native code will have that native code included in
  /// the library path of its clients.
  /// *{android.content.Context#getSharedPreferences Context.getSharedPreferences}
  /// in credential encrypted storage will throw an exception before the user is unlocked.
  /// *Attempting to retrieve a {Context#FINGERPRINT_SERVICE} on a device that
  /// does not support that feature will now throw a runtime exception.
  /// *{android.app.Fragment} will stop any active view animations when
  /// the fragment is stopped.
  /// *Some compatibility code in Resources that attempts to use the default Theme
  /// the app may be using will be turned off, requiring the app to explicitly request
  /// resources with the right theme.
  /// *{android.content.ContentResolver#notifyChange ContentResolver.notifyChange} and
  /// {android.content.ContentResolver#registerContentObserver
  /// ContentResolver.registerContentObserver}
  /// will throw a SecurityException if the caller does not have permission to access
  /// the provider (or the provider doesn't exit); otherwise the call will be silently
  /// ignored.
  /// *{android.hardware.camera2.CameraDevice#createCaptureRequest
  /// CameraDevice.createCaptureRequest} will enable
  /// {android.hardware.camera2.CaptureRequest#CONTROL_ENABLE_ZSL} by default for
  /// still image capture.
  /// *WallpaperManager's {android.app.WallpaperManager#getWallpaperFile},
  /// {android.app.WallpaperManager#getDrawable},
  /// {android.app.WallpaperManager#getFastDrawable},
  /// {android.app.WallpaperManager#peekDrawable}, and
  /// {android.app.WallpaperManager#peekFastDrawable} will throw an exception
  /// if you can not access the wallpaper.
  /// *The behavior of
  /// {android.hardware.usb.UsbDeviceConnection#requestWait UsbDeviceConnection.requestWait}
  /// is modified as per the documentation there.
  /// *{StrictMode.VmPolicy.Builder#detectAll StrictMode.VmPolicy.Builder.detectAll}
  /// will also enable {StrictMode.VmPolicy.Builder#detectContentUriWithoutPermission}
  /// and {StrictMode.VmPolicy.Builder#detectUntaggedSockets}.
  /// *{StrictMode.ThreadPolicy.Builder#detectAll StrictMode.ThreadPolicy.Builder.detectAll}
  /// will also enable {StrictMode.ThreadPolicy.Builder#detectUnbufferedIo}.
  /// *{android.provider.DocumentsContract}'s various methods will throw failure
  /// exceptions back to the caller instead of returning null.
  /// *{View#hasFocusable() View.hasFocusable} now includes auto-focusable views.
  /// *{android.view.SurfaceView} will no longer always change the underlying
  /// Surface object when something about it changes; apps need to look at the current
  /// state of the object to determine which things they are interested in have changed.
  /// *{android.view.WindowManager.LayoutParams#TYPE_APPLICATION_OVERLAY} must be
  /// used for overlay windows, other system overlay window types are not allowed.
  /// *{android.view.ViewTreeObserver#addOnDrawListener
  /// ViewTreeObserver.addOnDrawListener} will throw an exception if called from within
  /// onDraw.
  /// *{android.graphics.Canvas#setBitmap Canvas.setBitmap} will no longer preserve
  /// the current matrix and clip stack of the canvas.
  /// *{android.widget.ListPopupWindow#setHeight ListPopupWindow.setHeight}
  /// will throw an exception if a negative height is supplied.
  /// *{android.widget.TextView} will use internationalized input for numbers,
  /// dates, and times.
  /// *{android.widget.Toast} must be used for showing toast windows; the toast
  /// window type can not be directly used.
  /// *{android.net.wifi.WifiManager#getConnectionInfo WifiManager.getConnectionInfo}
  /// requires that the caller hold the location permission to return BSSID/SSID
  /// *{android.net.wifi.p2p.WifiP2pManager#requestPeers WifiP2pManager.requestPeers}
  /// requires the caller hold the location permission.
  /// *{android.R.attr#maxAspectRatio} defaults to 0, meaning there is no restriction
  /// on the app's maximum aspect ratio (so it can be stretched to fill larger screens).
  /// *{android.R.attr#focusable} defaults to a new state ({auto}) where it will
  /// inherit the value of {android.R.attr#clickable} unless explicitly overridden.
  /// *A default theme-appropriate focus-state highlight will be supplied to all Views
  /// which don't provide a focus-state drawable themselves. This can be disabled by setting
  /// {android.R.attr#defaultFocusHighlightEnabled} to false.
  ///
  o($p.Build$VERSION_CODES.O),

  /// O MR1.
  ///
  /// Released publicly as Android 8.1 in December 2017.
  /// Applications targeting this or a later release will get these
  /// new changes in behavior. For more information about this release, see
  /// <a href="/about/versions/oreo/android-8.1">Android 8.1 features and
  /// APIs</a>.
  ///
  /// *Apps exporting and linking to apk shared libraries must explicitly
  /// enumerate all signing certificates in a consistent order.
  /// *{android.R.attr#screenOrientation} can not be used to request a fixed
  /// orientation if the associated activity is not fullscreen and opaque.
  ///
  ///
  oMr1($p.Build$VERSION_CODES.O_MR1),

  /// P.
  ///
  /// Released publicly as Android 9 in August 2018.
  /// Applications targeting this or a later release will get these
  /// new changes in behavior. For more information about this release, see the
  /// <a href="/about/versions/pie/">Android 9 Pie overview</a>.
  ///
  /// *{android.app.Service#startForeground Service.startForeground} requires
  /// that apps hold the permission
  /// {android.Manifest.permission#FOREGROUND_SERVICE}.
  /// *{android.widget.LinearLayout} will always remeasure weighted children,
  /// even if there is no excess space.
  ///
  ///
  p($p.Build$VERSION_CODES.P),

  /// Q.
  ///
  /// Released publicly as Android 10 in September 2019.
  /// Applications targeting this or a later release will get these new changes in behavior.
  /// For more information about this release, see the
  /// <a href="/about/versions/10">Android 10 overview</a>.
  ///
  /// *<a href="/about/versions/10/behavior-changes-all">Behavior changes: all apps</a>
  /// *<a href="/about/versions/10/behavior-changes-10">Behavior changes: apps targeting API
  /// 29+</a>
  ///
  ///
  q($p.Build$VERSION_CODES.Q),

  /// R.
  ///
  /// Released publicly as Android 11 in September 2020.
  /// Applications targeting this or a later release will get these new changes in behavior.
  /// For more information about this release, see the
  /// <a href="/about/versions/11">Android 11 overview</a>.
  ///
  /// *<a href="/about/versions/11/behavior-changes-all">Behavior changes: all apps</a>
  /// *<a href="/about/versions/11/behavior-changes-11">Behavior changes: Apps targeting
  /// Android 11</a>
  /// *<a href="/about/versions/11/non-sdk-11">Updates to non-SDK interface restrictions
  /// in Android 11</a>
  ///
  ///
  r($p.Build$VERSION_CODES.R),

  /// S.
  s($p.Build$VERSION_CODES.S),

  /// S V2.
  ///
  /// Once more unto the breach, dear friends, once more.
  sV2($p.Build$VERSION_CODES.S_V2),

  /// Tiramisu.
  tiramisu($p.Build$VERSION_CODES.TIRAMISU),

  /// Upside Down Cake.
  upsideDownCake($p.Build$VERSION_CODES.UPSIDE_DOWN_CAKE),

  /// Vanilla Ice Cream.
  vanillaIceCream($p.Build$VERSION_CODES.VANILLA_ICE_CREAM),

  /// Baklava.
  baklava($p.Build$VERSION_CODES.BAKLAVA),
  ;

  const BuildVersionCodes(this.versionCode);

  final int versionCode;
}

enum BuildVersionCodesFull {
  /// Android 1.0.
  base($p.Build$VERSION_CODES_FULL.BASE),

  /// Android 2.0.
  base_1_1($p.Build$VERSION_CODES_FULL.BASE_1_1),

  /// Android 3.0.
  cupcake($p.Build$VERSION_CODES_FULL.CUPCAKE),

  /// Android 4.0.
  donut($p.Build$VERSION_CODES_FULL.DONUT),

  /// Android 5.0.
  eclair($p.Build$VERSION_CODES_FULL.ECLAIR),

  /// Android 6.0.
  eclair_0_1($p.Build$VERSION_CODES_FULL.ECLAIR_0_1),

  /// Android 7.0.
  eclairMr1($p.Build$VERSION_CODES_FULL.ECLAIR_MR1),

  /// Android 8.0.
  froyo($p.Build$VERSION_CODES_FULL.FROYO),

  /// Android 9.0.
  gingerbread($p.Build$VERSION_CODES_FULL.GINGERBREAD),

  /// Android 10.0.
  gingerbreadMr1($p.Build$VERSION_CODES_FULL.GINGERBREAD_MR1),

  /// Android 11.0.
  honeycomb($p.Build$VERSION_CODES_FULL.HONEYCOMB),

  /// Android 12.0.
  honeycombMr1($p.Build$VERSION_CODES_FULL.HONEYCOMB_MR1),

  /// Android 13.0.
  honeycombMr2($p.Build$VERSION_CODES_FULL.HONEYCOMB_MR2),

  /// Android 14.0.
  iceCreamSandwich($p.Build$VERSION_CODES_FULL.ICE_CREAM_SANDWICH),

  /// Android 15.0.
  iceCreamSandwichMr1($p.Build$VERSION_CODES_FULL.ICE_CREAM_SANDWICH_MR1),

  /// Android 16.0.
  jellyBean($p.Build$VERSION_CODES_FULL.JELLY_BEAN),

  /// Android 17.0.
  jellyBeanMr1($p.Build$VERSION_CODES_FULL.JELLY_BEAN_MR1),

  /// Android 18.0.
  jellyBeanMr2($p.Build$VERSION_CODES_FULL.JELLY_BEAN_MR2),

  /// Android 19.0.
  kitkat($p.Build$VERSION_CODES_FULL.KITKAT),

  /// Android 20.0.
  kitkatWatch($p.Build$VERSION_CODES_FULL.KITKAT_WATCH),

  /// Android 21.0.
  lollipop($p.Build$VERSION_CODES_FULL.LOLLIPOP),

  /// Android 22.0.
  lollipopMr1($p.Build$VERSION_CODES_FULL.LOLLIPOP_MR1),

  /// Android 23.0.
  m($p.Build$VERSION_CODES_FULL.M),

  /// Android 24.0.
  n($p.Build$VERSION_CODES_FULL.N),

  /// Android 25.0.
  nMr1($p.Build$VERSION_CODES_FULL.N_MR1),

  /// Android 26.0.
  o($p.Build$VERSION_CODES_FULL.O),

  /// Android 27.0.
  oMr1($p.Build$VERSION_CODES_FULL.O_MR1),

  /// Android 28.0.
  p($p.Build$VERSION_CODES_FULL.P),

  /// Android 29.0.
  q($p.Build$VERSION_CODES_FULL.Q),

  /// Android 30.0.
  r($p.Build$VERSION_CODES_FULL.R),

  /// Android 31.0.
  s($p.Build$VERSION_CODES_FULL.S),

  /// Android 32.0.
  sV2($p.Build$VERSION_CODES_FULL.S_V2),

  /// Android 33.0.
  tiramisu($p.Build$VERSION_CODES_FULL.TIRAMISU),

  /// Android 34.0.
  upsideDownCake($p.Build$VERSION_CODES.UPSIDE_DOWN_CAKE),

  /// Android 35.0.
  vanillaIceCream($p.Build$VERSION_CODES_FULL.VANILLA_ICE_CREAM),

  /// Android 36.0.
  baklava($p.Build$VERSION_CODES_FULL.BAKLAVA),
  ;

  const BuildVersionCodesFull(this.rawValue);
  final int rawValue;
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

extension on JString? {
  String toBuildString() =>
      this?.toDartString(releaseOriginal: true) ?? Build.unknown;
}
