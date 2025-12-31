import 'package:jni/jni.dart';

import 'secure.dart';

abstract class Settings {
  String? getString(JString? value);
  int? getInt(JString? value) {
    final result = getString(value);
    if (result == null) {
      return null;
    }
    return int.tryParse(result);
  }

  bool getBool(JString? value, bool def) {
    return switch (getInt(value)) {
      0 => false,
      1 => true,
      _ => def,
    };
  }

  static Secure get secure => Secure();
}
