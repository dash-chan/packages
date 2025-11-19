library;

import 'package:jni/jni.dart';

import 'generated/android_util_log.g.dart' as $p;

/// API for sending log output.
///
/// Generally, you should use the [Log.v], [Log.d], [Log.i], [Log.w],
///  and [Log.e] methods to write logs. You can then view the logs in logcat.
///
/// The order in terms of verbosity, from least to most is
/// [Log.error], [Log.warn], [Log.info], [Log.debug], [Log.verbose].
///
/// Tip: A good convention is to declare a TAG constant in your class:
/// ```dart
/// private static const TAG = "MyClass";
/// ```
/// and use that in subsequent calls to the log methods.
///
/// Tip: Don't forget that when you make a call like
/// ```dart
/// Log.i(TAG, "My message");
/// ```
///
/// that when you're building the string to pass into Log.d,
/// the compiler uses a StringBuilder and at least three allocations occur:
/// the StringBuilder itself, the buffer, and the String object.
/// Realistically, there is also another buffer allocation and copy,
/// and even more pressure on the gc. That means that if your log message
/// is filtered out, you might be doing significant work and
/// incurring significant overhead.
///
/// Note: The return value from the logging functions in this class may
/// vary between Android releases due to changes in the logging implementation.
/// For the methods that return an integer,
/// a positive value may be considered as a successful invocation.
abstract class Log {
  /// Priority constant for the println method.
  static const assert_ = 0x00000007;

  /// Priority constant for the println method; use Log.d.
  static const debug = 0x00000003;

  /// Priority constant for the println method; use Log.e.
  static const error = 0x00000006;

  /// Priority constant for the println method; use Log.i.
  static const info = 0x00000004;

  /// Priority constant for the println method; use Log.v.
  static const verbose = 0x00000002;

  /// Priority constant for the println method; use Log.w.
  static const warn = 0x00000005;

  /// Send a [debug] log message.
  ///
  /// {@template log_template}
  /// * [tag] Used to identify the source of a log message.
  /// It usually identifies the class or activity where the log call occurs.
  /// This value may be null.
  /// * [msg] The message you would like logged. This value may be null.
  ///
  /// return a positive value if the message was loggable (see [isLoggable]).
  /// {@endtemplate}
  static int d(String tag, String msg) {
    return $p.Log.d(tag.toJString(), msg.toJString());
  }

  /// Send an [error] log message.
  ///
  /// {@macro log_template}
  static int e(String tag, String msg) {
    return $p.Log.e(tag.toJString(), msg.toJString());
  }

  /// Send an [info] log message.
  ///
  /// {@macro log_template}
  static int i(String tag, String msg) {
    return $p.Log.i(tag.toJString(), msg.toJString());
  }

  /// Send an [verbose] log message.
  ///
  /// {@macro log_template}
  static int v(String tag, String msg) {
    return $p.Log.v(tag.toJString(), msg.toJString());
  }

  /// Send an [warn] log message.
  ///
  /// {@macro log_template}
  static int w(String tag, String msg) {
    return $p.Log.w(tag.toJString(), msg.toJString());
  }

  /// What a Terrible Failure: Report a condition that should never happen.
  /// The error will always be logged at level ASSERT with the call stack.
  /// Depending on system configuration, a report may be added to
  /// the DropBoxManager and/or the process may be terminated immediately
  /// with an error dialog.
  ///
  /// {@macro log_template}
  static int wtf(String tag, String msg) {
    return $p.Log.wtf(tag.toJString(), msg.toJString());
  }

  /// Checks to see whether or not a log for the specified tag is loggable
  /// at the specified level. The default level of any tag is set to INFO.
  /// This means that any level above and including INFO will be logged.
  /// Before you make any calls to a logging method you should check to
  /// see if your tag should be logged. You can change the default level
  /// by setting a system property: 'setprop log.tag.\<YOUR_LOG_TAG>
  /// \<LEVEL>' Where level is either [verbose], [debug], [info], [warn], [error],
  /// or [assert_]. You can also create a local.prop file that with the
  /// following in it: 'log.tag.\<YOUR_LOG_TAG>=\<LEVEL>' and place that
  /// in /data/local.prop.
  ///
  /// return Whether or not that this is allowed to be logged.
  static bool isLoggable(String tag, int level) {
    return $p.Log.isLoggable(tag.toJString(), level);
  }

  /// Low-level logging call.
  ///
  /// * [priority] int: The priority/type of this log message Value is [assert_],
  /// [error], [warn], [info], [debug], or [verbose]
  /// * [tag]  Used to identify the source of a log message.
  /// It usually identifies the class or activity where the log call occurs.
  /// This value may be null.
  /// * [message] String: The message you would like logged.
  /// This value cannot be null.
  ///
  /// return a positive value if the message was loggable [isLoggable].
  static int println(int priority, String tag, String msg) {
    return $p.Log.println(priority, tag.toJString(), msg.toJString());
  }
}
