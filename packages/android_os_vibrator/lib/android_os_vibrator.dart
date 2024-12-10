import 'package:jni/jni.dart';
import 'generated/android_os_vibrator.g.dart' as $v;

/// Class that operates the vibrator on the device.
///
/// If your process exits, any vibration you started will stop.
class Vibrator {
  /// Vibration effect support: unsupported
  ///
  /// This effect is not natively supported by the underlying hardware,
  /// although the system may still play a fallback vibration.
  static const vibrationEffectSupportNo = 2;

  /// Vibration effect support: unknown
  ///
  /// The hardware doesn't report its supported effects,
  ///  so we can't determine whether the effect is supported or not.
  static const vibrationEffectSupportUnknown = 0;

  /// Vibration effect support: supported
  ///
  /// This effect is supported by the underlying hardware.
  static const vibrationEffectSupportYes = 1;

  cancel() {}
}

test() {
  final context = $v.Context.fromReference(Jni.getCurrentActivity());
  final service = context.getSystemService($v.Context.VIBRATOR_SERVICE).as($v.Vibrator.type);
  
}
