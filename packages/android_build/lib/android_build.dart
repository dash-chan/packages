/// an API to connect to Android Builds
library android_build;

import 'generated/builds.g.dart';

export 'generated/builds.g.dart' show BuildApi;

/// usage:
/// ```dart
/// builds.someValue();
/// ```
final build = BuildApi();
