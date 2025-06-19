# android_util_log

A utility library for Android log. Built with dart's experimental jni

> [!IMPORTANT]
> This package is currently **experimental** and may change in non-breaking ways in the future.
> version 0.X.X still in development and may not ready for production use.

## Usage

[API Documentation](https://pub.dev/documentation/android_util_log/latest/)

### Add package

* run in command line

```shell
flutter pub add android_util_log
```

* or add to `pubspec.yaml`

```yaml
...
dependencies:
  android_util_log: any
...
```

### Start log

```dart
import 'package:android_util_log/android_util_log.dart';

Log.i("TAG", "I'M A MESSAGE");
Log.e("TAG", "I'M A MESSAGE");
Log.w("TAG", "I'M A MESSAGE");
```

## Development

you should build apk first then run jnigen
```shell
cd example
flutter build apk
cd ..
flutter pub run jnigen --config jnigen.yaml
```

## License

* package is under [MIT](LICENSE) license