import 'package:android_provider_settings/generated/android_provider_settings.g.dart';
import 'package:jni/jni.dart' as jni;

import 'settings.dart' as parent;
import 'util.dart';
import 'package:android_os_build/android_os_build.dart' as os;

class Secure extends parent.Settings {
  /// Setting that specifies whether display color inversion is enabled.
  bool get accessibilityDisplayInversionEnabled =>
      getBool(Settings$Secure.ACCESSIBILITY_DISPLAY_INVERSION_ENABLED, false);

  /// If accessibility is enabled.
  bool get accessibilityEnabled =>
      getBool(Settings$Secure.ACCESSIBILITY_ENABLED, false);

  /// Origins for which browsers should allow geolocation by default.
  /// The value is a space-separated list of origins.
  bool get allowedGeolocationOrigins =>
      getBool(Settings$Secure.ALLOWED_GEOLOCATION_ORIGINS, false);

  /// On Android 8.0 (API level 26) and higher versions of the platform,
  /// a 64-bit number (expressed as a hexadecimal string),
  /// unique to each combination of app-signing key, user, and device.
  /// Values of ANDROID_ID are scoped by signing key and user.
  /// The value may change if a factory reset is performed on the device
  /// or if an APK signing key changes. For more information about
  /// how the platform handles ANDROID_ID in Android 8.0 (API level 26)
  /// and higher, see Android 8.0 Behavior Changes.
  ///
  /// > Note: For apps that were installed prior to updating the device
  /// to a version of Android 8.0 (API level 26) or higher, the value of
  /// ANDROID_ID changes if the app is uninstalled and then reinstalled
  /// after the OTA. To preserve values across uninstalls after an OTA
  /// to Android 8.0 or higher, developers can use Key/Value Backup.
  ///
  /// In versions of the platform lower than Android 8.0 (API level 26),
  /// a 64-bit number (expressed as a hexadecimal string) that is
  /// randomly generated when the user first sets up the device and
  /// should remain constant for the lifetime of the user's device. On
  /// devices that have multiple users, each user appears as a
  /// completely separate device, so the ANDROID_ID value is unique to
  /// each user.
  ///
  /// > Note: If the caller is an Instant App the ID is scoped to the
  /// Instant App, it is generated when the Instant App is first
  /// installed and reset if the user clears the Instant App.
  String? get androidId => getString(Settings$Secure.ANDROID_ID);

  /// Stores InputMethodInfo.getId() of the input method service that is
  /// currently selected.
  ///
  /// Although the name DEFAULT_INPUT_METHOD implies that there is a
  /// concept of default input method, in reality this setting is no
  /// more or less than the currently selected input method.
  /// This setting can be updated at any time as a result of
  /// user-initiated and system-initiated input method switching.
  String? get defaultInputMethod =>
      getString(Settings$Secure.DEFAULT_INPUT_METHOD);

  /// List of the enabled accessibility providers.
  String? get enabledAccessibilityServices =>
      getString(Settings$Secure.ENABLED_ACCESSIBILITY_SERVICES);

  /// List of input methods that are currently enabled. This is a
  /// string containing the IDs of all enabled input methods, each
  /// ID separated by ':'.
  /// Format like "ime0;subtype0;subtype1;subtype2:ime1:ime2;subtype0"
  /// where imeId is ComponentName and subtype is int32.
  ///
  /// > Note: This setting is not readable to the app targeting API
  /// level 34 or higher.
  /// use InputMethodManager.getEnabledInputMethodList() instead.
  String? get enabledInputMethods {
    if (os.Build.version.sdkInt <= os.BuildVersionCodes.tiramisu.versionCode) {
      return getString(Settings$Secure.ENABLED_INPUT_METHODS);
    }
    return null;
  }

  /// Setting to record the visibility of input method selector
  bool get inputMethodSelectorVisibility =>
      getBool(Settings$Secure.INPUT_METHOD_SELECTOR_VISIBILITY, false);

  /// User-selected RTT mode. When on, outgoing and incoming calls 
  /// will be answered as RTT calls when supported by the device 
  /// and carrier. Boolean value. 0 = OFF 1 = ON
  int? get rttCallingMode => getInt(Settings$Secure.RTT_CALLING_MODE);

  @override
  String? getString(jni.JString? value) {
    return Settings$Secure.getString(
      contentResolver(),
      value,
    ).toNullableString();
  }
}
